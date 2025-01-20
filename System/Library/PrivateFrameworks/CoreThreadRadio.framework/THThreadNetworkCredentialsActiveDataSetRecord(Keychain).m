@interface THThreadNetworkCredentialsActiveDataSetRecord(Keychain)
- (void)computedUniqueIdentifier;
- (void)computedUniqueIdentifierWithBorderAgent;
- (void)keyChainItemRepresentationForActiveDataSetRecordAddOperation;
- (void)keyChainQueryForActiveDataSetRecordUpdateOperation;
@end

@implementation THThreadNetworkCredentialsActiveDataSetRecord(Keychain)

- (void)computedUniqueIdentifier
{
  v4 = [a1 network];
  v5 = [v4 networkName];
  v6 = [a1 network];
  v7 = [v6 extendedPANID];
  int v9 = 138412546;
  v10 = v5;
  OUTLINED_FUNCTION_3_1();
  uint64_t v11 = v8;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Failed to calculate UUID (name=%@; xpanid=%@)!",
    (uint8_t *)&v9,
    0x16u);
}

- (void)computedUniqueIdentifierWithBorderAgent
{
  v2 = [a1 network];
  v3 = [v2 networkName];
  v4 = [a1 network];
  v5 = [v4 extendedPANID];
  v6 = [a1 borderAgent];
  v7 = [v6 discriminatorId];
  uint64_t v8 = [a1 keychainAccessGroup];
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_2_4((void *)&_mh_execute_header, v9, v10, "Failed to calculate UUID (name=%@; xpanid=%@; discriminatorId=%@; keychainAccessGroup=%@)!",
    v11,
    v12,
    v13,
    v14,
    2u);
}

+ (void)activeDataSetRecordFromKeychainDictionary:()Keychain .cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_1((void *)&_mh_execute_header, v0, v1, "%s : %d:  Failed to decode Keychain item (unable to form THThreadNetwork)!", v2, v3, v4, v5, v6);
}

+ (void)activeDataSetRecordFromKeychainDictionary:()Keychain .cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_1((void *)&_mh_execute_header, v0, v1, "%s:%d: Failed to decode Keychain item (unable to form THThreadNetworkBorderAgent)!", v2, v3, v4, v5, v6);
}

+ (void)activeDataSetRecordFromKeychainDictionary:()Keychain .cold.3(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Failed to decode keychainAccessGroup!", v1, 2u);
}

+ (void)activeDataSetRecordFromKeychainDictionary:()Keychain .cold.4(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v5 = [a1 uniqueIdentifier];
  int v6 = 138412546;
  v7 = v5;
  OUTLINED_FUNCTION_3_1();
  uint64_t v8 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_ERROR, "Warning: decoded record with identifier %@ but does not match expected %@!", (uint8_t *)&v6, 0x16u);
}

+ (void)activeDataSetRecordFromKeychainDictionary:()Keychain .cold.5()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_1((void *)&_mh_execute_header, v0, v1, "%s:%d: Failed to decode Keychain item (credentialsDataSet could not be deserialized)! Using empty credential template.", v2, v3, v4, v5, v6);
}

+ (void)activeDataSetRecordFromKeychainDictionary:()Keychain .cold.6()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_1((void *)&_mh_execute_header, v0, v1, "%s:%d: Failed to decode Keychain item (credentialsDataSet could not be deserialized)!", v2, v3, v4, v5, v6);
}

+ (void)activeDataSetRecordFromKeychainDictionary:()Keychain .cold.7(os_log_t log)
{
  int v1 = 136315650;
  uint64_t v2 = "+[THThreadNetworkCredentialsActiveDataSetRecord(Keychain) activeDataSetRecordFromKeychainDictionary:]";
  __int16 v3 = 1024;
  int v4 = 187;
  __int16 v5 = 2112;
  uint64_t v6 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "%s:%d, Failed to decode Keychain item - Ba Discriminator Id  (baDiscriminatorId=%@)!", (uint8_t *)&v1, 0x1Cu);
}

+ (void)activeDataSetRecordFromKeychainDictionary:()Keychain .cold.8()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_1((void *)&_mh_execute_header, v0, v1, "%s: %d Failed to decode Keychain item (credentials could not be deserialized)! Using empty credential template.", v2, v3, v4, v5, v6);
}

- (void)keyChainItemRepresentationForActiveDataSetRecordAddOperation
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Error: unable to form add operation due to missing data", v1, 2u);
}

- (void)keyChainQueryForActiveDataSetRecordUpdateOperation
{
  uint64_t v2 = [a1 network];
  uint64_t v3 = [v2 networkName];
  uint64_t v4 = [a1 network];
  uint64_t v5 = [v4 extendedPANID];
  uint8_t v6 = [a1 borderAgent];
  v7 = [v6 discriminatorId];
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_2_4((void *)&_mh_execute_header, v8, v9, "Illegal attempt to form keychain item with insufficient information (name=%@; xpanid=%@; discriminatorId=%@; uuid=%@)!",
    v10,
    v11,
    v12,
    v13,
    2u);
}

@end