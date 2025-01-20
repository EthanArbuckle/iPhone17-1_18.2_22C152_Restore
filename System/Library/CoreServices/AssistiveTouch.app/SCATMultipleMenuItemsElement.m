@interface SCATMultipleMenuItemsElement
- (BOOL)scatIndicatesOwnFocus;
- (BOOL)scatPerformAction:(int)a3;
- (NSArray)menuItems;
- (NSString)identifier;
- (SCATMultipleMenuItemsElementDelegate)delegate;
- (id)description;
- (void)scatDidBecomeFocused:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setMenuItems:(id)a3;
@end

@implementation SCATMultipleMenuItemsElement

- (BOOL)scatIndicatesOwnFocus
{
  return 1;
}

- (void)scatDidBecomeFocused:(BOOL)a3
{
  BOOL v3 = a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v5 = [(SCATMultipleMenuItemsElement *)self menuItems];
  id v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v13;
    if (v3) {
      uint64_t v9 = 2;
    }
    else {
      uint64_t v9 = 0;
    }
    do
    {
      v10 = 0;
      do
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v12 + 1) + 8 * (void)v10) setStyle:v9];
        v10 = (char *)v10 + 1;
      }
      while (v7 != v10);
      id v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  v11 = [(SCATMultipleMenuItemsElement *)self delegate];
  [v11 multipleMenuItemsElement:self didBecomeHighlighted:v3];
}

- (BOOL)scatPerformAction:(int)a3
{
  if (a3 == 2010)
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    v4 = [(SCATMultipleMenuItemsElement *)self menuItems];
    id v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v5)
    {
      id v6 = v5;
      uint64_t v7 = *(void *)v13;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v13 != v7) {
            objc_enumerationMutation(v4);
          }
          [*(id *)(*((void *)&v12 + 1) + 8 * (void)v8) flash];
          uint64_t v8 = (char *)v8 + 1;
        }
        while (v6 != v8);
        id v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v6);
    }

    uint64_t v9 = [(SCATMultipleMenuItemsElement *)self delegate];
    [v9 didActivateMultipleMenuItemsElement:self];

    return 1;
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)SCATMultipleMenuItemsElement;
    return -[SCATSimpleElement scatPerformAction:](&v11, "scatPerformAction:");
  }
}

- (id)description
{
  v9.receiver = self;
  v9.super_class = (Class)SCATMultipleMenuItemsElement;
  BOOL v3 = [(SCATMultipleMenuItemsElement *)&v9 description];
  v4 = [(SCATMultipleMenuItemsElement *)self menuItems];
  id v5 = [(SCATMultipleMenuItemsElement *)self identifier];
  id v6 = [(SCATMultipleMenuItemsElement *)self delegate];
  uint64_t v7 = [v3 stringByAppendingFormat:@" - menu items %@, identifier %@, delegate %@", v4, v5, v6];

  return v7;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (NSArray)menuItems
{
  return self->_menuItems;
}

- (void)setMenuItems:(id)a3
{
}

- (SCATMultipleMenuItemsElementDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (SCATMultipleMenuItemsElementDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_menuItems, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

@end