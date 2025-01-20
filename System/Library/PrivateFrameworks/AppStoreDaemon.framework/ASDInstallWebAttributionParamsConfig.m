@interface ASDInstallWebAttributionParamsConfig
+ (BOOL)supportsSecureCoding;
- (ASDInstallWebAttributionParamsConfig)initWithCoder:(id)a3;
- (NSNumber)appAdamId;
- (NSString)adNetworkRegistrableDomain;
- (NSString)impressionId;
- (NSString)sourceWebRegistrableDomain;
- (NSString)version;
- (int64_t)attributionContext;
- (void)encodeWithCoder:(id)a3;
- (void)setAdNetworkRegistrableDomain:(id)a3;
- (void)setAppAdamId:(id)a3;
- (void)setAttributionContext:(int64_t)a3;
- (void)setImpressionId:(id)a3;
- (void)setSourceWebRegistrableDomain:(id)a3;
- (void)setVersion:(id)a3;
@end

@implementation ASDInstallWebAttributionParamsConfig

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  appAdamId = self->_appAdamId;
  id v5 = a3;
  [v5 encodeObject:appAdamId forKey:@"1"];
  [v5 encodeObject:self->_adNetworkRegistrableDomain forKey:@"2"];
  [v5 encodeObject:self->_impressionId forKey:@"3"];
  [v5 encodeObject:self->_sourceWebRegistrableDomain forKey:@"4"];
  [v5 encodeObject:self->_version forKey:@"5"];
  [v5 encodeInteger:self->_attributionContext forKey:@"6"];
}

- (ASDInstallWebAttributionParamsConfig)initWithCoder:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)ASDInstallWebAttributionParamsConfig;
  id v5 = [(ASDInstallWebAttributionParamsConfig *)&v17 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"1"];
    appAdamId = v5->_appAdamId;
    v5->_appAdamId = (NSNumber *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"2"];
    adNetworkRegistrableDomain = v5->_adNetworkRegistrableDomain;
    v5->_adNetworkRegistrableDomain = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"3"];
    impressionId = v5->_impressionId;
    v5->_impressionId = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"4"];
    sourceWebRegistrableDomain = v5->_sourceWebRegistrableDomain;
    v5->_sourceWebRegistrableDomain = (NSString *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"5"];
    version = v5->_version;
    v5->_version = (NSString *)v14;

    v5->_attributionContext = [v4 decodeIntegerForKey:@"5"];
  }

  return v5;
}

- (NSNumber)appAdamId
{
  return self->_appAdamId;
}

- (void)setAppAdamId:(id)a3
{
}

- (NSString)adNetworkRegistrableDomain
{
  return self->_adNetworkRegistrableDomain;
}

- (void)setAdNetworkRegistrableDomain:(id)a3
{
}

- (NSString)impressionId
{
  return self->_impressionId;
}

- (void)setImpressionId:(id)a3
{
}

- (NSString)sourceWebRegistrableDomain
{
  return self->_sourceWebRegistrableDomain;
}

- (void)setSourceWebRegistrableDomain:(id)a3
{
}

- (NSString)version
{
  return self->_version;
}

- (void)setVersion:(id)a3
{
}

- (int64_t)attributionContext
{
  return self->_attributionContext;
}

- (void)setAttributionContext:(int64_t)a3
{
  self->_attributionContext = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_version, 0);
  objc_storeStrong((id *)&self->_sourceWebRegistrableDomain, 0);
  objc_storeStrong((id *)&self->_impressionId, 0);
  objc_storeStrong((id *)&self->_adNetworkRegistrableDomain, 0);
  objc_storeStrong((id *)&self->_appAdamId, 0);
}

@end