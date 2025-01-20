@interface PARSessionConfiguration
+ (BOOL)supportsSecureCoding;
+ (id)defaultSessionConfiguration;
- (BOOL)dontPreloadImages;
- (BOOL)enablePersonalizedRanking;
- (BOOL)parsecEnabled;
- (NSDictionary)overrideFeatureFlags;
- (NSString)experimentId;
- (NSString)experimentNamespaceId;
- (NSString)experimentTreatmentId;
- (NSString)identifier;
- (NSString)userAgent;
- (PARResultFactory)factory;
- (PARSessionConfiguration)init;
- (PARSessionConfiguration)initWithCoder:(id)a3;
- (PARSessionConfiguration)initWithId:(id)a3 userAgent:(id)a4;
- (PARSessionConfiguration)initWithId:(id)a3 userAgent:(id)a4 factory:(id)a5;
- (id)description;
- (int)experimentDeploymentId;
- (int)experimentVersion;
- (void)encodeWithCoder:(id)a3;
- (void)setDontPreloadImages:(BOOL)a3;
- (void)setEnablePersonalizedRanking:(BOOL)a3;
- (void)setExperimentDeploymentId:(int)a3;
- (void)setExperimentId:(id)a3;
- (void)setExperimentNamespaceId:(id)a3;
- (void)setExperimentTreatmentId:(id)a3;
- (void)setExperimentVersion:(int)a3;
- (void)setOverrideFeatureFlags:(id)a3;
- (void)setParsecEnabled:(BOOL)a3;
@end

@implementation PARSessionConfiguration

- (NSString)identifier
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (BOOL)parsecEnabled
{
  return self->_parsecEnabled;
}

