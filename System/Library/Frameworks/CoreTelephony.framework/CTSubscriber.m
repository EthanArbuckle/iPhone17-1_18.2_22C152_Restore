@interface CTSubscriber
- (BOOL)_isValidGid:(id)a3;
- (BOOL)_isValidMCCMNCString:(id)a3 max:(unint64_t)a4 min:(unint64_t)a5;
- (BOOL)isSIMInserted;
- (BOOL)refreshCarrierToken;
- (CTServiceDescriptor)descriptor;
- (CTSubscriber)init;
- (CTSubscriber)initWithDescriptor:(id)a3;
- (CTSubscriber)initWithDescriptor:(id)a3 client:(id)a4;
- (NSData)carrierToken;
- (NSString)identifier;
- (id).cxx_construct;
- (id)delegate;
- (id)typeAllocationCode;
- (void)authTokenChanged:(id)a3;
- (void)authenticate:(id)a3 completion:(id)a4;
- (void)authenticateWithInfo:(id)a3 handleResult:(id)a4;
- (void)carrierToken;
- (void)isSIMInserted;
- (void)refreshCarrierToken;
- (void)setDelegate:(id)delegate;
- (void)setDescriptor:(id)a3;
- (void)typeAllocationCode;
@end

@implementation CTSubscriber

- (CTSubscriber)initWithDescriptor:(id)a3 client:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v18.receiver = self;
  v18.super_class = (Class)CTSubscriber;
  v9 = [(CTSubscriber *)&v18 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_descriptor, a3);
    v11 = NSString;
    v12 = [v7 identifier];
    v13 = [v11 stringWithFormat:@"CTSubscriber-%@", v12];

    id v14 = v13;
    dispatch_queue_t v15 = dispatch_queue_create((const char *)[v14 UTF8String], 0);
    fObj = v10->_queue.fObj.fObj;
    v10->_queue.fObj.fObj = (dispatch_object_s *)v15;
    if (fObj) {
      dispatch_release(fObj);
    }
    objc_storeStrong((id *)&v10->_client, a4);
    [(CoreTelephonyClient *)v10->_client setDelegate:v10];
  }
  return v10;
}

- (CTSubscriber)initWithDescriptor:(id)a3
{
  id v5 = a3;
  v17.receiver = self;
  v17.super_class = (Class)CTSubscriber;
  v6 = [(CTSubscriber *)&v17 init];
  id v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_descriptor, a3);
    id v8 = NSString;
    v9 = [v5 identifier];
    v10 = [v8 stringWithFormat:@"CTSubscriber-%@", v9];

    id v11 = v10;
    dispatch_queue_t v12 = dispatch_queue_create((const char *)[v11 UTF8String], 0);
    fObj = v7->_queue.fObj.fObj;
    v7->_queue.fObj.fObj = (dispatch_object_s *)v12;
    if (fObj) {
      dispatch_release(fObj);
    }
    id v14 = [[CoreTelephonyClient alloc] initWithQueue:v7->_queue.fObj.fObj];
    client = v7->_client;
    v7->_client = v14;

    [(CoreTelephonyClient *)v7->_client setDelegate:v7];
  }

  return v7;
}

- (CTSubscriber)init
{
  v3 = [[CTServiceDescriptor alloc] initWithDomain:1 instance:&unk_1ED01DF68];
  v4 = [(CTSubscriber *)self initWithDescriptor:v3];

  return v4;
}

- (NSData)carrierToken
{
  client = self->_client;
  v3 = [(CTSubscriber *)self descriptor];
  id v8 = 0;
  v4 = [(CoreTelephonyClient *)client getUserAuthToken:v3 error:&v8];
  id v5 = v8;

  if (v5)
  {
    v6 = CTLogSubscriber();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[CTSubscriber carrierToken]();
    }
  }

  return (NSData *)v4;
}

- (NSString)identifier
{
  v2 = [(CTSubscriber *)self descriptor];
  v3 = [v2 identifier];

  return (NSString *)v3;
}

- (BOOL)refreshCarrierToken
{
  client = self->_client;
  v3 = [(CTSubscriber *)self descriptor];
  id v7 = 0;
  [(CoreTelephonyClient *)client refreshUserAuthToken:v3 error:&v7];
  id v4 = v7;

  if (v4)
  {
    id v5 = CTLogSubscriber();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      -[CTSubscriber refreshCarrierToken]();
    }
  }

  return v4 == 0;
}

- (void)authenticate:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  client = self->_client;
  v9 = [(CTSubscriber *)self descriptor];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __40__CTSubscriber_authenticate_completion___block_invoke;
  v11[3] = &unk_1E52676A8;
  id v10 = v7;
  id v12 = v10;
  [(CoreTelephonyClient *)client authenticate:v9 request:v6 completion:v11];
}

