@interface CTDeviceDataUsage
+ (BOOL)supportsSecureCoding;
- (CTDeviceDataUsage)initWithCoder:(id)a3;
- (NSArray)wifiAssist;
- (NSMutableDictionary)apps;
- (NSMutableDictionary)proxiedOnlyApps;
- (NSMutableDictionary)systemServices;
- (NSMutableDictionary)uninstalledApps;
- (id)appDataUsageForPeriod:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dataUsage:(id)a3 forPeriod:(unint64_t)a4;
- (id)description;
- (id)proxiedOnlyAppDataUsageForPeriod:(unint64_t)a3;
- (id)systemServiceDataUsageForPeriod:(unint64_t)a3;
- (id)totalAppDataUsedForPeriod:(unint64_t)a3;
- (id)totalDataUsage:(id)a3 forPeriod:(unint64_t)a4;
- (id)totalDataUsedForPeriod:(unint64_t)a3;
- (id)totalProxiedOnlyAppDataUsedForPeriod:(unint64_t)a3;
- (id)totalSystemServiceDataUsedForPeriod:(unint64_t)a3;
- (id)totalUninstalledAppDataUsedForPeriod:(unint64_t)a3;
- (id)totalWifiAssistUsageForPeriod:(unint64_t)a3;
- (id)uninstalledAppDataUsageForPeriod:(unint64_t)a3;
- (unint64_t)periods;
- (void)encodeWithCoder:(id)a3;
- (void)setApps:(id)a3;
- (void)setPeriods:(unint64_t)a3;
- (void)setProxiedOnlyApps:(id)a3;
- (void)setSystemServices:(id)a3;
- (void)setUninstalledApps:(id)a3;
- (void)setWifiAssist:(id)a3;
@end

@implementation CTDeviceDataUsage

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@ %p", objc_opt_class(), self];
  if ([(CTDeviceDataUsage *)self periods])
  {
    uint64_t v4 = 0;
    unsigned int v5 = 1;
    do
    {
      uint64_t v6 = v4 + 1;
      unint64_t v7 = [(CTDeviceDataUsage *)self periods];
      v8 = [(CTDeviceDataUsage *)self totalDataUsedForPeriod:v4];
      [v3 appendFormat:@", period %lu of %lu total usage = %@", v6, v7, v8];

      uint64_t v4 = v5;
    }
    while ([(CTDeviceDataUsage *)self periods] > v5++);
  }
  v10 = [(CTDeviceDataUsage *)self apps];
  [v3 appendFormat:@", apps = %lu", objc_msgSend(v10, "count")];

  v11 = [(CTDeviceDataUsage *)self uninstalledApps];
  [v3 appendFormat:@", uninstalled apps = %lu", objc_msgSend(v11, "count")];

  v12 = [(CTDeviceDataUsage *)self proxiedOnlyApps];
  [v3 appendFormat:@", proxied only apps = %lu", objc_msgSend(v12, "count")];

  v13 = [(CTDeviceDataUsage *)self systemServices];
  [v3 appendFormat:@", system services = %lu", objc_msgSend(v13, "count")];

  [v3 appendString:@">"];

  return v3;
}

- (id)dataUsage:(id)a3 forPeriod:(unint64_t)a4
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  unint64_t v27 = a4;
  if ([(CTDeviceDataUsage *)self periods] <= a4)
  {
    v23 = 0;
  }
  else
  {
    v26 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v6, "count"));
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    id v25 = v6;
    id v7 = v6;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v28 objects:v38 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v29;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v29 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = *(void *)(*((void *)&v28 + 1) + 8 * i);
          v13 = [v7 objectForKeyedSubscript:v12];
          v14 = [CTAppDataUsage alloc];
          v15 = [v13 displayName];
          v16 = [v13 used];
          v17 = [v16 objectAtIndexedSubscript:v27];
          id v18 = [(CTAppDataUsage *)v14 init:v12 withDisplayName:v15 andUsage:v17];
          [v26 addObject:v18];

          v19 = CTLogClient();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
          {
            v20 = [v13 displayName];
            v21 = [v13 used];
            v22 = [v21 objectAtIndexedSubscript:v27];
            *(_DWORD *)buf = 138412802;
            uint64_t v33 = v12;
            __int16 v34 = 2112;
            v35 = v20;
            __int16 v36 = 2112;
            v37 = v22;
            _os_log_debug_impl(&dword_18444A000, v19, OS_LOG_TYPE_DEBUG, "AppUsage bundle %@ with display name %@ used %@", buf, 0x20u);
          }
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v28 objects:v38 count:16];
      }
      while (v9);
    }

    v23 = (void *)[v26 copy];
    id v6 = v25;
  }

  return v23;
}

