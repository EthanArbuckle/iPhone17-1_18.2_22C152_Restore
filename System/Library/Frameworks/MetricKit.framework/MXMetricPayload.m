@interface MXMetricPayload
+ (BOOL)supportsSecureCoding;
- (BOOL)includesMultipleApplicationVersions;
- (MXAnimationMetric)animationMetrics;
- (MXAppExitMetric)applicationExitMetrics;
- (MXAppLaunchMetric)applicationLaunchMetrics;
- (MXAppResponsivenessMetric)applicationResponsivenessMetrics;
- (MXAppRunTimeMetric)applicationTimeMetrics;
- (MXCPUMetric)cpuMetrics;
- (MXCellularConditionMetric)cellularConditionMetrics;
- (MXDiskIOMetric)diskIOMetrics;
- (MXDisplayMetric)displayMetrics;
- (MXGPUMetric)gpuMetrics;
- (MXLocationActivityMetric)locationActivityMetrics;
- (MXMemoryMetric)memoryMetrics;
- (MXMetaData)metaData;
- (MXMetricPayload)initWithAppVersion:(id)a3 withMutipleAppVersions:(BOOL)a4 withTimeStampBegin:(id)a5 withTimeStampEnd:(id)a6;
- (MXMetricPayload)initWithCoder:(id)a3;
- (MXMetricPayload)initWithPayloadData:(id)a3 withMutipleAppVersions:(BOOL)a4 withTimeStampBegin:(id)a5 withTimeStampEnd:(id)a6 withMetaData:(id)a7 withMetrics:(id)a8;
- (MXNetworkTransferMetric)networkTransferMetrics;
- (NSArray)signpostMetrics;
- (NSData)JSONRepresentation;
- (NSDate)timeStampBegin;
- (NSDate)timeStampEnd;
- (NSString)latestApplicationVersion;
- (id)toDictionary;
- (void)encodeWithCoder:(id)a3;
- (void)setAnimationMetrics:(id)a3;
- (void)setApplicationExitMetrics:(id)a3;
- (void)setApplicationLaunchMetrics:(id)a3;
- (void)setApplicationResponsivenessMetrics:(id)a3;
- (void)setApplicationTimeMetrics:(id)a3;
- (void)setCellularConditionMetrics:(id)a3;
- (void)setCpuMetrics:(id)a3;
- (void)setDiskIOMetrics:(id)a3;
- (void)setDisplayMetrics:(id)a3;
- (void)setGpuMetrics:(id)a3;
- (void)setLocationActivityMetrics:(id)a3;
- (void)setMemoryMetrics:(id)a3;
- (void)setMetaData:(id)a3;
- (void)setNetworkTransferMetrics:(id)a3;
- (void)setSignpostMetrics:(id)a3;
@end

@implementation MXMetricPayload

