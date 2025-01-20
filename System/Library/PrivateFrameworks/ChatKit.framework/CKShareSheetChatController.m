@interface CKShareSheetChatController
- (BOOL)alreadySetUp;
- (BOOL)shouldDismissAfterSend;
- (void)_beginInteractionSignPost;
- (void)_endInteractionSignPost;
- (void)insertInitialCompositionIfNeeded;
- (void)keyboardDidChangeFrame:(id)a3;
- (void)sendComposition:(id)a3;
- (void)setAlreadySetUp:(BOOL)a3;
- (void)viewDidAppear:(BOOL)a3;
@end

@implementation CKShareSheetChatController

- (void)keyboardDidChangeFrame:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CKShareSheetChatController;
  [(CKChatController *)&v4 keyboardDidChangeFrame:a3];
  [(CKChatController *)self _updateEntryViewFrameIfNeeded:0];
}

- (void)_beginInteractionSignPost
{
  if (!self->_interactionSignPost)
  {
    _chatControllerTelemetryLogHandle();
    v3 = (id)objc_claimAutoreleasedReturnValue();
    os_signpost_id_t v4 = os_signpost_id_make_with_pointer(v3, self);
    if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      os_signpost_id_t v5 = v4;
      if (os_signpost_enabled(v3))
      {
        *(_WORD *)v6 = 0;
        _os_signpost_emit_with_name_impl(&dword_18EF18000, v3, OS_SIGNPOST_INTERVAL_BEGIN, v5, "ShareSheetInteraction", " enableTelemetry=YES ", v6, 2u);
      }
    }

    self->_interactionSignPost = 1;
  }
}

- (void)_endInteractionSignPost
{
  if (self->_interactionSignPost == 1)
  {
    _chatControllerTelemetryLogHandle();
    v3 = (id)objc_claimAutoreleasedReturnValue();
    os_signpost_id_t v4 = os_signpost_id_make_with_pointer(v3, self);
    if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      os_signpost_id_t v5 = v4;
      if (os_signpost_enabled(v3))
      {
        *(_WORD *)v6 = 0;
        _os_signpost_emit_with_name_impl(&dword_18EF18000, v3, OS_SIGNPOST_INTERVAL_END, v5, "ShareSheetInteraction", " enableTelemetry=YES ", v6, 2u);
      }
    }

    self->_interactionSignPost = 2;
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  [(CKShareSheetChatController *)self _beginInteractionSignPost];
  v6.receiver = self;
  v6.super_class = (Class)CKShareSheetChatController;
  [(CKChatController *)&v6 viewDidAppear:v3];
  os_signpost_id_t v5 = [(CKChatController *)self entryView];
  [v5 setDisablePluginButtons:1];
}

- (void)insertInitialCompositionIfNeeded
{
  BOOL v3 = [(CKChatController *)self initialComposition];
  if (v3)
  {
    [(CKChatController *)self setInitialComposition:0];
    [(CKChatController *)self setComposition:v3];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __62__CKShareSheetChatController_insertInitialCompositionIfNeeded__block_invoke;
    v8[3] = &unk_1E5620C40;
    v8[4] = self;
    [MEMORY[0x1E4F42FF0] performWithoutAnimation:v8];
    os_signpost_id_t v4 = [(CKChatController *)self entryView];

    if (v4)
    {
      os_signpost_id_t v5 = [(CKCoreChatController *)self delegate];
      char v6 = objc_opt_respondsToSelector();

      if (v6)
      {
        v7 = [(CKCoreChatController *)self delegate];
        [v7 composeChatController:self didLoadEntryViewContentWithCompletion:&__block_literal_global_20];
      }
    }
  }
}

void __62__CKShareSheetChatController_insertInitialCompositionIfNeeded__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) entryView];
  [v2 setNeedsLayout];

  id v3 = [*(id *)(a1 + 32) entryView];
  [v3 layoutIfNeeded];
}

- (void)sendComposition:(id)a3
{
  id v4 = a3;
  os_signpost_id_t v5 = [(CKCoreChatController *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    v7 = [(CKCoreChatController *)self delegate];
    v8 = [(CKCoreChatController *)self conversation];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __46__CKShareSheetChatController_sendComposition___block_invoke;
    v10[3] = &unk_1E5621EA8;
    v10[4] = self;
    id v11 = v4;
    [v7 composeChatController:self shouldSendComposition:v11 inConversation:v8 completion:v10];
  }
  else
  {
    [(CKShareSheetChatController *)self _endInteractionSignPost];
    v9.receiver = self;
    v9.super_class = (Class)CKShareSheetChatController;
    [(CKComposeChatController *)&v9 sendComposition:v4];
  }
}

id *__46__CKShareSheetChatController_sendComposition___block_invoke(id *result, int a2)
{
  if (a2)
  {
    v2 = result;
    [result[4] _endInteractionSignPost];
    id v3 = v2[5];
    v4.receiver = v2[4];
    v4.super_class = (Class)CKShareSheetChatController;
    return (id *)objc_msgSendSuper2(&v4, sel_sendComposition_, v3);
  }
  return result;
}

- (BOOL)shouldDismissAfterSend
{
  return 1;
}

- (BOOL)alreadySetUp
{
  return self->_alreadySetUp;
}

- (void)setAlreadySetUp:(BOOL)a3
{
  self->_alreadySetUp = a3;
}

@end