@interface APMetric
+ (BOOL)supportsSecureCoding;
- (APMetric)initWithCoder:(id)a3;
- (APMetric)initWithPurpose:(int64_t)a3 metric:(int64_t)a4 contentIdentifier:(id)a5 contextIdentifier:(id)a6 handle:(id)a7 branch:(id)a8 properties:(id)a9 internalProperties:(id)a10 relayData:(id)a11 environment:(id)a12 order:(int64_t)a13 options:(int64_t)a14;
- (BOOL)validateMetricAndSetupIdentifiers:(id)a3;
- (NSArray)branch;
- (NSArray)environment;
- (NSDate)timestamp;
- (NSDictionary)internalProperties;
- (NSDictionary)properties;
- (NSDictionary)relayData;
- (NSString)bundleIdentifier;
- (NSString)contentIdentifier;
- (NSString)contextIdentifier;
- (NSString)description;
- (NSString)handle;
- (NSString)trace;
- (id)_addOptionsToProperties:(id)a3;
- (id)_descriptionWithFormat:(id)a3;
- (id)_internalProperties;
- (id)_options;
- (id)_optionsArray;
- (id)_properties;
- (id)_relayData;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)metric;
- (int64_t)options;
- (int64_t)order;
- (int64_t)purpose;
- (unsigned)source;
- (void)addInternalPropertyValue:(id)a3 forKey:(id)a4;
- (void)encodeWithCoder:(id)a3;
- (void)setBranch:(id)a3;
- (void)setEnvironment:(id)a3;
- (void)setHandle:(id)a3;
- (void)setProperties:(id)a3;
- (void)setPurpose:(int64_t)a3;
- (void)setSource:(unsigned int)a3;
- (void)setTimestamp:(id)a3;
- (void)setTrace:(id)a3;
- (void)updatePurpose:(int64_t)a3;
@end

@implementation APMetric

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t purpose_low = LODWORD(self->_purpose);
  id v5 = a3;
  [v5 encodeInt32:purpose_low forKey:@"purpose"];
  [v5 encodeInt32:LODWORD(self->_metric) forKey:@"metric"];
  [v5 encodeObject:self->_timestamp forKey:@"timestamp"];
  [v5 encodeObject:self->_contentIdentifier forKey:@"content_identifier"];
  [v5 encodeObject:self->_contextIdentifier forKey:@"context_identifier"];
  [v5 encodeObject:self->_properties forKey:@"properties"];
  [v5 encodeObject:self->_internalProperties forKey:@"internal_properties"];
  [v5 encodeInt32:LODWORD(self->_options) forKey:@"options"];
  [v5 encodeObject:self->_handle forKey:@"handle"];
  [v5 encodeInt32:LODWORD(self->_order) forKey:@"order"];
  [v5 encodeObject:self->_trace forKey:@"trace"];
  [v5 encodeObject:self->_branch forKey:@"branch"];
  [v5 encodeObject:self->_relayData forKey:@"relay"];
  [v5 encodeObject:self->_environment forKey:@"environment"];
  [v5 encodeInt32:self->_source forKey:@"source"];
}

- (BOOL)validateMetricAndSetupIdentifiers:(id)a3
{
  return 1;
}