- (PARSessionConfiguration)initWithId:(id)a3 userAgent:(id)a4 factory:(id)a5
{
  uint64_t v5 = MEMORY[0x1F4188790](self, a2, a3, a4, a5);
  v7 = v6;
  v9 = v8;
  v10 = (void *)v5;
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v12 = v11;
  id v13 = v9;
  id v14 = v7;
  v38.receiver = v10;
  v38.super_class = (Class)PARSessionConfiguration;
  v15 = [(PARSessionConfiguration *)&v38 init];
  if (!v15) {
    goto LABEL_29;
  }
  if (v12 && v13)
  {
    v16 = 0;
    goto LABEL_21;
  }
  pid_t v17 = getpid();
  if (proc_pidpath(v17, buffer, 0x1000u) <= 0)
  {
    if (PARLogHandleForCategory_onceToken != -1) {
      dispatch_once(&PARLogHandleForCategory_onceToken, &__block_literal_global_325);
    }
    v20 = (void *)PARLogHandleForCategory_logHandles_2;
    if (os_log_type_enabled((os_log_t)PARLogHandleForCategory_logHandles_2, OS_LOG_TYPE_ERROR))
    {
      v31 = v20;
      v32 = __error();
      v33 = strerror(*v32);
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)&buf[4] = v17;
      LOWORD(v40[0]) = 2080;
      *(void *)((char *)v40 + 2) = v33;
      _os_log_error_impl(&dword_19C7E7000, v31, OS_LOG_TYPE_ERROR, "error getting path for pid [%d] %s", buf, 0x12u);
    }
    v19 = @"com.apple.parsec.defaultClient";
  }
  else
  {
    v18 = [NSString stringWithUTF8String:buffer];
    v19 = [v18 lastPathComponent];
  }
  v21 = v19;
  if (([(__CFString *)v21 isEqualToString:@"searchd"] & 1) != 0
    || ([(__CFString *)v21 isEqualToString:@"SpringBoard"] & 1) != 0
    || ([(__CFString *)v21 isEqualToString:@"Spotlight Test"] & 1) != 0
    || ([(__CFString *)v21 isEqualToString:@"Spotlight"] & 1) != 0
    || ([(__CFString *)v21 isEqualToString:@"Spotlight2"] & 1) != 0
    || [(__CFString *)v21 isEqualToString:@"Search"])
  {
    v22 = @"com.apple.spotlight";
    *(void *)buf = @"_identifier";
    v40[0] = @"_userAgent";
    v23 = @"Spotlight/1";
    goto LABEL_19;
  }
  v34 = @"Safari";
  if ([(__CFString *)v21 containsString:@"Safari"])
  {
    *(void *)buf = @"_identifier";
    v40[0] = @"_userAgent";
    v23 = @"Safari/1";
  }
  else
  {
    if (([(__CFString *)v21 isEqualToString:@"DDActionsService"] & 1) != 0
      || [(__CFString *)v21 isEqualToString:@"LookupViewService"])
    {
      v22 = @"com.apple.lookup";
      *(void *)buf = @"_identifier";
      v40[0] = @"_userAgent";
      v23 = @"Lookup/1";
      goto LABEL_19;
    }
    if ([(__CFString *)v21 isEqualToString:@"HashtagImagesExtension"])
    {
      v22 = @"Messages-searchToShare-session";
      *(void *)buf = @"_identifier";
      v40[0] = @"_userAgent";
      v23 = @"Messages/1";
      goto LABEL_19;
    }
    v35 = [(__CFString *)v21 lowercaseString];
    int v36 = [v35 containsString:@"news"];

    if (v36)
    {
      v22 = @"com.apple.news";
      *(void *)buf = @"_identifier";
      v40[0] = @"_userAgent";
      v23 = @"News/1";
      goto LABEL_19;
    }
    if (([(__CFString *)v21 isEqualToString:@"assistantd"] & 1) != 0
      || ([(__CFString *)v21 parsec_hasPrefix:@"Siri"] & 1) != 0
      || [(__CFString *)v21 isEqualToString:@"assistant_service"])
    {
      v22 = @"com.apple.siri";
      *(void *)buf = @"_identifier";
      v40[0] = @"_userAgent";
      v23 = @"Siri/1";
      goto LABEL_19;
    }
    if ([(__CFString *)v21 isEqualToString:@"suggestd"])
    {
      v22 = @"com.apple.proactive.trystero";
      *(void *)buf = @"_identifier";
      v40[0] = @"_userAgent";
      v23 = @"Trystero/1";
      goto LABEL_19;
    }
    v34 = @"reversetemplated";
    if (([(__CFString *)v21 isEqualToString:@"reversetemplated"] & 1) == 0
      && ![(__CFString *)v21 containsString:@"suggest_tool"])
    {
      if ([(__CFString *)v21 isEqualToString:@"duetexpertd"])
      {
        v22 = @"com.apple.notifications.logging";
        *(void *)buf = @"_identifier";
        v40[0] = @"_userAgent";
        v23 = @"DuetExpert/1";
      }
      else
      {
        if ([(__CFString *)v21 isEqualToString:@"mediaanalysisd"])
        {
          v22 = @"com.apple.mediaanalysisd";
        }
        else
        {
          if (([(__CFString *)v21 isEqualToString:@"PhotosMessagesApp"] & 1) != 0
            || ([(__CFString *)v21 isEqualToString:@"PhotoPicker"] & 1) != 0
            || [(__CFString *)v21 isEqualToString:@"PhotosPicker"])
          {
            v22 = @"com.apple.photopicker";
            *(void *)buf = @"_identifier";
            v40[0] = @"_userAgent";
            v23 = @"PhotoPicker/1";
            goto LABEL_19;
          }
          if (([(__CFString *)v21 isEqualToString:@"MobileSlideShow"] & 1) != 0
            || [(__CFString *)v21 isEqualToString:@"Photos"])
          {
            v22 = @"com.apple.photos";
            *(void *)buf = @"_identifier";
            v40[0] = @"_userAgent";
            v23 = @"Photos/1";
            goto LABEL_19;
          }
          if (([(__CFString *)v21 isEqualToString:@"Tamale"] & 1) == 0
            && ![(__CFString *)v21 isEqualToString:@"VisualIntelligenceCamera"])
          {
            if (PARLogHandleForCategory_onceToken != -1) {
              dispatch_once(&PARLogHandleForCategory_onceToken, &__block_literal_global_325);
            }
            v37 = PARLogHandleForCategory_logHandles_2;
            if (os_log_type_enabled((os_log_t)PARLogHandleForCategory_logHandles_2, OS_LOG_TYPE_ERROR))
            {
              LODWORD(buffer[0]) = 138412290;
              *(void *)((char *)buffer + 4) = v21;
              _os_log_error_impl(&dword_19C7E7000, v37, OS_LOG_TYPE_ERROR, "unhandled process %@", (uint8_t *)buffer, 0xCu);
            }
            v22 = @"default";
            *(void *)buf = @"_identifier";
            v40[0] = @"_userAgent";
            v23 = @"parsecd/1.0";
            goto LABEL_19;
          }
          v22 = @"com.apple.VisualIntelligenceCamera";
        }
        *(void *)buf = @"_identifier";
        v40[0] = @"_userAgent";
        v23 = @"VisualIntelligence/1";
      }
LABEL_19:
      *(void *)&buffer[0] = v22;
      goto LABEL_20;
    }
    *(void *)buf = @"_identifier";
    v40[0] = @"_userAgent";
    v23 = @"CoreSuggestions/1";
  }
  *(void *)&buffer[0] = v34;