- (id)appDataUsageForPeriod:(unint64_t)a3
{
  unsigned int v5 = [(CTDeviceDataUsage *)self apps];
  id v6 = [(CTDeviceDataUsage *)self dataUsage:v5 forPeriod:a3];

  return v6;
}

- (id)uninstalledAppDataUsageForPeriod:(unint64_t)a3
{
  unsigned int v5 = [(CTDeviceDataUsage *)self uninstalledApps];
  id v6 = [(CTDeviceDataUsage *)self dataUsage:v5 forPeriod:a3];

  return v6;
}

- (id)proxiedOnlyAppDataUsageForPeriod:(unint64_t)a3
{
  unsigned int v5 = [(CTDeviceDataUsage *)self proxiedOnlyApps];
  id v6 = [(CTDeviceDataUsage *)self dataUsage:v5 forPeriod:a3];

  return v6;
}

- (id)systemServiceDataUsageForPeriod:(unint64_t)a3
{
  unsigned int v5 = [(CTDeviceDataUsage *)self systemServices];
  id v6 = [(CTDeviceDataUsage *)self dataUsage:v5 forPeriod:a3];

  return v6;
}

- (id)totalDataUsage:(id)a3 forPeriod:(unint64_t)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if ([(CTDeviceDataUsage *)self periods] <= a4)
  {
    uint64_t v10 = 0;
  }
  else
  {
    id v7 = [CTDataUsed alloc];
    uint64_t v8 = [[CTDataUsage alloc] initWithHome:0 roaming:0];
    uint64_t v9 = [[CTDataUsage alloc] initWithHome:0 roaming:0];
    uint64_t v10 = [(CTDataUsed *)v7 initWithUsage:v8 proxied:v9];

    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    v11 = objc_msgSend(v6, "allValues", 0);
    uint64_t v12 = [v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v20;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v20 != v14) {
            objc_enumerationMutation(v11);
          }
          v16 = [*(id *)(*((void *)&v19 + 1) + 8 * i) used];
          v17 = [v16 objectAtIndexedSubscript:a4];
          [(CTDataUsed *)v10 addUsage:v17];
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v13);
    }
  }

  return v10;
}

- (id)totalDataUsedForPeriod:(unint64_t)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  if ([(CTDeviceDataUsage *)self periods] <= a3)
  {
    uint64_t v8 = 0;
  }
  else
  {
    unsigned int v5 = [CTDataUsed alloc];
    id v6 = [[CTDataUsage alloc] initWithHome:0 roaming:0];
    id v7 = [[CTDataUsage alloc] initWithHome:0 roaming:0];
    uint64_t v8 = [(CTDataUsed *)v5 initWithUsage:v6 proxied:v7];

    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    apps = self->_apps;
    long long v23 = *(_OWORD *)&self->_uninstalledApps;
    systemServices = self->_systemServices;
    uint64_t v9 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", &apps, 4, 0);
    uint64_t v10 = [v9 countByEnumeratingWithState:&v18 objects:v25 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v19 != v12) {
            objc_enumerationMutation(v9);
          }
          uint64_t v14 = [(CTDeviceDataUsage *)self totalDataUsage:*(void *)(*((void *)&v18 + 1) + 8 * i) forPeriod:a3];
          [(CTDataUsed *)v8 addUsage:v14];
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v18 objects:v25 count:16];
      }
      while (v11);
    }

    v15 = [(CTDeviceDataUsage *)self wifiAssist];
    v16 = [v15 objectAtIndexedSubscript:a3];
    [(CTDataUsed *)v8 addNativeUsage:v16];
  }

  return v8;
}