- (APMetric)initWithCoder:(id)a3
{
  id v4 = a3;
  v41.receiver = self;
  v41.super_class = (Class)APMetric;
  id v5 = [(APMetric *)&v41 init];
  if (!v5) {
    goto LABEL_3;
  }
  context = (void *)MEMORY[0x1D9469B60]();
  v6 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  uint64_t v10 = objc_opt_class();
  uint64_t v11 = objc_opt_class();
  uint64_t v12 = objc_opt_class();
  uint64_t v13 = objc_opt_class();
  v14 = objc_msgSend(v6, "setWithObjects:", v7, v8, v9, v10, v11, v12, v13, objc_opt_class(), 0);
  v5->_purpose = (int)[v4 decodeInt32ForKey:@"purpose"];
  v5->_metric = (int)[v4 decodeInt32ForKey:@"metric"];
  uint64_t v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"timestamp"];
  timestamp = v5->_timestamp;
  v5->_timestamp = (NSDate *)v15;

  uint64_t v17 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"content_identifier"];
  contentIdentifier = v5->_contentIdentifier;
  v5->_contentIdentifier = (NSString *)v17;

  uint64_t v19 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"context_identifier"];
  contextIdentifier = v5->_contextIdentifier;
  v5->_contextIdentifier = (NSString *)v19;

  uint64_t v21 = [v4 decodeObjectOfClasses:v14 forKey:@"properties"];
  properties = v5->_properties;
  v5->_properties = (NSDictionary *)v21;

  uint64_t v23 = [v4 decodeObjectOfClasses:v14 forKey:@"internal_properties"];
  internalProperties = v5->_internalProperties;
  v5->_internalProperties = (NSDictionary *)v23;

  v5->_options = (int)[v4 decodeInt32ForKey:@"options"];
  v5->_order = (int)[v4 decodeInt32ForKey:@"order"];
  uint64_t v25 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"trace"];
  trace = v5->_trace;
  v5->_trace = (NSString *)v25;

  uint64_t v27 = [v4 decodeObjectOfClasses:v14 forKey:@"branch"];
  branch = v5->_branch;
  v5->_branch = (NSArray *)v27;

  uint64_t v29 = [v4 decodeObjectOfClasses:v14 forKey:@"relay"];
  relayData = v5->_relayData;
  v5->_relayData = (NSDictionary *)v29;

  uint64_t v31 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"handle"];
  handle = v5->_handle;
  v5->_handle = (NSString *)v31;

  v33 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v34 = objc_opt_class();
  v35 = objc_msgSend(v33, "setWithObjects:", v34, objc_opt_class(), 0);
  uint64_t v36 = [v4 decodeObjectOfClasses:v35 forKey:@"environment"];
  environment = v5->_environment;
  v5->_environment = (NSArray *)v36;

  v5->_source = [v4 decodeInt32ForKey:@"source"];
  LODWORD(v34) = [(APMetric *)v5 validateMetricAndSetupIdentifiers:v4];

  v38 = 0;
  if (v34) {
LABEL_3:
  }
    v38 = v5;

  return v38;
}

- (APMetric)initWithPurpose:(int64_t)a3 metric:(int64_t)a4 contentIdentifier:(id)a5 contextIdentifier:(id)a6 handle:(id)a7 branch:(id)a8 properties:(id)a9 internalProperties:(id)a10 relayData:(id)a11 environment:(id)a12 order:(int64_t)a13 options:(int64_t)a14
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v44 = a5;
  id v43 = a6;
  id v20 = a7;
  id obj = a8;
  id v42 = a8;
  id v21 = a9;
  id v22 = a10;
  id v23 = a11;
  id v24 = a12;
  if (![v21 dictionaryContainsContainers]) {
    goto LABEL_12;
  }
  if (a4 > 1499)
  {
    if (a4 == 1500 || a4 == 2801 || a4 == 2803) {
      goto LABEL_12;
    }
  }
  else if ((unint64_t)(a4 - 1403) <= 3 && a4 != 1404)
  {
    goto LABEL_12;
  }
  log = APLogForCategory(0x1EuLL);
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109376;
    int v47 = a4;
    __int16 v48 = 1024;
    int v49 = a3;
    _os_log_impl(&dword_1D70B2000, log, OS_LOG_TYPE_DEFAULT, "Metric (%d) for purpose (%d) has a property that is a container!", buf, 0xEu);
  }