LABEL_20:
  *((void *)&buffer[0] + 1) = v23;
  v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:buffer forKeys:buf count:2];

  if (!v12)
  {
    uint64_t v24 = [v16 objectForKeyedSubscript:@"_identifier"];
    goto LABEL_22;
  }
LABEL_21:
  uint64_t v24 = [v12 copy];
LABEL_22:
  identifier = v15->_identifier;
  v15->_identifier = (NSString *)v24;

  if (v14) {
    v26 = (PARDefaultFactory *)v14;
  }
  else {
    v26 = objc_alloc_init(PARDefaultFactory);
  }
  factory = v15->_factory;
  v15->_factory = (PARResultFactory *)v26;

  if (v13)
  {
    uint64_t v28 = [v13 copy];
  }
  else
  {
    uint64_t v28 = [v16 objectForKeyedSubscript:@"_userAgent"];
  }
  userAgent = v15->_userAgent;
  v15->_userAgent = (NSString *)v28;

  v15->_dontPreloadImages = 1;
  v15->_parsecEnabled = 1;

LABEL_29:
  return v15;
}

- (NSString)userAgent
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)encodeWithCoder:(id)a3
{
  identifier = self->_identifier;
  id v5 = a3;
  [v5 encodeObject:identifier forKey:@"_identifier"];
  [v5 encodeObject:self->_userAgent forKey:@"_userAgent"];
  [v5 encodeBool:self->_dontPreloadImages forKey:@"_dontPreloadImages"];
  [v5 encodeBool:self->_parsecEnabled forKey:@"_parsecEnabled"];
  [v5 encodeObject:self->_experimentNamespaceId forKey:@"experimentNamespaceId"];
  [v5 encodeObject:self->_experimentId forKey:@"experimentId"];
  [v5 encodeObject:self->_experimentTreatmentId forKey:@"experimentTreatmentId"];
  [v5 encodeInt32:self->_experimentDeploymentId forKey:@"experimentDeploymentId"];
  [v5 encodeInt32:self->_experimentVersion forKey:@"experimentVersion"];
  [v5 encodeObject:self->_overrideFeatureFlags forKey:@"_overrideFeatureFlags"];
}

