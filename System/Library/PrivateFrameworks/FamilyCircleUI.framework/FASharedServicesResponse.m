@interface FASharedServicesResponse
- (BOOL)locationAllowed;
- (FASharedServicesResponse)initWithHTTPResponse:(id)a3 data:(id)a4;
- (NSArray)serviceGroups;
- (NSArray)services;
- (void)_initializeServicesMapWithGroups:(id)a3 andServices:(id)a4;
- (void)_setLocationAllowedWithLocation:(BOOL)a3;
- (void)_sharedServicesWithNoGrouping:(id)a3;
@end

@implementation FASharedServicesResponse

- (FASharedServicesResponse)initWithHTTPResponse:(id)a3 data:(id)a4
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  v19.receiver = self;
  v19.super_class = (Class)FASharedServicesResponse;
  v4 = [(AAResponse *)&v19 initWithHTTPResponse:a3 data:a4 bodyIsPlist:1];
  v5 = v4;
  if (v4)
  {
    v6 = [(AAResponse *)v4 responseDictionary];
    v7 = [v6 objectForKeyedSubscript:@"familySharedServicesGroups"];

    v8 = [(AAResponse *)v5 responseDictionary];
    v9 = [v8 objectForKeyedSubscript:@"familySharedServices"];

    v10 = [(AAResponse *)v5 responseDictionary];
    v11 = [v10 objectForKeyedSubscript:@"locationAllowed"];

    if (v11) {
      uint64_t v12 = [v11 BOOLValue];
    }
    else {
      uint64_t v12 = 1;
    }
    [(FASharedServicesResponse *)v5 _setLocationAllowedWithLocation:v12];
    if (v9)
    {
      [(FASharedServicesResponse *)v5 _sharedServicesWithNoGrouping:v9];
      if (v7) {
        [(FASharedServicesResponse *)v5 _initializeServicesMapWithGroups:v7 andServices:v9];
      }
    }
    else
    {
      v13 = [(AAResponse *)v5 responseDictionary];
      v14 = [v13 objectForKeyedSubscript:@"status"];

      v15 = [(AAResponse *)v5 responseDictionary];
      v16 = [v15 objectForKeyedSubscript:@"status-message"];

      v17 = _FALogSystem();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v21 = v14;
        __int16 v22 = 2112;
        v23 = v16;
        _os_log_impl(&dword_2189F0000, v17, OS_LOG_TYPE_DEFAULT, "Error: Shared services not seen in server response data with status=%@ message=%@", buf, 0x16u);
      }
    }
  }
  return v5;
}

- (void)_setLocationAllowedWithLocation:(BOOL)a3
{
  self->_locationAllowed = a3;
}

- (void)_initializeServicesMapWithGroups:(id)a3 andServices:(id)a4
{
  uint64_t v51 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v44 = objc_opt_new();
  if (v4)
  {
    long long v47 = 0u;
    long long v48 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    id v42 = v4;
    id v5 = v4;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v45 objects:v50 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v46;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v46 != v8) {
            objc_enumerationMutation(v5);
          }
          v10 = (void *)[objc_alloc(MEMORY[0x263F3BFF8]) initWithServerResponse:*(void *)(*((void *)&v45 + 1) + 8 * v9)];
          services = self->_services;
          uint64_t v12 = (void *)MEMORY[0x263F08A98];
          v13 = [v10 groupID];
          v14 = [v12 predicateWithFormat:@"SELF.groupID == %@", v13];
          v15 = [(NSArray *)services filteredArrayUsingPredicate:v14];

          [v10 setServices:v15];
          [v44 addObject:v10];

          ++v9;
        }
        while (v7 != v9);
        uint64_t v7 = [v5 countByEnumeratingWithState:&v45 objects:v50 count:16];
      }
      while (v7);
    }

    v16 = [objc_alloc(MEMORY[0x263F08B30]) initWithKey:@"groupID" ascending:1];
    v49 = v16;
    v17 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v49 count:1];
    v18 = [v44 sortedArrayUsingDescriptors:v17];
    serviceGroups = self->_serviceGroups;
    self->_serviceGroups = v18;

    v20 = self->_services;
    v21 = [MEMORY[0x263F08A98] predicateWithFormat:@"SELF.groupID == %@", &stru_26CA2C800];
    __int16 v22 = [(NSArray *)v20 filteredArrayUsingPredicate:v21];

    if ([v22 count])
    {
      v23 = _FALogSystem();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
        -[FASharedServicesResponse _initializeServicesMapWithGroups:andServices:](v23, v24, v25, v26, v27, v28, v29, v30);
      }

      v31 = [(NSArray *)self->_serviceGroups firstObject];
      v32 = [v31 services];
      v33 = [v22 arrayByAddingObjectsFromArray:v32];

      v34 = [(NSArray *)self->_serviceGroups firstObject];
      [v34 setServices:v33];
    }
    id v4 = v42;
  }
  else
  {
    v16 = _FALogSystem();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      -[FASharedServicesResponse _initializeServicesMapWithGroups:andServices:](v16, v35, v36, v37, v38, v39, v40, v41);
    }
  }
}

- (void)_sharedServicesWithNoGrouping:(id)a3
{
  v16[1] = *MEMORY[0x263EF8340];
  if (a3)
  {
    id v4 = objc_msgSend(a3, "fa_map:", &__block_literal_global_20);
    id v5 = (void *)[objc_alloc(MEMORY[0x263F08B30]) initWithKey:@"order" ascending:1];
    v16[0] = v5;
    uint64_t v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v16 count:1];
    uint64_t v7 = [v4 sortedArrayUsingDescriptors:v6];
    services = self->_services;
    self->_services = v7;
  }
  else
  {
    id v4 = _FALogSystem();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      -[FASharedServicesResponse _sharedServicesWithNoGrouping:](v4, v9, v10, v11, v12, v13, v14, v15);
    }
  }
}

id __58__FASharedServicesResponse__sharedServicesWithNoGrouping___block_invoke(uint64_t a1, void *a2)
{
  v2 = (objc_class *)MEMORY[0x263F3BFF0];
  id v3 = a2;
  id v4 = (void *)[[v2 alloc] initWithDictionary:v3];

  return v4;
}

- (NSArray)services
{
  return self->_services;
}

- (NSArray)serviceGroups
{
  return self->_serviceGroups;
}

- (BOOL)locationAllowed
{
  return self->_locationAllowed;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceGroups, 0);
  objc_storeStrong((id *)&self->_services, 0);
}

- (void)_initializeServicesMapWithGroups:(uint64_t)a3 andServices:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_initializeServicesMapWithGroups:(uint64_t)a3 andServices:(uint64_t)a4 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_sharedServicesWithNoGrouping:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end