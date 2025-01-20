@interface AXBuddySettingsSwitchItem
- (AXBuddySettingsSwitchItem)initWithName:(id)a3 delegate:(id)a4;
- (Class)cellClass;
- (id)representativeCellForIndexPath:(id)a3 inTableView:(id)a4;
- (id)reuseIdentifier;
- (void)buddyBundleSwitchCell:(id)a3 switchChangedTo:(BOOL)a4;
- (void)registerCellClassWithTableView:(id)a3;
- (void)setExtantSwitchesOn:(BOOL)a3;
@end

@implementation AXBuddySettingsSwitchItem

- (AXBuddySettingsSwitchItem)initWithName:(id)a3 delegate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)AXBuddySettingsSwitchItem;
  v8 = [(AXBuddySettingsSwitchItem *)&v14 init];
  if (v8)
  {
    v9 = (NSString *)[v6 copy];
    name = v8->_name;
    v8->_name = v9;

    uint64_t v11 = +[NSHashTable weakObjectsHashTable];
    extantCells = v8->_extantCells;
    v8->_extantCells = (NSHashTable *)v11;

    objc_storeWeak((id *)&v8->_delegate, v7);
  }

  return v8;
}

- (id)reuseIdentifier
{
  return @"SwitchCellReuseIdentifier";
}

- (Class)cellClass
{
  return (Class)objc_opt_class();
}

- (id)representativeCellForIndexPath:(id)a3 inTableView:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [(AXBuddySettingsSwitchItem *)self reuseIdentifier];
  v9 = [v6 dequeueReusableCellWithIdentifier:v8 forIndexPath:v7];

  name = self->_name;
  uint64_t v11 = [v9 textLabel];
  [v11 setText:name];

  [v9 setDelegate:self];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(v9, "setSwitchValue:", objc_msgSend(WeakRetained, "currentSwitchValueForItem:", self));

  [(NSHashTable *)self->_extantCells addObject:v9];

  return v9;
}

- (void)registerCellClassWithTableView:(id)a3
{
  id v4 = a3;
  v5 = [(AXBuddySettingsSwitchItem *)self cellClass];
  id v6 = [(AXBuddySettingsSwitchItem *)self reuseIdentifier];
  [v4 registerClass:v5 forCellReuseIdentifier:v6];
}

- (void)buddyBundleSwitchCell:(id)a3 switchChangedTo:(BOOL)a4
{
  BOOL v4 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained switchItem:self switchChangedTo:v4];
}

- (void)setExtantSwitchesOn:(BOOL)a3
{
  BOOL v3 = a3;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  BOOL v4 = self->_extantCells;
  id v5 = [(NSHashTable *)v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * (void)v8), "setSwitchValue:", v3, (void)v9);
        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [(NSHashTable *)v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extantCells, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_name, 0);
}

@end