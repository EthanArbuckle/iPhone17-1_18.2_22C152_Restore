@interface HDCloudSyncStateSampleWindowUpdaterConfiguration
- (Class)syncEntityClass;
- (HDCloudSyncStateSampleWindowUpdaterConfiguration)initWithDomain:(id)a3 key:(id)a4 sampleOriginKey:(id)a5 sampleType:(id)a6 syncEntityClass:(Class)a7 timeWindow:(id)a8 loggingCategory:(id)a9 sampleUUIDsFunction:(void *)a10;
- (HKSampleType)sampleType;
- (NSDateInterval)timeWindow;
- (NSString)domain;
- (NSString)key;
- (NSString)sampleOriginKey;
- (OS_os_log)loggingCategory;
- (id)sampleUUIDsFromCodableObjectCollection:(id)a3;
@end

@implementation HDCloudSyncStateSampleWindowUpdaterConfiguration

- (HDCloudSyncStateSampleWindowUpdaterConfiguration)initWithDomain:(id)a3 key:(id)a4 sampleOriginKey:(id)a5 sampleType:(id)a6 syncEntityClass:(Class)a7 timeWindow:(id)a8 loggingCategory:(id)a9 sampleUUIDsFunction:(void *)a10
{
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a6;
  id v20 = a8;
  id v21 = a9;
  v32.receiver = self;
  v32.super_class = (Class)HDCloudSyncStateSampleWindowUpdaterConfiguration;
  v22 = [(HDCloudSyncStateSampleWindowUpdaterConfiguration *)&v32 init];
  if (v22)
  {
    uint64_t v23 = [v16 copy];
    domain = v22->_domain;
    v22->_domain = (NSString *)v23;

    uint64_t v25 = [v17 copy];
    key = v22->_key;
    v22->_key = (NSString *)v25;

    uint64_t v27 = [v18 copy];
    sampleOriginKey = v22->_sampleOriginKey;
    v22->_sampleOriginKey = (NSString *)v27;

    objc_storeStrong((id *)&v22->_sampleType, a6);
    objc_storeStrong((id *)&v22->_syncEntityClass, a7);
    uint64_t v29 = [v20 copy];
    timeWindow = v22->_timeWindow;
    v22->_timeWindow = (NSDateInterval *)v29;

    objc_storeStrong((id *)&v22->_loggingCategory, a9);
    v22->_sampleUUIDsFromCodableObjectCollectionFunction = a10;
  }

  return v22;
}

- (id)sampleUUIDsFromCodableObjectCollection:(id)a3
{
  return (id)((uint64_t (*)(id))self->_sampleUUIDsFromCodableObjectCollectionFunction)(a3);
}

- (NSString)domain
{
  return self->_domain;
}

- (NSString)key
{
  return self->_key;
}

- (NSString)sampleOriginKey
{
  return self->_sampleOriginKey;
}

- (HKSampleType)sampleType
{
  return self->_sampleType;
}

- (Class)syncEntityClass
{
  return self->_syncEntityClass;
}

- (NSDateInterval)timeWindow
{
  return self->_timeWindow;
}

- (OS_os_log)loggingCategory
{
  return self->_loggingCategory;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loggingCategory, 0);
  objc_storeStrong((id *)&self->_timeWindow, 0);
  objc_storeStrong((id *)&self->_syncEntityClass, 0);
  objc_storeStrong((id *)&self->_sampleType, 0);
  objc_storeStrong((id *)&self->_sampleOriginKey, 0);
  objc_storeStrong((id *)&self->_key, 0);

  objc_storeStrong((id *)&self->_domain, 0);
}

@end