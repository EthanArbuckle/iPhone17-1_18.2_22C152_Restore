@interface THThreadNetworkCredentialsStoreRecord(CredentialsServerKeychainRepr)
- (void)computedUniqueIdentifier;
- (void)keyChainQueryForUpdateOperation;
@end

@implementation THThreadNetworkCredentialsStoreRecord(CredentialsServerKeychainRepr)

- (void)computedUniqueIdentifier
{
  v4 = [a1 network];
  v5 = [v4 networkName];
  v6 = [a1 network];
  v7 = [v6 extendedPANID];
  v8 = [a1 keychainAccessGroup];
  int v9 = 138412802;
  v10 = v5;
  __int16 v11 = 2112;
  v12 = v7;
  __int16 v13 = 2112;
  v14 = v8;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Failed to calculate UUID (name=%@; xpanid=%@; keychainAccessGroup=%@)!",
    (uint8_t *)&v9,
    0x20u);
}

+ (void)recordFromKeychainDictionary:()CredentialsServerKeychainRepr .cold.1()
{
  OUTLINED_FUNCTION_2();
  int v2 = 144;
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "%s:%d:Failed to decode Keychain item (unable to form THThreadNetwork)!", v1, 0x12u);
}

+ (void)recordFromKeychainDictionary:()CredentialsServerKeychainRepr .cold.3(void *a1, uint64_t a2, NSObject *a3)
{
  v5 = [a1 uniqueIdentifier];
  int v6 = 138412546;
  v7 = v5;
  __int16 v8 = 2112;
  uint64_t v9 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_ERROR, "Warning: decoded record with identifier %@ but does not match expected %@!", (uint8_t *)&v6, 0x16u);
}

+ (void)recordFromKeychainDictionary:()CredentialsServerKeychainRepr .cold.4()
{
  OUTLINED_FUNCTION_2();
  int v2 = 134;
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "%s:%d: Failed to decode Keychain item (credentials could not be deserialized)! Using empty credential template.", v1, 0x12u);
}

- (void)keyChainQueryForUpdateOperation
{
  int v6 = [a1 network];
  v7 = [v6 networkName];
  __int16 v8 = [a1 network];
  uint64_t v9 = [v8 extendedPANID];
  int v10 = 138412802;
  __int16 v11 = v7;
  __int16 v12 = 2112;
  __int16 v13 = v9;
  __int16 v14 = 2112;
  uint64_t v15 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_ERROR, "Illegal attempt to form keychain item with insufficient information (name=%@; xpanid=%@; uuid=%@)!",
    (uint8_t *)&v10,
    0x20u);
}

@end