void __40__CTSubscriber_authenticate_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = CTLogSubscriber();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __40__CTSubscriber_authenticate_completion___block_invoke_cold_2();
    }
  }
  else
  {
    id v8 = CTLogSubscriber();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      __40__CTSubscriber_authenticate_completion___block_invoke_cold_1();
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)authenticateWithInfo:(id)a3 handleResult:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_opt_new();
  id v9 = v6;
  id v10 = [v9 objectForKeyedSubscript:@"kCTSimSupportUICCAuthenticationTypeKey"];
  if ([v10 isEqualToString:@"kCTSimSupportUICCAuthenticationTypeEAPAKA"])
  {
    id v11 = objc_opt_new();
    id v12 = [v9 objectForKeyedSubscript:@"kCTSimSupportUICCAuthenticationRandKey"];
    [v11 setRand:v12];

    v13 = [v9 objectForKeyedSubscript:@"kCTSimSupportUICCAuthenticationAutnKey"];
    [v11 setAutn:v13];
  }
  else
  {
    if (![v10 isEqualToString:@"kCTSimSupportUICCAuthenticationTypeEAPSIM"])
    {
      id v11 = 0;
      goto LABEL_7;
    }
    id v11 = objc_opt_new();
    v13 = [v9 objectForKeyedSubscript:@"kCTSimSupportUICCAuthenticationRandKey"];
    [v11 setRand:v13];
  }

LABEL_7:
  [v8 setAlgorithm:v11];

  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __50__CTSubscriber_authenticateWithInfo_handleResult___block_invoke;
  v15[3] = &unk_1E52676D0;
  id v14 = v7;
  id v16 = v14;
  [(CTSubscriber *)self authenticate:v8 completion:v15];
}

void __50__CTSubscriber_authenticateWithInfo_handleResult___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = v3;
  id v19 = v5;
  if (v5)
  {
    id v6 = objc_opt_new();
    id v7 = [v19 auts];

    if (v7)
    {
      id v8 = [v19 auts];
      [v6 setObject:v8 forKeyedSubscript:@"kCTSimSupportUICCAuthenticationAutsKey"];
    }
    id v9 = [v19 res];

    if (v9)
    {
      id v10 = [v19 res];
      [v6 setObject:v10 forKeyedSubscript:@"kCTSimSupportUICCAuthenticationResKey"];
    }
    id v11 = [v19 sres];

    if (v11)
    {
      id v12 = [v19 sres];
      [v6 setObject:v12 forKeyedSubscript:@"kCTSimSupportUICCAuthenticationSresKey"];
    }
    v13 = [v19 kc];

    if (v13)
    {
      id v14 = [v19 kc];
      [v6 setObject:v14 forKeyedSubscript:@"kCTSimSupportUICCAuthenticationKcKey"];
    }
    dispatch_queue_t v15 = [v19 ck];

    if (v15)
    {
      id v16 = [v19 ck];
      [v6 setObject:v16 forKeyedSubscript:@"kCTSimSupportUICCAuthenticationCkKey"];
    }
    objc_super v17 = [v19 ik];

    if (v17)
    {
      objc_super v18 = [v19 ik];
      [v6 setObject:v18 forKeyedSubscript:@"kCTSimSupportUICCAuthenticationIkKey"];
    }
    id v5 = v19;
  }
  else
  {
    id v6 = 0;
  }

  (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v6);
}

- (id)typeAllocationCode
{
  client = self->_client;
  id v3 = [(CTSubscriber *)self descriptor];
  id v8 = 0;
  uint64_t v4 = [(CoreTelephonyClient *)client getTypeAllocationCode:v3 error:&v8];
  id v5 = v8;

  if (v5)
  {
    id v6 = CTLogSubscriber();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[CTSubscriber typeAllocationCode]();
    }
  }

  return v4;
}