LABEL_12:
  v45.receiver = self;
  v45.super_class = (Class)APMetric;
  uint64_t v25 = [(APMetric *)&v45 init];
  v26 = v25;
  if (!v25) {
    goto LABEL_16;
  }
  v25->_purpose = a3;
  v25->_metric = a4;
  objc_storeStrong((id *)&v25->_contentIdentifier, a5);
  objc_storeStrong((id *)&v26->_contextIdentifier, a6);
  uint64_t v27 = [MEMORY[0x1E4F1C9C8] date];
  timestamp = v26->_timestamp;
  v26->_timestamp = (NSDate *)v27;

  uint64_t v29 = [v21 copy];
  properties = v26->_properties;
  v26->_properties = (NSDictionary *)v29;

  uint64_t v31 = [v22 copy];
  internalProperties = v26->_internalProperties;
  v26->_internalProperties = (NSDictionary *)v31;

  v26->_options = a14;
  objc_storeStrong((id *)&v26->_contextIdentifier, a6);
  v26->_purpose = a3;
  objc_storeStrong((id *)&v26->_branch, obj);
  uint64_t v33 = [v23 copy];
  relayData = v26->_relayData;
  v26->_relayData = (NSDictionary *)v33;

  objc_storeStrong((id *)&v26->_environment, a12);
  v26->_order = a13;
  if (v20)
  {
    uint64_t v35 = [v20 copy];
    handle = v26->_handle;
    v26->_handle = (NSString *)v35;
  }
  v37 = 0;
  if (-[APMetric validateMetricAndSetupIdentifiers:](v26, "validateMetricAndSetupIdentifiers:", 0, a12)) {
LABEL_16:
  }
    v37 = v26;

  return v37;
}

- (NSString)bundleIdentifier
{
  v2 = [(APMetric *)self internalProperties];
  v3 = [v2 objectForKey:@"bundle_identifier"];

  return (NSString *)v3;
}

- (void)addInternalPropertyValue:(id)a3 forKey:(id)a4
{
  v16[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = v7;
  if (v6 && v7)
  {
    if (self->_internalProperties)
    {
      uint64_t v9 = [(APMetric *)self internalProperties];
      uint64_t v10 = (void *)[v9 mutableCopy];

      [v10 setValue:v6 forKey:v8];
      uint64_t v11 = (NSDictionary *)[v10 copy];
      internalProperties = self->_internalProperties;
      self->_internalProperties = v11;
    }
    else
    {
      id v15 = v7;
      v16[0] = v6;
      uint64_t v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:&v15 count:1];
      v14 = self->_internalProperties;
      self->_internalProperties = v13;
    }
  }
}

- (void)updatePurpose:(int64_t)a3
{
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v3 = self;
  objc_sync_enter(v3);
  id v14 = 0;
  id v4 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v3 requiringSecureCoding:1 error:&v14];
  id v5 = v14;
  objc_sync_exit(v3);

  if (v5)
  {
    id v6 = APLogForCategory(0x1EuLL);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v16 = v3;
      __int16 v17 = 2112;
      id v18 = v5;
      _os_log_impl(&dword_1D70B2000, v6, OS_LOG_TYPE_ERROR, "Error archiving metric %@! error: %@", buf, 0x16u);
    }

    id v7 = [NSString stringWithFormat:@"Error archiving metric %@! error: %@", v3, v5];
    APSimulateCrash(5, v7, 0);
  }
  id v13 = v5;
  uint64_t v8 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:objc_opt_class() fromData:v4 error:&v13];
  id v9 = v13;

  if (v9)
  {
    uint64_t v10 = APLogForCategory(0x1EuLL);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v16 = v3;
      __int16 v17 = 2112;
      id v18 = v9;
      _os_log_impl(&dword_1D70B2000, v10, OS_LOG_TYPE_ERROR, "Error unarchiving metric %@! error: %@", buf, 0x16u);
    }

    uint64_t v11 = [NSString stringWithFormat:@"Error unarchiving metric %@! error: %@", v3, v9];
    APSimulateCrash(5, v11, 0);
  }
  return v8;
}

- (id)_addOptionsToProperties:(id)a3
{
  id v3 = a3;
  return v3;
}

- (id)_optionsArray
{
  unint64_t v2 = [(APMetric *)self options];
  id v3 = [MEMORY[0x1E4F1CA48] array];
  id v4 = v3;
  if (v2 >= 0xFFFFFFFF80000000) {
    [v3 addObject:@"flush"];
  }
  return v4;
}

- (id)_options
{
  unint64_t v2 = [(APMetric *)self _optionsArray];
  if ([v2 count])
  {
    id v3 = [v2 componentsJoinedByString:@"|"];
  }
  else
  {
    id v3 = @"none";
  }

  return v3;
}

