@interface EAEmergencyAlertCenter
- (EAEmergencyAlertCenter)init;
- (EAEmergencyAlertCenter)initWithUserNotificationCenter:(id)a3;
- (id)getUpdatedNotificationForAppleSafetyAlert:(id)a3 withMessageDictionary:(id)a4;
- (id)handleCellBroadcastMessage:(id)a3 withCompletionHandler:(id)a4;
- (unint64_t)currentAudioAndVideoCallCount;
- (void)addNotificationRequest:(id)a3 withCompletionHandler:(id)a4;
- (void)handleAppleSafetyAlertMessage:(id)a3;
- (void)handleRawCellBroadcastMessage:(id)a3 withCompletionHandler:(id)a4;
- (void)replaceContentForRequestWithRequestID:(id)a3 replacementContent:(id)a4 completionHandler:(id)a5;
@end

@implementation EAEmergencyAlertCenter

- (EAEmergencyAlertCenter)init
{
  EARegisterUserNotificationsLogging();
  v3 = (void *)[objc_alloc(MEMORY[0x263F1DFB0]) initWithBundleIdentifier:@"com.apple.cmas"];
  v4 = [(EAEmergencyAlertCenter *)self initWithUserNotificationCenter:v3];

  return v4;
}

- (EAEmergencyAlertCenter)initWithUserNotificationCenter:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)EAEmergencyAlertCenter;
  v6 = [(EAEmergencyAlertCenter *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_userNotificationCenter, a3);
  }

  return v7;
}

- (void)replaceContentForRequestWithRequestID:(id)a3 replacementContent:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  userNotificationCenter = self->_userNotificationCenter;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __101__EAEmergencyAlertCenter_replaceContentForRequestWithRequestID_replacementContent_completionHandler___block_invoke;
  v13[3] = &unk_2647AC7C0;
  id v14 = v8;
  id v15 = v9;
  id v11 = v9;
  id v12 = v8;
  [(UNUserNotificationCenter *)userNotificationCenter replaceContentForRequestWithIdentifier:v12 replacementContent:a4 completionHandler:v13];
}

void __101__EAEmergencyAlertCenter_replaceContentForRequestWithRequestID_replacementContent_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = EALogDefault;
  BOOL v5 = os_log_type_enabled((os_log_t)EALogDefault, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (!v5) {
      goto LABEL_7;
    }
    uint64_t v6 = *(void *)(a1 + 32);
    int v12 = 138412546;
    uint64_t v13 = v6;
    __int16 v14 = 2112;
    id v15 = v3;
    v7 = "Failed to replace Notification Content For Request Identifier (%@). Error = %@";
    id v8 = v4;
    uint32_t v9 = 22;
  }
  else
  {
    if (!v5) {
      goto LABEL_7;
    }
    uint64_t v10 = *(void *)(a1 + 32);
    int v12 = 138412290;
    uint64_t v13 = v10;
    v7 = "Replaced Content for: %@";
    id v8 = v4;
    uint32_t v9 = 12;
  }
  _os_log_impl(&dword_2266B8000, v8, OS_LOG_TYPE_DEFAULT, v7, (uint8_t *)&v12, v9);
LABEL_7:
  uint64_t v11 = *(void *)(a1 + 40);
  if (v11) {
    (*(void (**)(uint64_t, id))(v11 + 16))(v11, v3);
  }
}

- (id)getUpdatedNotificationForAppleSafetyAlert:(id)a3 withMessageDictionary:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = [v5 request];
  id v8 = [v7 content];
  uint32_t v9 = (void *)[v8 mutableCopy];

  if (v9)
  {
    uint64_t v10 = [v5 request];
    uint64_t v11 = [v10 content];
    int v12 = [v11 body];
    uint64_t v13 = objc_msgSend(v9, "ea_getUpdatedBodyString:withMessageDictionary:", v12, v6);

    [v9 setBody:v13];
    __int16 v14 = [v5 request];
    id v15 = [v14 content];
    uint64_t v16 = [v15 userInfo];
    v17 = (void *)[v16 mutableCopy];
    objc_msgSend(v9, "ea_updateUserInfo:withMessageDictionary:", v17, v6);

    objc_msgSend(v9, "ea_updateAlertCategory:", v6);
  }

  return v9;
}