- (void)setParsecEnabled:(BOOL)a3
{
  self->_parsecEnabled = a3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PARSessionConfiguration)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_identifier"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_userAgent"];
  v7 = [(PARSessionConfiguration *)self initWithId:v5 userAgent:v6];

  v7->_dontPreloadImages = [v4 decodeBoolForKey:@"_dontPreloadImages"];
  v7->_parsecEnabled = [v4 decodeBoolForKey:@"_parsecEnabled"];
  uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"experimentNamespaceId"];
  experimentNamespaceId = v7->_experimentNamespaceId;
  v7->_experimentNamespaceId = (NSString *)v8;

  uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"experimentId"];
  experimentId = v7->_experimentId;
  v7->_experimentId = (NSString *)v10;

  uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"experimentTreatmentId"];
  experimentTreatmentId = v7->_experimentTreatmentId;
  v7->_experimentTreatmentId = (NSString *)v12;

  v7->_experimentDeploymentId = [v4 decodeInt32ForKey:@"experimentDeploymentId"];
  v7->_experimentVersion = [v4 decodeInt32ForKey:@"experimentVersion"];
  id v14 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v15 = objc_opt_class();
  uint64_t v16 = objc_opt_class();
  pid_t v17 = objc_msgSend(v14, "setWithObjects:", v15, v16, objc_opt_class(), 0);
  uint64_t v18 = [v4 decodeObjectOfClasses:v17 forKey:@"_overrideFeatureFlags"];

  overrideFeatureFlags = v7->_overrideFeatureFlags;
  v7->_overrideFeatureFlags = (NSDictionary *)v18;

  return v7;
}

- (PARSessionConfiguration)initWithId:(id)a3 userAgent:(id)a4
{
  return [(PARSessionConfiguration *)self initWithId:a3 userAgent:a4 factory:0];
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"(%@, %@)", self->_identifier, self->_userAgent];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overrideFeatureFlags, 0);
  objc_storeStrong((id *)&self->_experimentTreatmentId, 0);
  objc_storeStrong((id *)&self->_experimentId, 0);
  objc_storeStrong((id *)&self->_experimentNamespaceId, 0);
  objc_storeStrong((id *)&self->_factory, 0);
  objc_storeStrong((id *)&self->_userAgent, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

- (void)setOverrideFeatureFlags:(id)a3
{
}

- (NSDictionary)overrideFeatureFlags
{
  return self->_overrideFeatureFlags;
}

- (void)setExperimentVersion:(int)a3
{
  self->_experimentVersion = a3;
}

- (int)experimentVersion
{
  return self->_experimentVersion;
}

- (void)setExperimentDeploymentId:(int)a3
{
  self->_experimentDeploymentId = a3;
}

- (int)experimentDeploymentId
{
  return self->_experimentDeploymentId;
}

- (void)setExperimentTreatmentId:(id)a3
{
}

- (NSString)experimentTreatmentId
{
  return self->_experimentTreatmentId;
}

- (void)setExperimentId:(id)a3
{
}

- (NSString)experimentId
{
  return self->_experimentId;
}

- (void)setExperimentNamespaceId:(id)a3
{
}

- (NSString)experimentNamespaceId
{
  return self->_experimentNamespaceId;
}

- (void)setEnablePersonalizedRanking:(BOOL)a3
{
  self->_enablePersonalizedRanking = a3;
}

- (BOOL)enablePersonalizedRanking
{
  return self->_enablePersonalizedRanking;
}

- (void)setDontPreloadImages:(BOOL)a3
{
  self->_dontPreloadImages = a3;
}

- (BOOL)dontPreloadImages
{
  return self->_dontPreloadImages;
}

- (PARResultFactory)factory
{
  return (PARResultFactory *)objc_getProperty(self, a2, 40, 1);
}

- (PARSessionConfiguration)init
{
  return [(PARSessionConfiguration *)self initWithId:0 userAgent:0];
}

+ (id)defaultSessionConfiguration
{
  if (defaultSessionConfiguration_once != -1) {
    dispatch_once(&defaultSessionConfiguration_once, &__block_literal_global_8);
  }
  v2 = (void *)defaultSessionConfiguration__defaultSession;

  return v2;
}

uint64_t __54__PARSessionConfiguration_defaultSessionConfiguration__block_invoke()
{
  defaultSessionConfiguration__defaultSession = objc_alloc_init(PARSessionConfiguration);

  return MEMORY[0x1F41817F8]();
}

@end