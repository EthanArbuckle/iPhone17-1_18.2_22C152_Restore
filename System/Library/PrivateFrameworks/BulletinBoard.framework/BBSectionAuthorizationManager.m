@interface BBSectionAuthorizationManager
- (BBSectionAuthorizationManager)initWithQueue:(id)a3;
- (BBSectionAuthorizationManagerDelegate)delegate;
- (id)handleChangeForSectionInfo:(id)a3 replacingSectionInfo:(id)a4;
- (void)_addNewTimerForSectionID:(id)a3 withExpirationDate:(id)a4;
- (void)_cancelExisitingTimerForSectionID:(id)a3;
- (void)_queue_triggerDidFireForExpiryTimer:(id)a3;
- (void)_replaceExisitingTimerForSectionID:(id)a3 withExpirationDate:(id)a4;
- (void)setDelegate:(id)a3;
@end

@implementation BBSectionAuthorizationManager

- (BBSectionAuthorizationManager)initWithQueue:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)BBSectionAuthorizationManager;
  v6 = [(BBSectionAuthorizationManager *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_queue, a3);
    v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    sectionIDsToAuthorizationExpiryTimers = v7->_sectionIDsToAuthorizationExpiryTimers;
    v7->_sectionIDsToAuthorizationExpiryTimers = v8;
  }
  return v7;
}

- (id)handleChangeForSectionInfo:(id)a3 replacingSectionInfo:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v6 authorizationStatus];
  uint64_t v9 = [v7 authorizationStatus];
  v10 = [v6 authorizationExpirationDate];
  objc_super v11 = [v7 authorizationExpirationDate];
  v12 = [v6 lastUserGrantedAuthorizationDate];
  v13 = [v7 lastUserGrantedAuthorizationDate];

  if (v8 == 4)
  {
    if (!v9) {
      goto LABEL_11;
    }
    if (v9 == 4)
    {
      if (![v10 compare:v11]) {
        goto LABEL_13;
      }
      v14 = [v6 sectionID];
      [(BBSectionAuthorizationManager *)self _replaceExisitingTimerForSectionID:v14 withExpirationDate:v10];
      goto LABEL_12;
    }
    if (v12 != v13)
    {
LABEL_11:
      v14 = [v6 sectionID];
      [(BBSectionAuthorizationManager *)self _addNewTimerForSectionID:v14 withExpirationDate:v10];
LABEL_12:

      goto LABEL_13;
    }
    [v6 setAuthorizationStatus:v9];
LABEL_9:
    [v6 setAuthorizationExpirationDate:0];
    goto LABEL_13;
  }
  if (v9 == 4)
  {
    v15 = [v6 sectionID];
    [(BBSectionAuthorizationManager *)self _cancelExisitingTimerForSectionID:v15];
  }
  if (v10) {
    goto LABEL_9;
  }
LABEL_13:

  return v6;
}

- (void)_addNewTimerForSectionID:(id)a3 withExpirationDate:(id)a4
{
  v13[1] = *MEMORY[0x263EF8340];
  id v6 = (objc_class *)MEMORY[0x263F5D400];
  id v7 = a4;
  id v8 = a3;
  id v9 = [v6 alloc];
  v12 = @"sectionID";
  v13[0] = v8;
  v10 = [NSDictionary dictionaryWithObjects:v13 forKeys:&v12 count:1];
  objc_super v11 = (void *)[v9 initWithFireDate:v7 serviceIdentifier:v8 target:self selector:sel__queue_triggerDidFireForExpiryTimer_ userInfo:v10];

  [v11 setMinimumEarlyFireProportion:1.0];
  [v11 setUserVisible:1];
  [v11 scheduleInQueue:self->_queue];
  [(NSMutableDictionary *)self->_sectionIDsToAuthorizationExpiryTimers setObject:v11 forKey:v8];
}

- (void)_replaceExisitingTimerForSectionID:(id)a3 withExpirationDate:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(BBSectionAuthorizationManager *)self _cancelExisitingTimerForSectionID:v7];
  [(BBSectionAuthorizationManager *)self _addNewTimerForSectionID:v7 withExpirationDate:v6];
}

- (void)_cancelExisitingTimerForSectionID:(id)a3
{
  sectionIDsToAuthorizationExpiryTimers = self->_sectionIDsToAuthorizationExpiryTimers;
  id v5 = a3;
  id v6 = [(NSMutableDictionary *)sectionIDsToAuthorizationExpiryTimers objectForKey:v5];
  [v6 invalidate];
  [(NSMutableDictionary *)self->_sectionIDsToAuthorizationExpiryTimers removeObjectForKey:v5];
}

- (void)_queue_triggerDidFireForExpiryTimer:(id)a3
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  v4 = [a3 userInfo];
  id v5 = [v4 valueForKey:@"sectionID"];

  id v6 = BBLogSettings;
  if (os_log_type_enabled((os_log_t)BBLogSettings, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138543362;
    id v9 = v5;
    _os_log_impl(&dword_217675000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] Temporary authorization expired, effective authorization status has changed", (uint8_t *)&v8, 0xCu);
  }
  [(NSMutableDictionary *)self->_sectionIDsToAuthorizationExpiryTimers removeObjectForKey:v5];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained didChangeEffectiveAuthorizationStatusForSectionID:v5];
}

- (BBSectionAuthorizationManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (BBSectionAuthorizationManagerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_sectionIDsToAuthorizationExpiryTimers, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end