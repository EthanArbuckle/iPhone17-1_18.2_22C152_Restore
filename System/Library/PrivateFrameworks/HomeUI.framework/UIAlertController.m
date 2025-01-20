@interface UIAlertController
@end

@implementation UIAlertController

void __89__UIAlertController_HUAdditions__alertControllerForAddingDestinationWithType_andProceed___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 setAutocapitalizationType:1];
  [v2 setAutocorrectionType:0];
}

void __89__UIAlertController_HUAdditions__alertControllerForAddingDestinationWithType_andProceed___block_invoke_2()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v0 = HFLogForCategory();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    int v1 = 136315138;
    id v2 = "+[UIAlertController(HUAdditions) alertControllerForAddingDestinationWithType:andProceed:]_block_invoke_2";
    _os_log_impl(&dword_1BE345000, v0, OS_LOG_TYPE_DEFAULT, "(%s) User tapped cancel button from alert", (uint8_t *)&v1, 0xCu);
  }
}

void __89__UIAlertController_HUAdditions__alertControllerForAddingDestinationWithType_andProceed___block_invoke_33(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v2 = HFLogForCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136315138;
    v9 = "+[UIAlertController(HUAdditions) alertControllerForAddingDestinationWithType:andProceed:]_block_invoke";
    _os_log_impl(&dword_1BE345000, v2, OS_LOG_TYPE_DEFAULT, "(%s) User tapped Add button from alert", (uint8_t *)&v8, 0xCu);
  }

  uint64_t v3 = [*(id *)(a1 + 32) textFields];
  v4 = [v3 firstObject];

  v5 = [v4 text];
  v6 = [MEMORY[0x1E4F69758] sanitizeUserEnteredHomeKitName:v5];
  uint64_t v7 = *(void *)(a1 + 40);
  if (v7) {
    (*(void (**)(uint64_t, void *))(v7 + 16))(v7, v6);
  }
}

void __95__UIAlertController_HUAdditions__alertControllerForAddingDestinationWithTypeString_andProceed___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 setAutocapitalizationType:1];
  [v2 setAutocorrectionType:0];
}

void __95__UIAlertController_HUAdditions__alertControllerForAddingDestinationWithTypeString_andProceed___block_invoke_2()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v0 = HFLogForCategory();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    int v1 = 136315138;
    id v2 = "+[UIAlertController(HUAdditions) alertControllerForAddingDestinationWithTypeString:andProceed:]_block_invoke_2";
    _os_log_impl(&dword_1BE345000, v0, OS_LOG_TYPE_DEFAULT, "(%s) User tapped 'Cancel' from alert", (uint8_t *)&v1, 0xCu);
  }
}

void __95__UIAlertController_HUAdditions__alertControllerForAddingDestinationWithTypeString_andProceed___block_invoke_55(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v2 = HFLogForCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315138;
    int v8 = "+[UIAlertController(HUAdditions) alertControllerForAddingDestinationWithTypeString:andProceed:]_block_invoke";
    _os_log_impl(&dword_1BE345000, v2, OS_LOG_TYPE_DEFAULT, "(%s) User tapped 'Add' button from alert", (uint8_t *)&v7, 0xCu);
  }

  uint64_t v3 = [*(id *)(a1 + 32) textFields];
  v4 = [v3 firstObject];

  uint64_t v5 = *(void *)(a1 + 40);
  if (v5)
  {
    v6 = [v4 text];
    (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v6);
  }
}

void __76__UIAlertController_HUAdditions__hu_alertControllerForUnimplementedFeature___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  uint64_t v3 = HFLogForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = [v2 title];
    int v5 = 136315394;
    v6 = "+[UIAlertController(HUAdditions) hu_alertControllerForUnimplementedFeature:]_block_invoke";
    __int16 v7 = 2114;
    int v8 = v4;
    _os_log_impl(&dword_1BE345000, v3, OS_LOG_TYPE_DEFAULT, "(%s) User tapped '%{public}@' from alert", (uint8_t *)&v5, 0x16u);
  }
}

void __88__UIAlertController_HUAdditions__hu_alertControllerForAcknowledgementWithTitle_message___block_invoke()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v0 = HFLogForCategory();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    int v1 = 136315138;
    id v2 = "+[UIAlertController(HUAdditions) hu_alertControllerForAcknowledgementWithTitle:message:]_block_invoke";
    _os_log_impl(&dword_1BE345000, v0, OS_LOG_TYPE_DEFAULT, "(%s) User tapped 'OK' from alert", (uint8_t *)&v1, 0xCu);
  }
}

uint64_t __89__UIAlertController_HUAdditions__hu_alertControllerForAddingPersonWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v2 = HFLogForCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v5 = 136315394;
    v6 = "+[UIAlertController(HUAdditions) hu_alertControllerForAddingPersonWithCompletionHandler:]_block_invoke";
    __int16 v7 = 2114;
    uint64_t v8 = v3;
    _os_log_impl(&dword_1BE345000, v2, OS_LOG_TYPE_DEFAULT, "(%s) User tapped '%{public}@' from alert", (uint8_t *)&v5, 0x16u);
  }

  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, MEMORY[0x1E4F1CC38]);
  }
  return result;
}

uint64_t __89__UIAlertController_HUAdditions__hu_alertControllerForAddingPersonWithCompletionHandler___block_invoke_90(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v2 = HFLogForCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v5 = 136315394;
    v6 = "+[UIAlertController(HUAdditions) hu_alertControllerForAddingPersonWithCompletionHandler:]_block_invoke";
    __int16 v7 = 2114;
    uint64_t v8 = v3;
    _os_log_impl(&dword_1BE345000, v2, OS_LOG_TYPE_DEFAULT, "(%s) User tapped '%{public}@' from alert", (uint8_t *)&v5, 0x16u);
  }

  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, MEMORY[0x1E4F1CC28]);
  }
  return result;
}

@end