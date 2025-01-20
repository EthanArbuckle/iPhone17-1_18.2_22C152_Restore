@interface CNContactVCardSerialization
+ (NSArray)contactsWithData:(NSData *)data error:(NSError *)error;
+ (NSData)dataWithContacts:(NSArray *)contacts error:(NSError *)error;
+ (id)contactsWithData:(id)a3 options:(id)a4 error:(id *)a5;
+ (id)contactsWithMECARDString:(id)a3 error:(id *)a4;
+ (id)dataWithContacts:(id)a3 options:(id)a4 error:(id *)a5;
+ (id)dataWithContacts:(id)a3 options:(id)a4 error:(id *)a5 environment:(id)a6;
+ (id)descriptorForRequiredKeys;
+ (id)descriptorForRequiredKeysWithOptions:(id)a3;
+ (id)descriptorForRequiredKeysWithOptions:(id)a3 description:(id)a4;
+ (id)summaryOfLocationVCard:(id)a3 error:(id *)a4;
+ (id)summaryOfVCard:(id)a3 error:(id *)a4;
+ (void)contactsWithData:(id)a3 completionHandler:(id)a4;
+ (void)contactsWithData:(id)a3 scheduler:(id)a4 completionHandler:(id)a5;
+ (void)dataWithContacts:(id)a3 options:(id)a4 completionHandler:(id)a5;
+ (void)dataWithContacts:(id)a3 options:(id)a4 scheduler:(id)a5 completionHandler:(id)a6;
+ (void)logWritingContactsToVCard:(id)a3 options:(id)a4 logger:(id)a5;
@end

@implementation CNContactVCardSerialization

+ (id)descriptorForRequiredKeys
{
  v3 = [MEMORY[0x1E4FB8C18] optionsFromPreferences];
  v4 = [NSString stringWithUTF8String:"+[CNContactVCardSerialization descriptorForRequiredKeys]"];
  v5 = [a1 descriptorForRequiredKeysWithOptions:v3 description:v4];

  return v5;
}

+ (id)descriptorForRequiredKeysWithOptions:(id)a3 description:(id)a4
{
  v10[1] = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  v6 = +[CNContactVCardWritingAdapter descriptorForAllSupportedKeysWithOptions:a3];
  v10[0] = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
  v8 = +[CNContact descriptorWithKeyDescriptors:v7 description:v5];

  return v8;
}

+ (id)summaryOfVCard:(id)a3 error:(id *)a4
{
  id v5 = a3;
  v6 = [[CNContactVCardSummary alloc] initWithData:v5 error:a4];

  return v6;
}

+ (id)summaryOfLocationVCard:(id)a3 error:(id *)a4
{
  id v5 = a3;
  v6 = [[CNContactLocationVCardSummary alloc] initWithData:v5 error:a4];

  return v6;
}

+ (id)descriptorForRequiredKeysWithOptions:(id)a3
{
  v4 = NSString;
  id v5 = a3;
  v6 = [v4 stringWithUTF8String:"+[CNContactVCardSerialization descriptorForRequiredKeysWithOptions:]"];
  v7 = [a1 descriptorForRequiredKeysWithOptions:v5 description:v6];

  return v7;
}

+ (NSData)dataWithContacts:(NSArray *)contacts error:(NSError *)error
{
  v6 = (void *)MEMORY[0x1E4FB8C18];
  v7 = contacts;
  v8 = [v6 optionsFromPreferences];
  v9 = [a1 dataWithContacts:v7 options:v8 error:error];

  return (NSData *)v9;
}

+ (id)dataWithContacts:(id)a3 options:(id)a4 error:(id *)a5
{
  id v8 = a4;
  id v9 = a3;
  v10 = +[CNContactsEnvironment currentEnvironment];
  v11 = [a1 dataWithContacts:v9 options:v8 error:a5 environment:v10];

  return v11;
}

+ (id)dataWithContacts:(id)a3 options:(id)a4 error:(id *)a5 environment:(id)a6
{
  id v10 = a4;
  id v11 = a3;
  v12 = [a6 loggerProvider];
  v13 = [v12 regulatoryLogger];
  [a1 logWritingContactsToVCard:v11 options:v10 logger:v13];

  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __74__CNContactVCardSerialization_dataWithContacts_options_error_environment___block_invoke;
  v18[3] = &unk_1E56B8BF0;
  id v19 = v10;
  id v14 = v10;
  v15 = objc_msgSend(v11, "_cn_map:", v18);

  v16 = [MEMORY[0x1E4FB8C10] dataWithPeople:v15 options:v14 error:a5];

  return v16;
}

CNContactVCardWritingAdapter *__74__CNContactVCardSerialization_dataWithContacts_options_error_environment___block_invoke(uint64_t a1, uint64_t a2)
{
  return +[CNContactVCardWritingAdapter adapterWithContact:a2 options:*(void *)(a1 + 32)];
}

+ (void)logWritingContactsToVCard:(id)a3 options:(id)a4 logger:(id)a5
{
  id v8 = a3;
  id v7 = a5;
  if (([a4 shouldSuppressRegulatoryLogging] & 1) == 0
    && objc_msgSend(v8, "_cn_any:", &__block_literal_global_121))
  {
    [v7 readAndTransmittingContactsData];
  }
}