- (void)handleAppleSafetyAlertMessage:(id)a3
{
  id v4 = a3;
  id v5 = [v4 objectForKey:@"kCTSMSAppleSafetyAlertData"];
  id v6 = [v5 objectForKeyedSubscript:@"CmamText"];
  uint64_t v7 = ea_getHashForString(v6);

  id v8 = [v5 objectForKeyedSubscript:@"CmamLongText"];
  uint64_t v9 = ea_getHashForString(v8);

  if (v7 | v9)
  {
    userNotificationCenter = self->_userNotificationCenter;
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __56__EAEmergencyAlertCenter_handleAppleSafetyAlertMessage___block_invoke;
    v11[3] = &unk_2647AC830;
    id v12 = (id)v7;
    id v13 = (id)v9;
    __int16 v14 = self;
    id v15 = v4;
    [(UNUserNotificationCenter *)userNotificationCenter getDeliveredNotificationsWithCompletionHandler:v11];
  }
  else if (os_log_type_enabled((os_log_t)EALogDefault, OS_LOG_TYPE_ERROR))
  {
    -[EAEmergencyAlertCenter handleAppleSafetyAlertMessage:]();
  }
}

void __56__EAEmergencyAlertCenter_handleAppleSafetyAlertMessage___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id v3 = a2;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v36 objects:v44 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v37;
    v30 = &v41;
    id obj = v3;
LABEL_3:
    uint64_t v7 = 0;
    while (1)
    {
      if (*(void *)v37 != v6) {
        objc_enumerationMutation(obj);
      }
      id v8 = *(void **)(*((void *)&v36 + 1) + 8 * v7);
      uint64_t v9 = objc_msgSend(v8, "request", v30);
      uint64_t v10 = [v9 identifier];
      if ([v10 rangeOfString:*(void *)(a1 + 32)] != 0x7FFFFFFFFFFFFFFFLL) {
        break;
      }
      uint64_t v11 = [v8 request];
      id v12 = [v11 identifier];
      uint64_t v13 = [v12 rangeOfString:*(void *)(a1 + 40)];

      if (v13 != 0x7FFFFFFFFFFFFFFFLL) {
        goto LABEL_11;
      }
      __int16 v14 = (void *)EALogDefault;
      if (os_log_type_enabled((os_log_t)EALogDefault, OS_LOG_TYPE_DEBUG)) {
        __56__EAEmergencyAlertCenter_handleAppleSafetyAlertMessage___block_invoke_cold_2(v40, v14, v8, v30);
      }
LABEL_16:
      if (v5 == ++v7)
      {
        id v3 = obj;
        uint64_t v5 = [obj countByEnumeratingWithState:&v36 objects:v44 count:16];
        if (v5) {
          goto LABEL_3;
        }
        goto LABEL_18;
      }
    }

LABEL_11:
    id v15 = (void *)EALogDefault;
    if (os_log_type_enabled((os_log_t)EALogDefault, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v16 = v15;
      v17 = [v8 request];
      v18 = [v17 identifier];
      *(_DWORD *)buf = 138412290;
      v43 = v18;
      _os_log_impl(&dword_2266B8000, v16, OS_LOG_TYPE_DEFAULT, "Apple safety alert matches previous alert: %@", buf, 0xCu);
    }
    v19 = [v8 request];
    v20 = [v19 content];
    v21 = [v20 userInfo];

    if (v21)
    {
      uint64_t v23 = [*(id *)(a1 + 48) getUpdatedNotificationForAppleSafetyAlert:v8 withMessageDictionary:*(void *)(a1 + 56)];
      v24 = (void *)EALogDefault;
      if (v23)
      {
        v25 = (void *)v23;
        id v3 = obj;
        if (os_log_type_enabled((os_log_t)EALogDefault, OS_LOG_TYPE_DEFAULT))
        {
          v26 = v24;
          v27 = [v25 userInfo];
          *(_DWORD *)buf = 138412290;
          v43 = v27;
          _os_log_impl(&dword_2266B8000, v26, OS_LOG_TYPE_DEFAULT, "UserInfo dict: %@", buf, 0xCu);
        }
        dispatch_time_t v28 = dispatch_time(0, 0);
        block[0] = MEMORY[0x263EF8330];
        block[1] = 3221225472;
        block[2] = __56__EAEmergencyAlertCenter_handleAppleSafetyAlertMessage___block_invoke_2;
        block[3] = &unk_2647AC808;
        block[4] = *(void *)(a1 + 48);
        block[5] = v8;
        id v33 = v25;
        id v29 = v25;
        dispatch_after(v28, MEMORY[0x263EF83A0], block);
      }
      else
      {
        id v3 = obj;
        if (os_log_type_enabled((os_log_t)EALogDefault, OS_LOG_TYPE_ERROR)) {
          __56__EAEmergencyAlertCenter_handleAppleSafetyAlertMessage___block_invoke_cold_4();
        }
      }

      goto LABEL_27;
    }
    v22 = EALogDefault;
    if (os_log_type_enabled((os_log_t)EALogDefault, OS_LOG_TYPE_ERROR)) {
      __56__EAEmergencyAlertCenter_handleAppleSafetyAlertMessage___block_invoke_cold_3(&v34, v35, v22);
    }
    goto LABEL_16;
  }