- (BOOL)isSIMInserted
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v3 = [MEMORY[0x1E4F28B50] mainBundle];
  uint64_t v4 = [v3 infoDictionary];
  v32 = [v4 objectForKey:@"CarrierDescriptors"];

  v33 = objc_opt_new();
  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id v5 = v32;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v35 objects:v40 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v36;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v36 != v7) {
          objc_enumerationMutation(v5);
        }
        id v9 = *(void **)(*((void *)&v35 + 1) + 8 * i);
        id v10 = [v9 objectForKeyedSubscript:@"MCC"];
        BOOL v11 = [(CTSubscriber *)self _isValidMCCMNCString:v10 max:3 min:3];

        if (v11)
        {
          id v12 = [v9 objectForKeyedSubscript:@"MNC"];
          BOOL v13 = [(CTSubscriber *)self _isValidMCCMNCString:v12 max:3 min:2];

          if (v13)
          {
            id v14 = [v9 objectForKeyedSubscript:@"GID1"];
            BOOL v15 = [(CTSubscriber *)self _isValidGid:v14];

            if (v15)
            {
              id v16 = [v9 objectForKeyedSubscript:@"GID2"];
              BOOL v17 = [(CTSubscriber *)self _isValidGid:v16];

              if (v17)
              {
                objc_super v18 = objc_opt_new();
                id v19 = [v9 objectForKeyedSubscript:@"MCC"];
                [v18 setObject:v19 forKeyedSubscript:@"MCC"];

                v20 = [v9 objectForKeyedSubscript:@"MNC"];
                [v18 setObject:v20 forKeyedSubscript:@"MNC"];

                v21 = [v9 objectForKeyedSubscript:@"GID1"];
                [v18 setObject:v21 forKeyedSubscript:@"GID1"];

                v22 = [v9 objectForKeyedSubscript:@"GID2"];
                [v18 setObject:v22 forKeyedSubscript:@"GID2"];

                [v33 addObject:v18];
              }
            }
          }
        }
      }
      uint64_t v6 = [v5 countByEnumeratingWithState:&v35 objects:v40 count:16];
    }
    while (v6);
  }

  if (![v33 count])
  {
    v24 = CTLogSubscriber();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18444A000, v24, OS_LOG_TYPE_INFO, "No carrier descriptors found", buf, 2u);
    }
    goto LABEL_19;
  }
  if ((unint64_t)[v33 count] >= 0x1A)
  {
    v23 = CTLogSubscriber();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
      -[CTSubscriber isSIMInserted](buf, [v33 count], v23);
    }
LABEL_19:
    char v25 = 0;
    goto LABEL_26;
  }
  client = self->_client;
  v27 = [(CTSubscriber *)self descriptor];
  id v34 = 0;
  v28 = [(CoreTelephonyClient *)client isSimMatching:v27 carrierDescriptors:v33 error:&v34];
  id v29 = v34;

  if (v29)
  {
    v30 = CTLogSubscriber();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
      -[CTSubscriber isSIMInserted]();
    }
    char v25 = 0;
  }
  else
  {
    char v25 = [v28 BOOLValue];
  }

LABEL_26:
  return v25;
}

- (void)authTokenChanged:(id)a3
{
  id v8 = a3;
  uint64_t v4 = [(CTSubscriber *)self descriptor];
  char v5 = [v8 isEqual:v4];

  if (v5)
  {
    uint64_t v6 = [(CTSubscriber *)self delegate];
    [v6 subscriberTokenRefreshed:self];

    uint64_t v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v7 postNotificationName:@"CTSubscriberTokenRefreshed" object:self];
  }
}

- (BOOL)_isValidMCCMNCString:(id)a3 max:(unint64_t)a4 min:(unint64_t)a5
{
  id v7 = a3;
  id v8 = [MEMORY[0x1E4F28B88] decimalDigitCharacterSet];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && [v7 length] <= a4 && objc_msgSend(v7, "length") >= a5)
  {
    BOOL v11 = [v7 stringByTrimmingCharactersInSet:v8];
    BOOL v9 = [v11 length] == 0;
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (BOOL)_isValidGid:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [MEMORY[0x1E4F28B88] characterSetWithCharactersInString:@"0123456789ABCDEFabcdef"];
  if (v3)
  {
    if ([v3 length] && (unint64_t)objc_msgSend(v3, "length") <= 0x32)
    {
      uint64_t v6 = [v3 stringByTrimmingCharactersInSet:v4];
      BOOL v5 = [v6 length] == 0;
    }
    else
    {
      BOOL v5 = 0;
    }
  }
  else
  {
    BOOL v5 = 1;
  }

  return v5;
}

- (id)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return WeakRetained;
}

- (void)setDelegate:(id)delegate
{
}

- (CTServiceDescriptor)descriptor
{
  return self->_descriptor;
}

- (void)setDescriptor:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_descriptor, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_client, 0);
  fObj = self->_queue.fObj.fObj;
  if (fObj)
  {
    dispatch_release(fObj);
  }
}

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  return self;
}

- (void)carrierToken
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2_2(&dword_18444A000, v0, v1, "Error getting user auth token: %@", v2, v3, v4, v5, v6);
}

- (void)refreshCarrierToken
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2_2(&dword_18444A000, v0, v1, "Error refreshing user auth token: %@", v2, v3, v4, v5, v6);
}

void __40__CTSubscriber_authenticate_completion___block_invoke_cold_1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1_0();
  _os_log_debug_impl(&dword_18444A000, v0, OS_LOG_TYPE_DEBUG, "Authentication successful: %@", v1, 0xCu);
}

void __40__CTSubscriber_authenticate_completion___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2_2(&dword_18444A000, v0, v1, "Failed to authenticate request: %@", v2, v3, v4, v5, v6);
}

- (void)typeAllocationCode
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2_2(&dword_18444A000, v0, v1, "Error retrieving type allocation code: %@", v2, v3, v4, v5, v6);
}

- (void)isSIMInserted
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2_2(&dword_18444A000, v0, v1, "Error determining if sim is inserted: %@", v2, v3, v4, v5, v6);
}

@end