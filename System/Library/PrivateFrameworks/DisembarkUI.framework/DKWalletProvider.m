@interface DKWalletProvider
- (id)localPaymentCards;
- (void)fetchAppleWalletCards:(id)a3;
@end

@implementation DKWalletProvider

- (id)localPaymentCards
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  v2 = [MEMORY[0x263EFF980] array];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  v3 = objc_msgSend(MEMORY[0x263F14A00], "sharedInstance", 0);
  v4 = [v3 paymentPassesWithLocallyStoredValue];

  uint64_t v5 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v17 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        v10 = objc_alloc_init(DKWalletLocalPaymentCardViewModel);
        v11 = [v9 localizedName];
        [(DKWalletLocalPaymentCardViewModel *)v10 setTitle:v11];

        v12 = [v9 localizedDescription];
        [(DKWalletLocalPaymentCardViewModel *)v10 setSubtitle:v12];

        v13 = [(DKWalletLocalPaymentCardViewModel *)v10 title];
        if (v13)
        {
        }
        else
        {
          v14 = [(DKWalletLocalPaymentCardViewModel *)v10 subtitle];

          if (!v14) {
            goto LABEL_10;
          }
        }
        [v2 addObject:v10];
LABEL_10:
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v6);
  }

  return v2;
}

- (void)fetchAppleWalletCards:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)[objc_alloc(MEMORY[0x263F14A20]) initWithSetupAssistant:0];
  uint64_t v6 = (void *)[objc_alloc(MEMORY[0x263F14A10]) initWithSetupAssistantContext:v5];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __42__DKWalletProvider_fetchAppleWalletCards___block_invoke;
  v8[3] = &unk_264CF0EE0;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  [v6 expressResetCardsWithCompletion:v8];
}

void __42__DKWalletProvider_fetchAppleWalletCards___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (!v3)
  {
    id v4 = _DKLogSystem();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __42__DKWalletProvider_fetchAppleWalletCards___block_invoke_cold_1(v4);
    }
  }
  uint64_t v5 = [*(id *)(a1 + 32) localPaymentCards];
  if (![v5 count])
  {
    uint64_t v6 = _DKLogSystem();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 134217984;
      uint64_t v9 = [v5 count];
      _os_log_impl(&dword_237B3F000, v6, OS_LOG_TYPE_DEFAULT, "Local cards not found, localPaymentCards cout:%lu", (uint8_t *)&v8, 0xCu);
    }
  }
  id v7 = [[DKNotableUserDataWallet alloc] initWithContext:v3 localCards:v5];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __42__DKWalletProvider_fetchAppleWalletCards___block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_237B3F000, log, OS_LOG_TYPE_ERROR, "PKPaymentSetupAssistantResetController failed to provide provisioning context", v1, 2u);
}

@end