LABEL_18:

  if (os_log_type_enabled((os_log_t)EALogDefault, OS_LOG_TYPE_ERROR)) {
    __56__EAEmergencyAlertCenter_handleAppleSafetyAlertMessage___block_invoke_cold_1();
  }
LABEL_27:
}

void __56__EAEmergencyAlertCenter_handleAppleSafetyAlertMessage___block_invoke_2(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  id v5 = [*(id *)(a1 + 40) request];
  id v3 = [v5 identifier];
  uint64_t v4 = (void *)[*(id *)(a1 + 48) copy];
  [v2 replaceContentForRequestWithRequestID:v3 replacementContent:v4 completionHandler:&__block_literal_global];
}

void __56__EAEmergencyAlertCenter_handleAppleSafetyAlertMessage___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = EALogDefault;
  if (v2)
  {
    if (os_log_type_enabled((os_log_t)EALogDefault, OS_LOG_TYPE_ERROR)) {
      __56__EAEmergencyAlertCenter_handleAppleSafetyAlertMessage___block_invoke_2_cold_1((uint64_t)v2, v3);
    }
  }
  else if (os_log_type_enabled((os_log_t)EALogDefault, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl(&dword_2266B8000, v3, OS_LOG_TYPE_DEFAULT, "Alert updated", v4, 2u);
  }
}

- (id)handleCellBroadcastMessage:(id)a3 withCompletionHandler:(id)a4
{
  id v5 = (objc_class *)MEMORY[0x263F1DEF0];
  id v6 = a3;
  id v7 = objc_alloc_init(v5);
  objc_msgSend(v7, "ea_setPropertiesForCellBroadcastMessage:withActivePhoneCall:", v6, -[EAEmergencyAlertCenter currentAudioAndVideoCallCount](self, "currentAudioAndVideoCallCount") != 0);
  id v8 = [v6 objectForKey:@"PreventScreenCapture"];

  LODWORD(v6) = [v8 BOOLValue];
  if (v6)
  {
    uint64_t v9 = EALogDefault;
    if (os_log_type_enabled((os_log_t)EALogDefault, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v11 = 0;
      _os_log_impl(&dword_2266B8000, v9, OS_LOG_TYPE_DEFAULT, "Screen capture prohibited", v11, 2u);
    }
    [v7 setScreenCaptureProhibited:1];
  }
  return v7;
}

- (void)handleRawCellBroadcastMessage:(id)a3 withCompletionHandler:(id)a4
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = (void (**)(id, void, void *))a4;
  id v8 = [v6 objectForKey:*MEMORY[0x263F032F8]];
  uint64_t v9 = [v6 objectForKey:@"kCTSMSAppleSafetyAlertData"];
  uint64_t v10 = (void *)v9;
  if (!v8)
  {
    if (v9)
    {
      [(EAEmergencyAlertCenter *)self handleAppleSafetyAlertMessage:v6];
LABEL_11:
      uint64_t v11 = 0;
      goto LABEL_12;
    }
    if (os_log_type_enabled((os_log_t)EALogDefault, OS_LOG_TYPE_ERROR))
    {
      -[EAEmergencyAlertCenter handleRawCellBroadcastMessage:withCompletionHandler:]();
      if (!v7) {
        goto LABEL_11;
      }
    }
    else if (!v7)
    {
      goto LABEL_11;
    }
    v24 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08438] code:-1 userInfo:0];
    v7[2](v7, 0, v24);

    goto LABEL_11;
  }
  uint64_t v11 = [(EAEmergencyAlertCenter *)self handleCellBroadcastMessage:v6 withCompletionHandler:v7];
  id v12 = [v11 body];
  uint64_t v13 = [v12 length];

  if (v13)
  {
    __int16 v14 = [MEMORY[0x263EFF910] date];
    [v14 timeIntervalSince1970];
    uint64_t v16 = v15;

    v17 = NSString;
    v18 = ea_getHashForString(v8);
    v19 = [v17 stringWithFormat:@"%@%f", v18, v16];

    v20 = [MEMORY[0x263F1DF48] requestWithIdentifier:v19 content:v11 trigger:0];
    v21 = (void *)EALogDefault;
    if (os_log_type_enabled((os_log_t)EALogDefault, OS_LOG_TYPE_DEFAULT))
    {
      v22 = v21;
      uint64_t v23 = [v20 identifier];
      *(_DWORD *)buf = 138543362;
      dispatch_time_t v28 = v23;
      _os_log_impl(&dword_2266B8000, v22, OS_LOG_TYPE_DEFAULT, "Adding notification request for emergency alert %{public}@", buf, 0xCu);
    }
    v25[0] = MEMORY[0x263EF8330];
    v25[1] = 3221225472;
    v25[2] = __78__EAEmergencyAlertCenter_handleRawCellBroadcastMessage_withCompletionHandler___block_invoke;
    v25[3] = &unk_2647AC858;
    v26 = v7;
    [(EAEmergencyAlertCenter *)self addNotificationRequest:v20 withCompletionHandler:v25];
  }
