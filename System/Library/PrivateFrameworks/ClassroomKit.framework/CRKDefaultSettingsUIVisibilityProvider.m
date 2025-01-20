@interface CRKDefaultSettingsUIVisibilityProvider
- (BOOL)isAnyCourseActiveInEnrollmentController:(id)a3;
- (BOOL)settingsUIVisible;
- (CRKDefaultSettingsUIVisibilityProvider)init;
- (NSString)paneStatus;
- (void)connectToDaemon;
- (void)enrollmentControllerDidUpdateSettingsUIVisibility:(id)a3;
- (void)migrateOldUserDefaultsValues;
- (void)setPaneStatus:(id)a3;
- (void)setSettingsUIVisible:(BOOL)a3;
- (void)updatePaneStatus;
- (void)updatePreviouslyVisibleDefaultWithValue:(BOOL)a3;
- (void)updateVisibilityState;
@end

@implementation CRKDefaultSettingsUIVisibilityProvider

- (CRKDefaultSettingsUIVisibilityProvider)init
{
  v6.receiver = self;
  v6.super_class = (Class)CRKDefaultSettingsUIVisibilityProvider;
  v2 = [(CRKDefaultSettingsUIVisibilityProvider *)&v6 init];
  if (v2)
  {
    v3 = [[CRKUserDefaultsObject alloc] initWithKey:@"ClassroomSettingsUIPreviouslyVisible"];
    mUIPreviouslyVisible = v2->mUIPreviouslyVisible;
    v2->mUIPreviouslyVisible = v3;

    [(CRKDefaultSettingsUIVisibilityProvider *)v2 migrateOldUserDefaultsValues];
    [(CRKDefaultSettingsUIVisibilityProvider *)v2 updateVisibilityState];
  }
  return v2;
}

- (void)migrateOldUserDefaultsValues
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v3 = [&unk_26D81A3A8 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    char v5 = 0;
    uint64_t v6 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(&unk_26D81A3A8);
        }
        v8 = [[CRKUserDefaultsObject alloc] initWithKey:*(void *)(*((void *)&v11 + 1) + 8 * i)];
        v9 = [(CRKUserDefaultsObject *)v8 value];
        char v10 = [v9 BOOLValue];

        v5 |= v10;
        [(CRKUserDefaultsObject *)v8 setValue:0];
      }
      uint64_t v4 = [&unk_26D81A3A8 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v4);
    if (v5) {
      [(CRKDefaultSettingsUIVisibilityProvider *)self updatePreviouslyVisibleDefaultWithValue:1];
    }
  }
}

- (void)updatePreviouslyVisibleDefaultWithValue:(BOOL)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  uint64_t v4 = (void *)MEMORY[0x263EFFA88];
  if (!a3) {
    uint64_t v4 = 0;
  }
  id v5 = v4;
  uint64_t v6 = _CRKLogSettings_0();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136446466;
    v8 = "-[CRKDefaultSettingsUIVisibilityProvider updatePreviouslyVisibleDefaultWithValue:]";
    __int16 v9 = 2114;
    id v10 = v5;
    _os_log_impl(&dword_224C00000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}s] %{public}@", (uint8_t *)&v7, 0x16u);
  }

  [(CRKUserDefaultsObject *)self->mUIPreviouslyVisible setValue:v5];
}

- (void)updateVisibilityState
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  uint64_t v3 = [(CRKCourseEnrollmentController *)self->mEnrollmentController settingsUIVisible];
  if ([v3 BOOLValue])
  {
    uint64_t v4 = 1;
  }
  else
  {
    id v5 = [(CRKUserDefaultsObject *)self->mUIPreviouslyVisible value];
    uint64_t v4 = [v5 BOOLValue];
  }
  uint64_t v6 = _CRKLogSettings_0();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = @"NO";
    if (v4) {
      int v7 = @"YES";
    }
    v8 = v7;
    int v9 = 136446466;
    id v10 = "-[CRKDefaultSettingsUIVisibilityProvider updateVisibilityState]";
    __int16 v11 = 2114;
    long long v12 = v8;
    _os_log_impl(&dword_224C00000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}s] %{public}@", (uint8_t *)&v9, 0x16u);
  }
  if (v4 != [(CRKDefaultSettingsUIVisibilityProvider *)self settingsUIVisible]) {
    [(CRKDefaultSettingsUIVisibilityProvider *)self setSettingsUIVisible:v4];
  }
}