- (MXMetricPayload)initWithPayloadData:(id)a3 withMutipleAppVersions:(BOOL)a4 withTimeStampBegin:(id)a5 withTimeStampEnd:(id)a6 withMetaData:(id)a7 withMetrics:(id)a8
{
  id v15 = a3;
  id v51 = a5;
  id v16 = a6;
  id v50 = a7;
  id v17 = a8;
  v52.receiver = self;
  v52.super_class = (Class)MXMetricPayload;
  v18 = [(MXMetricPayload *)&v52 init];
  v19 = v18;
  if (!v18) {
    goto LABEL_6;
  }
  v20 = 0;
  if (v15 && v51 && v16)
  {
    objc_storeStrong((id *)&v18->_latestApplicationVersion, a3);
    v19->_includesMultipleApplicationVersions = a4;
    objc_storeStrong((id *)&v19->_timeStampBegin, a5);
    objc_storeStrong((id *)&v19->_timeStampEnd, a6);
    objc_storeStrong((id *)&v19->_metaData, a7);
    uint64_t v21 = objc_msgSend(v17, "objectForKeyedSubscript:", @"cpuMetrics", v50);
    cpuMetrics = v19->_cpuMetrics;
    v19->_cpuMetrics = (MXCPUMetric *)v21;

    uint64_t v23 = [v17 objectForKeyedSubscript:@"gpuMetrics"];
    gpuMetrics = v19->_gpuMetrics;
    v19->_gpuMetrics = (MXGPUMetric *)v23;

    uint64_t v25 = [v17 objectForKeyedSubscript:@"cellularConditionMetrics"];
    cellularConditionMetrics = v19->_cellularConditionMetrics;
    v19->_cellularConditionMetrics = (MXCellularConditionMetric *)v25;

    uint64_t v27 = [v17 objectForKeyedSubscript:@"applicationTimeMetrics"];
    applicationTimeMetrics = v19->_applicationTimeMetrics;
    v19->_applicationTimeMetrics = (MXAppRunTimeMetric *)v27;

    uint64_t v29 = [v17 objectForKeyedSubscript:@"locationActivityMetrics"];
    locationActivityMetrics = v19->_locationActivityMetrics;
    v19->_locationActivityMetrics = (MXLocationActivityMetric *)v29;

    uint64_t v31 = [v17 objectForKeyedSubscript:@"networkTransferMetrics"];
    networkTransferMetrics = v19->_networkTransferMetrics;
    v19->_networkTransferMetrics = (MXNetworkTransferMetric *)v31;

    uint64_t v33 = [v17 objectForKeyedSubscript:@"applicationLaunchMetrics"];
    applicationLaunchMetrics = v19->_applicationLaunchMetrics;
    v19->_applicationLaunchMetrics = (MXAppLaunchMetric *)v33;

    uint64_t v35 = [v17 objectForKeyedSubscript:@"applicationResponsivenessMetrics"];
    applicationResponsivenessMetrics = v19->_applicationResponsivenessMetrics;
    v19->_applicationResponsivenessMetrics = (MXAppResponsivenessMetric *)v35;

    uint64_t v37 = [v17 objectForKeyedSubscript:@"diskIOMetrics"];
    diskIOMetrics = v19->_diskIOMetrics;
    v19->_diskIOMetrics = (MXDiskIOMetric *)v37;

    uint64_t v39 = [v17 objectForKeyedSubscript:@"memoryMetrics"];
    memoryMetrics = v19->_memoryMetrics;
    v19->_memoryMetrics = (MXMemoryMetric *)v39;

    uint64_t v41 = [v17 objectForKeyedSubscript:@"displayMetrics"];
    displayMetrics = v19->_displayMetrics;
    v19->_displayMetrics = (MXDisplayMetric *)v41;

    uint64_t v43 = [v17 objectForKeyedSubscript:@"animationMetrics"];
    animationMetrics = v19->_animationMetrics;
    v19->_animationMetrics = (MXAnimationMetric *)v43;

    uint64_t v45 = [v17 objectForKeyedSubscript:@"applicationExitMetrics"];
    applicationExitMetrics = v19->_applicationExitMetrics;
    v19->_applicationExitMetrics = (MXAppExitMetric *)v45;

    uint64_t v47 = [v17 objectForKeyedSubscript:@"signpostMetrics"];
    signpostMetrics = v19->_signpostMetrics;
    v19->_signpostMetrics = (NSArray *)v47;

LABEL_6:
    v20 = v19;
  }

  return v20;
}

- (MXMetricPayload)initWithAppVersion:(id)a3 withMutipleAppVersions:(BOOL)a4 withTimeStampBegin:(id)a5 withTimeStampEnd:(id)a6
{
  id v11 = a3;
  id v12 = a5;
  id v13 = a6;
  v18.receiver = self;
  v18.super_class = (Class)MXMetricPayload;
  v14 = [(MXMetricPayload *)&v18 init];
  id v15 = v14;
  if (!v14) {
    goto LABEL_6;
  }
  id v16 = 0;
  if (v11 && v12 && v13)
  {
    objc_storeStrong((id *)&v14->_latestApplicationVersion, a3);
    v15->_includesMultipleApplicationVersions = a4;
    objc_storeStrong((id *)&v15->_timeStampBegin, a5);
    objc_storeStrong((id *)&v15->_timeStampEnd, a6);
LABEL_6:
    id v16 = v15;
  }

  return v16;
}

