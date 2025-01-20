@interface CalHolidayAccountUtils
+ (BOOL)_isEnabledWithAccount:(id)a3;
+ (BOOL)holidayCalendarIsEnabledWithAccountStore:(id)a3;
+ (id)_createUnsavedHolidayAccountWithAccountStore:(id)a3;
+ (id)_holidayAccountWithAccountStore:(id)a3;
+ (id)holidayAccountDescription;
+ (id)logHandle;
+ (void)ensureHolidayAccountExistsWithAccountStore:(id)a3;
+ (void)setHolidayCalendarIsEnabled:(BOOL)a3 withAccountStore:(id)a4;
@end

@implementation CalHolidayAccountUtils

+ (id)logHandle
{
  if (logHandle_onceToken_2 != -1) {
    dispatch_once(&logHandle_onceToken_2, &__block_literal_global_25);
  }
  v2 = (void *)logHandle_logHandle_2;

  return v2;
}

uint64_t __35__CalHolidayAccountUtils_logHandle__block_invoke()
{
  logHandle_logHandle_2 = (uint64_t)os_log_create("com.apple.calendar", "HolidayAccountUtils");

  return MEMORY[0x1F41817F8]();
}

+ (BOOL)holidayCalendarIsEnabledWithAccountStore:(id)a3
{
  id v3 = a1;
  v4 = [a1 _holidayAccountWithAccountStore:a3];
  LOBYTE(v3) = [v3 _isEnabledWithAccount:v4];

  return (char)v3;
}

+ (void)setHolidayCalendarIsEnabled:(BOOL)a3 withAccountStore:(id)a4
{
  BOOL v4 = a3;
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  v7 = [a1 _holidayAccountWithAccountStore:v6];
  if ([a1 _isEnabledWithAccount:v7] != v4)
  {
    v8 = [a1 logHandle];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      BOOL v14 = v4;
      _os_log_impl(&dword_190D88000, v8, OS_LOG_TYPE_DEFAULT, "Setting holiday account to %{BOOL}d", buf, 8u);
    }

    if (!v7)
    {
      v7 = [a1 _createUnsavedHolidayAccountWithAccountStore:v6];
    }
    [v7 setEnabled:v4 forDataclass:*MEMORY[0x1E4F17568]];
    id v12 = 0;
    char v9 = [v6 saveVerifiedAccount:v7 error:&v12];
    id v10 = v12;
    if (v9)
    {
      v11 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v11 postNotificationName:@"CalHolidayAccountEnabledChanged" object:0];
    }
    else
    {
      v11 = [a1 logHandle];
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        +[CalHolidayAccountUtils setHolidayCalendarIsEnabled:withAccountStore:]((uint64_t)v10, v11);
      }
    }
  }
}

+ (void)ensureHolidayAccountExistsWithAccountStore:(id)a3
{
  id v5 = a3;
  BOOL v4 = objc_msgSend(a1, "_holidayAccountWithAccountStore:");
  if (!v4) {
    [a1 setHolidayCalendarIsEnabled:1 withAccountStore:v5];
  }
}

+ (id)holidayAccountDescription
{
  v2 = [MEMORY[0x1E4F28B50] bundleForClass:a1];
  id v3 = [v2 localizedStringForKey:@"Holiday Calendar" value:&stru_1EE0C39E0 table:0];

  return v3;
}

+ (BOOL)_isEnabledWithAccount:(id)a3
{
  if (a3) {
    return [a3 isEnabledForDataclass:*MEMORY[0x1E4F17568]];
  }
  else {
    return 0;
  }
}

+ (id)_holidayAccountWithAccountStore:(id)a3
{
  v13[1] = *MEMORY[0x1E4F143B8];
  v13[0] = *MEMORY[0x1E4F177C8];
  BOOL v4 = (void *)MEMORY[0x1E4F1C978];
  id v5 = a3;
  id v6 = [v4 arrayWithObjects:v13 count:1];
  id v12 = 0;
  v7 = [v5 accountsWithAccountTypeIdentifiers:v6 error:&v12];

  id v8 = v12;
  if (v7)
  {
    char v9 = [v7 firstObject];
  }
  else
  {
    id v10 = [a1 logHandle];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      +[CalHolidayAccountUtils _holidayAccountWithAccountStore:]((uint64_t)v8, v10);
    }

    char v9 = 0;
  }

  return v9;
}

+ (id)_createUnsavedHolidayAccountWithAccountStore:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  BOOL v4 = [a3 accountTypeWithAccountTypeIdentifier:*MEMORY[0x1E4F177C8]];
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F179B0]) initWithAccountType:v4];
  id v6 = [a1 holidayAccountDescription];
  [v5 setAccountDescription:v6];

  [v5 setAuthenticationType:*MEMORY[0x1E4F17A50]];
  [v5 setSupportsAuthentication:0];
  [v5 setVisible:0];
  v7 = [a1 logHandle];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = [v5 identifier];
    int v10 = 138543362;
    v11 = v8;
    _os_log_impl(&dword_190D88000, v7, OS_LOG_TYPE_DEFAULT, "Creating holiday account with identifier %{public}@", (uint8_t *)&v10, 0xCu);
  }

  return v5;
}

+ (void)setHolidayCalendarIsEnabled:(uint64_t)a1 withAccountStore:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_190D88000, a2, OS_LOG_TYPE_ERROR, "Failed to save holiday account: %@", (uint8_t *)&v2, 0xCu);
}

+ (void)_holidayAccountWithAccountStore:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_190D88000, a2, OS_LOG_TYPE_ERROR, "Failed to get holiday account: %@", (uint8_t *)&v2, 0xCu);
}

@end