- (void)updatePaneStatus
{
  if ([(CRKDefaultSettingsUIVisibilityProvider *)self isAnyCourseActiveInEnrollmentController:self->mEnrollmentController])
  {
    uint64_t v3 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    uint64_t v7 = [v3 localizedStringForKey:@"connected.status" value:@"Connected" table:0];
  }
  else
  {
    uint64_t v7 = (uint64_t)&stru_26D7E7B00;
  }
  uint64_t v4 = [(CRKDefaultSettingsUIVisibilityProvider *)self paneStatus];
  if (v4 | v7)
  {
    id v5 = [(CRKDefaultSettingsUIVisibilityProvider *)self paneStatus];
    char v6 = [v5 isEqual:v7];

    if ((v6 & 1) == 0) {
      [(CRKDefaultSettingsUIVisibilityProvider *)self setPaneStatus:v7];
    }
  }
}

- (BOOL)isAnyCourseActiveInEnrollmentController:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v3 = a3;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v4 = objc_msgSend(v3, "courses", 0);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v10;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v4);
        }
        if ([v3 isCourseActive:*(void *)(*((void *)&v9 + 1) + 8 * i)])
        {
          LOBYTE(v5) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v5;
}

- (void)connectToDaemon
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __57__CRKDefaultSettingsUIVisibilityProvider_connectToDaemon__block_invoke;
  v2[3] = &unk_2646F35C0;
  v2[4] = self;
  objc_msgSend(MEMORY[0x263EFF9F0], "cat_performBlockOnMainRunLoop:", v2);
}

uint64_t __57__CRKDefaultSettingsUIVisibilityProvider_connectToDaemon__block_invoke(uint64_t a1)
{
  uint64_t v2 = +[CRKCourseEnrollmentController sharedEnrollmentController];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void **)(v3 + 16);
  *(void *)(v3 + 16) = v2;

  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 16), "addEnrollmentObserver:");
  uint64_t v5 = *(void **)(a1 + 32);

  return [v5 updatePaneStatus];
}

- (void)enrollmentControllerDidUpdateSettingsUIVisibility:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = _CRKLogSettings_0();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = [v4 settingsUIVisible];
    int v7 = [v6 BOOLValue];
    v8 = @"NO";
    if (v7) {
      v8 = @"YES";
    }
    long long v9 = v8;
    int v11 = 136446466;
    long long v12 = "-[CRKDefaultSettingsUIVisibilityProvider enrollmentControllerDidUpdateSettingsUIVisibility:]";
    __int16 v13 = 2114;
    uint64_t v14 = v9;
    _os_log_impl(&dword_224C00000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}s] %{public}@", (uint8_t *)&v11, 0x16u);
  }
  long long v10 = [v4 settingsUIVisible];
  -[CRKDefaultSettingsUIVisibilityProvider updatePreviouslyVisibleDefaultWithValue:](self, "updatePreviouslyVisibleDefaultWithValue:", [v10 BOOLValue]);

  [(CRKDefaultSettingsUIVisibilityProvider *)self updateVisibilityState];
}

- (BOOL)settingsUIVisible
{
  return self->_settingsUIVisible;
}

- (void)setSettingsUIVisible:(BOOL)a3
{
  self->_settingsUIVisible = a3;
}

- (NSString)paneStatus
{
  return self->_paneStatus;
}

- (void)setPaneStatus:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_paneStatus, 0);
  objc_storeStrong((id *)&self->mEnrollmentController, 0);

  objc_storeStrong((id *)&self->mUIPreviouslyVisible, 0);
}

@end