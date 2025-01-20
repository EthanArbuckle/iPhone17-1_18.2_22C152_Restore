@interface DNDToggleManager
+ (id)managerForClientIdentifier:(id)a3;
- (BOOL)_toggleDNDOffReturningError:(id *)a3;
- (BOOL)_toggleDNDOnReturningError:(id *)a3;
- (BOOL)toggleToTargetState:(unint64_t)a3 error:(id *)a4;
- (DNDToggleManager)initWithModeAssertionService:(id)a3 stateService:(id)a4;
- (NSString)toggleAssertionIdentifier;
- (void)setToggleAssertionIdentifier:(id)a3;
@end

@implementation DNDToggleManager

+ (id)managerForClientIdentifier:(id)a3
{
  v4 = (void *)MEMORY[0x263F3A6F0];
  id v5 = a3;
  v6 = [v4 serviceForClientIdentifier:v5];
  v7 = [MEMORY[0x263F3A7B0] serviceForClientIdentifier:v5];

  v8 = (void *)[objc_alloc((Class)a1) initWithModeAssertionService:v6 stateService:v7];
  return v8;
}

- (DNDToggleManager)initWithModeAssertionService:(id)a3 stateService:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)DNDToggleManager;
  v9 = [(DNDToggleManager *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_modeAssertionService, a3);
    objc_storeStrong((id *)&v10->_stateService, a4);
    [(DNDToggleManager *)v10 setToggleAssertionIdentifier:0];
  }

  return v10;
}

- (void)setToggleAssertionIdentifier:(id)a3
{
  v4 = @"com.apple.donotdisturb.toggle-manager";
  if (a3) {
    v4 = (__CFString *)a3;
  }
  id v7 = v4;
  if (!-[NSString isEqualToString:](self->_toggleAssertionIdentifier, "isEqualToString:"))
  {
    id v5 = (NSString *)[(__CFString *)v7 copy];
    toggleAssertionIdentifier = self->_toggleAssertionIdentifier;
    self->_toggleAssertionIdentifier = v5;
  }
}

- (BOOL)toggleToTargetState:(unint64_t)a3 error:(id *)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v7 = (void *)DNDLogToggleManager;
  if (os_log_type_enabled((os_log_t)DNDLogToggleManager, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = v7;
    v9 = DNDStringFromToggleTargetState(a3);
    int v15 = 138543362;
    v16 = v9;
    _os_log_impl(&dword_21E516000, v8, OS_LOG_TYPE_DEFAULT, "Toggling DND: targetState=%{public}@", (uint8_t *)&v15, 0xCu);
  }
  if (!a3)
  {
    v10 = [(DNDStateService *)self->_stateService queryCurrentStateWithError:a4];
    if ([v10 isActive]) {
      a3 = 1;
    }
    else {
      a3 = 2;
    }
    v11 = (void *)DNDLogToggleManager;
    if (os_log_type_enabled((os_log_t)DNDLogToggleManager, OS_LOG_TYPE_DEFAULT))
    {
      objc_super v12 = v11;
      v13 = DNDStringFromToggleTargetState(a3);
      int v15 = 138543618;
      v16 = v13;
      __int16 v17 = 2114;
      v18 = v10;
      _os_log_impl(&dword_21E516000, v12, OS_LOG_TYPE_DEFAULT, "Resolved target state: targetState=%{public}@, currentState=%{public}@", (uint8_t *)&v15, 0x16u);
    }
  }
  if (a3 == 1) {
    return [(DNDToggleManager *)self _toggleDNDOffReturningError:a4];
  }
  if (a3 == 2) {
    return [(DNDToggleManager *)self _toggleDNDOnReturningError:a4];
  }
  return 0;
}

