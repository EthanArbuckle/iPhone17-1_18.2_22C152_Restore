@interface MDMAppPropertyShim
+ (id)_dmdKeysToRequestToGetItems:(id)a3;
+ (id)_itemKeyToDMDKeyMappingTable;
- (BOOL)shouldReturnManagedAppsOnly;
- (DMFConnection)deviceManagementUserConnection;
- (DMFFetchAppsRequest)request;
- (DMFFetchAppsResultObject)response;
- (NSArray)keysForRequest;
- (NSDictionary)appItems;
- (NSSet)appsRequested;
- (NSSet)itemsRequested;
- (id)_appDictionaryFromApp:(id)a3;
- (void)_createAppItems;
- (void)_createKeysForRequest;
- (void)_createRequest;
- (void)_executeRequest;
- (void)fetchAppItems;
- (void)setAppItems:(id)a3;
- (void)setAppsRequested:(id)a3;
- (void)setDeviceManagementUserConnection:(id)a3;
- (void)setItemsRequested:(id)a3;
- (void)setKeysForRequest:(id)a3;
- (void)setRequest:(id)a3;
- (void)setResponse:(id)a3;
- (void)setShouldReturnManagedAppsOnly:(BOOL)a3;
@end

@implementation MDMAppPropertyShim

- (void)fetchAppItems
{
  [(MDMAppPropertyShim *)self _createRequest];
  [(MDMAppPropertyShim *)self _executeRequest];
  [(MDMAppPropertyShim *)self _createAppItems];
}

- (void)_createRequest
{
  [(MDMAppPropertyShim *)self _createKeysForRequest];
  id v6 = (id)objc_opt_new();
  [v6 setType:2];
  v3 = [(MDMAppPropertyShim *)self appsRequested];
  v4 = [v3 allObjects];
  [v6 setBundleIdentifiers:v4];

  objc_msgSend(v6, "setManagedAppsOnly:", -[MDMAppPropertyShim shouldReturnManagedAppsOnly](self, "shouldReturnManagedAppsOnly"));
  [v6 setDeleteFeedback:0];
  [v6 setAdvanceTransientStates:0];
  v5 = [(MDMAppPropertyShim *)self keysForRequest];
  [v6 setPropertyKeys:v5];

  [(MDMAppPropertyShim *)self setRequest:v6];
}

- (void)_createKeysForRequest
{
  v3 = objc_opt_class();
  id v5 = [(MDMAppPropertyShim *)self itemsRequested];
  v4 = [v3 _dmdKeysToRequestToGetItems:v5];
  [(MDMAppPropertyShim *)self setKeysForRequest:v4];
}

- (void)_executeRequest
{
  v13[1] = *MEMORY[0x263EF8340];
  v3 = [(MDMAppPropertyShim *)self deviceManagementUserConnection];
  v4 = [(MDMAppPropertyShim *)self request];
  id v11 = 0;
  id v5 = [v3 performRequest:v4 error:&v11];
  id v6 = v11;

  if (!v5)
  {
    v7 = [NSString stringWithFormat:@"request for app items failed: %@", v6];
    v8 = [MDMAppPropertyShimException alloc];
    v12 = @"error";
    v13[0] = v6;
    v9 = [NSDictionary dictionaryWithObjects:v13 forKeys:&v12 count:1];
    v10 = [(MDMAppPropertyShimException *)v8 initWithName:@"MCDMDAppPropertyShimExceptionRequestFailed" reason:v7 userInfo:v9];

    [(MDMAppPropertyShimException *)v10 raise];
  }
  [(MDMAppPropertyShim *)self setResponse:v5];
}

