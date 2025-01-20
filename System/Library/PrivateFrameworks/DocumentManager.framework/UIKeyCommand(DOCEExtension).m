@interface UIKeyCommand(DOCEExtension)
- (BOOL)doc_isCancellingKeyCommand;
- (BOOL)doc_isDismissingKeyCommand;
- (BOOL)doc_isShortcutEqualToKeyCommand:()DOCEExtension;
- (id)_doc_erasedKeyCommandWithWrappedAction:()DOCEExtension;
@end

@implementation UIKeyCommand(DOCEExtension)

- (id)_doc_erasedKeyCommandWithWrappedAction:()DOCEExtension
{
  v16[1] = *MEMORY[0x263EF8340];
  v15 = @"com.apple.DocumentManager.keyCommands.originalKeyCommandAction";
  v5 = NSStringFromSelector((SEL)[a1 action]);
  v16[0] = v5;
  v6 = [NSDictionary dictionaryWithObjects:v16 forKeys:&v15 count:1];

  v7 = (void *)MEMORY[0x263F82890];
  v8 = [a1 discoverabilityTitle];
  v9 = [a1 input];
  uint64_t v10 = [a1 modifierFlags];
  v11 = [a1 alternates];
  v12 = [v7 commandWithTitle:v8 image:0 action:a3 input:v9 modifierFlags:v10 propertyList:v6 alternates:v11];

  v13 = [a1 discoverabilityTitle];
  [v12 setDiscoverabilityTitle:v13];

  objc_msgSend(v12, "setAttributes:", objc_msgSend(a1, "attributes"));
  return v12;
}

- (BOOL)doc_isCancellingKeyCommand
{
  v2 = +[DOCKeyCommandController cancellingKeyCommandsWithAction:sel_description];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __57__UIKeyCommand_DOCEExtension__doc_isCancellingKeyCommand__block_invoke;
  v7[3] = &unk_2641B21C8;
  v7[4] = a1;
  v3 = [MEMORY[0x263F08A98] predicateWithBlock:v7];
  v4 = [v2 filteredArrayUsingPredicate:v3];

  BOOL v5 = [v4 count] != 0;
  return v5;
}

- (BOOL)doc_isDismissingKeyCommand
{
  v2 = +[DOCKeyCommandController dismissingKeyCommandsWithAction:sel_description];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __57__UIKeyCommand_DOCEExtension__doc_isDismissingKeyCommand__block_invoke;
  v7[3] = &unk_2641B21C8;
  v7[4] = a1;
  v3 = [MEMORY[0x263F08A98] predicateWithBlock:v7];
  v4 = [v2 filteredArrayUsingPredicate:v3];

  BOOL v5 = [v4 count] != 0;
  return v5;
}

- (BOOL)doc_isShortcutEqualToKeyCommand:()DOCEExtension
{
  id v4 = a3;
  BOOL v5 = [a1 input];
  v6 = [v4 input];
  if ([v5 isEqualToString:v6])
  {
    uint64_t v7 = [a1 modifierFlags];
    BOOL v8 = v7 == [v4 modifierFlags];
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

@end