@interface CNUIInteractionDonor
+ (OS_os_log)log;
- (void)donateInteraction:(id)a3;
@end

@implementation CNUIInteractionDonor

+ (OS_os_log)log
{
  if (log_cn_once_token_1_3 != -1) {
    dispatch_once(&log_cn_once_token_1_3, &__block_literal_global_46);
  }
  v2 = (void *)log_cn_once_object_1_3;
  return (OS_os_log *)v2;
}

uint64_t __27__CNUIInteractionDonor_log__block_invoke()
{
  log_cn_once_object_1_3 = (uint64_t)os_log_create("contactsui", "activity");
  return MEMORY[0x270F9A758]();
}

- (void)donateInteraction:(id)a3
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __42__CNUIInteractionDonor_donateInteraction___block_invoke;
  v3[3] = &unk_264017210;
  v3[4] = self;
  [a3 donateInteractionWithCompletion:v3];
}

void __42__CNUIInteractionDonor_donateInteraction___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (v2)
  {
    v3 = [(id)objc_opt_class() log];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __42__CNUIInteractionDonor_donateInteraction___block_invoke_cold_1((uint64_t)v2, v3);
    }
  }
}

void __42__CNUIInteractionDonor_donateInteraction___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_20B704000, a2, OS_LOG_TYPE_ERROR, "error donating interaction: %@", (uint8_t *)&v2, 0xCu);
}

@end