- (id)_properties
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  unint64_t v2 = [(APMetric *)self properties];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id obj = [v2 allKeys];
  uint64_t v3 = [obj countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    id v5 = 0;
    uint64_t v6 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v19 != v6) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void *)(*((void *)&v18 + 1) + 8 * i);
        id v9 = [v2 objectForKeyedSubscript:v8];
        uint64_t v10 = NSString;
        uint64_t v11 = [v9 description];
        uint64_t v12 = (void *)v11;
        if (v5)
        {
          uint64_t v13 = [v10 stringWithFormat:@"%@ %@: %@", v5, v8, v11];

          id v5 = (__CFString *)v13;
        }
        else
        {
          id v5 = [v10 stringWithFormat:@" %@: %@", v8, v11];
        }
      }
      uint64_t v4 = [obj countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v4);
  }
  else
  {
    id v5 = 0;
  }

  if (v5) {
    id v14 = v5;
  }
  else {
    id v14 = &stru_1F2EA2540;
  }
  id v15 = v14;

  return v15;
}

- (id)_internalProperties
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  unint64_t v2 = [(APMetric *)self internalProperties];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id obj = [v2 allKeys];
  uint64_t v3 = [obj countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    id v5 = 0;
    uint64_t v6 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v19 != v6) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void *)(*((void *)&v18 + 1) + 8 * i);
        id v9 = [v2 objectForKeyedSubscript:v8];
        uint64_t v10 = NSString;
        uint64_t v11 = [v9 description];
        uint64_t v12 = (void *)v11;
        if (v5)
        {
          uint64_t v13 = [v10 stringWithFormat:@"%@ %@: %@", v5, v8, v11];

          id v5 = (__CFString *)v13;
        }
        else
        {
          id v5 = [v10 stringWithFormat:@" %@: %@", v8, v11];
        }
      }
      uint64_t v4 = [obj countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v4);
  }
  else
  {
    id v5 = 0;
  }

  if (v5) {
    id v14 = v5;
  }
  else {
    id v14 = &stru_1F2EA2540;
  }
  id v15 = v14;

  return v15;
}

- (id)_relayData
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  unint64_t v2 = [(APMetric *)self relayData];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id obj = [v2 allKeys];
  uint64_t v3 = [obj countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    id v5 = 0;
    uint64_t v6 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v19 != v6) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void *)(*((void *)&v18 + 1) + 8 * i);
        id v9 = [v2 objectForKeyedSubscript:v8];
        uint64_t v10 = NSString;
        uint64_t v11 = [v9 description];
        uint64_t v12 = (void *)v11;
        if (v5)
        {
          uint64_t v13 = [v10 stringWithFormat:@"%@ %@: %@", v5, v8, v11];

          id v5 = (__CFString *)v13;
        }
        else
        {
          id v5 = [v10 stringWithFormat:@" %@: %@", v8, v11];
        }
      }
      uint64_t v4 = [obj countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v4);
  }
  else
  {
    id v5 = 0;
  }

  if (v5) {
    id v14 = v5;
  }
  else {
    id v14 = &stru_1F2EA2540;
  }
  id v15 = v14;

  return v15;
}