- (void)_createAppItems
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  v3 = [(MDMAppPropertyShim *)self response];
  v4 = [v3 appsByBundleIdentifier];

  id v5 = objc_opt_new();
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v16 + 1) + 8 * i);
        v12 = objc_msgSend(v6, "objectForKeyedSubscript:", v11, (void)v16);
        v13 = [(MDMAppPropertyShim *)self _appDictionaryFromApp:v12];
        if (![(MDMAppPropertyShim *)self shouldReturnManagedAppsOnly]
          || ([v12 sourceIdentifier],
              v14 = objc_claimAutoreleasedReturnValue(),
              BOOL v15 = v14 != 0,
              v14,
              !v15))
        {
          if (v13) {
            [v5 setObject:v13 forKeyedSubscript:v11];
          }
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v8);
  }

  [(MDMAppPropertyShim *)self setAppItems:v5];
}

- (DMFConnection)deviceManagementUserConnection
{
  deviceManagementUserConnection = self->_deviceManagementUserConnection;
  if (!deviceManagementUserConnection)
  {
    v4 = [MEMORY[0x263F39D18] currentUserConnection];
    id v5 = self->_deviceManagementUserConnection;
    self->_deviceManagementUserConnection = v4;

    deviceManagementUserConnection = self->_deviceManagementUserConnection;
  }
  return deviceManagementUserConnection;
}

+ (id)_itemKeyToDMDKeyMappingTable
{
  v5[16] = *MEMORY[0x263EF8340];
  v4[0] = @"AdHocCodeSigned";
  v4[1] = @"AppStoreVendable";
  v5[0] = @"isAdHocCodeSigned";
  v5[1] = @"isAppStoreVendable";
  v4[2] = @"BetaApp";
  v4[3] = @"BundleSize";
  v5[2] = @"isBetaApp";
  v5[3] = @"staticUsage";
  v4[4] = @"DeviceBasedVPP";
  v4[5] = @"DynamicSize";
  v5[4] = @"isDeviceBasedVPP";
  v5[5] = @"dynamicUsage";
  v4[6] = @"ExternalVersionIdentifier";
  v4[7] = @"DistributorIdentifier";
  v5[6] = @"externalVersionIdentifier";
  v5[7] = @"distributorIdentifier";
  v4[8] = @"HasUpdateAvailable";
  v4[9] = @"Identifier";
  v5[8] = @"hasUpdateAvailable";
  v5[9] = @"bundleIdentifier";
  v4[10] = @"Installing";
  v4[11] = @"IsValidated";
  v5[10] = @"installationState";
  v5[11] = @"isValidated";
  v4[12] = @"Name";
  v4[13] = @"ShortVersion";
  v5[12] = @"displayName";
  v5[13] = @"shortVersion";
  v4[14] = @"Version";
  v4[15] = @"IsAppClip";
  v5[14] = @"version";
  v5[15] = @"isAppClip";
  v2 = [NSDictionary dictionaryWithObjects:v5 forKeys:v4 count:16];
  return v2;
}

+ (id)_dmdKeysToRequestToGetItems:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [a1 _itemKeyToDMDKeyMappingTable];
  id v6 = objc_opt_new();
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v7 = v4;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = objc_msgSend(v5, "objectForKeyedSubscript:", *(void *)(*((void *)&v15 + 1) + 8 * i), (void)v15);
        if (v12) {
          [v6 addObject:v12];
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v9);
  }

  [v6 addObject:@"bundleIdentifier"];
  [v6 addObject:@"installationState"];
  [v6 addObject:@"storeItemIdentifier"];
  [v6 addObject:@"sourceIdentifier"];
  v13 = [v6 allObjects];

  return v13;
}

