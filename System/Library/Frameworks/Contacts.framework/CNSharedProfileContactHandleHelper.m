@interface CNSharedProfileContactHandleHelper
+ (id)log;
- (BOOL)contact:(id)a3 containsEmailHandleString:(id)a4;
- (BOOL)contact:(id)a3 containsHandleString:(id)a4;
- (BOOL)contact:(id)a3 containsPhoneHandleString:(id)a4;
- (CNHandleStringClassifier)classifier;
- (CNSharedProfileContactHandleHelper)init;
- (CNSharedProfileContactHandleHelper)initWithHandleStringClassifier:(id)a3;
- (void)setClassifier:(id)a3;
@end

@implementation CNSharedProfileContactHandleHelper

+ (id)log
{
  if (log_cn_once_token_0_9 != -1) {
    dispatch_once(&log_cn_once_token_0_9, &__block_literal_global_100);
  }
  v2 = (void *)log_cn_once_object_0_9;

  return v2;
}

uint64_t __41__CNSharedProfileContactHandleHelper_log__block_invoke()
{
  log_cn_once_object_0_9 = (uint64_t)os_log_create("com.apple.contacts", "CNSharedProfileContactHandleHelper");

  return MEMORY[0x1F41817F8]();
}

- (CNSharedProfileContactHandleHelper)init
{
  v5.receiver = self;
  v5.super_class = (Class)CNSharedProfileContactHandleHelper;
  v2 = [(CNSharedProfileContactHandleHelper *)&v5 init];
  if (v2)
  {
    v3 = (void *)[objc_alloc(MEMORY[0x1E4F5A410]) initWithClassificationQuality:0];
    v2 = [(CNSharedProfileContactHandleHelper *)v2 initWithHandleStringClassifier:v3];
  }
  return v2;
}

- (CNSharedProfileContactHandleHelper)initWithHandleStringClassifier:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CNSharedProfileContactHandleHelper;
  v6 = [(CNSharedProfileContactHandleHelper *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_classifier, a3);
    v8 = v7;
  }

  return v7;
}

- (BOOL)contact:(id)a3 containsHandleString:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (![v6 isKeyAvailable:@"emailAddresses"]
    || ([v6 isKeyAvailable:@"phoneNumbers"] & 1) == 0)
  {
    v8 = [(id)objc_opt_class() log];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[CNSharedProfileContactHandleHelper contact:containsHandleString:](v8);
    }
  }
  v9 = [(CNSharedProfileContactHandleHelper *)self classifier];
  uint64_t v10 = [v9 typeOfHandleString:v7];

  if (v10)
  {
    if (v10 != 2)
    {
      if (v10 != 1)
      {
        BOOL v12 = 0;
        goto LABEL_15;
      }
      BOOL v11 = [(CNSharedProfileContactHandleHelper *)self contact:v6 containsEmailHandleString:v7];
      goto LABEL_13;
    }
LABEL_12:
    BOOL v11 = [(CNSharedProfileContactHandleHelper *)self contact:v6 containsPhoneHandleString:v7];
LABEL_13:
    BOOL v12 = v11;
    goto LABEL_15;
  }
  if (![(CNSharedProfileContactHandleHelper *)self contact:v6 containsEmailHandleString:v7])goto LABEL_12; {
  BOOL v12 = 1;
  }
LABEL_15:

  return v12;
}

- (BOOL)contact:(id)a3 containsEmailHandleString:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v6 = objc_msgSend(a3, "emailAddresses", 0);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v17;
    uint64_t v10 = *MEMORY[0x1E4F5A1E0];
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v12 = [*(id *)(*((void *)&v16 + 1) + 8 * i) value];
        v13 = (*(void (**)(uint64_t, uint64_t))(v10 + 16))(v10, v12);

        LOBYTE(v12) = [v13 isEqualToString:v5];
        if (v12)
        {
          BOOL v14 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
  BOOL v14 = 0;
LABEL_11:

  return v14;
}

- (BOOL)contact:(id)a3 containsPhoneHandleString:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = objc_msgSend(a3, "phoneNumbers", 0);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v6);
        }
        uint64_t v10 = [*(id *)(*((void *)&v13 + 1) + 8 * i) value];
        BOOL v11 = [(id)v10 unformattedInternationalStringValue];

        LOBYTE(v10) = [v11 isEqualToString:v5];
        if (v10)
        {
          LOBYTE(v7) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v7;
}

- (CNHandleStringClassifier)classifier
{
  return self->_classifier;
}

- (void)setClassifier:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)contact:(os_log_t)log containsHandleString:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1909E3000, log, OS_LOG_TYPE_ERROR, "Contact must have already have CNContactEmailAddressesKey and CNContactPhoneNumbersKey available", v1, 2u);
}

@end