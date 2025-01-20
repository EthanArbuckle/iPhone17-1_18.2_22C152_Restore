@interface CNUICoreContactFetchRequestAccumulator
+ (id)resultOfFetchRequest:(id)a3 fromStore:(id)a4;
@end

@implementation CNUICoreContactFetchRequestAccumulator

+ (id)resultOfFetchRequest:(id)a3 fromStore:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (v5) {
    goto LABEL_5;
  }
  if (CNGuardOSLog_cn_once_token_0_6 != -1) {
    dispatch_once(&CNGuardOSLog_cn_once_token_0_6, &__block_literal_global_23);
  }
  v7 = CNGuardOSLog_cn_once_object_0_6;
  if (os_log_type_enabled((os_log_t)CNGuardOSLog_cn_once_object_0_6, OS_LOG_TYPE_FAULT))
  {
    +[CNUICoreContactFetchRequestAccumulator resultOfFetchRequest:fromStore:](v7);
    if (v6) {
      goto LABEL_10;
    }
  }
  else
  {
LABEL_5:
    if (v6) {
      goto LABEL_10;
    }
  }
  if (CNGuardOSLog_cn_once_token_0_6 != -1) {
    dispatch_once(&CNGuardOSLog_cn_once_token_0_6, &__block_literal_global_23);
  }
  v8 = CNGuardOSLog_cn_once_object_0_6;
  if (os_log_type_enabled((os_log_t)CNGuardOSLog_cn_once_object_0_6, OS_LOG_TYPE_FAULT)) {
    +[CNUICoreContactFetchRequestAccumulator resultOfFetchRequest:fromStore:](v8);
  }
LABEL_10:
  v9 = [MEMORY[0x263EFF980] array];
  id v20 = 0;
  uint64_t v15 = MEMORY[0x263EF8330];
  uint64_t v16 = 3221225472;
  v17 = __73__CNUICoreContactFetchRequestAccumulator_resultOfFetchRequest_fromStore___block_invoke;
  v18 = &unk_264017E00;
  id v10 = v9;
  id v19 = v10;
  char v11 = [v6 enumerateContactsWithFetchRequest:v5 error:&v20 usingBlock:&v15];
  id v12 = v20;
  if ((v11 & 1) == 0)
  {

    id v10 = 0;
  }
  v13 = objc_msgSend(MEMORY[0x263F33658], "resultWithValue:orError:", v10, v12, v15, v16, v17, v18);

  return v13;
}

uint64_t __73__CNUICoreContactFetchRequestAccumulator_resultOfFetchRequest_fromStore___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

+ (void)resultOfFetchRequest:(os_log_t)log fromStore:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_20B704000, log, OS_LOG_TYPE_FAULT, "parameter ‘contactStore’ must be nonnull", v1, 2u);
}

+ (void)resultOfFetchRequest:(os_log_t)log fromStore:.cold.2(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_20B704000, log, OS_LOG_TYPE_FAULT, "parameter ‘fetchRequest’ must be nonnull", v1, 2u);
}

@end