- (id)_descriptionWithFormat:(id)a3
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (void *)MEMORY[0x1E4F28D48];
  id v5 = a3;
  uint64_t v6 = [v4 apLocalSharedFormatter];
  id v7 = [(APMetric *)self timestamp];
  v37 = v6;
  uint64_t v38 = [v6 stringFromDate:v7];

  int64_t v36 = [(APMetric *)self purpose];
  int64_t v35 = [(APMetric *)self metric];
  uint64_t v8 = [(APMetric *)self handle];
  id v9 = (void *)v8;
  uint64_t v10 = @"none";
  if (v8) {
    uint64_t v11 = (__CFString *)v8;
  }
  else {
    uint64_t v11 = @"none";
  }
  objc_super v41 = v11;

  v40 = [(APMetric *)self _options];
  uint64_t v12 = [(APMetric *)self contentIdentifier];
  uint64_t v13 = (void *)v12;
  if (v12) {
    id v14 = (__CFString *)v12;
  }
  else {
    id v14 = @"none";
  }
  v39 = v14;

  uint64_t v15 = [(APMetric *)self contextIdentifier];
  v16 = (void *)v15;
  if (v15) {
    __int16 v17 = (__CFString *)v15;
  }
  else {
    __int16 v17 = @"none";
  }
  long long v18 = v17;

  uint64_t v19 = [(APMetric *)self bundleIdentifier];
  long long v20 = (void *)v19;
  if (v19) {
    long long v21 = (__CFString *)v19;
  }
  else {
    long long v21 = @"none";
  }
  id v22 = v21;

  uint64_t v23 = [(APMetric *)self _properties];
  id v24 = [(APMetric *)self _internalProperties];
  uint64_t v25 = [(APMetric *)self _relayData];
  int64_t v26 = [(APMetric *)self order];
  uint64_t v27 = [(APMetric *)self environment];
  if (v27)
  {
    v28 = [(APMetric *)self environment];
    uint64_t v10 = [v28 componentsJoinedByString:@","];
  }
  id v42 = 0;
  uint64_t v29 = (void *)v38;
  v30 = [NSString stringWithValidatedFormat:v5, @"%@%ld%ld%@%@%@%@%@%@%@%@%ld%@", &v42, v38, v36, v35, v41, v40, v39, v18, v22, v23, v24, v25, v26, v10 validFormatSpecifiers error];

  id v31 = v42;
  if (v31)
  {
    v32 = APLogForCategory(0x1EuLL);
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      uint64_t v33 = [v31 localizedDescription];
      *(_DWORD *)buf = 138412290;
      id v44 = v33;
      _os_log_impl(&dword_1D70B2000, v32, OS_LOG_TYPE_ERROR, "Error retrieving description for metric: %@", buf, 0xCu);

      uint64_t v29 = (void *)v38;
    }
  }
  return v30;
}

