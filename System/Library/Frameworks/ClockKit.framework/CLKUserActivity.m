@interface CLKUserActivity
- (CLKUserActivity)initWithEncodedUserActivity:(id)a3;
- (CLKUserActivity)initWithUserActivity:(id)a3;
- (NSString)encodedUserActivity;
- (NSUserActivity)userActivity;
- (void)encodedUserActivity;
- (void)userActivity;
@end

@implementation CLKUserActivity

- (CLKUserActivity)initWithUserActivity:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CLKUserActivity;
  v6 = [(CLKUserActivity *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_userActivity, a3);
  }

  return v7;
}

- (CLKUserActivity)initWithEncodedUserActivity:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CLKUserActivity;
  v6 = [(CLKUserActivity *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_encodedUserActivity, a3);
  }

  return v7;
}

- (NSUserActivity)userActivity
{
  userActivity = self->_userActivity;
  if (!userActivity)
  {
    if (self->_encodedUserActivity)
    {
      v4 = (void *)[objc_alloc(MEMORY[0x263EFF8F8]) initWithBase64EncodedString:self->_encodedUserActivity options:0];
      id v5 = (NSUserActivity *)[objc_alloc(MEMORY[0x263F08D38]) _initWithUserActivityData:v4];
      v6 = self->_userActivity;
      self->_userActivity = v5;

      if (!self->_userActivity)
      {
        v7 = CLKLoggingObjectForDomain(1);
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
          [(CLKUserActivity *)(uint64_t *)&self->_encodedUserActivity userActivity];
        }
      }
      userActivity = self->_userActivity;
    }
    else
    {
      userActivity = 0;
    }
  }

  return userActivity;
}

- (NSString)encodedUserActivity
{
  encodedUserActivity = self->_encodedUserActivity;
  if (!encodedUserActivity)
  {
    if (self->_userActivity)
    {
      uint64_t v18 = 0;
      v19 = &v18;
      uint64_t v20 = 0x3032000000;
      v21 = __Block_byref_object_copy__2;
      v22 = __Block_byref_object_dispose__2;
      id v23 = 0;
      dispatch_semaphore_t v4 = dispatch_semaphore_create(0);
      userActivity = self->_userActivity;
      uint64_t v12 = MEMORY[0x263EF8330];
      uint64_t v13 = 3221225472;
      v14 = __38__CLKUserActivity_encodedUserActivity__block_invoke;
      v15 = &unk_26440E8D8;
      v17 = &v18;
      v6 = v4;
      v16 = v6;
      [(NSUserActivity *)userActivity _createUserActivityDataWithOptions:MEMORY[0x263EFFA78] completionHandler:&v12];
      dispatch_time_t v7 = dispatch_time(0, 5000000000);
      if (dispatch_semaphore_wait(v6, v7))
      {
        v8 = CLKLoggingObjectForDomain(1);
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
          [(CLKUserActivity *)(uint64_t *)&self->_userActivity encodedUserActivity];
        }
      }
      objc_msgSend((id)v19[5], "base64EncodedStringWithOptions:", 0, v12, v13, v14, v15);
      objc_super v9 = (NSString *)objc_claimAutoreleasedReturnValue();
      v10 = self->_encodedUserActivity;
      self->_encodedUserActivity = v9;

      _Block_object_dispose(&v18, 8);
      encodedUserActivity = self->_encodedUserActivity;
    }
    else
    {
      encodedUserActivity = 0;
    }
  }

  return encodedUserActivity;
}

void __38__CLKUserActivity_encodedUserActivity__block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_encodedUserActivity, 0);

  objc_storeStrong((id *)&self->_userActivity, 0);
}

- (void)userActivity
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v2 = *a1;
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_21C599000, a2, OS_LOG_TYPE_ERROR, "Failed to decode user activity %@", (uint8_t *)&v3, 0xCu);
}

- (void)encodedUserActivity
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v2 = *a1;
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_21C599000, a2, OS_LOG_TYPE_ERROR, "Failed to encode user activity %@. Semaphore timed out.", (uint8_t *)&v3, 0xCu);
}

@end