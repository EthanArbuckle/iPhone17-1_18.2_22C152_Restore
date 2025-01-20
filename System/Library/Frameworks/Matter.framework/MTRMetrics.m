@interface MTRMetrics
- (MTRMetrics)init;
- (MTRMetrics)initWithCapacity:(unint64_t)a3;
- (NSArray)allKeys;
- (NSUUID)uniqueIdentifier;
- (id)description;
- (id)metricDataForKey:(id)a3;
- (void)removeMetricDataForKey:(id)a3;
- (void)setMetricData:(id)a3 forKey:(id)a4;
@end

@implementation MTRMetrics

- (MTRMetrics)init
{
  return 0;
}

- (MTRMetrics)initWithCapacity:(unint64_t)a3
{
  v13.receiver = self;
  v13.super_class = (Class)MTRMetrics;
  v5 = [(MTRMetrics *)&v13 init];
  if (v5)
  {
    uint64_t v6 = objc_msgSend_dictionaryWithCapacity_(MEMORY[0x263EFF9A0], v4, a3);
    metricsData = v5->_metricsData;
    v5->_metricsData = (NSMutableDictionary *)v6;

    uint64_t v10 = objc_msgSend_UUID(MEMORY[0x263F08C38], v8, v9);
    uniqueIdentifier = v5->_uniqueIdentifier;
    v5->_uniqueIdentifier = (NSUUID *)v10;
  }
  return v5;
}

- (NSArray)allKeys
{
  return (NSArray *)objc_msgSend_allKeys(self->_metricsData, a2, v2);
}

- (id)metricDataForKey:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    uint64_t v6 = objc_msgSend_objectForKeyedSubscript_(self->_metricsData, v4, (uint64_t)v5);
  }
  else
  {
    v7 = sub_244CC8484(0, "NotSpecified");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)uint64_t v9 = 0;
      _os_log_impl(&dword_2446BD000, v7, OS_LOG_TYPE_ERROR, "Cannot get metrics value for nil key", v9, 2u);
    }

    if (sub_244CC4E58(1u)) {
      sub_244CC4DE0(0, 1);
    }
    uint64_t v6 = 0;
  }

  return v6;
}

- (void)setMetricData:(id)a3 forKey:(id)a4
{
  id v6 = a3;
  id v8 = a4;
  if (v8)
  {
    objc_msgSend_setValue_forKey_(self->_metricsData, v7, (uint64_t)v6, v8);
  }
  else
  {
    uint64_t v9 = sub_244CC8484(0, "NotSpecified");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)uint64_t v10 = 0;
      _os_log_impl(&dword_2446BD000, v9, OS_LOG_TYPE_ERROR, "Cannot set metrics value for nil key", v10, 2u);
    }

    if (sub_244CC4E58(1u)) {
      sub_244CC4DE0(0, 1);
    }
  }
}

- (void)removeMetricDataForKey:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    objc_msgSend_removeObjectForKey_(self->_metricsData, v4, (uint64_t)v5);
  }
  else
  {
    id v6 = sub_244CC8484(0, "NotSpecified");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_2446BD000, v6, OS_LOG_TYPE_ERROR, "Cannot remove metrics value for nil key", v7, 2u);
    }

    if (sub_244CC4E58(1u)) {
      sub_244CC4DE0(0, 1);
    }
  }
}

- (id)description
{
  v3 = NSString;
  uniqueIdentifier = self->_uniqueIdentifier;
  id v5 = objc_msgSend_description(self->_metricsData, a2, v2);
  v7 = objc_msgSend_stringWithFormat_(v3, v6, @"<MTRMetrics: uuid = %@, data = %@>", uniqueIdentifier, v5);

  return v7;
}

- (NSUUID)uniqueIdentifier
{
  return self->_uniqueIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);

  objc_storeStrong((id *)&self->_metricsData, 0);
}

@end