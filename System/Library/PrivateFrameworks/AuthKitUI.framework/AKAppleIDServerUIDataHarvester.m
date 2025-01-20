@interface AKAppleIDServerUIDataHarvester
- (AKAppleIDServerUIDataHarvester)init;
- (NSDictionary)harvestedData;
- (void)_harvestDataFromClientInfo:(id)a3 withExtractor:(id)a4;
- (void)_harvestIDMSRecoveryHeadersInfo:(id)a3;
- (void)harvestDataFromServerHTTPResponse:(id)a3;
- (void)harvestDataFromServerUIObjectModel:(id)a3;
- (void)harvestIDMSRecoveryInfoFromClientInfo:(id)a3;
- (void)harvestIDMSRecoveryInfoFromHeaders:(id)a3;
@end

@implementation AKAppleIDServerUIDataHarvester

- (AKAppleIDServerUIDataHarvester)init
{
  v6.receiver = self;
  v6.super_class = (Class)AKAppleIDServerUIDataHarvester;
  v2 = [(AKAppleIDServerUIDataHarvester *)&v6 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    harvestedData = v2->_harvestedData;
    v2->_harvestedData = (NSMutableDictionary *)v3;
  }
  return v2;
}

- (NSDictionary)harvestedData
{
  v2 = (void *)[(NSMutableDictionary *)self->_harvestedData copy];

  return (NSDictionary *)v2;
}

- (void)harvestDataFromServerUIObjectModel:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = _AKLogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138477827;
    id v9 = v4;
    _os_log_impl(&dword_1C38C1000, v5, OS_LOG_TYPE_DEFAULT, "Harvesting data from object model: %{private}@", (uint8_t *)&v8, 0xCu);
  }

  objc_super v6 = [[AKAppleIDObjectModelFieldExtractor alloc] initWithObjectModel:v4];
  v7 = [v4 clientInfo];
  [(AKAppleIDServerUIDataHarvester *)self _harvestDataFromClientInfo:v7 withExtractor:v6];
}

- (void)_harvestDataFromClientInfo:(id)a3 withExtractor:(id)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  int v8 = _AKLogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v25 = 138477827;
    id v26 = v7;
    _os_log_impl(&dword_1C38C1000, v8, OS_LOG_TYPE_DEFAULT, "Harvesting data with extractor: %{private}@", (uint8_t *)&v25, 0xCu);
  }

  id v9 = [v6 objectForKeyedSubscript:@"appleIdRowId"];
  uint64_t v10 = [v7 valueForFieldWithID:v9];
  if (v10) {
    goto LABEL_4;
  }
  v15 = [v6 objectForKeyedSubscript:@"appleIdRowPrefixId"];
  uint64_t v16 = [v7 valueForFieldWithID:v15];
  if (!v16)
  {

    goto LABEL_22;
  }
  v17 = (void *)v16;
  v18 = [v6 objectForKeyedSubscript:@"appleIdRowSuffixId"];
  v19 = [v7 valueForFieldWithID:v18];
  if (v19
    || ([v6 objectForKeyedSubscript:@"appleIdServerInfoSuffixId"],
        v20 = objc_claimAutoreleasedReturnValue(),
        [v7 valueForFieldWithID:v20],
        v19 = objc_claimAutoreleasedReturnValue(),
        v20,
        v19))
  {
    uint64_t v10 = [v17 stringByAppendingString:v19];
  }
  else
  {
    uint64_t v10 = 0;
  }

  if (!v10)
  {
LABEL_22:
    v24 = [v6 objectForKeyedSubscript:@"appleIdServerInfoId"];
    uint64_t v10 = [v7 valueForFieldWithID:v24];

    if (!v10) {
      goto LABEL_7;
    }
  }
