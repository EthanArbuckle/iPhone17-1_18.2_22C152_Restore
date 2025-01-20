@interface THPreferredThreadNetwork(Keychain)
- (void)DEBUGkeyChainItemRepresentationForpreferredNetworkAddOperation;
- (void)DEBUGkeyChainQueryForpreferredNetworkUpdateOperation;
- (void)keyChainItemRepresentationForpreferredNetworkAddOperation;
- (void)keyChainQueryForpreferredNetworkUpdateOperation;
@end

@implementation THPreferredThreadNetwork(Keychain)

+ (void)preferredNetworkFromKeychainDictionary:()Keychain .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Failed to decode THThreadNetwork!", v1, 2u);
}

+ (void)preferredNetworkFromKeychainDictionary:()Keychain .cold.2(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Failed to decode THNetworkSignature!", v1, 2u);
}

+ (void)preferredNetworkFromKeychainDictionary:()Keychain .cold.3()
{
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_1_1((void *)&_mh_execute_header, v0, v1, "%s: %d : credentials dataset record is empty in preferred network entry.", v2, v3, v4, v5, 2u);
}

+ (void)preferredNetworkFromKeychainDictionary:()Keychain .cold.4()
{
  v1[0] = 136315650;
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_6_1();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "%s: %d : wifiPwd is empty inside the preferred network entry for network name : %@.", (uint8_t *)v1, 0x1Cu);
}

+ (void)preferredNetworkFromKeychainDictionary:()Keychain .cold.5()
{
  v1[0] = 136315650;
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_6_1();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "%s: %d : wifissid is empty inside the preferred network entry for network name : %@.", (uint8_t *)v1, 0x1Cu);
}

+ (void)preferredNetworkFromKeychainDictionary:()Keychain .cold.6()
{
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_1_1((void *)&_mh_execute_header, v0, v1, "%s : %d : Unable to decode name or xpanid or network signature", v2, v3, v4, v5, 2u);
}

- (void)DEBUGkeyChainItemRepresentationForpreferredNetworkAddOperation
{
  int v1 = 136315138;
  uint64_t v2 = "-[THPreferredThreadNetwork(Keychain) DEBUGkeyChainItemRepresentationForpreferredNetworkAddOperation]";
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "%s : Error: unable to form add operation due to missing data", (uint8_t *)&v1, 0xCu);
}

- (void)DEBUGkeyChainQueryForpreferredNetworkUpdateOperation
{
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_1_1((void *)&_mh_execute_header, v0, v1, "%s : %d : Can not form preferred netowk keychain item with insufficient information ", v2, v3, v4, v5, 2u);
}

- (void)keyChainItemRepresentationForpreferredNetworkAddOperation
{
  int v1 = 136315138;
  uint64_t v2 = "-[THPreferredThreadNetwork(Keychain) keyChainItemRepresentationForpreferredNetworkAddOperation]";
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "%s : Error: unable to form add operation due to missing data", (uint8_t *)&v1, 0xCu);
}

- (void)keyChainQueryForpreferredNetworkUpdateOperation
{
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_1_1((void *)&_mh_execute_header, v0, v1, "%s : %d : Can not form preferred netowk keychain item with insufficient information ", v2, v3, v4, v5, 2u);
}

@end