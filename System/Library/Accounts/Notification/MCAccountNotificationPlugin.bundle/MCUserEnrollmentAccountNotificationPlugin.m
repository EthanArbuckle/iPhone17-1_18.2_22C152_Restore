@interface MCUserEnrollmentAccountNotificationPlugin
- (BOOL)canSaveAccount:(id)a3 inStore:(id)a4 error:(id *)a5;
@end

@implementation MCUserEnrollmentAccountNotificationPlugin

- (BOOL)canSaveAccount:(id)a3 inStore:(id)a4 error:(id *)a5
{
  id v6 = a3;
  v7 = [v6 objectForKeyedSubscript:ACAccountPropertyPersonaIdentifier];
  if (![v7 length])
  {
    v10 = _ACLogSystem();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      sub_3460(v6, v10);
    }
    goto LABEL_7;
  }
  unsigned int v8 = +[DMCPersonaHelper personaWithUniqueIdentifierExists:v7];
  v9 = _ACLogSystem();
  v10 = v9;
  if (v8)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      sub_3558((uint64_t)v7, v6, v10);
    }
LABEL_7:
    BOOL v11 = 1;
    goto LABEL_13;
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v12 = [v6 username];
    v13 = [v6 accountType];
    v14 = [v13 accountTypeDescription];
    v15 = [v6 identifier];
    int v17 = 138413058;
    v18 = v7;
    __int16 v19 = 2112;
    v20 = v12;
    __int16 v21 = 2112;
    v22 = v14;
    __int16 v23 = 2112;
    v24 = v15;
    _os_log_impl(&dword_0, v10, OS_LOG_TYPE_DEFAULT, "\"MCUserEnrollmentAccountNotificationPlugin: Persona with identifier:%@ doesn't exist, reject account(%@, %@, %@) saving\"", (uint8_t *)&v17, 0x2Au);
  }
  if (a5)
  {
    *a5 = +[NSError errorWithDomain:ACErrorDomain code:4 userInfo:0];
  }
  v10 = +[ACAccountStore defaultStore];
  [v10 dmc_removeMAIDRelatedAccountsWithPersonaID:v7 asynchronous:1];
  BOOL v11 = 0;
LABEL_13:

  return v11;
}

@end