LABEL_4:
  v11 = _AKLogSystem();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v25 = 138478083;
    id v26 = v10;
    __int16 v27 = 2113;
    id v28 = v7;
    _os_log_impl(&dword_1C38C1000, v11, OS_LOG_TYPE_DEFAULT, "Found an Apple ID (%{private}@) with extractor %{private}@", (uint8_t *)&v25, 0x16u);
  }

  [(NSMutableDictionary *)self->_harvestedData setObject:v10 forKeyedSubscript:*MEMORY[0x1E4F4EE10]];
LABEL_7:
  v12 = [v6 objectForKeyedSubscript:@"passwordRowId"];
  v13 = v12;
  if (v12)
  {
    id v14 = v12;
  }
  else
  {
    id v14 = [v6 objectForKeyedSubscript:@"newPasswordRowId"];
  }
  v21 = v14;

  v22 = [v7 valueForFieldWithID:v21];
  if (v22)
  {
    v23 = _AKLogSystem();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG)) {
      -[AKAppleIDServerUIDataHarvester _harvestDataFromClientInfo:withExtractor:]((uint64_t)v7, v22, v23);
    }

    [(NSMutableDictionary *)self->_harvestedData setObject:v22 forKeyedSubscript:*MEMORY[0x1E4F4EDE8]];
  }
  [(AKAppleIDServerUIDataHarvester *)self harvestIDMSRecoveryInfoFromClientInfo:v6];
}

- (void)harvestDataFromServerHTTPResponse:(id)a3
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = _AKLogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[AKAppleIDServerUIDataHarvester harvestDataFromServerHTTPResponse:]((uint64_t)v4, v5);
  }

  id v6 = [v4 allHeaderFields];
  uint64_t v7 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4F4EE38]];

  if (v7)
  {
    int v8 = _AKLogSystem();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C38C1000, v8, OS_LOG_TYPE_DEFAULT, "Found continuation data header in HTTP response", buf, 2u);
    }

    [(NSMutableDictionary *)self->_harvestedData setObject:v7 forKeyedSubscript:*MEMORY[0x1E4F4EDE0]];
  }
  id v9 = [v4 allHeaderFields];
  uint64_t v10 = [v9 objectForKeyedSubscript:*MEMORY[0x1E4F4ED08]];

  if ([v10 length])
  {
    v11 = _AKLogSystem();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138477827;
      v38 = v10;
      _os_log_impl(&dword_1C38C1000, v11, OS_LOG_TYPE_DEFAULT, "Found Apple ID (%{private}@) in HTTP response", buf, 0xCu);
    }

    [(NSMutableDictionary *)self->_harvestedData setObject:v10 forKeyedSubscript:*MEMORY[0x1E4F4EE10]];
  }
  v36 = (void *)v7;
  v12 = [v4 allHeaderFields];
  v13 = [v12 objectForKeyedSubscript:*MEMORY[0x1E4F4EE80]];

  if ([v13 length])
  {
    id v14 = _AKLogSystem();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138477827;
      v38 = v13;
      _os_log_impl(&dword_1C38C1000, v14, OS_LOG_TYPE_DEFAULT, "Found HME email address  (%{private}@) in HTTP response", buf, 0xCu);
    }

    [(NSMutableDictionary *)self->_harvestedData setObject:v13 forKeyedSubscript:*MEMORY[0x1E4F4EE88]];
  }
  v15 = [v4 allHeaderFields];
  uint64_t v16 = [v15 objectForKeyedSubscript:@"X-Apple-I-Private-Email-Client-Bundle"];

  if ([v16 length])
  {
    v17 = _AKLogSystem();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138477827;
      v38 = v16;
      _os_log_impl(&dword_1C38C1000, v17, OS_LOG_TYPE_DEFAULT, "Found HME email bundle (%{private}@) in HTTP response", buf, 0xCu);
    }

    [(NSMutableDictionary *)self->_harvestedData setObject:v16 forKeyedSubscript:@"X-Apple-I-Private-Email-Client-Bundle"];
  }
  v35 = v10;
  v18 = [v4 allHeaderFields];
  uint64_t v19 = *MEMORY[0x1E4F4EE58];
  v20 = [v18 objectForKeyedSubscript:*MEMORY[0x1E4F4EE58]];

  if (v20) {
    [(NSMutableDictionary *)self->_harvestedData setObject:v20 forKeyedSubscript:v19];
  }
  v21 = [v4 allHeaderFields];
  uint64_t v22 = *MEMORY[0x1E4F4EE78];
  v23 = [v21 objectForKeyedSubscript:*MEMORY[0x1E4F4EE78]];

  if (v23) {
    [(NSMutableDictionary *)self->_harvestedData setObject:v23 forKeyedSubscript:v22];
  }
  v34 = v16;
  v24 = [v4 allHeaderFields];
  uint64_t v25 = *MEMORY[0x1E4F4EEE8];
  id v26 = [v24 objectForKeyedSubscript:*MEMORY[0x1E4F4EEE8]];

  if (v26) {
    [(NSMutableDictionary *)self->_harvestedData setObject:v26 forKeyedSubscript:v25];
  }
  __int16 v27 = v13;
  id v28 = [v4 allHeaderFields];
  uint64_t v29 = *MEMORY[0x1E4F4EEF0];
  v30 = [v28 objectForKeyedSubscript:*MEMORY[0x1E4F4EEF0]];

  if (v30) {
    [(NSMutableDictionary *)self->_harvestedData setObject:v30 forKeyedSubscript:v29];
  }
  v31 = [v4 allHeaderFields];
  uint64_t v32 = *MEMORY[0x1E4F4EEE0];
  v33 = [v31 objectForKeyedSubscript:*MEMORY[0x1E4F4EEE0]];

  if (v33) {
    [(NSMutableDictionary *)self->_harvestedData setObject:v33 forKeyedSubscript:v32];
  }
  [(AKAppleIDServerUIDataHarvester *)self _harvestIDMSRecoveryHeadersInfo:v4];
}

