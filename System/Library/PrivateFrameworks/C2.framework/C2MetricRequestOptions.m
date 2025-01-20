@interface C2MetricRequestOptions
- (C2MetricOptions)metricOptions;
- (C2MetricRequestOptions)init;
- (C2MetricRequestOptions)initWithRequestOptions:(id)a3;
- (NSNumber)privacyProxyFailClosedOverride;
- (NSNumber)useNWLoaderOverride;
- (NSString)_sourceApplicationBundleIdentifier;
- (NSString)_sourceApplicationSecondaryIdentifier;
- (NSUUID)metricUUID;
- (id)metricRequestTransportOptions;
- (unsigned)_allowsExpensiveAccess;
- (unsigned)_allowsPowerNapScheduling;
- (unsigned)allowsCellularAccess;
- (void)setAllowsCellularAccess:(unsigned __int8)a3;
- (void)setMetricOptions:(id)a3;
- (void)setMetricUUID:(id)a3;
- (void)setPrivacyProxyFailClosedOverride:(id)a3;
- (void)setUseNWLoaderOverride:(id)a3;
- (void)set_allowsExpensiveAccess:(unsigned __int8)a3;
- (void)set_allowsPowerNapScheduling:(unsigned __int8)a3;
- (void)set_sourceApplicationBundleIdentifier:(id)a3;
- (void)set_sourceApplicationSecondaryIdentifier:(id)a3;
@end

@implementation C2MetricRequestOptions

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metricOptions, 0);
  objc_storeStrong((id *)&self->_metricUUID, 0);
  objc_storeStrong((id *)&self->__sourceApplicationSecondaryIdentifier, 0);
  objc_storeStrong((id *)&self->__sourceApplicationBundleIdentifier, 0);
}

- (NSString)_sourceApplicationSecondaryIdentifier
{
  return self->__sourceApplicationSecondaryIdentifier;
}

- (unsigned)_allowsPowerNapScheduling
{
  return self->__allowsPowerNapScheduling;
}

- (C2MetricOptions)metricOptions
{
  return self->_metricOptions;
}

- (NSString)_sourceApplicationBundleIdentifier
{
  return self->__sourceApplicationBundleIdentifier;
}

- (unsigned)_allowsExpensiveAccess
{
  return self->__allowsExpensiveAccess;
}

- (unsigned)allowsCellularAccess
{
  return self->_allowsCellularAccess;
}

- (void)set_allowsPowerNapScheduling:(unsigned __int8)a3
{
  self->__allowsPowerNapScheduling = a3;
}

- (void)set_allowsExpensiveAccess:(unsigned __int8)a3
{
  self->__allowsExpensiveAccess = a3;
}

- (void)setPrivacyProxyFailClosedOverride:(id)a3
{
  self->_privacyProxyFailClosedOverride = (NSNumber *)a3;
}

- (void)setAllowsCellularAccess:(unsigned __int8)a3
{
  self->_allowsCellularAccess = a3;
}

- (void)set_sourceApplicationSecondaryIdentifier:(id)a3
{
}

- (void)set_sourceApplicationBundleIdentifier:(id)a3
{
}

- (void)setMetricUUID:(id)a3
{
}

- (void)setMetricOptions:(id)a3
{
}

- (C2MetricRequestOptions)initWithRequestOptions:(id)a3
{
  id v4 = a3;
  v5 = [(C2MetricRequestOptions *)self init];
  if (v5)
  {
    v5->_allowsCellularAccess = [v4 allowsCellularAccess];
    v5->__allowsExpensiveAccess = [v4 _allowsExpensiveAccess];
    v5->__allowsPowerNapScheduling = [v4 _allowsPowerNapScheduling];
    uint64_t v6 = [v4 _sourceApplicationBundleIdentifier];
    sourceApplicationBundleIdentifier = v5->__sourceApplicationBundleIdentifier;
    v5->__sourceApplicationBundleIdentifier = (NSString *)v6;

    uint64_t v8 = [v4 _sourceApplicationSecondaryIdentifier];
    sourceApplicationSecondaryIdentifier = v5->__sourceApplicationSecondaryIdentifier;
    v5->__sourceApplicationSecondaryIdentifier = (NSString *)v8;

    v5->_privacyProxyFailClosedOverride = (NSNumber *)(id)[v4 privacyProxyFailClosedOverride];
    v5->_useNWLoaderOverride = (NSNumber *)(id)[v4 useNWLoaderOverride];
    uint64_t v10 = [v4 metricOptions];
    metricOptions = v5->_metricOptions;
    v5->_metricOptions = (C2MetricOptions *)v10;
  }
  return v5;
}