uint64_t __72__CNContactVCardSerialization_logWritingContactsToVCard_options_logger___block_invoke(uint64_t a1, void *a2)
{
  return [a2 hasBeenPersisted];
}

+ (NSArray)contactsWithData:(NSData *)data error:(NSError *)error
{
  v6 = (objc_class *)MEMORY[0x1E4FB8C08];
  id v7 = data;
  id v8 = objc_alloc_init(v6);
  id v9 = [a1 contactsWithData:v7 options:v8 error:error];

  return (NSArray *)v9;
}

+ (id)contactsWithData:(id)a3 options:(id)a4 error:(id *)a5
{
  id v6 = a3;
  id v7 = a4;
  if (v6) {
    goto LABEL_5;
  }
  if (CNGuardOSLog_cn_once_token_0_8 != -1) {
    dispatch_once(&CNGuardOSLog_cn_once_token_0_8, &__block_literal_global_43);
  }
  id v8 = CNGuardOSLog_cn_once_object_0_8;
  if (os_log_type_enabled((os_log_t)CNGuardOSLog_cn_once_object_0_8, OS_LOG_TYPE_FAULT))
  {
    +[CNContactVCardSerialization contactsWithData:options:error:](v8);
    if (v7) {
      goto LABEL_10;
    }
  }
  else
  {
LABEL_5:
    if (v7) {
      goto LABEL_10;
    }
  }
  if (CNGuardOSLog_cn_once_token_0_8 != -1) {
    dispatch_once(&CNGuardOSLog_cn_once_token_0_8, &__block_literal_global_43);
  }
  id v9 = CNGuardOSLog_cn_once_object_0_8;
  if (os_log_type_enabled((os_log_t)CNGuardOSLog_cn_once_object_0_8, OS_LOG_TYPE_FAULT)) {
    +[CNContactVCardSerialization contactsWithData:options:error:](v9);
  }
LABEL_10:
  id v10 = objc_alloc_init(CNContactVCardParsedResultBuilderFactory);
  id v11 = [MEMORY[0x1E4FB8BF8] parseData:v6 options:v7 resultFactory:v10];

  return v11;
}

+ (void)contactsWithData:(id)a3 completionHandler:(id)a4
{
  id v6 = (void *)MEMORY[0x1E4F5A4E8];
  id v7 = a4;
  id v8 = a3;
  id v9 = [v6 globalAsyncScheduler];
  [a1 contactsWithData:v8 scheduler:v9 completionHandler:v7];
}

+ (void)contactsWithData:(id)a3 scheduler:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if (v9)
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    void v10[2] = __76__CNContactVCardSerialization_contactsWithData_scheduler_completionHandler___block_invoke;
    v10[3] = &unk_1E56B8C18;
    id v13 = a1;
    id v11 = v8;
    id v12 = v9;
    [a4 performBlock:v10];
  }
}

void __76__CNContactVCardSerialization_contactsWithData_scheduler_completionHandler___block_invoke(void *a1)
{
  v2 = (void *)a1[6];
  uint64_t v3 = a1[4];
  id v6 = 0;
  v4 = [v2 contactsWithData:v3 error:&v6];
  id v5 = v6;
  (*(void (**)(void))(a1[5] + 16))();
}

+ (void)dataWithContacts:(id)a3 options:(id)a4 completionHandler:(id)a5
{
  id v8 = (void *)MEMORY[0x1E4F5A4E8];
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  id v12 = [v8 globalAsyncScheduler];
  [a1 dataWithContacts:v11 options:v10 scheduler:v12 completionHandler:v9];
}

+ (void)dataWithContacts:(id)a3 options:(id)a4 scheduler:(id)a5 completionHandler:(id)a6
{
  id v9 = a3;
  id v10 = a6;
  if (v10)
  {
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __84__CNContactVCardSerialization_dataWithContacts_options_scheduler_completionHandler___block_invoke;
    v11[3] = &unk_1E56B8C18;
    id v14 = a1;
    id v12 = v9;
    id v13 = v10;
    [a5 performBlock:v11];
  }
}

void __84__CNContactVCardSerialization_dataWithContacts_options_scheduler_completionHandler___block_invoke(void *a1)
{
  v2 = (void *)a1[6];
  uint64_t v3 = a1[4];
  id v6 = 0;
  v4 = [v2 dataWithContacts:v3 error:&v6];
  id v5 = v6;
  (*(void (**)(void))(a1[5] + 16))();
}

+ (id)contactsWithMECARDString:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = objc_alloc_init(CNContactVCardParsedResultBuilderFactory);
  id v7 = [MEMORY[0x1E4FB8BF0] parseString:v5 resultFactory:v6 error:a4];

  return v7;
}

+ (void)contactsWithData:(os_log_t)log options:error:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_1909E3000, log, OS_LOG_TYPE_FAULT, "parameter ‘options’ must be nonnull", v1, 2u);
}

+ (void)contactsWithData:(os_log_t)log options:error:.cold.2(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_1909E3000, log, OS_LOG_TYPE_FAULT, "parameter ‘data’ must be nonnull", v1, 2u);
}

@end