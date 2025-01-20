@interface TUDialRequest(PhoneKit)
@end

@implementation TUDialRequest(PhoneKit)

+ (void)dialRequestForCallProvider:()PhoneKit handle:.cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  v6 = [a1 localizedName];
  v7 = [a1 supportedHandleTypes];
  int v8 = 134218498;
  uint64_t v9 = a2;
  __int16 v10 = 2112;
  v11 = v6;
  __int16 v12 = 2112;
  v13 = v7;
  _os_log_error_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_ERROR, "Could not create a dial request due to an invalid handle type (%zd). For call provider %@, the supported handle types are (%@).", (uint8_t *)&v8, 0x20u);
}

+ (void)dialRequestForUserActivity:()PhoneKit callProviderManager:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "User activity does not contains a user info dictionary.", v1, 2u);
}

+ (void)dialRequestForUserActivity:()PhoneKit callProviderManager:.cold.2(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "User activity is missing the required key TUCallUserActivityProviderIdentifierKey.", v1, 2u);
}

+ (void)dialRequestForUserActivity:()PhoneKit callProviderManager:.cold.3(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Could not retrieve a call provider for the specified identifier %@.", (uint8_t *)&v2, 0xCu);
}

@end