- (id)totalAppDataUsedForPeriod:(unint64_t)a3
{
  unsigned int v5 = [(CTDeviceDataUsage *)self apps];
  id v6 = [(CTDeviceDataUsage *)self totalDataUsage:v5 forPeriod:a3];

  return v6;
}

- (id)totalUninstalledAppDataUsedForPeriod:(unint64_t)a3
{
  unsigned int v5 = [(CTDeviceDataUsage *)self uninstalledApps];
  id v6 = [(CTDeviceDataUsage *)self totalDataUsage:v5 forPeriod:a3];

  return v6;
}

- (id)totalProxiedOnlyAppDataUsedForPeriod:(unint64_t)a3
{
  unsigned int v5 = [(CTDeviceDataUsage *)self proxiedOnlyApps];
  id v6 = [(CTDeviceDataUsage *)self totalDataUsage:v5 forPeriod:a3];

  return v6;
}

- (id)totalSystemServiceDataUsedForPeriod:(unint64_t)a3
{
  unsigned int v5 = [(CTDeviceDataUsage *)self systemServices];
  id v6 = [(CTDeviceDataUsage *)self totalDataUsage:v5 forPeriod:a3];

  return v6;
}

- (id)totalWifiAssistUsageForPeriod:(unint64_t)a3
{
  if ([(CTDeviceDataUsage *)self periods] <= a3)
  {
    id v6 = 0;
  }
  else
  {
    unsigned int v5 = [(CTDeviceDataUsage *)self wifiAssist];
    id v6 = [v5 objectAtIndexedSubscript:a3];
  }

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v4[1] = [(CTDeviceDataUsage *)self periods];
  id v5 = objc_alloc(MEMORY[0x1E4F1CA60]);
  id v6 = [(CTDeviceDataUsage *)self apps];
  uint64_t v7 = [v5 initWithDictionary:v6 copyItems:1];
  uint64_t v8 = (void *)v4[2];
  v4[2] = v7;

  id v9 = objc_alloc(MEMORY[0x1E4F1CA60]);
  uint64_t v10 = [(CTDeviceDataUsage *)self uninstalledApps];
  uint64_t v11 = [v9 initWithDictionary:v10 copyItems:1];
  uint64_t v12 = (void *)v4[3];
  v4[3] = v11;

  id v13 = objc_alloc(MEMORY[0x1E4F1CA60]);
  uint64_t v14 = [(CTDeviceDataUsage *)self proxiedOnlyApps];
  uint64_t v15 = [v13 initWithDictionary:v14 copyItems:1];
  v16 = (void *)v4[4];
  v4[4] = v15;

  id v17 = objc_alloc(MEMORY[0x1E4F1CA60]);
  long long v18 = [(CTDeviceDataUsage *)self systemServices];
  uint64_t v19 = [v17 initWithDictionary:v18 copyItems:1];
  long long v20 = (void *)v4[5];
  v4[5] = v19;

  id v21 = objc_alloc(MEMORY[0x1E4F1C978]);
  long long v22 = [(CTDeviceDataUsage *)self wifiAssist];
  uint64_t v23 = [v21 initWithArray:v22 copyItems:1];
  uint64_t v24 = (void *)v4[6];
  v4[6] = v23;

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v4 = NSNumber;
  id v5 = a3;
  id v6 = objc_msgSend(v4, "numberWithUnsignedInteger:", -[CTDeviceDataUsage periods](self, "periods"));
  [v5 encodeObject:v6 forKey:@"periodsKey"];

  uint64_t v7 = [(CTDeviceDataUsage *)self apps];
  [v5 encodeObject:v7 forKey:@"appsKey"];

  uint64_t v8 = [(CTDeviceDataUsage *)self uninstalledApps];
  [v5 encodeObject:v8 forKey:@"uninstalledAppsKey"];

  id v9 = [(CTDeviceDataUsage *)self proxiedOnlyApps];
  [v5 encodeObject:v9 forKey:@"proxiedOnlyAppsKey"];

  uint64_t v10 = [(CTDeviceDataUsage *)self systemServices];
  [v5 encodeObject:v10 forKey:@"systemServicesKey"];

  id v11 = [(CTDeviceDataUsage *)self wifiAssist];
  [v5 encodeObject:v11 forKey:@"wifiAssistKey"];
}