- (NSString)description
{
  v42[13] = *MEMORY[0x1E4F143B8];
  if (+[APSystemInternal isAppleInternalInstall])
  {
    uint64_t v3 = (void *)[objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:@"com.apple.AdPlatforms"];
    if ([v3 BOOLForKey:@"AutomationLoggingEnabled"])
    {
      uint64_t v4 = [MEMORY[0x1E4F28D48] apUTCSharedFormatter];
      id v5 = [(APMetric *)self timestamp];
      uint64_t v6 = [v4 stringFromDate:v5];

      int64_t v7 = [(APMetric *)self purpose];
      int64_t v8 = [(APMetric *)self metric];
      uint64_t v9 = [(APMetric *)self handle];
      uint64_t v10 = (void *)v9;
      uint64_t v11 = &stru_1F2EA2540;
      if (v9) {
        uint64_t v11 = (__CFString *)v9;
      }
      v40 = v11;

      v39 = [(APMetric *)self _optionsArray];
      uint64_t v38 = [(APMetric *)self contentIdentifier];
      uint64_t v12 = [(APMetric *)self bundleIdentifier];
      uint64_t v13 = v12;
      if (v12)
      {
        id v37 = v12;
      }
      else
      {
        uint64_t v15 = [MEMORY[0x1E4F28B50] mainBundle];
        id v37 = [v15 bundleIdentifier];
      }
      int64_t v36 = [(APMetric *)self contextIdentifier];
      v16 = [(APMetric *)self properties];
      int64_t v35 = [(APMetric *)self _addOptionsToProperties:v16];

      __int16 v17 = [(APMetric *)self internalProperties];
      long long v18 = v17;
      if (v17)
      {
        id v19 = v17;
      }
      else
      {
        id v19 = [MEMORY[0x1E4F1C9E8] dictionary];
      }
      uint64_t v34 = v19;

      long long v20 = [(APMetric *)self relayData];
      long long v21 = v20;
      if (v20)
      {
        id v22 = v20;
      }
      else
      {
        id v22 = [MEMORY[0x1E4F1C9E8] dictionary];
      }
      uint64_t v33 = v22;

      int64_t v23 = [(APMetric *)self order];
      id v24 = [(APMetric *)self environment];
      if (v24)
      {
        uint64_t v25 = [(APMetric *)self environment];
        id v31 = [v25 componentsJoinedByString:@","];
      }
      else
      {
        id v31 = &stru_1F2EA2540;
      }

      v42[0] = v6;
      v41[0] = @"TS";
      v41[1] = @"R";
      v32 = (void *)v6;
      int64_t v26 = [NSNumber numberWithInteger:v7];
      v42[1] = v26;
      v41[2] = @"M";
      uint64_t v27 = [NSNumber numberWithInteger:v8];
      v42[2] = v27;
      v42[3] = v40;
      v41[3] = @"H";
      v41[4] = @"O";
      v42[4] = v39;
      v42[5] = v38;
      v41[5] = @"CI";
      v41[6] = @"CX";
      v42[6] = v36;
      v42[7] = v37;
      v41[7] = @"BID";
      v41[8] = @"P";
      v42[8] = v35;
      v42[9] = v34;
      v41[9] = @"IP";
      v41[10] = @"ORD";
      v28 = [NSNumber numberWithInteger:v23];
      v42[10] = v28;
      v42[11] = v33;
      v41[11] = @"REL";
      v41[12] = @"ENV";
      v42[12] = v31;
      uint64_t v29 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v42 forKeys:v41 count:13];

      id v14 = [v29 jsonStringWithOptions:1];
    }
    else
    {
      id v14 = [(APMetric *)self _descriptionWithFormat:@"%@ Purpose: %ld Metric: %ld H: %@ Options: %@, CID: %@ CX: %@ BID: %@ P: %@ IP: %@ REL: %@, ORD: %ld ENV: %@"];
    }
  }
  else
  {
    id v14 = [(APMetric *)self _descriptionWithFormat:@"%@ R: %ld M: %ld H: %@ O: %@, CI: %@ CX: %@ BID: %@ P: %@ IP: %@ REL: %@, ORD: %ld ENV: %@"];
  }
  return (NSString *)v14;
}

- (int64_t)purpose
{
  return self->_purpose;
}

- (void)setPurpose:(int64_t)a3
{
  self->_purpose = a3;
}

- (int64_t)metric
{
  return self->_metric;
}

- (NSDate)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(id)a3
{
}

- (NSString)contentIdentifier
{
  return self->_contentIdentifier;
}

- (NSString)contextIdentifier
{
  return self->_contextIdentifier;
}

- (NSDictionary)properties
{
  return self->_properties;
}

- (void)setProperties:(id)a3
{
}

- (NSDictionary)internalProperties
{
  return self->_internalProperties;
}

- (int64_t)options
{
  return self->_options;
}

- (NSString)handle
{
  return self->_handle;
}

- (void)setHandle:(id)a3
{
}

- (int64_t)order
{
  return self->_order;
}

- (NSString)trace
{
  return self->_trace;
}

- (void)setTrace:(id)a3
{
}

- (NSArray)branch
{
  return self->_branch;
}

- (void)setBranch:(id)a3
{
}

- (NSDictionary)relayData
{
  return self->_relayData;
}

- (NSArray)environment
{
  return self->_environment;
}

- (void)setEnvironment:(id)a3
{
}

- (unsigned)source
{
  return self->_source;
}

- (void)setSource:(unsigned int)a3
{
  self->_source = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_environment, 0);
  objc_storeStrong((id *)&self->_relayData, 0);
  objc_storeStrong((id *)&self->_branch, 0);
  objc_storeStrong((id *)&self->_trace, 0);
  objc_storeStrong((id *)&self->_handle, 0);
  objc_storeStrong((id *)&self->_internalProperties, 0);
  objc_storeStrong((id *)&self->_properties, 0);
  objc_storeStrong((id *)&self->_contextIdentifier, 0);
  objc_storeStrong((id *)&self->_contentIdentifier, 0);
  objc_storeStrong((id *)&self->_timestamp, 0);
}

@end