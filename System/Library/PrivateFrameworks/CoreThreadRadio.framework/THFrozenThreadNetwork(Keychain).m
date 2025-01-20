@interface THFrozenThreadNetwork(Keychain)
- (void)keyChainItemRepresentationForFrozenThreadNetworkAddOperation;
- (void)keyChainQueryForFrozenThreadNetworkUpdateOperation;
@end

@implementation THFrozenThreadNetwork(Keychain)

+ (void)frozenThreadNetworkFromKeychainDictionary:()Keychain .cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_1((void *)&_mh_execute_header, v0, v1, "%s : %d : Unable to decode dataSet", v2, v3, v4, v5, v6);
}

+ (void)frozenThreadNetworkFromKeychainDictionary:()Keychain .cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_1((void *)&_mh_execute_header, v0, v1, "%s:%d: Failed to decode THThreadNetworkCredentialsDataSet!", v2, v3, v4, v5, v6);
}

- (void)keyChainItemRepresentationForFrozenThreadNetworkAddOperation
{
  int v1 = 136315138;
  uint64_t v2 = "-[THFrozenThreadNetwork(Keychain) keyChainItemRepresentationForFrozenThreadNetworkAddOperation]";
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "%s : Error: unable to form add operation due to missing data", (uint8_t *)&v1, 0xCu);
}

- (void)keyChainQueryForFrozenThreadNetworkUpdateOperation
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_1((void *)&_mh_execute_header, v0, v1, "%s : %d : Can not create frozen thread network keychain item with insufficient information ", v2, v3, v4, v5, v6);
}

@end