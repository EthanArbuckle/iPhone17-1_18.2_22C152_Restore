@interface SFNavigationBarURLButton
@end

@implementation SFNavigationBarURLButton

void __60___SFNavigationBarURLButton__updateBackgroundImageAnimated___block_invoke(uint64_t a1)
{
}

void __110___SFNavigationBarURLButton__scribbleInteraction_focusElement_initialFocusSelectionReferencePoint_completion___block_invoke(uint64_t a1)
{
  v2 = WBS_LOG_CHANNEL_PREFIXPencilInput();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __110___SFNavigationBarURLButton__scribbleInteraction_focusElement_initialFocusSelectionReferencePoint_completion___block_invoke_cold_1();
  }
  uint64_t v3 = *(void *)(a1 + 48);
  v4 = [*(id *)(a1 + 32) textFieldForNavigationBarURLButton:*(void *)(a1 + 40)];
  (*(void (**)(uint64_t, void *))(v3 + 16))(v3, v4);
}

void __110___SFNavigationBarURLButton__scribbleInteraction_focusElement_initialFocusSelectionReferencePoint_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_2(&dword_1A690B000, v0, v1, "Calling completionHandler for -_scribbleInteraction:focusElement:initialFocusSelectionReferencePoint:completion:", v2, v3, v4, v5, v6);
}

@end