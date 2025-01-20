@interface CSQuickAction
- (BOOL)allowsInteraction;
- (BOOL)isSelected;
- (BOOL)showsButton;
- (BOOL)supportsSelection;
- (CSQuickActionDelegate)delegate;
- (NSString)accessibilityIdentifier;
- (NSString)accessoryTitleKey;
- (NSString)actionIdentifier;
- (NSString)selectedSymbolName;
- (NSString)statisticsIdentifier;
- (NSString)symbolName;
- (NSString)unavailableSymbolName;
- (UIColor)symbolOnColor;
- (double)symbolScaleValue;
- (id)symbolConfiguration;
- (int64_t)appearance;
- (void)setDelegate:(id)a3;
- (void)setSelected:(BOOL)a3;
@end

@implementation CSQuickAction

- (CSQuickActionDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CSQuickActionDelegate *)WeakRetained;
}

- (NSString)actionIdentifier
{
  return 0;
}

- (NSString)accessibilityIdentifier
{
  return 0;
}

- (NSString)statisticsIdentifier
{
  return 0;
}

- (NSString)accessoryTitleKey
{
  return 0;
}

- (NSString)symbolName
{
  return (NSString *)@"questionmark.app";
}

- (id)symbolConfiguration
{
  return (id)[MEMORY[0x1E4F42A98] configurationWithPointSize:3 weight:2 scale:18.0];
}

- (double)symbolScaleValue
{
  return 0.368;
}

- (UIColor)symbolOnColor
{
  return 0;
}

- (BOOL)supportsSelection
{
  return 0;
}

- (BOOL)isSelected
{
  return 0;
}

- (void)setSelected:(BOOL)a3
{
  id v4 = [(CSQuickAction *)self delegate];
  [v4 isSelectedDidChangeForAction:self];
}

- (NSString)selectedSymbolName
{
  return (NSString *)@"questionmark.app.fill";
}

- (BOOL)showsButton
{
  return 1;
}

- (BOOL)allowsInteraction
{
  return 1;
}

- (NSString)unavailableSymbolName
{
  return (NSString *)@"questionmark.square.dashed";
}

- (int64_t)appearance
{
  return self->_appearance;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end