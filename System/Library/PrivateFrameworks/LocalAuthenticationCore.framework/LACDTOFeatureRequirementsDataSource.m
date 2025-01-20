@interface LACDTOFeatureRequirementsDataSource
- (BOOL)hasBiometricEnrollmentsForCurrentUser;
- (BOOL)hasPasscodeSetForCurrentUser;
- (BOOL)isPhone;
- (LACDTOFeatureRequirementsDataSource)initWithDevice:(id)a3 replyQueue:(id)a4;
- (void)hasHSA2AccountWithCompletion:(id)a3;
- (void)hasLocationServicesEnabledWithCompletion:(id)a3;
@end

@implementation LACDTOFeatureRequirementsDataSource

- (LACDTOFeatureRequirementsDataSource)initWithDevice:(id)a3 replyQueue:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)LACDTOFeatureRequirementsDataSource;
  v9 = [(LACDTOFeatureRequirementsDataSource *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_device, a3);
    objc_storeStrong((id *)&v10->_replyQueue, a4);
  }

  return v10;
}

- (BOOL)hasPasscodeSetForCurrentUser
{
  return [(LACDTODeviceInfoProvider *)self->_device hasPasscodeSetForCurrentUser];
}

- (BOOL)isPhone
{
  return [(LACDTODeviceInfoProvider *)self->_device isPhone];
}

- (BOOL)hasBiometricEnrollmentsForCurrentUser
{
  return [(LACDTODeviceInfoProvider *)self->_device hasBiometricEnrollmentsForCurrentUser];
}

- (void)hasHSA2AccountWithCompletion:(id)a3
{
  id v4 = a3;
  if (getAKAccountManagerClass_0())
  {
    objc_initWeak(&location, self);
    v5 = [LACBackgroundTask alloc];
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __68__LACDTOFeatureRequirementsDataSource_hasHSA2AccountWithCompletion___block_invoke;
    v15[3] = &unk_2653B5A38;
    objc_copyWeak(&v16, &location);
    v6 = [(LACBackgroundTask *)v5 initWithIdentifier:@"HSA2AccountQuery" worker:v15];
    replyQueue = self->_replyQueue;
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __68__LACDTOFeatureRequirementsDataSource_hasHSA2AccountWithCompletion___block_invoke_2;
    v11[3] = &unk_2653B5700;
    objc_copyWeak(&v14, &location);
    id v13 = v4;
    id v8 = v6;
    objc_super v12 = v8;
    [(LACBackgroundTask *)v8 runWithTimeout:replyQueue queue:v11 completion:1.0];

    objc_destroyWeak(&v14);
    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }
  else
  {
    v9 = +[LACError errorWithCode:-1000 debugDescription:@"Missing AuthKit dependency"];
    v10 = LACLogDTOFeature();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[LACDTOFeatureRequirementsDataSource hasHSA2AccountWithCompletion:]((uint64_t)v9, v10);
    }

    (*((void (**)(id, void, void *))v4 + 2))(v4, 0, v9);
  }
}

void __68__LACDTOFeatureRequirementsDataSource_hasHSA2AccountWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  v10 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v4 = [getAKAccountManagerClass_0() sharedInstance];
    v5 = [v4 primaryAuthKitAccount];
    BOOL v6 = [v4 securityLevelForAccount:v5] == 4;

    id v7 = [LACBackgroundTaskResult alloc];
    id v8 = [NSNumber numberWithBool:v6];
    v9 = [(LACBackgroundTaskResult *)v7 initWithValue:v8];
    v10[2](v10, v9);
  }
}

void __68__LACDTOFeatureRequirementsDataSource_hasHSA2AccountWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v7 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    uint64_t v4 = *(void *)(a1 + 40);
    v5 = [v7 value];
    BOOL v6 = [v7 error];
    (*(void (**)(uint64_t, void *, void *))(v4 + 16))(v4, v5, v6);
  }
}

- (void)hasLocationServicesEnabledWithCompletion:(id)a3
{
  id v4 = a3;
  if (getCLLocationManagerClass())
  {
    objc_initWeak(&location, self);
    v5 = [LACBackgroundTask alloc];
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __80__LACDTOFeatureRequirementsDataSource_hasLocationServicesEnabledWithCompletion___block_invoke;
    v15[3] = &unk_2653B5A38;
    objc_copyWeak(&v16, &location);
    BOOL v6 = [(LACBackgroundTask *)v5 initWithIdentifier:@"LocationServicesQuery" worker:v15];
    replyQueue = self->_replyQueue;
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __80__LACDTOFeatureRequirementsDataSource_hasLocationServicesEnabledWithCompletion___block_invoke_2;
    v11[3] = &unk_2653B5700;
    objc_copyWeak(&v14, &location);
    id v13 = v4;
    id v8 = v6;
    objc_super v12 = v8;
    [(LACBackgroundTask *)v8 runWithTimeout:replyQueue queue:v11 completion:1.0];

    objc_destroyWeak(&v14);
    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }
  else
  {
    v9 = +[LACError errorWithCode:-1000 debugDescription:@"Missing CoreLocation dependency"];
    v10 = LACLogDTOFeature();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[LACDTOFeatureRequirementsDataSource hasLocationServicesEnabledWithCompletion:]((uint64_t)v9, v10);
    }

    (*((void (**)(id, void, void *))v4 + 2))(v4, 0, v9);
  }
}

void __80__LACDTOFeatureRequirementsDataSource_hasLocationServicesEnabledWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v8 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    uint64_t v4 = [getCLLocationManagerClass() locationServicesEnabled];
    v5 = [LACBackgroundTaskResult alloc];
    BOOL v6 = [NSNumber numberWithBool:v4];
    id v7 = [(LACBackgroundTaskResult *)v5 initWithValue:v6];
    v8[2](v8, v7);
  }
}

void __80__LACDTOFeatureRequirementsDataSource_hasLocationServicesEnabledWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v7 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    uint64_t v4 = *(void *)(a1 + 40);
    v5 = [v7 value];
    BOOL v6 = [v7 error];
    (*(void (**)(uint64_t, void *, void *))(v4 + 16))(v4, v5, v6);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_replyQueue, 0);
  objc_storeStrong((id *)&self->_device, 0);
}

- (void)hasHSA2AccountWithCompletion:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_254F14000, a2, OS_LOG_TYPE_ERROR, "Could not fetch HSA2 account %{public}@", (uint8_t *)&v2, 0xCu);
}

- (void)hasLocationServicesEnabledWithCompletion:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_254F14000, a2, OS_LOG_TYPE_ERROR, "Could not fetch LocationServices status %{public}@", (uint8_t *)&v2, 0xCu);
}

@end