- (NSData)JSONRepresentation
{
  v2 = [(MXMetricPayload *)self toDictionary];
  if ([MEMORY[0x263F08900] isValidJSONObject:v2])
  {
    id v5 = 0;
    v3 = [MEMORY[0x263F08900] dataWithJSONObject:v2 options:1 error:&v5];
  }
  else
  {
    v3 = 0;
  }

  return (NSData *)v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  latestApplicationVersion = self->_latestApplicationVersion;
  id v6 = a3;
  [v6 encodeObject:latestApplicationVersion forKey:@"appVersion"];
  id v5 = [NSNumber numberWithBool:self->_includesMultipleApplicationVersions];
  [v6 encodeObject:v5 forKey:@"multipleAppVersions"];

  [v6 encodeObject:self->_timeStampBegin forKey:@"timeStampBegin"];
  [v6 encodeObject:self->_timeStampEnd forKey:@"timeStampEnd"];
  [v6 encodeObject:self->_metaData forKey:@"metaData"];
  [v6 encodeObject:self->_cpuMetrics forKey:@"cpuMetrics"];
  [v6 encodeObject:self->_gpuMetrics forKey:@"gpuMetrics"];
  [v6 encodeObject:self->_cellularConditionMetrics forKey:@"cellularConditionMetrics"];
  [v6 encodeObject:self->_applicationTimeMetrics forKey:@"applicationTimeMetrics"];
  [v6 encodeObject:self->_locationActivityMetrics forKey:@"locationActivityMetrics"];
  [v6 encodeObject:self->_networkTransferMetrics forKey:@"networkTransferMetrics"];
  [v6 encodeObject:self->_applicationLaunchMetrics forKey:@"applicationLaunchMetrics"];
  [v6 encodeObject:self->_applicationResponsivenessMetrics forKey:@"applicationResponsivenessMetrics"];
  [v6 encodeObject:self->_diskIOMetrics forKey:@"diskIOMetrics"];
  [v6 encodeObject:self->_memoryMetrics forKey:@"memoryMetrics"];
  [v6 encodeObject:self->_displayMetrics forKey:@"displayMetrics"];
  [v6 encodeObject:self->_animationMetrics forKey:@"animationMetrics"];
  [v6 encodeObject:self->_applicationExitMetrics forKey:@"applicationExitMetrics"];
  [v6 encodeObject:self->_signpostMetrics forKey:@"signpostMetrics"];
}

- (MXMetricPayload)initWithCoder:(id)a3
{
  id v4 = a3;
  v51.receiver = self;
  v51.super_class = (Class)MXMetricPayload;
  id v5 = [(MXMetricPayload *)&v51 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"appVersion"];
    latestApplicationVersion = v5->_latestApplicationVersion;
    v5->_latestApplicationVersion = (NSString *)v6;

    v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"multipleAppVersions"];
    v5->_includesMultipleApplicationVersions = [v8 BOOLValue];

    uint64_t v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"timeStampBegin"];
    timeStampBegin = v5->_timeStampBegin;
    v5->_timeStampBegin = (NSDate *)v9;

    uint64_t v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"timeStampEnd"];
    timeStampEnd = v5->_timeStampEnd;
    v5->_timeStampEnd = (NSDate *)v11;

    uint64_t v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"metaData"];
    metaData = v5->_metaData;
    v5->_metaData = (MXMetaData *)v13;

    uint64_t v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"cpuMetrics"];
    cpuMetrics = v5->_cpuMetrics;
    v5->_cpuMetrics = (MXCPUMetric *)v15;

    uint64_t v17 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"gpuMetrics"];
    gpuMetrics = v5->_gpuMetrics;
    v5->_gpuMetrics = (MXGPUMetric *)v17;

    uint64_t v19 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"cellularConditionMetrics"];
    cellularConditionMetrics = v5->_cellularConditionMetrics;
    v5->_cellularConditionMetrics = (MXCellularConditionMetric *)v19;

    uint64_t v21 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"applicationTimeMetrics"];
    applicationTimeMetrics = v5->_applicationTimeMetrics;
    v5->_applicationTimeMetrics = (MXAppRunTimeMetric *)v21;

    uint64_t v23 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"locationActivityMetrics"];
    locationActivityMetrics = v5->_locationActivityMetrics;
    v5->_locationActivityMetrics = (MXLocationActivityMetric *)v23;

    uint64_t v25 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"networkTransferMetrics"];
    networkTransferMetrics = v5->_networkTransferMetrics;
    v5->_networkTransferMetrics = (MXNetworkTransferMetric *)v25;

    uint64_t v27 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"applicationLaunchMetrics"];
    applicationLaunchMetrics = v5->_applicationLaunchMetrics;
    v5->_applicationLaunchMetrics = (MXAppLaunchMetric *)v27;

    uint64_t v29 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"applicationResponsivenessMetrics"];
    applicationResponsivenessMetrics = v5->_applicationResponsivenessMetrics;
    v5->_applicationResponsivenessMetrics = (MXAppResponsivenessMetric *)v29;

    uint64_t v31 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"diskIOMetrics"];
    diskIOMetrics = v5->_diskIOMetrics;
    v5->_diskIOMetrics = (MXDiskIOMetric *)v31;

    uint64_t v33 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"memoryMetrics"];
    memoryMetrics = v5->_memoryMetrics;
    v5->_memoryMetrics = (MXMemoryMetric *)v33;

    uint64_t v35 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"displayMetrics"];
    displayMetrics = v5->_displayMetrics;
    v5->_displayMetrics = (MXDisplayMetric *)v35;

    uint64_t v37 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"animationMetrics"];
    animationMetrics = v5->_animationMetrics;
    v5->_animationMetrics = (MXAnimationMetric *)v37;

    uint64_t v39 = (void *)MEMORY[0x263EFFA08];
    uint64_t v40 = objc_opt_class();
    uint64_t v41 = objc_opt_class();
    v42 = objc_msgSend(v39, "setWithObjects:", v40, v41, objc_opt_class(), 0);
    uint64_t v43 = [v4 decodeObjectOfClasses:v42 forKey:@"applicationExitMetrics"];
    applicationExitMetrics = v5->_applicationExitMetrics;
    v5->_applicationExitMetrics = (MXAppExitMetric *)v43;

    uint64_t v45 = (void *)MEMORY[0x263EFFA08];
    uint64_t v46 = objc_opt_class();
    uint64_t v47 = objc_msgSend(v45, "setWithObjects:", v46, objc_opt_class(), 0);
    uint64_t v48 = [v4 decodeObjectOfClasses:v47 forKey:@"signpostMetrics"];
    signpostMetrics = v5->_signpostMetrics;
    v5->_signpostMetrics = (NSArray *)v48;
  }
  return v5;
}

