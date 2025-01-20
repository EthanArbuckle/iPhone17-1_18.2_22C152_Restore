@interface WFDictateTextAction(UIKit)
- (id)keyCommands;
@end

@implementation WFDictateTextAction(UIKit)

- (id)keyCommands
{
  v12[1] = *MEMORY[0x263EF8340];
  objc_initWeak(&location, val);
  v1 = (void *)MEMORY[0x263F87740];
  v2 = WFLocalizedString(@"Finish Dictation");
  uint64_t v6 = MEMORY[0x263EF8330];
  uint64_t v7 = 3221225472;
  v8 = __41__WFDictateTextAction_UIKit__keyCommands__block_invoke;
  v9 = &unk_2648FFF60;
  objc_copyWeak(&v10, &location);
  v3 = [v1 commandWithTitle:v2 input:@"\r" modifierFlags:0x100000 block:&v6];
  v12[0] = v3;
  v4 = objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:count:", v12, 1, v6, v7, v8, v9);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
  return v4;
}

@end