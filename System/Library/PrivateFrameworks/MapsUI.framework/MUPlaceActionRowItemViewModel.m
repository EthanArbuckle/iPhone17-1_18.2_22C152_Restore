@interface MUPlaceActionRowItemViewModel
- (BOOL)isEnabled;
- (BOOL)isSelected;
- (MKPlaceCardActionItem)actionRowItem;
- (MUPlaceActionRowItemViewModel)initWithActionRowItem:(id)a3 menuProvider:(id)a4 style:(unint64_t)a5;
- (MUPlaceCardActionsRowViewMenuProvider)menuProvider;
- (id)accessibilityIdentifier;
- (id)analyticsButtonValue;
- (id)buildMenuWithPresentationOptions:(id)a3;
- (id)preferredBackgroundColor;
- (id)preferredTintColor;
- (id)symbolName;
- (id)titleText;
- (void)dealloc;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setMenuProvider:(id)a3;
@end

@implementation MUPlaceActionRowItemViewModel

- (MUPlaceActionRowItemViewModel)initWithActionRowItem:(id)a3 menuProvider:(id)a4 style:(unint64_t)a5
{
  id v9 = a3;
  id v10 = a4;
  v15.receiver = self;
  v15.super_class = (Class)MUPlaceActionRowItemViewModel;
  v11 = [(MUActionRowItemViewModel *)&v15 init];
  v12 = v11;
  if (v11)
  {
    p_actionRowItem = (id *)&v11->_actionRowItem;
    objc_storeStrong((id *)&v11->_actionRowItem, a3);
    objc_storeWeak((id *)&v12->_menuProvider, v10);
    v12->_style = a5;
    [*p_actionRowItem addObserver:v12 forKeyPath:@"enabled" options:1 context:0];
    [*p_actionRowItem addObserver:v12 forKeyPath:@"selected" options:1 context:0];
  }

  return v12;
}

- (void)dealloc
{
  [(MKPlaceCardActionItem *)self->_actionRowItem removeObserver:self forKeyPath:@"enabled"];
  [(MKPlaceCardActionItem *)self->_actionRowItem removeObserver:self forKeyPath:@"selected"];
  v3.receiver = self;
  v3.super_class = (Class)MUPlaceActionRowItemViewModel;
  [(MUPlaceActionRowItemViewModel *)&v3 dealloc];
}

- (id)titleText
{
  v2 = [(MKPlaceCardActionItem *)self->_actionRowItem resolvedActionItem];
  objc_super v3 = [v2 displayString];

  return v3;
}

- (id)symbolName
{
  v2 = [(MKPlaceCardActionItem *)self->_actionRowItem resolvedActionItem];
  objc_super v3 = [v2 glyph];

  return v3;
}

- (BOOL)isEnabled
{
  v2 = [(MKPlaceCardActionItem *)self->_actionRowItem resolvedActionItem];
  char v3 = [v2 enabled];

  return v3;
}

- (BOOL)isSelected
{
  v2 = [(MKPlaceCardActionItem *)self->_actionRowItem resolvedActionItem];
  char v3 = [v2 selected];

  return v3;
}

- (void)setMenuProvider:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_menuProvider);

  v5 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_menuProvider, obj);
    [(MUActionRowItemViewModel *)self _notifyObservers];
    v5 = obj;
  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (([v10 isEqualToString:@"enabled"] & 1) != 0
    || [v10 isEqualToString:@"selected"])
  {
    [(MUActionRowItemViewModel *)self _notifyObservers];
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)MUPlaceActionRowItemViewModel;
    [(MUPlaceActionRowItemViewModel *)&v13 observeValueForKeyPath:v10 ofObject:v11 change:v12 context:a6];
  }
}

- (id)buildMenuWithPresentationOptions:(id)a3
{
  p_menuProvider = &self->_menuProvider;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_menuProvider);
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = objc_loadWeakRetained((id *)p_menuProvider);
    v8 = [v7 menuForActionItem:self->_actionRowItem];
  }
  else
  {
    v8 = 0;
  }
  return v8;
}

- (id)accessibilityIdentifier
{
  v2 = [(MKPlaceCardActionItem *)self->_actionRowItem resolvedActionItem];
  [v2 type];
  char v3 = MKPlaceCardActionTypeAsString();
  v4 = [@"ActionRowItemType" stringByAppendingString:v3];

  return v4;
}

- (id)preferredTintColor
{
  v2 = [(MKPlaceCardActionItem *)self->_actionRowItem resolvedActionItem];
  char v3 = [v2 glyphColor];

  return v3;
}

- (id)preferredBackgroundColor
{
  v2 = [(MKPlaceCardActionItem *)self->_actionRowItem resolvedActionItem];
  char v3 = [v2 backgroundColor];

  return v3;
}

- (id)analyticsButtonValue
{
  v2 = (void *)MEMORY[0x1E4F64950];
  char v3 = [(MUPlaceActionRowItemViewModel *)self actionRowItem];
  v4 = [v3 resolvedActionItem];
  v5 = objc_msgSend(v2, "moduleButtonForType:", MURevealedButtonModuleTypeForActionType(objc_msgSend(v4, "type")));

  return v5;
}

- (MKPlaceCardActionItem)actionRowItem
{
  return self->_actionRowItem;
}

- (MUPlaceCardActionsRowViewMenuProvider)menuProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_menuProvider);
  return (MUPlaceCardActionsRowViewMenuProvider *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_menuProvider);
  objc_storeStrong((id *)&self->_actionRowItem, 0);
}

@end