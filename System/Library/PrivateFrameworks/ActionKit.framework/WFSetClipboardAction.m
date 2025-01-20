@interface WFSetClipboardAction
- (id)contentDestinationWithError:(id *)a3;
- (id)smartPromptWithContentDescription:(id)a3 contentDestination:(id)a4 workflowName:(id)a5;
- (void)finishRunningWithError:(id)a3;
- (void)pasteboardDidChange:(id)a3;
- (void)runAsynchronouslyWithInput:(id)a3;
@end

@implementation WFSetClipboardAction

- (id)smartPromptWithContentDescription:(id)a3 contentDestination:(id)a4 workflowName:(id)a5
{
  id v6 = a3;
  v7 = NSString;
  id v8 = a5;
  if (v6)
  {
    v9 = WFLocalizedString(@"Allow “%1$@” to copy %2$@ to the clipboard?");
    objc_msgSend(v7, "localizedStringWithFormat:", v9, v8, v6);
  }
  else
  {
    v9 = WFLocalizedString(@"Allow “%1$@” to copy to the clipboard?");
    objc_msgSend(v7, "localizedStringWithFormat:", v9, v8, v12);
  v10 = };

  return v10;
}

- (id)contentDestinationWithError:(id *)a3
{
  return (id)objc_msgSend(MEMORY[0x263F337E8], "clipboardLocation", a3);
}

- (void)pasteboardDidChange:(id)a3
{
}

- (void)finishRunningWithError:(id)a3
{
  v4 = (void *)MEMORY[0x263F08A00];
  id v5 = a3;
  id v6 = [v4 defaultCenter];
  v7 = getUIPasteboardChangedNotification();
  [v6 removeObserver:self name:v7 object:0];

  v8.receiver = self;
  v8.super_class = (Class)WFSetClipboardAction;
  [(WFSetClipboardAction *)&v8 finishRunningWithError:v5];
}

- (void)runAsynchronouslyWithInput:(id)a3
{
  id v4 = a3;
  id v5 = objc_opt_new();
  id v6 = [(objc_class *)getUIPasteboardClass() generalPasteboard];
  v7 = [(WFSetClipboardAction *)self parameterValueForKey:@"WFExpirationDate" ofClass:objc_opt_class()];
  if (v7)
  {
    objc_super v8 = getUIPasteboardOptionExpirationDate();
    [v5 setObject:v7 forKey:v8];
  }
  v9 = [(WFSetClipboardAction *)self parameterValueForKey:@"WFLocalOnly" ofClass:objc_opt_class()];
  if (v9)
  {
    v10 = getUIPasteboardOptionLocalOnly();
    [v5 setObject:v9 forKey:v10];
  }
  v11 = [MEMORY[0x263F08A00] defaultCenter];
  uint64_t v12 = getUIPasteboardChangedNotification();
  [v11 addObserver:self selector:sel_pasteboardDidChange_ name:v12 object:v6];

  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __51__WFSetClipboardAction_runAsynchronouslyWithInput___block_invoke;
  v13[3] = &unk_264E5E8E8;
  v13[4] = self;
  [v4 copyToPasteboard:v6 options:v5 completionHandler:v13];
}

uint64_t __51__WFSetClipboardAction_runAsynchronouslyWithInput___block_invoke(uint64_t result, uint64_t a2)
{
  if (!a2) {
    return objc_msgSend(*(id *)(result + 32), "finishRunningWithError:");
  }
  return result;
}

@end