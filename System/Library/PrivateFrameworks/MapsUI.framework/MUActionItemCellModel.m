@interface MUActionItemCellModel
- (BOOL)isEnabled;
- (MUActionItemCellModel)initWithActionItem:(id)a3;
- (MUDynamicButtonCellModelChangeDelegate)changeDelegate;
- (NSString)symbolName;
- (NSString)titleString;
- (UIMenu)menu;
- (id)_resolvedActionItem;
- (id)accessibilityIdentifierForAction;
- (id)actionBlock;
- (int64_t)actionStyle;
- (void)_registerObserver;
- (void)dealloc;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setActionBlock:(id)a3;
- (void)setChangeDelegate:(id)a3;
- (void)setMenu:(id)a3;
@end

@implementation MUActionItemCellModel

- (MUActionItemCellModel)initWithActionItem:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MUActionItemCellModel;
  v6 = [(MUActionItemCellModel *)&v9 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_actionItem, a3);
    [(MUActionItemCellModel *)v7 _registerObserver];
  }

  return v7;
}

- (NSString)symbolName
{
  v2 = [(MUActionItemCellModel *)self _resolvedActionItem];
  v3 = [v2 symbolForDisplayStyle:0];

  return (NSString *)v3;
}

- (NSString)titleString
{
  v2 = [(MUActionItemCellModel *)self _resolvedActionItem];
  v3 = [v2 titleForDisplayStyle:0];

  return (NSString *)v3;
}

- (id)accessibilityIdentifierForAction
{
  v2 = [(MKPlaceCardActionItem *)self->_actionItem resolvedActionItem];
  [v2 type];
  v3 = MKPlaceCardActionTypeAsString();

  return v3;
}

- (BOOL)isEnabled
{
  v2 = [(MUActionItemCellModel *)self _resolvedActionItem];
  char v3 = [v2 enabled];

  return v3;
}

- (int64_t)actionStyle
{
  v2 = [(MUActionItemCellModel *)self _resolvedActionItem];
  unsigned int v3 = [v2 isDestructiveForDisplayStyle:0];

  return v3;
}

- (void)_registerObserver
{
  [(MKPlaceCardActionItem *)self->_actionItem addObserver:self forKeyPath:@"enabled" options:1 context:0];
  actionItem = self->_actionItem;
  [(MKPlaceCardActionItem *)actionItem addObserver:self forKeyPath:@"selected" options:1 context:0];
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (([v10 isEqualToString:@"enabled"] & 1) != 0
    || [v10 isEqualToString:@"selected"])
  {
    v13 = [(MUActionItemCellModel *)self changeDelegate];
    [v13 dynamicButtonCellModelDidChange:self];
  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)MUActionItemCellModel;
    [(MUActionItemCellModel *)&v14 observeValueForKeyPath:v10 ofObject:v11 change:v12 context:a6];
  }
}

- (id)_resolvedActionItem
{
  return (id)[(MKPlaceCardActionItem *)self->_actionItem resolvedActionItem];
}

- (void)dealloc
{
  [(MKPlaceCardActionItem *)self->_actionItem removeObserver:self forKeyPath:@"enabled"];
  [(MKPlaceCardActionItem *)self->_actionItem removeObserver:self forKeyPath:@"selected"];
  v3.receiver = self;
  v3.super_class = (Class)MUActionItemCellModel;
  [(MUActionItemCellModel *)&v3 dealloc];
}

- (id)actionBlock
{
  return self->_actionBlock;
}

- (void)setActionBlock:(id)a3
{
}

- (MUDynamicButtonCellModelChangeDelegate)changeDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_changeDelegate);
  return (MUDynamicButtonCellModelChangeDelegate *)WeakRetained;
}

- (void)setChangeDelegate:(id)a3
{
}

- (UIMenu)menu
{
  return self->_menu;
}

- (void)setMenu:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_menu, 0);
  objc_destroyWeak((id *)&self->_changeDelegate);
  objc_storeStrong(&self->_actionBlock, 0);
  objc_storeStrong((id *)&self->_actionItem, 0);
}

@end