@interface CNUIDowntimeLogger
+ (CNUIDowntimeLogger)sharedLogger;
- (CNUIDowntimeLogger)init;
- (CNUIDowntimeLogger)initWithLog:(id)a3;
- (OS_os_log)log;
- (void)logFailure:(id)a3 fetchingContactsOfFamilyMember:(id)a4;
- (void)logFailure:(id)a3 updatingContactListByAddingContacts:(id)a4 ofFamilyMember:(id)a5;
- (void)logFailure:(id)a3 updatingContactListByRemovingContacts:(id)a4 ofFamilyMember:(id)a5;
- (void)logFailure:(id)a3 updatingContactWhitelistByAddingContacts:(id)a4 ofFamilyMember:(id)a5;
- (void)logFailure:(id)a3 updatingContactWhitelistByRemovingContacts:(id)a4 ofFamilyMember:(id)a5;
- (void)logFetchingFamilyCircleError:(id)a3;
- (void)logFetchingMeError:(id)a3;
- (void)logResultOfFetchingContacts:(id)a3 ofFamilyMember:(id)a4;
- (void)logSuccessFetchingContacts:(id)a3 ofFamilyMember:(id)a4;
- (void)logSuccessUpdatingContactListByAddingContacts:(id)a3 ofFamilyMember:(id)a4;
- (void)logSuccessUpdatingContactListByRemovingContacts:(id)a3 ofFamilyMember:(id)a4;
- (void)logSuccessUpdatingContactWhitelistByAddingContacts:(id)a3 ofFamilyMember:(id)a4;
- (void)logSuccessUpdatingContactWhitelistByRemovingContacts:(id)a3 ofFamilyMember:(id)a4;
@end

@implementation CNUIDowntimeLogger

+ (CNUIDowntimeLogger)sharedLogger
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __34__CNUIDowntimeLogger_sharedLogger__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedLogger_cn_once_token_1 != -1) {
    dispatch_once(&sharedLogger_cn_once_token_1, block);
  }
  v2 = (void *)sharedLogger_cn_once_object_1;
  return (CNUIDowntimeLogger *)v2;
}

void __34__CNUIDowntimeLogger_sharedLogger__block_invoke(uint64_t a1)
{
  id v1 = objc_alloc(*(Class *)(a1 + 32));
  os_log_t v4 = os_log_create("com.apple.contactsui", "downtime");
  uint64_t v2 = [v1 initWithLog:v4];
  v3 = (void *)sharedLogger_cn_once_object_1;
  sharedLogger_cn_once_object_1 = v2;
}

- (CNUIDowntimeLogger)init
{
  uint64_t v2 = self;
  CNInitializerUnavailableException();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v3);
}

- (CNUIDowntimeLogger)initWithLog:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CNUIDowntimeLogger;
  v6 = [(CNUIDowntimeLogger *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_log, a3);
    v8 = v7;
  }

  return v7;
}

- (void)logResultOfFetchingContacts:(id)a3 ofFamilyMember:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  if ([v7 isSuccess])
  {
    id v8 = [v7 value];

    [(CNUIDowntimeLogger *)self logSuccessFetchingContacts:v8 ofFamilyMember:v6];
  }
  else
  {
    id v8 = [v7 error];

    [(CNUIDowntimeLogger *)self logFailure:v8 fetchingContactsOfFamilyMember:v6];
  }
}

- (void)logSuccessFetchingContacts:(id)a3 ofFamilyMember:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(CNUIDowntimeLogger *)self log];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[CNUIDowntimeLogger logSuccessFetchingContacts:ofFamilyMember:]();
  }
}

- (void)logFailure:(id)a3 fetchingContactsOfFamilyMember:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(CNUIDowntimeLogger *)self log];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
    -[CNUIDowntimeLogger logFailure:fetchingContactsOfFamilyMember:]();
  }
}

- (void)logSuccessUpdatingContactListByAddingContacts:(id)a3 ofFamilyMember:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(CNUIDowntimeLogger *)self log];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[CNUIDowntimeLogger logSuccessUpdatingContactListByAddingContacts:ofFamilyMember:]();
  }
}

- (void)logFailure:(id)a3 updatingContactListByAddingContacts:(id)a4 ofFamilyMember:(id)a5
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = [(CNUIDowntimeLogger *)self log];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    int v12 = 138412802;
    id v13 = v8;
    __int16 v14 = 2112;
    id v15 = v9;
    __int16 v16 = 2112;
    id v17 = v10;
    _os_log_error_impl(&dword_20B704000, v11, OS_LOG_TYPE_ERROR, "error: %@ adding contacts: %@ to contacts of family member: %@", (uint8_t *)&v12, 0x20u);
  }
}

