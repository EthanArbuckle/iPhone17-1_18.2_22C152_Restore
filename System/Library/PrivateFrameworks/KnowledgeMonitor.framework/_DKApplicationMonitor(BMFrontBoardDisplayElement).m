@interface _DKApplicationMonitor(BMFrontBoardDisplayElement)
@end

@implementation _DKApplicationMonitor(BMFrontBoardDisplayElement)

- (void)donateElementsFromDisplayLayout:()BMFrontBoardDisplayElement withContext:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_225002000, log, OS_LOG_TYPE_DEBUG, "BMFrontBoardDisplayElement - Current state END   ------------------------", v1, 2u);
}

- (void)donateElementsFromDisplayLayout:()BMFrontBoardDisplayElement withContext:.cold.2(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_225002000, log, OS_LOG_TYPE_DEBUG, "BMFrontBoardDisplayElement - Current state BEGIN -----------------------", v1, 2u);
}

- (void)donateElementsFromDisplayLayout:()BMFrontBoardDisplayElement withContext:.cold.3(uint8_t *buf, unsigned char *a2, os_log_t log)
{
  *buf = 0;
  *a2 = 0;
  _os_log_debug_impl(&dword_225002000, log, OS_LOG_TYPE_DEBUG, "BMFrontBoardDisplayElement - Skipping modify element update due to it being a duplicate of an existing event", buf, 2u);
}

- (void)_updateCurrentElementsWithDisplayElement:()BMFrontBoardDisplayElement .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_225002000, a2, OS_LOG_TYPE_ERROR, "BMFrontBoardDisplayElement - Updating current elements state received malformed biome display element event, skipping: %@", (uint8_t *)&v2, 0xCu);
}

@end