@interface MDMESSODetails
+ (id)essoDetailsWithJSONDictionary:(id)a3;
- (MDMESSODetails)initWithiTunesStoreID:(id)a3 appIDs:(id)a4 associatedDomains:(id)a5 associatedDomainsEnableDirectDownloads:(id)a6 configurationProfile:(id)a7;
- (NSArray)appIDs;
- (NSArray)associatedDomains;
- (NSData)configurationProfile;
- (NSNumber)associatedDomainsEnableDirectDownloads;
- (NSNumber)iTunesStoreID;
- (void)setAppIDs:(id)a3;
- (void)setAssociatedDomains:(id)a3;
- (void)setAssociatedDomainsEnableDirectDownloads:(id)a3;
- (void)setConfigurationProfile:(id)a3;
- (void)setITunesStoreID:(id)a3;
@end

@implementation MDMESSODetails

+ (id)essoDetailsWithJSONDictionary:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = [v3 objectForKeyedSubscript:@"iTunesStoreID"];
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || ([MEMORY[0x1E4F5E770] ESSOTestModeEnabled] & 1) != 0)
  {
    if ([MEMORY[0x1E4F5E770] ESSOTestModeEnabled])
    {
      v5 = [v3 objectForKeyedSubscript:@"AppIDs"];
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0 || ![v5 count])
      {
        v6 = *(NSObject **)DMCLogObjects();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        {
          int v18 = 138543362;
          id v19 = v3;
          _os_log_impl(&dword_1DD340000, v6, OS_LOG_TYPE_ERROR, "ESSO app IDs is invalid: %{public}@", (uint8_t *)&v18, 0xCu);
        }
        v7 = 0;
LABEL_33:

        goto LABEL_34;
      }
    }
    else
    {
      v5 = 0;
    }
    v9 = [v3 objectForKeyedSubscript:@"AssociatedDomains"];
    if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      v15 = *(NSObject **)DMCLogObjects();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        int v18 = 138543362;
        id v19 = v3;
        _os_log_impl(&dword_1DD340000, v15, OS_LOG_TYPE_ERROR, "ESSO associated domains is invalid: %{public}@", (uint8_t *)&v18, 0xCu);
      }
      v7 = 0;
    }
    else
    {
      v10 = [v3 objectForKeyedSubscript:@"AssociatedDomainsEnableDirectDownloads"];
      if (v10 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      {
        v16 = *(NSObject **)DMCLogObjects();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          int v18 = 138543362;
          id v19 = v3;
          _os_log_impl(&dword_1DD340000, v16, OS_LOG_TYPE_ERROR, "ESSO associated domains enable direct downloads is invalid: %{public}@", (uint8_t *)&v18, 0xCu);
        }
        v7 = 0;
      }
      else
      {
        id v11 = objc_alloc(MEMORY[0x1E4F1C9B8]);
        v12 = [v3 objectForKeyedSubscript:@"ConfigurationProfile"];
        v13 = (void *)[v11 initWithBase64EncodedString:v12 options:0];

        if (v13 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
        {
          v7 = [[MDMESSODetails alloc] initWithiTunesStoreID:v4 appIDs:v5 associatedDomains:v9 associatedDomainsEnableDirectDownloads:v10 configurationProfile:v13];
        }
        else
        {
          v14 = *(NSObject **)DMCLogObjects();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          {
            int v18 = 138543362;
            id v19 = v3;
            _os_log_impl(&dword_1DD340000, v14, OS_LOG_TYPE_ERROR, "ESSO details configuration profile data is invalid or missing: %{public}@", (uint8_t *)&v18, 0xCu);
          }
          v7 = 0;
        }
      }
    }

    goto LABEL_33;
  }
  v8 = *(NSObject **)DMCLogObjects();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    int v18 = 138543362;
    id v19 = v3;
    _os_log_impl(&dword_1DD340000, v8, OS_LOG_TYPE_ERROR, "ESSO details app store ID is invalid or missing: %{public}@", (uint8_t *)&v18, 0xCu);
  }
  v7 = 0;
LABEL_34:

  return v7;
}

- (MDMESSODetails)initWithiTunesStoreID:(id)a3 appIDs:(id)a4 associatedDomains:(id)a5 associatedDomainsEnableDirectDownloads:(id)a6 configurationProfile:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  v25.receiver = self;
  v25.super_class = (Class)MDMESSODetails;
  int v18 = [(MDMESSODetails *)&v25 init];
  id v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_iTunesStoreID, a3);
    uint64_t v20 = [v14 copy];
    appIDs = v19->_appIDs;
    v19->_appIDs = (NSArray *)v20;

    uint64_t v22 = [v15 copy];
    associatedDomains = v19->_associatedDomains;
    v19->_associatedDomains = (NSArray *)v22;

    objc_storeStrong((id *)&v19->_associatedDomainsEnableDirectDownloads, a6);
    objc_storeStrong((id *)&v19->_configurationProfile, a7);
  }

  return v19;
}

- (NSNumber)iTunesStoreID
{
  return self->_iTunesStoreID;
}

- (void)setITunesStoreID:(id)a3
{
}

- (NSArray)appIDs
{
  return self->_appIDs;
}

- (void)setAppIDs:(id)a3
{
}

- (NSArray)associatedDomains
{
  return self->_associatedDomains;
}

- (void)setAssociatedDomains:(id)a3
{
}

- (NSNumber)associatedDomainsEnableDirectDownloads
{
  return self->_associatedDomainsEnableDirectDownloads;
}

- (void)setAssociatedDomainsEnableDirectDownloads:(id)a3
{
}

- (NSData)configurationProfile
{
  return self->_configurationProfile;
}

- (void)setConfigurationProfile:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configurationProfile, 0);
  objc_storeStrong((id *)&self->_associatedDomainsEnableDirectDownloads, 0);
  objc_storeStrong((id *)&self->_associatedDomains, 0);
  objc_storeStrong((id *)&self->_appIDs, 0);

  objc_storeStrong((id *)&self->_iTunesStoreID, 0);
}

@end