- (C2MetricRequestOptions)init
{
  v10.receiver = self;
  v10.super_class = (Class)C2MetricRequestOptions;
  v2 = [(C2MetricRequestOptions *)&v10 init];
  v3 = v2;
  if (v2)
  {
    *(_WORD *)&v2->_allowsCellularAccess = 257;
    v2->__allowsPowerNapScheduling = 1;
    sourceApplicationBundleIdentifier = v2->__sourceApplicationBundleIdentifier;
    v2->__sourceApplicationBundleIdentifier = 0;

    sourceApplicationSecondaryIdentifier = v3->__sourceApplicationSecondaryIdentifier;
    v3->__sourceApplicationSecondaryIdentifier = 0;

    v3->_privacyProxyFailClosedOverride = 0;
    v3->_useNWLoaderOverride = 0;
    uint64_t v6 = [MEMORY[0x1E4F29128] UUID];
    metricUUID = v3->_metricUUID;
    v3->_metricUUID = (NSUUID *)v6;

    metricOptions = v3->_metricOptions;
    v3->_metricOptions = 0;
  }
  return v3;
}

- (id)metricRequestTransportOptions
{
  v3 = objc_alloc_init(C2RequestOptions);
  [(C2RequestOptions *)v3 setMetricRequest:1];
  [(C2RequestOptions *)v3 setMetricOptions:0];
  [(C2RequestOptions *)v3 setOutOfProcessPoolName:0];
  [(C2RequestOptions *)v3 setQualityOfService:17];
  [(C2RequestOptions *)v3 set_appleIDContextSessionIdentifier:0];
  [(C2RequestOptions *)v3 setTlsPinning:1];
  [(C2RequestOptions *)v3 setDiscretionaryNetworkBehavior:0];
  [(C2RequestOptions *)v3 set_allowsRetryForBackgroundDataTasks:0];
  [(C2RequestOptions *)v3 set_timeoutIntervalForResource:30.0];
  [(C2RequestOptions *)v3 setAllowsCellularAccess:self->_allowsCellularAccess != 0];
  [(C2RequestOptions *)v3 set_allowsExpensiveAccess:self->__allowsExpensiveAccess != 0];
  [(C2RequestOptions *)v3 set_allowsPowerNapScheduling:self->__allowsPowerNapScheduling != 0];
  [(C2RequestOptions *)v3 set_sourceApplicationBundleIdentifier:self->__sourceApplicationBundleIdentifier];
  [(C2RequestOptions *)v3 set_sourceApplicationSecondaryIdentifier:self->__sourceApplicationSecondaryIdentifier];
  [(C2RequestOptions *)v3 setPrivacyProxyFailClosedOverride:self->_privacyProxyFailClosedOverride];
  [(C2RequestOptions *)v3 setUseNWLoaderOverride:self->_useNWLoaderOverride];
  [(C2RequestOptions *)v3 setMetricOptions:self->_metricOptions];
  return v3;
}

- (NSNumber)privacyProxyFailClosedOverride
{
  return self->_privacyProxyFailClosedOverride;
}

- (NSNumber)useNWLoaderOverride
{
  return self->_useNWLoaderOverride;
}

- (void)setUseNWLoaderOverride:(id)a3
{
  self->_useNWLoaderOverride = (NSNumber *)a3;
}

- (NSUUID)metricUUID
{
  return self->_metricUUID;
}

@end