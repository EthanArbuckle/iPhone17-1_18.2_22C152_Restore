@interface CNInstantMessagePickerController
+ (id)defaultServices;
- (CNInstantMessagePickerController)initWithStyle:(int64_t)a3;
- (id)titleForAddCustomItem;
- (id)titleForPickerItem:(id)a3;
@end

@implementation CNInstantMessagePickerController

- (id)titleForAddCustomItem
{
  v2 = CNContactsUIBundle();
  v3 = [v2 localizedStringForKey:@"ADD_CUSTOM_SERVICE_BUTTON" value:&stru_1ED8AC728 table:@"Localized"];

  return v3;
}

- (id)titleForPickerItem:(id)a3
{
  return (id)[MEMORY[0x1E4F1BA18] localizedStringForService:a3];
}

- (CNInstantMessagePickerController)initWithStyle:(int64_t)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v15.receiver = self;
  v15.super_class = (Class)CNInstantMessagePickerController;
  v3 = [(CNPickerController *)&v15 initWithStyle:a3];
  if (v3)
  {
    v4 = [MEMORY[0x1E4F1CA48] array];
    long long v11 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    v5 = objc_msgSend((id)objc_opt_class(), "defaultServices", 0);
    uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v16 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v12;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v12 != v8) {
            objc_enumerationMutation(v5);
          }
          [v4 addObject:*(void *)(*((void *)&v11 + 1) + 8 * v9++)];
        }
        while (v7 != v9);
        uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v16 count:16];
      }
      while (v7);
    }

    [(CNPickerController *)v3 setBuiltinItems:v4];
  }
  return v3;
}

+ (id)defaultServices
{
  if (defaultServices_onceToken != -1) {
    dispatch_once(&defaultServices_onceToken, &__block_literal_global_20699);
  }
  v2 = (void *)defaultServices__services;

  return v2;
}

void __51__CNInstantMessagePickerController_defaultServices__block_invoke()
{
  v18[10] = *MEMORY[0x1E4F143B8];
  v0 = [MEMORY[0x1E4F5A498] defaultCountryCode];
  int v1 = [v0 isEqualToString:@"cn"];

  if (v1)
  {
    v2 = (uint64_t *)MEMORY[0x1E4F1B030];
    v3 = (uint64_t *)MEMORY[0x1E4F1B028];
    v4 = (uint64_t *)MEMORY[0x1E4F1B050];
    v5 = (uint64_t *)MEMORY[0x1E4F1B008];
    uint64_t v6 = (uint64_t *)MEMORY[0x1E4F1B010];
    uint64_t v7 = (uint64_t *)MEMORY[0x1E4F1B020];
    v18[0] = *MEMORY[0x1E4F1B040];
    uint64_t v8 = (uint64_t *)MEMORY[0x1E4F1B038];
    uint64_t v9 = (uint64_t *)MEMORY[0x1E4F1B048];
    v10 = v18;
  }
  else
  {
    v2 = (uint64_t *)MEMORY[0x1E4F1B040];
    v3 = (uint64_t *)MEMORY[0x1E4F1B030];
    v4 = (uint64_t *)MEMORY[0x1E4F1B028];
    v5 = (uint64_t *)MEMORY[0x1E4F1B050];
    uint64_t v6 = (uint64_t *)MEMORY[0x1E4F1B008];
    uint64_t v7 = (uint64_t *)MEMORY[0x1E4F1B010];
    uint64_t v17 = *MEMORY[0x1E4F1B048];
    uint64_t v8 = (uint64_t *)MEMORY[0x1E4F1B020];
    uint64_t v9 = (uint64_t *)MEMORY[0x1E4F1B038];
    v10 = &v17;
  }
  uint64_t v11 = *v8;
  v10[1] = *v9;
  v10[2] = v11;
  uint64_t v12 = *v6;
  v10[3] = *v7;
  v10[4] = v12;
  uint64_t v13 = *v4;
  v10[5] = *v5;
  v10[6] = v13;
  uint64_t v14 = *v2;
  v10[7] = *v3;
  v10[8] = v14;
  v10[9] = *MEMORY[0x1E4F1B018];
  uint64_t v15 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:");
  v16 = (void *)defaultServices__services;
  defaultServices__services = v15;
}

@end