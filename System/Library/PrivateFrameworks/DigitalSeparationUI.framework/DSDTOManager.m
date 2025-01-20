@interface DSDTOManager
+ (void)isRatchetActiveWithCompletion:(id)a3;
+ (void)protectUserLocationOnWebDuringDTO;
@end

@implementation DSDTOManager

+ (void)protectUserLocationOnWebDuringDTO
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_235BFC000, log, OS_LOG_TYPE_ERROR, "DTO Location Protection: Does not respondToSelector disableLocationDisplayWithCompletion", v1, 2u);
}

void __49__DSDTOManager_protectUserLocationOnWebDuringDTO__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = DSLog_1;
  if (v2)
  {
    if (os_log_type_enabled((os_log_t)DSLog_1, OS_LOG_TYPE_ERROR)) {
      __49__DSDTOManager_protectUserLocationOnWebDuringDTO__block_invoke_cold_1((uint64_t)v2, v3);
    }
  }
  else if (os_log_type_enabled((os_log_t)DSLog_1, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_235BFC000, v3, OS_LOG_TYPE_INFO, "DTO Location Protection: disableLocationDisplay succeeded", v4, 2u);
  }
}

+ (void)isRatchetActiveWithCompletion:(id)a3
{
  id v3 = a3;
  v4 = [MEMORY[0x263F10488] sharedInstance];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __46__DSDTOManager_isRatchetActiveWithCompletion___block_invoke;
  v6[3] = &unk_264C6ECD8;
  id v7 = v3;
  id v5 = v3;
  [v4 stateWithCompletion:v6];
}

void __46__DSDTOManager_isRatchetActiveWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  id v6 = v3;
  if ([v3 rawValue]) {
    BOOL v5 = [v6 rawValue] != 4;
  }
  else {
    BOOL v5 = 0;
  }
  (*(void (**)(uint64_t, BOOL))(v4 + 16))(v4, v5);
}

void __49__DSDTOManager_protectUserLocationOnWebDuringDTO__block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_235BFC000, a2, OS_LOG_TYPE_ERROR, "DTO Location Protection: disableLocationDisplay failed with error - %@", (uint8_t *)&v2, 0xCu);
}

@end