- (BOOL)_toggleDNDOnReturningError:(id *)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v5 = DNDLogToggleManager;
  if (os_log_type_enabled((os_log_t)DNDLogToggleManager, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21E516000, v5, OS_LOG_TYPE_DEFAULT, "Taking toggle assertion", buf, 2u);
  }
  id v6 = objc_alloc_init(MEMORY[0x263F3A778]);
  id v7 = [(DNDToggleManager *)self toggleAssertionIdentifier];
  [v6 setIdentifier:v7];

  id v8 = [MEMORY[0x263F3A6E8] lifetimeUntilEndOfScheduleWithIdentifier:*MEMORY[0x263F3A678]];
  [v6 setLifetime:v8];

  modeAssertionService = self->_modeAssertionService;
  id v14 = 0;
  v10 = [(DNDModeAssertionService *)modeAssertionService takeModeAssertionWithDetails:v6 error:&v14];
  id v11 = v14;
  objc_super v12 = DNDLogToggleManager;
  if (v10)
  {
    if (os_log_type_enabled((os_log_t)DNDLogToggleManager, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v16 = v10;
      _os_log_impl(&dword_21E516000, v12, OS_LOG_TYPE_DEFAULT, "Successfully took toggle assertion; assertion=%{public}@",
        buf,
        0xCu);
      if (!a3) {
        goto LABEL_11;
      }
      goto LABEL_9;
    }
LABEL_8:
    if (!a3) {
      goto LABEL_11;
    }
    goto LABEL_9;
  }
  if (!os_log_type_enabled((os_log_t)DNDLogToggleManager, OS_LOG_TYPE_ERROR)) {
    goto LABEL_8;
  }
  -[DNDToggleManager _toggleDNDOnReturningError:]((uint64_t)v11, v12);
  if (!a3) {
    goto LABEL_11;
  }
LABEL_9:
  if (v11) {
    *a3 = v11;
  }
LABEL_11:

  return v10 != 0;
}

- (BOOL)_toggleDNDOffReturningError:(id *)a3
{
  id v5 = DNDLogToggleManager;
  if (os_log_type_enabled((os_log_t)DNDLogToggleManager, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21E516000, v5, OS_LOG_TYPE_DEFAULT, "Invalidating all assertions for toggle", buf, 2u);
  }
  modeAssertionService = self->_modeAssertionService;
  id v12 = 0;
  int v7 = [(DNDModeAssertionService *)modeAssertionService invalidateAllActiveModeAssertionsWithError:&v12];
  id v8 = v12;
  v9 = DNDLogToggleManager;
  if (v7)
  {
    if (os_log_type_enabled((os_log_t)DNDLogToggleManager, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v11 = 0;
      _os_log_impl(&dword_21E516000, v9, OS_LOG_TYPE_DEFAULT, "Successfully invalidated all assertions", v11, 2u);
      if (!a3) {
        goto LABEL_11;
      }
      goto LABEL_9;
    }
LABEL_8:
    if (!a3) {
      goto LABEL_11;
    }
    goto LABEL_9;
  }
  if (!os_log_type_enabled((os_log_t)DNDLogToggleManager, OS_LOG_TYPE_ERROR)) {
    goto LABEL_8;
  }
  -[DNDToggleManager _toggleDNDOffReturningError:]((uint64_t)v8, v9);
  if (!a3) {
    goto LABEL_11;
  }
LABEL_9:
  if (v8) {
    *a3 = v8;
  }
LABEL_11:

  return v7;
}

- (NSString)toggleAssertionIdentifier
{
  return self->_toggleAssertionIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_toggleAssertionIdentifier, 0);
  objc_storeStrong((id *)&self->_stateService, 0);
  objc_storeStrong((id *)&self->_modeAssertionService, 0);
}

- (void)_toggleDNDOnReturningError:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_21E516000, a2, OS_LOG_TYPE_ERROR, "Unable to take toggle assertion; error=%{public}@",
    (uint8_t *)&v2,
    0xCu);
}

- (void)_toggleDNDOffReturningError:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_21E516000, a2, OS_LOG_TYPE_ERROR, "Unable to invalidate all assertions; error=%{public}@",
    (uint8_t *)&v2,
    0xCu);
}

@end