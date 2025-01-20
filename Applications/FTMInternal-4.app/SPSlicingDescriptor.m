@interface SPSlicingDescriptor
+ (id)_coreTelephonyContainer:(id)a3;
+ (id)_coreTelephonyDescriptor:(id)a3;
+ (id)_coreTelephonyDescritorList:(id)a3;
- (NSNumber)ipProtocol;
- (NSNumber)port;
- (NSNumber)portRangeLow;
- (NSNumber)portRangeUpper;
- (NSNumber)trafficClass;
- (NSString)address;
- (NSString)appCategory;
- (NSString)bundleId;
- (NSString)dnn;
- (NSString)host;
- (SPSlicingDescriptor)init;
- (id)description;
- (void)setAddress:(id)a3;
- (void)setAppCategory:(id)a3;
- (void)setBundleId:(id)a3;
- (void)setDnn:(id)a3;
- (void)setHost:(id)a3;
- (void)setIpProtocol:(id)a3;
- (void)setPort:(id)a3;
- (void)setPortRangeLow:(id)a3;
- (void)setPortRangeUpper:(id)a3;
- (void)setTrafficClass:(id)a3;
@end

@implementation SPSlicingDescriptor

- (SPSlicingDescriptor)init
{
  v3.receiver = self;
  v3.super_class = (Class)SPSlicingDescriptor;
  return [(SPSlicingDescriptor *)&v3 init];
}

+ (id)_coreTelephonyDescriptor:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init(SPSlicingDescriptor);
  v5 = [v3 address];
  [(SPSlicingDescriptor *)v4 setAddress:v5];

  v6 = [v3 host];
  [(SPSlicingDescriptor *)v4 setHost:v6];

  v7 = [v3 port];
  [(SPSlicingDescriptor *)v4 setPort:v7];

  v8 = [v3 appCategory];
  [(SPSlicingDescriptor *)v4 setAppCategory:v8];

  v9 = [v3 bundleId];
  [(SPSlicingDescriptor *)v4 setBundleId:v9];

  v10 = [v3 dnn];
  [(SPSlicingDescriptor *)v4 setDnn:v10];

  v11 = [v3 ipProtocol];
  [(SPSlicingDescriptor *)v4 setIpProtocol:v11];

  v12 = [v3 portRangeLow];
  [(SPSlicingDescriptor *)v4 setPortRangeLow:v12];

  v13 = [v3 portRangeUpper];
  [(SPSlicingDescriptor *)v4 setPortRangeUpper:v13];

  v14 = [v3 trafficClass];

  [(SPSlicingDescriptor *)v4 setTrafficClass:v14];

  return v4;
}

+ (id)_coreTelephonyDescritorList:(id)a3
{
  id v3 = a3;
  v4 = objc_opt_new();
  if (v3 && [v3 count])
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v5 = v3;
    id v6 = [v5 countByEnumeratingWithState:&v14 objects:v20 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v15;
      do
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v15 != v8) {
            objc_enumerationMutation(v5);
          }
          v10 = +[SPSlicingDescriptor _coreTelephonyDescriptor:](SPSlicingDescriptor, "_coreTelephonyDescriptor:", *(void *)(*((void *)&v14 + 1) + 8 * i), (void)v14);
          [v4 addObject:v10];
        }
        id v7 = [v5 countByEnumeratingWithState:&v14 objects:v20 count:16];
      }
      while (v7);
    }
  }
  v11 = qword_1002E3100;
  if (os_log_type_enabled((os_log_t)qword_1002E3100, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v19 = v4;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "slice descriptors %@", buf, 0xCu);
  }
  id v12 = [v4 copy:v14];

  return v12;
}

+ (id)_coreTelephonyContainer:(id)a3
{
  id v3 = a3;
  v4 = objc_opt_new();
  id v5 = [v3 trafficDescriptors];

  id v6 = +[SPSlicingDescriptor _coreTelephonyDescritorList:v5];

  return v6;
}

- (id)description
{
  long long v15 = [(id)objc_opt_class() description];
  id v3 = [(SPSlicingDescriptor *)self address];
  v4 = [(SPSlicingDescriptor *)self host];
  id v5 = [(SPSlicingDescriptor *)self port];
  id v6 = [(SPSlicingDescriptor *)self appCategory];
  id v7 = [(SPSlicingDescriptor *)self bundleId];
  uint64_t v8 = [(SPSlicingDescriptor *)self dnn];
  v9 = [(SPSlicingDescriptor *)self ipProtocol];
  v10 = [(SPSlicingDescriptor *)self portRangeLow];
  v11 = [(SPSlicingDescriptor *)self portRangeUpper];
  id v12 = [(SPSlicingDescriptor *)self trafficClass];
  +[NSString stringWithFormat:@"<%@: address=%@ %@:%@ category=%@ bundleId=%@ dnn=%@ ip=%@ prl=%@ pru=%@ tclass=%@>", v15, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12];
  id v14 = (id)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (NSString)bundleId
{
  return self->_bundleId;
}

- (void)setBundleId:(id)a3
{
}

- (NSString)appCategory
{
  return self->_appCategory;
}

- (void)setAppCategory:(id)a3
{
}

- (NSString)host
{
  return self->_host;
}

- (void)setHost:(id)a3
{
}

- (NSString)address
{
  return self->_address;
}

- (void)setAddress:(id)a3
{
}

- (NSNumber)port
{
  return self->_port;
}

- (void)setPort:(id)a3
{
}

- (NSNumber)portRangeLow
{
  return self->_portRangeLow;
}

- (void)setPortRangeLow:(id)a3
{
}

- (NSNumber)portRangeUpper
{
  return self->_portRangeUpper;
}

- (void)setPortRangeUpper:(id)a3
{
}

- (NSNumber)ipProtocol
{
  return self->_ipProtocol;
}

- (void)setIpProtocol:(id)a3
{
}

- (NSNumber)trafficClass
{
  return self->_trafficClass;
}

- (void)setTrafficClass:(id)a3
{
}

- (NSString)dnn
{
  return self->_dnn;
}

- (void)setDnn:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dnn, 0);
  objc_storeStrong((id *)&self->_trafficClass, 0);
  objc_storeStrong((id *)&self->_ipProtocol, 0);
  objc_storeStrong((id *)&self->_portRangeUpper, 0);
  objc_storeStrong((id *)&self->_portRangeLow, 0);
  objc_storeStrong((id *)&self->_port, 0);
  objc_storeStrong((id *)&self->_address, 0);
  objc_storeStrong((id *)&self->_host, 0);
  objc_storeStrong((id *)&self->_appCategory, 0);

  objc_storeStrong((id *)&self->_bundleId, 0);
}

@end