LABEL_12:
}

uint64_t __78__EAEmergencyAlertCenter_handleRawCellBroadcastMessage_withCompletionHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, BOOL))(result + 16))(result, a3 == 0);
  }
  return result;
}

- (unint64_t)currentAudioAndVideoCallCount
{
  id v2 = [MEMORY[0x263F7E1A0] sharedInstance];
  unint64_t v3 = [v2 currentAudioAndVideoCallCount];

  return v3;
}

- (void)addNotificationRequest:(id)a3 withCompletionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void (**)(void, void, void))v7;
  if (self->_userNotificationCenter)
  {
    uint64_t v9 = dispatch_get_global_queue(25, 0);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __71__EAEmergencyAlertCenter_addNotificationRequest_withCompletionHandler___block_invoke;
    block[3] = &unk_2647AC8A8;
    block[4] = self;
    id v11 = v6;
    id v12 = v8;
    dispatch_async(v9, block);
  }
  else if (v7)
  {
    if (os_log_type_enabled((os_log_t)EALogDefault, OS_LOG_TYPE_ERROR)) {
      -[EAEmergencyAlertCenter addNotificationRequest:withCompletionHandler:]();
    }
    v8[2](v8, 0, 0);
  }
}

void __71__EAEmergencyAlertCenter_addNotificationRequest_withCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = *(void **)(*(void *)(a1 + 32) + 8);
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __71__EAEmergencyAlertCenter_addNotificationRequest_withCompletionHandler___block_invoke_2;
  v3[3] = &unk_2647AC880;
  id v4 = *(id *)(a1 + 48);
  [v2 addNotificationRequest:v1 withCompletionHandler:v3];
}

uint64_t __71__EAEmergencyAlertCenter_addNotificationRequest_withCompletionHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, BOOL, uint64_t))(result + 16))(result, a2 == 0, a2);
  }
  return result;
}

- (void).cxx_destruct
{
}

- (void)handleAppleSafetyAlertMessage:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_2266B8000, v0, v1, "Missing CmamText and CmamLongText key. Dropping the Safety alert", v2, v3, v4, v5, v6);
}

void __56__EAEmergencyAlertCenter_handleAppleSafetyAlertMessage___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_2266B8000, v0, v1, "Safety alert did not match any existing alert", v2, v3, v4, v5, v6);
}

void __56__EAEmergencyAlertCenter_handleAppleSafetyAlertMessage___block_invoke_cold_2(uint8_t *a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = [a3 request];
  uint64_t v9 = [v8 identifier];
  *(_DWORD *)a1 = 138412290;
  *a4 = v9;
  _os_log_debug_impl(&dword_2266B8000, v7, OS_LOG_TYPE_DEBUG, "Apple safety alert did not match previous alert: %@", a1, 0xCu);
}

void __56__EAEmergencyAlertCenter_handleAppleSafetyAlertMessage___block_invoke_cold_3(uint8_t *buf, unsigned char *a2, os_log_t log)
{
  *buf = 0;
  *a2 = 0;
  _os_log_error_impl(&dword_2266B8000, log, OS_LOG_TYPE_ERROR, "Missing UserInfo", buf, 2u);
}

void __56__EAEmergencyAlertCenter_handleAppleSafetyAlertMessage___block_invoke_cold_4()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_2266B8000, v0, v1, "Failed to create new content", v2, v3, v4, v5, v6);
}

void __56__EAEmergencyAlertCenter_handleAppleSafetyAlertMessage___block_invoke_2_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_2266B8000, a2, OS_LOG_TYPE_ERROR, "Error while updating the notification content: %@", (uint8_t *)&v2, 0xCu);
}

- (void)handleRawCellBroadcastMessage:withCompletionHandler:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_2266B8000, v0, v1, "Invalid CellBroadcast dictionary", v2, v3, v4, v5, v6);
}

- (void)addNotificationRequest:withCompletionHandler:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_2266B8000, v0, v1, "Missing userNotificationCenter", v2, v3, v4, v5, v6);
}

@end