- (id)toDictionary
{
  uint64_t v53 = *MEMORY[0x263EF8340];
  id v3 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  id v4 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  id v5 = objc_alloc_init(MEMORY[0x263F08790]);
  uint64_t v6 = (void *)[objc_alloc(MEMORY[0x263EFF960]) initWithLocaleIdentifier:@"en_US_POSIX"];
  [v5 setLocale:v6];
  [v5 setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
  latestApplicationVersion = self->_latestApplicationVersion;
  if (latestApplicationVersion) {
    [v3 setObject:latestApplicationVersion forKey:@"appVersion"];
  }
  if (self->_includesMultipleApplicationVersions)
  {
    v8 = [NSNumber numberWithBool:1];
    uint64_t v9 = [v8 descriptionWithLocale:@"en_US_POSIX"];
    [v3 setObject:v9 forKey:@"multipleAppVersions"];
  }
  if (self->_timeStampBegin)
  {
    v10 = objc_msgSend(v5, "stringFromDate:");
    [v3 setObject:v10 forKey:@"timeStampBegin"];
  }
  if (self->_timeStampEnd)
  {
    uint64_t v11 = objc_msgSend(v5, "stringFromDate:");
    [v3 setObject:v11 forKey:@"timeStampEnd"];
  }
  metaData = self->_metaData;
  if (metaData)
  {
    uint64_t v13 = [(MXMetaData *)metaData toDictionary];
    [v3 setObject:v13 forKey:@"metaData"];
  }
  cpuMetrics = self->_cpuMetrics;
  if (cpuMetrics)
  {
    uint64_t v15 = [(MXCPUMetric *)cpuMetrics toDictionary];
    [v3 setObject:v15 forKey:@"cpuMetrics"];
  }
  gpuMetrics = self->_gpuMetrics;
  if (gpuMetrics)
  {
    uint64_t v17 = [(MXGPUMetric *)gpuMetrics toDictionary];
    [v3 setObject:v17 forKey:@"gpuMetrics"];
  }
  cellularConditionMetrics = self->_cellularConditionMetrics;
  if (cellularConditionMetrics)
  {
    uint64_t v19 = [(MXCellularConditionMetric *)cellularConditionMetrics toDictionary];
    [v3 setObject:v19 forKey:@"cellularConditionMetrics"];
  }
  applicationTimeMetrics = self->_applicationTimeMetrics;
  if (applicationTimeMetrics)
  {
    uint64_t v21 = [(MXAppRunTimeMetric *)applicationTimeMetrics toDictionary];
    [v3 setObject:v21 forKey:@"applicationTimeMetrics"];
  }
  locationActivityMetrics = self->_locationActivityMetrics;
  if (locationActivityMetrics)
  {
    uint64_t v23 = [(MXLocationActivityMetric *)locationActivityMetrics toDictionary];
    [v3 setObject:v23 forKey:@"locationActivityMetrics"];
  }
  networkTransferMetrics = self->_networkTransferMetrics;
  if (networkTransferMetrics)
  {
    uint64_t v25 = [(MXNetworkTransferMetric *)networkTransferMetrics toDictionary];
    [v3 setObject:v25 forKey:@"networkTransferMetrics"];
  }
  applicationLaunchMetrics = self->_applicationLaunchMetrics;
  if (applicationLaunchMetrics)
  {
    uint64_t v27 = [(MXAppLaunchMetric *)applicationLaunchMetrics toDictionary];
    [v3 setObject:v27 forKey:@"applicationLaunchMetrics"];
  }
  applicationResponsivenessMetrics = self->_applicationResponsivenessMetrics;
  if (applicationResponsivenessMetrics)
  {
    uint64_t v29 = [(MXAppResponsivenessMetric *)applicationResponsivenessMetrics toDictionary];
    [v3 setObject:v29 forKey:@"applicationResponsivenessMetrics"];
  }
  diskIOMetrics = self->_diskIOMetrics;
  if (diskIOMetrics)
  {
    uint64_t v31 = [(MXDiskIOMetric *)diskIOMetrics toDictionary];
    [v3 setObject:v31 forKey:@"diskIOMetrics"];
  }
  memoryMetrics = self->_memoryMetrics;
  if (memoryMetrics)
  {
    uint64_t v33 = [(MXMemoryMetric *)memoryMetrics toDictionary];
    [v3 setObject:v33 forKey:@"memoryMetrics"];
  }
  displayMetrics = self->_displayMetrics;
  if (displayMetrics)
  {
    uint64_t v35 = [(MXDisplayMetric *)displayMetrics toDictionary];
    [v3 setObject:v35 forKey:@"displayMetrics"];
  }
  animationMetrics = self->_animationMetrics;
  if (animationMetrics)
  {
    uint64_t v37 = [(MXAnimationMetric *)animationMetrics toDictionary];
    [v3 setObject:v37 forKey:@"animationMetrics"];
  }
  applicationExitMetrics = self->_applicationExitMetrics;
  if (applicationExitMetrics)
  {
    uint64_t v39 = [(MXAppExitMetric *)applicationExitMetrics toDictionary];
    [v3 setObject:v39 forKey:@"applicationExitMetrics"];
  }
  if (self->_signpostMetrics)
  {
    id v40 = objc_alloc_init(MEMORY[0x263EFF980]);
    long long v48 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    uint64_t v41 = self->_signpostMetrics;
    uint64_t v42 = [(NSArray *)v41 countByEnumeratingWithState:&v48 objects:v52 count:16];
    if (v42)
    {
      uint64_t v43 = v42;
      uint64_t v44 = *(void *)v49;
      do
      {
        for (uint64_t i = 0; i != v43; ++i)
        {
          if (*(void *)v49 != v44) {
            objc_enumerationMutation(v41);
          }
          uint64_t v46 = objc_msgSend(*(id *)(*((void *)&v48 + 1) + 8 * i), "toDictionary", (void)v48);
          [v40 addObject:v46];
        }
        uint64_t v43 = [(NSArray *)v41 countByEnumeratingWithState:&v48 objects:v52 count:16];
      }
      while (v43);
    }

    [v3 setObject:v40 forKey:@"signpostMetrics"];
  }

  return v3;
}

- (NSString)latestApplicationVersion
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (BOOL)includesMultipleApplicationVersions
{
  return self->_includesMultipleApplicationVersions;
}

- (NSDate)timeStampBegin
{
  return (NSDate *)objc_getProperty(self, a2, 24, 1);
}

- (NSDate)timeStampEnd
{
  return (NSDate *)objc_getProperty(self, a2, 32, 1);
}

- (MXCPUMetric)cpuMetrics
{
  return (MXCPUMetric *)objc_getProperty(self, a2, 40, 1);
}

- (void)setCpuMetrics:(id)a3
{
}

- (MXGPUMetric)gpuMetrics
{
  return (MXGPUMetric *)objc_getProperty(self, a2, 48, 1);
}

- (void)setGpuMetrics:(id)a3
{
}

- (MXCellularConditionMetric)cellularConditionMetrics
{
  return (MXCellularConditionMetric *)objc_getProperty(self, a2, 56, 1);
}

- (void)setCellularConditionMetrics:(id)a3
{
}

- (MXAppRunTimeMetric)applicationTimeMetrics
{
  return (MXAppRunTimeMetric *)objc_getProperty(self, a2, 64, 1);
}

- (void)setApplicationTimeMetrics:(id)a3
{
}

- (MXLocationActivityMetric)locationActivityMetrics
{
  return (MXLocationActivityMetric *)objc_getProperty(self, a2, 72, 1);
}

- (void)setLocationActivityMetrics:(id)a3
{
}

- (MXNetworkTransferMetric)networkTransferMetrics
{
  return (MXNetworkTransferMetric *)objc_getProperty(self, a2, 80, 1);
}

- (void)setNetworkTransferMetrics:(id)a3
{
}

- (MXAppLaunchMetric)applicationLaunchMetrics
{
  return (MXAppLaunchMetric *)objc_getProperty(self, a2, 88, 1);
}

- (void)setApplicationLaunchMetrics:(id)a3
{
}

- (MXAppResponsivenessMetric)applicationResponsivenessMetrics
{
  return (MXAppResponsivenessMetric *)objc_getProperty(self, a2, 96, 1);
}

- (void)setApplicationResponsivenessMetrics:(id)a3
{
}

- (MXDiskIOMetric)diskIOMetrics
{
  return (MXDiskIOMetric *)objc_getProperty(self, a2, 104, 1);
}

- (void)setDiskIOMetrics:(id)a3
{
}

- (MXMemoryMetric)memoryMetrics
{
  return (MXMemoryMetric *)objc_getProperty(self, a2, 112, 1);
}

- (void)setMemoryMetrics:(id)a3
{
}

- (MXDisplayMetric)displayMetrics
{
  return (MXDisplayMetric *)objc_getProperty(self, a2, 120, 1);
}

- (void)setDisplayMetrics:(id)a3
{
}

- (MXAnimationMetric)animationMetrics
{
  return (MXAnimationMetric *)objc_getProperty(self, a2, 128, 1);
}

- (void)setAnimationMetrics:(id)a3
{
}

- (MXAppExitMetric)applicationExitMetrics
{
  return (MXAppExitMetric *)objc_getProperty(self, a2, 136, 1);
}

- (void)setApplicationExitMetrics:(id)a3
{
}

- (NSArray)signpostMetrics
{
  return (NSArray *)objc_getProperty(self, a2, 144, 1);
}

- (void)setSignpostMetrics:(id)a3
{
}

- (MXMetaData)metaData
{
  return (MXMetaData *)objc_getProperty(self, a2, 152, 1);
}

- (void)setMetaData:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metaData, 0);
  objc_storeStrong((id *)&self->_signpostMetrics, 0);
  objc_storeStrong((id *)&self->_applicationExitMetrics, 0);
  objc_storeStrong((id *)&self->_animationMetrics, 0);
  objc_storeStrong((id *)&self->_displayMetrics, 0);
  objc_storeStrong((id *)&self->_memoryMetrics, 0);
  objc_storeStrong((id *)&self->_diskIOMetrics, 0);
  objc_storeStrong((id *)&self->_applicationResponsivenessMetrics, 0);
  objc_storeStrong((id *)&self->_applicationLaunchMetrics, 0);
  objc_storeStrong((id *)&self->_networkTransferMetrics, 0);
  objc_storeStrong((id *)&self->_locationActivityMetrics, 0);
  objc_storeStrong((id *)&self->_applicationTimeMetrics, 0);
  objc_storeStrong((id *)&self->_cellularConditionMetrics, 0);
  objc_storeStrong((id *)&self->_gpuMetrics, 0);
  objc_storeStrong((id *)&self->_cpuMetrics, 0);
  objc_storeStrong((id *)&self->_timeStampEnd, 0);
  objc_storeStrong((id *)&self->_timeStampBegin, 0);

  objc_storeStrong((id *)&self->_latestApplicationVersion, 0);
}

@end