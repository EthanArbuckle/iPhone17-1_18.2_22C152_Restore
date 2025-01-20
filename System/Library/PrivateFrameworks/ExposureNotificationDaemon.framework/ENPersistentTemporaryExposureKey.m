@interface ENPersistentTemporaryExposureKey
- (ENPersistentTemporaryExposureKey)initWithTemporaryExposureKey:(id)a3 appBundleIdentifier:(id)a4 regionCountryCode:(id)a5;
- (ENTemporaryExposureKey)key;
- (NSString)appBundleIdentifier;
- (NSString)regionCountryCode;
- (id)description;
- (unsigned)originalReportType;
- (unsigned)originalVariantOfConcernType;
- (void)setOriginalReportType:(unsigned int)a3;
- (void)setOriginalVariantOfConcernType:(unsigned int)a3;
@end

@implementation ENPersistentTemporaryExposureKey

- (ENPersistentTemporaryExposureKey)initWithTemporaryExposureKey:(id)a3 appBundleIdentifier:(id)a4 regionCountryCode:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v19.receiver = self;
  v19.super_class = (Class)ENPersistentTemporaryExposureKey;
  v12 = [(ENPersistentTemporaryExposureKey *)&v19 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_key, a3);
    uint64_t v14 = [v10 copy];
    appBundleIdentifier = v13->_appBundleIdentifier;
    v13->_appBundleIdentifier = (NSString *)v14;

    uint64_t v16 = [v11 copy];
    regionCountryCode = v13->_regionCountryCode;
    v13->_regionCountryCode = (NSString *)v16;

    v13->_originalReportType = [v9 diagnosisReportType];
    v13->_originalVariantOfConcernType = [v9 variantOfConcernType];
  }

  return v13;
}

- (id)description
{
  v3 = (objc_class *)objc_opt_class();
  id v9 = NSStringFromClass(v3);
  NSAppendPrintF_safe();
  id v4 = 0;

  if (self->_appBundleIdentifier)
  {
    NSAppendPrintF_safe();
    id v5 = v4;

    id v4 = v5;
  }
  if (self->_regionCountryCode)
  {
    NSAppendPrintF_safe();
    id v6 = v4;

    id v4 = v6;
  }
  NSAppendPrintF_safe();
  id v7 = v4;

  return v7;
}

- (ENTemporaryExposureKey)key
{
  return self->_key;
}

- (NSString)appBundleIdentifier
{
  return self->_appBundleIdentifier;
}

- (NSString)regionCountryCode
{
  return self->_regionCountryCode;
}

- (unsigned)originalReportType
{
  return self->_originalReportType;
}

- (void)setOriginalReportType:(unsigned int)a3
{
  self->_originalReportType = a3;
}

- (unsigned)originalVariantOfConcernType
{
  return self->_originalVariantOfConcernType;
}

- (void)setOriginalVariantOfConcernType:(unsigned int)a3
{
  self->_originalVariantOfConcernType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_regionCountryCode, 0);
  objc_storeStrong((id *)&self->_appBundleIdentifier, 0);

  objc_storeStrong((id *)&self->_key, 0);
}

@end