- (void)_harvestIDMSRecoveryHeadersInfo:(id)a3
{
  id v4 = [a3 allHeaderFields];
  [(AKAppleIDServerUIDataHarvester *)self harvestIDMSRecoveryInfoFromHeaders:v4];
}

- (void)harvestIDMSRecoveryInfoFromClientInfo:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = *MEMORY[0x1E4F4EE10];
  id v6 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F4EE10]];
  if (v6) {
    [(NSMutableDictionary *)self->_harvestedData setObject:v6 forKeyedSubscript:v5];
  }
  uint64_t v7 = *MEMORY[0x1E4F4EEC8];
  int v8 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F4EEC8]];
  id v9 = (uint64_t *)MEMORY[0x1E4F4F0F8];
  if (v8
    || (uint64_t v10 = *MEMORY[0x1E4F4F0F8],
        [v4 objectForKeyedSubscript:*MEMORY[0x1E4F4F0F8]],
        (int v8 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v11 = _AKLogSystem();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v16) = 0;
      _os_log_impl(&dword_1C38C1000, v11, OS_LOG_TYPE_DEFAULT, "Harvested recovery continuation endpoint", (uint8_t *)&v16, 2u);
    }

    [(NSMutableDictionary *)self->_harvestedData setObject:v8 forKeyedSubscript:v7];
    uint64_t v10 = *v9;
  }
  v12 = [v4 objectForKeyedSubscript:v10];
  if (v12) {
    [(NSMutableDictionary *)self->_harvestedData setObject:v12 forKeyedSubscript:v10];
  }
  uint64_t v13 = *MEMORY[0x1E4F4EEB8];
  id v14 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F4EEB8]];
  v15 = _AKLogSystem();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    int v16 = 138412290;
    v17 = v14;
    _os_log_impl(&dword_1C38C1000, v15, OS_LOG_TYPE_DEFAULT, "harvestIDMSRecoveryInfoFromClientInfo: RKMandate is %@", (uint8_t *)&v16, 0xCu);
  }

  [(NSMutableDictionary *)self->_harvestedData setObject:v14 forKeyedSubscript:v13];
}

