@interface WKElementAction
@end

@implementation WKElementAction

uint64_t __57___WKElementAction_elementActionWithTitle_actionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __63___WKElementAction__elementActionWithType_title_actionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __74___WKElementAction__elementActionWithType_customTitle_assistant_disabled___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  return [a2 handleElementActionWithType:*(void *)(a1 + 32) element:a3 needsInteraction:1];
}

uint64_t __74___WKElementAction__elementActionWithType_customTitle_assistant_disabled___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  return [a2 handleElementActionWithType:*(void *)(a1 + 32) element:a3 needsInteraction:1];
}

uint64_t __74___WKElementAction__elementActionWithType_customTitle_assistant_disabled___block_invoke_3(uint64_t a1, void *a2, uint64_t a3)
{
  return [a2 handleElementActionWithType:*(void *)(a1 + 32) element:a3 needsInteraction:1];
}

uint64_t __74___WKElementAction__elementActionWithType_customTitle_assistant_disabled___block_invoke_4(uint64_t a1, uint64_t a2, void *a3)
{
  v4 = (void *)[a3 URL];
  v5 = (void *)[a3 title];
  if (!v5 || (uint64_t v6 = (uint64_t)v5, ![v5 length])) {
    uint64_t v6 = [v4 absoluteString];
  }
  v7 = (void *)[(id)getSSReadingListClass() defaultReadingList];

  return [v7 addReadingListItemWithURL:v4 title:v6 previewText:0 error:0];
}

uint64_t __74___WKElementAction__elementActionWithType_customTitle_assistant_disabled___block_invoke_5(uint64_t a1, void *a2, uint64_t a3)
{
  return [a2 handleElementActionWithType:*(void *)(a1 + 32) element:a3 needsInteraction:0];
}

uint64_t __74___WKElementAction__elementActionWithType_customTitle_assistant_disabled___block_invoke_6(uint64_t a1, void *a2, uint64_t a3)
{
  return [a2 handleElementActionWithType:*(void *)(a1 + 32) element:a3 needsInteraction:1];
}

uint64_t __74___WKElementAction__elementActionWithType_customTitle_assistant_disabled___block_invoke_7(uint64_t a1, void *a2, uint64_t a3)
{
  return [a2 handleElementActionWithType:*(void *)(a1 + 32) element:a3 needsInteraction:1];
}

uint64_t __74___WKElementAction__elementActionWithType_customTitle_assistant_disabled___block_invoke_8(uint64_t a1, void *a2, uint64_t a3)
{
  return [a2 handleElementActionWithType:*(void *)(a1 + 32) element:a3 needsInteraction:1];
}

uint64_t __74___WKElementAction__elementActionWithType_customTitle_assistant_disabled___block_invoke_9(uint64_t a1, void *a2, uint64_t a3)
{
  return [a2 handleElementActionWithType:*(void *)(a1 + 32) element:a3 needsInteraction:1];
}

uint64_t __74___WKElementAction__elementActionWithType_customTitle_assistant_disabled___block_invoke_10(uint64_t a1, void *a2, uint64_t a3)
{
  return [a2 handleElementActionWithType:*(void *)(a1 + 32) element:a3 needsInteraction:1];
}

uint64_t __43___WKElementAction_uiActionForElementInfo___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v2 = *(void **)(a1 + 32);
  v3 = qword_1EB357D08;
  if (os_log_type_enabled((os_log_t)qword_1EB357D08, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315138;
    uint64_t v6 = -[__CFString UTF8String](elementActionTypeToUIActionIdentifier([v2 type]), "UTF8String");
    _os_log_impl(&dword_1985F2000, v3, OS_LOG_TYPE_DEFAULT, "Executing action for type: %s", (uint8_t *)&v5, 0xCu);
  }
  return [v2 runActionWithElementInfo:*(void *)(a1 + 40)];
}

@end