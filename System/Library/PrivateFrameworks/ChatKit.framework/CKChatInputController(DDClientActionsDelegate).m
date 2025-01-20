@interface CKChatInputController(DDClientActionsDelegate)
@end

@implementation CKChatInputController(DDClientActionsDelegate)

- (void)handleClientActionFromUrl:()DDClientActionsDelegate context:.cold.1()
{
  v0 = [MEMORY[0x1E4F28B00] currentHandler];
  v1 = [NSString stringWithUTF8String:"NSString *getkDataDetectorsReferenceDateKey(void)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"CKChatInputController_TextInputPayloads.m", 34, @"%s", dlerror());

  __break(1u);
}

- (void)handleClientActionFromUrl:()DDClientActionsDelegate context:.cold.2()
{
  v0 = [MEMORY[0x1E4F28B00] currentHandler];
  v1 = [NSString stringWithUTF8String:"NSString *getkDataDetectorsLeadingText(void)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"CKChatInputController_TextInputPayloads.m", 36, @"%s", dlerror());

  __break(1u);
}

- (void)handleClientActionFromUrl:()DDClientActionsDelegate context:.cold.3()
{
  v0 = [MEMORY[0x1E4F28B00] currentHandler];
  v1 = [NSString stringWithUTF8String:"NSString *getkDataDetectorsMiddleText(void)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"CKChatInputController_TextInputPayloads.m", 38, @"%s", dlerror());

  __break(1u);
}

- (void)handleClientActionFromUrl:()DDClientActionsDelegate context:.cold.4()
{
  v0 = [MEMORY[0x1E4F28B00] currentHandler];
  v1 = [NSString stringWithUTF8String:"NSString *getkDataDetectorsTrailingText(void)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"CKChatInputController_TextInputPayloads.m", 40, @"%s", dlerror());

  __break(1u);
}

@end