- (CTDeviceDataUsage)initWithCoder:(id)a3
{
  v38[3] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v33.receiver = self;
  v33.super_class = (Class)CTDeviceDataUsage;
  id v5 = [(CTDeviceDataUsage *)&v33 init];
  if (v5)
  {
    id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"periodsKey"];
    v5->_periods = [v6 unsignedIntegerValue];

    uint64_t v7 = (void *)MEMORY[0x1E4F1CAD0];
    v38[0] = objc_opt_class();
    v38[1] = objc_opt_class();
    v38[2] = objc_opt_class();
    uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v38 count:3];
    id v9 = [v7 setWithArray:v8];
    uint64_t v10 = [v4 decodeObjectOfClasses:v9 forKey:@"appsKey"];
    apps = v5->_apps;
    v5->_apps = (NSMutableDictionary *)v10;

    uint64_t v12 = (void *)MEMORY[0x1E4F1CAD0];
    v37[0] = objc_opt_class();
    v37[1] = objc_opt_class();
    v37[2] = objc_opt_class();
    id v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v37 count:3];
    uint64_t v14 = [v12 setWithArray:v13];
    uint64_t v15 = [v4 decodeObjectOfClasses:v14 forKey:@"uninstalledAppsKey"];
    uninstalledApps = v5->_uninstalledApps;
    v5->_uninstalledApps = (NSMutableDictionary *)v15;

    id v17 = (void *)MEMORY[0x1E4F1CAD0];
    v36[0] = objc_opt_class();
    v36[1] = objc_opt_class();
    v36[2] = objc_opt_class();
    long long v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v36 count:3];
    uint64_t v19 = [v17 setWithArray:v18];
    uint64_t v20 = [v4 decodeObjectOfClasses:v19 forKey:@"proxiedOnlyAppsKey"];
    proxiedOnlyApps = v5->_proxiedOnlyApps;
    v5->_proxiedOnlyApps = (NSMutableDictionary *)v20;

    long long v22 = (void *)MEMORY[0x1E4F1CAD0];
    v35[0] = objc_opt_class();
    v35[1] = objc_opt_class();
    v35[2] = objc_opt_class();
    uint64_t v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:v35 count:3];
    uint64_t v24 = [v22 setWithArray:v23];
    uint64_t v25 = [v4 decodeObjectOfClasses:v24 forKey:@"systemServicesKey"];
    systemServices = v5->_systemServices;
    v5->_systemServices = (NSMutableDictionary *)v25;

    unint64_t v27 = (void *)MEMORY[0x1E4F1CAD0];
    v34[0] = objc_opt_class();
    v34[1] = objc_opt_class();
    long long v28 = [MEMORY[0x1E4F1C978] arrayWithObjects:v34 count:2];
    long long v29 = [v27 setWithArray:v28];
    uint64_t v30 = [v4 decodeObjectOfClasses:v29 forKey:@"wifiAssistKey"];
    wifiAssist = v5->_wifiAssist;
    v5->_wifiAssist = (NSArray *)v30;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (unint64_t)periods
{
  return self->_periods;
}

- (void)setPeriods:(unint64_t)a3
{
  self->_periods = a3;
}

- (NSMutableDictionary)apps
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 16, 1);
}

- (void)setApps:(id)a3
{
}

- (NSMutableDictionary)uninstalledApps
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 24, 1);
}

- (void)setUninstalledApps:(id)a3
{
}

- (NSMutableDictionary)proxiedOnlyApps
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 32, 1);
}

- (void)setProxiedOnlyApps:(id)a3
{
}

- (NSMutableDictionary)systemServices
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 40, 1);
}

- (void)setSystemServices:(id)a3
{
}

- (NSArray)wifiAssist
{
  return (NSArray *)objc_getProperty(self, a2, 48, 1);
}

- (void)setWifiAssist:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wifiAssist, 0);
  objc_storeStrong((id *)&self->_systemServices, 0);
  objc_storeStrong((id *)&self->_proxiedOnlyApps, 0);
  objc_storeStrong((id *)&self->_uninstalledApps, 0);

  objc_storeStrong((id *)&self->_apps, 0);
}

@end