- (void)logSuccessUpdatingContactListByRemovingContacts:(id)a3 ofFamilyMember:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(CNUIDowntimeLogger *)self log];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[CNUIDowntimeLogger logSuccessUpdatingContactListByRemovingContacts:ofFamilyMember:]();
  }
}

- (void)logFailure:(id)a3 updatingContactListByRemovingContacts:(id)a4 ofFamilyMember:(id)a5
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = [(CNUIDowntimeLogger *)self log];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    int v12 = 138412802;
    id v13 = v8;
    __int16 v14 = 2112;
    id v15 = v9;
    __int16 v16 = 2112;
    id v17 = v10;
    _os_log_error_impl(&dword_20B704000, v11, OS_LOG_TYPE_ERROR, "error: %@ removing contacts: %@from contacts of family member: %@", (uint8_t *)&v12, 0x20u);
  }
}

- (void)logSuccessUpdatingContactWhitelistByAddingContacts:(id)a3 ofFamilyMember:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(CNUIDowntimeLogger *)self log];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[CNUIDowntimeLogger logSuccessUpdatingContactWhitelistByAddingContacts:ofFamilyMember:]();
  }
}

- (void)logFailure:(id)a3 updatingContactWhitelistByAddingContacts:(id)a4 ofFamilyMember:(id)a5
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = [(CNUIDowntimeLogger *)self log];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    int v12 = 138412802;
    id v13 = v8;
    __int16 v14 = 2112;
    id v15 = v9;
    __int16 v16 = 2112;
    id v17 = v10;
    _os_log_error_impl(&dword_20B704000, v11, OS_LOG_TYPE_ERROR, "error: %@ whitelisting contacts: %@ of family member: %@", (uint8_t *)&v12, 0x20u);
  }
}

- (void)logSuccessUpdatingContactWhitelistByRemovingContacts:(id)a3 ofFamilyMember:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(CNUIDowntimeLogger *)self log];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[CNUIDowntimeLogger logSuccessUpdatingContactWhitelistByRemovingContacts:ofFamilyMember:]();
  }
}

- (void)logFailure:(id)a3 updatingContactWhitelistByRemovingContacts:(id)a4 ofFamilyMember:(id)a5
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = [(CNUIDowntimeLogger *)self log];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    int v12 = 138412802;
    id v13 = v8;
    __int16 v14 = 2112;
    id v15 = v9;
    __int16 v16 = 2112;
    id v17 = v10;
    _os_log_error_impl(&dword_20B704000, v11, OS_LOG_TYPE_ERROR, "error: %@ clearing contacts: %@ from whitelist of family member: %@", (uint8_t *)&v12, 0x20u);
  }
}

- (void)logFetchingFamilyCircleError:(id)a3
{
  id v4 = a3;
  id v5 = [(CNUIDowntimeLogger *)self log];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    -[CNUIDowntimeLogger logFetchingFamilyCircleError:]((uint64_t)v4, v5);
  }
}

- (void)logFetchingMeError:(id)a3
{
  id v4 = a3;
  id v5 = [(CNUIDowntimeLogger *)self log];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    -[CNUIDowntimeLogger logFetchingMeError:]((uint64_t)v4, v5);
  }
}

- (OS_os_log)log
{
  return self->_log;
}

- (void).cxx_destruct
{
}

- (void)logSuccessFetchingContacts:ofFamilyMember:.cold.1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1(&dword_20B704000, v0, v1, "success fetching contacts: %@ of family member: %@");
}

- (void)logFailure:fetchingContactsOfFamilyMember:.cold.1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_0_0();
  _os_log_error_impl(&dword_20B704000, v0, OS_LOG_TYPE_ERROR, "error: %@ fetching contacts of family member: %@", v1, 0x16u);
}

- (void)logSuccessUpdatingContactListByAddingContacts:ofFamilyMember:.cold.1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1(&dword_20B704000, v0, v1, "success adding contacts: %@ to contacts of family member: %@");
}

- (void)logSuccessUpdatingContactListByRemovingContacts:ofFamilyMember:.cold.1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1(&dword_20B704000, v0, v1, "success removing contacts: %@ from contacts of family member: %@");
}

- (void)logSuccessUpdatingContactWhitelistByAddingContacts:ofFamilyMember:.cold.1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1(&dword_20B704000, v0, v1, "success whitelisting contacts: %@ of family member: %@");
}

- (void)logSuccessUpdatingContactWhitelistByRemovingContacts:ofFamilyMember:.cold.1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1(&dword_20B704000, v0, v1, "success clearing contacts: %@ from whitelist of family member: %@");
}

- (void)logFetchingFamilyCircleError:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_20B704000, a2, OS_LOG_TYPE_ERROR, "error: %@ fetching family circle", (uint8_t *)&v2, 0xCu);
}

- (void)logFetchingMeError:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_20B704000, a2, OS_LOG_TYPE_ERROR, "error: %@ fetching me", (uint8_t *)&v2, 0xCu);
}

@end