@interface CNSocialProfileServicePickerController
+ (id)defaultServices;
- (CNSocialProfileServicePickerController)initWithStyle:(int64_t)a3;
- (id)titleForAddCustomItem;
- (id)titleForPickerItem:(id)a3;
@end

@implementation CNSocialProfileServicePickerController

- (id)titleForAddCustomItem
{
  v2 = CNContactsUIBundle();
  v3 = [v2 localizedStringForKey:@"ADD_CUSTOM_SERVICE_BUTTON" value:&stru_1ED8AC728 table:@"Localized"];

  return v3;
}

- (id)titleForPickerItem:(id)a3
{
  return (id)[MEMORY[0x1E4F1BAC0] localizedStringForService:a3];
}

- (CNSocialProfileServicePickerController)initWithStyle:(int64_t)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v15.receiver = self;
  v15.super_class = (Class)CNSocialProfileServicePickerController;
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
  if (defaultServices_onceToken_48597 != -1) {
    dispatch_once(&defaultServices_onceToken_48597, &__block_literal_global_48598);
  }
  v2 = (void *)defaultServices__services_48599;

  return v2;
}

void __57__CNSocialProfileServicePickerController_defaultServices__block_invoke()
{
  v13[6] = *MEMORY[0x1E4F143B8];
  v0 = [MEMORY[0x1E4F5A498] defaultCountryCode];
  int v1 = [v0 isEqualToString:@"cn"];

  if (v1)
  {
    v2 = (uint64_t *)MEMORY[0x1E4F1B7F8];
    v3 = (uint64_t *)MEMORY[0x1E4F1B7F0];
    v4 = (uint64_t *)MEMORY[0x1E4F1B7E8];
    v13[0] = *MEMORY[0x1E4F1B800];
    v5 = (uint64_t *)MEMORY[0x1E4F1B7E0];
    uint64_t v6 = (uint64_t *)MEMORY[0x1E4F1B810];
    uint64_t v7 = v13;
  }
  else
  {
    v2 = (uint64_t *)MEMORY[0x1E4F1B800];
    v3 = (uint64_t *)MEMORY[0x1E4F1B7F8];
    v4 = (uint64_t *)MEMORY[0x1E4F1B7F0];
    uint64_t v12 = *MEMORY[0x1E4F1B810];
    v5 = (uint64_t *)MEMORY[0x1E4F1B7E8];
    uint64_t v6 = (uint64_t *)MEMORY[0x1E4F1B7E0];
    uint64_t v7 = &v12;
  }
  uint64_t v8 = *v5;
  v7[1] = *v6;
  v7[2] = v8;
  uint64_t v9 = *v3;
  v7[3] = *v4;
  v7[4] = v9;
  v7[5] = *v2;
  uint64_t v10 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:");
  long long v11 = (void *)defaultServices__services_48599;
  defaultServices__services_48599 = v10;
}

@end