- (id)_appDictionaryFromApp:(id)a3
{
  id v4 = a3;
  id v5 = objc_opt_new();
  unint64_t v6 = [v4 installationState] - 2;
  if (v6 <= 5 && ((0x37u >> v6) & 1) != 0)
  {
    unsigned int v8 = 0x33u >> v6;
    uint64_t v9 = [(MDMAppPropertyShim *)self itemsRequested];
    int v10 = [v9 containsObject:@"Installing"];

    uint64_t v11 = MEMORY[0x263EFFA88];
    uint64_t v12 = MEMORY[0x263EFFA80];
    if (v10)
    {
      if (v8) {
        uint64_t v13 = MEMORY[0x263EFFA88];
      }
      else {
        uint64_t v13 = MEMORY[0x263EFFA80];
      }
      [v5 setObject:v13 forKeyedSubscript:@"Installing"];
    }
    v14 = [v4 bundleIdentifier];
    [v5 setObject:v14 forKeyedSubscript:@"Identifier"];

    long long v15 = [(MDMAppPropertyShim *)self itemsRequested];
    int v16 = [v15 containsObject:@"ExternalVersionIdentifier"];

    if (v16)
    {
      long long v17 = NSNumber;
      long long v18 = [v4 externalVersionIdentifier];
      long long v19 = objc_msgSend(v17, "numberWithUnsignedInteger:", objc_msgSend(v18, "unsignedIntegerValue"));
      [v5 setObject:v19 forKeyedSubscript:@"ExternalVersionIdentifier"];
    }
    uint64_t v20 = [(MDMAppPropertyShim *)self itemsRequested];
    int v21 = [v20 containsObject:@"DistributorIdentifier"];

    if (v21)
    {
      v22 = [v4 distributorIdentifier];
      [v5 setObject:v22 forKeyedSubscript:@"DistributorIdentifier"];
    }
    v23 = [(MDMAppPropertyShim *)self itemsRequested];
    int v24 = [v23 containsObject:@"Version"];

    if (v24)
    {
      v25 = [v4 version];
      [v5 setObject:v25 forKeyedSubscript:@"Version"];
    }
    v26 = [(MDMAppPropertyShim *)self itemsRequested];
    int v27 = [v26 containsObject:@"ShortVersion"];

    if (v27)
    {
      v28 = [v4 shortVersion];
      [v5 setObject:v28 forKeyedSubscript:@"ShortVersion"];
    }
    v29 = [(MDMAppPropertyShim *)self itemsRequested];
    int v30 = [v29 containsObject:@"Name"];

    if (v30)
    {
      v31 = [v4 displayName];
      [v5 setObject:v31 forKeyedSubscript:@"Name"];
    }
    v32 = [(MDMAppPropertyShim *)self itemsRequested];
    int v33 = [v32 containsObject:@"BundleSize"];

    if (v33)
    {
      v34 = [v4 staticUsage];
      [v5 setObject:v34 forKeyedSubscript:@"BundleSize"];
    }
    v35 = [(MDMAppPropertyShim *)self itemsRequested];
    int v36 = [v35 containsObject:@"DynamicSize"];

    if ((v8 & 1) == 0 && v36)
    {
      id v37 = [v4 dynamicUsage];
      v38 = [v4 onDemandResourcesUsage];
      v39 = v38;
      if (v38)
      {
        if (v37)
        {
          uint64_t v40 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v38, "unsignedLongLongValue") + objc_msgSend(v37, "unsignedLongLongValue"));

          id v37 = (id)v40;
        }
        else
        {
          id v37 = v38;
        }
      }
      [v5 setObject:v37 forKeyedSubscript:@"DynamicSize"];
    }
    v41 = [(MDMAppPropertyShim *)self itemsRequested];
    int v42 = [v41 containsObject:@"HasUpdateAvailable"];

    if (v42)
    {
      v43 = [v4 storeItemIdentifier];
      uint64_t v44 = [v43 longLongValue];

      if (v44)
      {
        if ([v4 hasUpdateAvailable]) {
          uint64_t v45 = v11;
        }
        else {
          uint64_t v45 = v12;
        }
        [v5 setObject:v45 forKeyedSubscript:@"HasUpdateAvailable"];
      }
    }
    v46 = [(MDMAppPropertyShim *)self itemsRequested];
    int v47 = [v46 containsObject:@"IsValidated"];

    if (v47)
    {
      if ([v4 isValidated]) {
        uint64_t v48 = v11;
      }
      else {
        uint64_t v48 = v12;
      }
      [v5 setObject:v48 forKeyedSubscript:@"IsValidated"];
    }
    v49 = [(MDMAppPropertyShim *)self itemsRequested];
    int v50 = [v49 containsObject:@"AppStoreVendable"];

    if (v50)
    {
      if ([v4 isAppStoreVendable]) {
        uint64_t v51 = v11;
      }
      else {
        uint64_t v51 = v12;
      }
      [v5 setObject:v51 forKeyedSubscript:@"AppStoreVendable"];
    }
    v52 = [(MDMAppPropertyShim *)self itemsRequested];
    int v53 = [v52 containsObject:@"DeviceBasedVPP"];

    if (v53)
    {
      if ([v4 isDeviceBasedVPP]) {
        uint64_t v54 = v11;
      }
      else {
        uint64_t v54 = v12;
      }
      [v5 setObject:v54 forKeyedSubscript:@"DeviceBasedVPP"];
    }
    v55 = [(MDMAppPropertyShim *)self itemsRequested];
    int v56 = [v55 containsObject:@"BetaApp"];

    if (v56)
    {
      if ([v4 isBetaApp]) {
        uint64_t v57 = v11;
      }
      else {
        uint64_t v57 = v12;
      }
      [v5 setObject:v57 forKeyedSubscript:@"BetaApp"];
    }
    v58 = [(MDMAppPropertyShim *)self itemsRequested];
    int v59 = [v58 containsObject:@"AdHocCodeSigned"];

    if (v59)
    {
      if ([v4 isAdHocCodeSigned]) {
        uint64_t v60 = v11;
      }
      else {
        uint64_t v60 = v12;
      }
      [v5 setObject:v60 forKeyedSubscript:@"AdHocCodeSigned"];
    }
    v61 = [(MDMAppPropertyShim *)self itemsRequested];
    int v62 = [v61 containsObject:@"IsAppClip"];

    if (v62)
    {
      if ([v4 isAppClip]) {
        uint64_t v63 = v11;
      }
      else {
        uint64_t v63 = v12;
      }
      [v5 setObject:v63 forKeyedSubscript:@"IsAppClip"];
    }
    v64 = [v4 sourceIdentifier];

    if (v64) {
      [v5 setObject:*MEMORY[0x263F38BF0] forKeyedSubscript:@"Source"];
    }
    id v7 = (void *)[v5 copy];
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (NSSet)appsRequested
{
  return self->_appsRequested;
}

