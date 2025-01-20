@interface VPNSetupTableCell
- (void)textFieldDidBeginEditing:(id)a3;
- (void)textFieldDidEndEditing:(id)a3;
- (void)textValueChanged:(id)a3;
@end

@implementation VPNSetupTableCell

- (void)textValueChanged:(id)a3
{
  if (objc_opt_respondsToSelector())
  {
    [(VPNSetupTableCell *)self performSelector:sel_controlChanged_ withObject:self];
  }
}

- (void)textFieldDidBeginEditing:(id)a3
{
  objc_msgSend(MEMORY[0x263F08A00], "defaultCenter", a3);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [v4 addObserver:self selector:sel_textValueChanged_ name:*MEMORY[0x263F1D778] object:0];
}

- (void)textFieldDidEndEditing:(id)a3
{
  objc_msgSend(MEMORY[0x263F08A00], "defaultCenter", a3);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [v4 removeObserver:self name:*MEMORY[0x263F1D778] object:0];
}

@end