- (void)harvestIDMSRecoveryInfoFromHeaders:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = *MEMORY[0x1E4F4ED38];
  id v6 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F4ED38]];
  if (v6)
  {
    [(NSMutableDictionary *)self->_harvestedData setObject:v6 forKeyedSubscript:v5];
    if (([v6 isEqualToString:*MEMORY[0x1E4F4ED50]] & 1) != 0
      || [v6 isEqualToString:*MEMORY[0x1E4F4ED58]])
    {
      uint64_t v7 = _AKLogSystem();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        int v21 = 138412290;
        uint64_t v22 = v6;
        _os_log_impl(&dword_1C38C1000, v7, OS_LOG_TYPE_DEFAULT, "Harvested native recovery action: %@", (uint8_t *)&v21, 0xCu);
      }

      int v8 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F4F0F0]];
      uint64_t v9 = *MEMORY[0x1E4F4EEC0];
      if (v8
        || ([v4 objectForKeyedSubscript:*MEMORY[0x1E4F4EEC0]],
            (int v8 = objc_claimAutoreleasedReturnValue()) != 0))
      {
        [(NSMutableDictionary *)self->_harvestedData setObject:v8 forKeyedSubscript:v9];
      }
      uint64_t v10 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F4F0E8]];
      uint64_t v11 = *MEMORY[0x1E4F4EEB0];
      if (v10
        || ([v4 objectForKeyedSubscript:*MEMORY[0x1E4F4EEB0]],
            (uint64_t v10 = objc_claimAutoreleasedReturnValue()) != 0))
      {
        [(NSMutableDictionary *)self->_harvestedData setObject:v10 forKeyedSubscript:v11];
      }
      uint64_t v12 = *MEMORY[0x1E4F4ED68];
      uint64_t v13 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F4ED68]];
      if (v13) {
        [(NSMutableDictionary *)self->_harvestedData setObject:v13 forKeyedSubscript:v12];
      }
      uint64_t v14 = *MEMORY[0x1E4F4EE40];
      v15 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F4EE40]];
      if (v15) {
        [(NSMutableDictionary *)self->_harvestedData setObject:v15 forKeyedSubscript:v14];
      }
      int v16 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F4ED08]];
      if (v16) {
        [(NSMutableDictionary *)self->_harvestedData setObject:v16 forKeyedSubscript:*MEMORY[0x1E4F4EE10]];
      }
      v17 = [v4 objectForKeyedSubscript:@"X-Apple-AK-Recovery-URL-Key"];
      if (v17)
      {
        uint64_t v18 = _AKLogSystem();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v21) = 0;
          _os_log_impl(&dword_1C38C1000, v18, OS_LOG_TYPE_DEFAULT, "Harvested recovery continuation endpoint", (uint8_t *)&v21, 2u);
        }

        [(NSMutableDictionary *)self->_harvestedData setObject:v17 forKeyedSubscript:*MEMORY[0x1E4F4EEC8]];
      }
      uint64_t v19 = *MEMORY[0x1E4F4ECF8];
      v20 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F4ECF8]];
      if (v20) {
        [(NSMutableDictionary *)self->_harvestedData setObject:v20 forKeyedSubscript:v19];
      }
    }
  }
}

- (void).cxx_destruct
{
}

- (void)_harvestDataFromClientInfo:(NSObject *)a3 withExtractor:.cold.1(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [a2 length];
  id v6 = @"(******)";
  if (!v5) {
    id v6 = @"(empty)";
  }
  int v7 = 138478083;
  uint64_t v8 = a1;
  __int16 v9 = 2113;
  uint64_t v10 = v6;
  _os_log_debug_impl(&dword_1C38C1000, a3, OS_LOG_TYPE_DEBUG, "Found a password with extractor %{private}@ - %{private}@", (uint8_t *)&v7, 0x16u);
}

- (void)harvestDataFromServerHTTPResponse:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138477827;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_1C38C1000, a2, OS_LOG_TYPE_DEBUG, "Harvesting data from response: %{private}@", (uint8_t *)&v2, 0xCu);
}

@end