- (void)setAppsRequested:(id)a3
{
}

- (BOOL)shouldReturnManagedAppsOnly
{
  return self->_shouldReturnManagedAppsOnly;
}

- (void)setShouldReturnManagedAppsOnly:(BOOL)a3
{
  self->_shouldReturnManagedAppsOnly = a3;
}

- (NSSet)itemsRequested
{
  return self->_itemsRequested;
}

- (void)setItemsRequested:(id)a3
{
}

- (NSDictionary)appItems
{
  return self->_appItems;
}

- (void)setAppItems:(id)a3
{
}

- (void)setDeviceManagementUserConnection:(id)a3
{
}

- (DMFFetchAppsRequest)request
{
  return self->_request;
}

- (void)setRequest:(id)a3
{
}

- (NSArray)keysForRequest
{
  return self->_keysForRequest;
}

- (void)setKeysForRequest:(id)a3
{
}

- (DMFFetchAppsResultObject)response
{
  return self->_response;
}

- (void)setResponse:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_response, 0);
  objc_storeStrong((id *)&self->_keysForRequest, 0);
  objc_storeStrong((id *)&self->_request, 0);
  objc_storeStrong((id *)&self->_deviceManagementUserConnection, 0);
  objc_storeStrong((id *)&self->_appItems, 0);
  objc_storeStrong((id *)&self->_itemsRequested, 0);
  objc_storeStrong((id *)&self->_appsRequested, 0);
}

@end