@interface HUCheckmarkIconCollectionListCell
- (BOOL)disablesCheckmark;
- (BOOL)hidesCheckmark;
- (HUCheckmarkAccessoryView)checkmarkAccessoryView;
- (UICellAccessory)checkmarkCellAccessory;
- (id)_buildAccessories;
- (void)setDisablesCheckmark:(BOOL)a3;
- (void)setHidesCheckmark:(BOOL)a3;
- (void)updateUIWithAnimation:(BOOL)a3;
@end

@implementation HUCheckmarkIconCollectionListCell

- (UICellAccessory)checkmarkCellAccessory
{
  checkmarkCellAccessory = self->_checkmarkCellAccessory;
  if (!checkmarkCellAccessory)
  {
    self->_hidesCheckmark = 0;
    self->_disablesCheckmark = 0;
    v4 = objc_alloc_init(HUCheckmarkAccessoryView);
    checkmarkAccessoryView = self->_checkmarkAccessoryView;
    self->_checkmarkAccessoryView = v4;

    id v6 = objc_alloc(MEMORY[0x1E4F42828]);
    v7 = [(HUCheckmarkIconCollectionListCell *)self checkmarkAccessoryView];
    v8 = (UICellAccessory *)[v6 initWithCustomView:v7 placement:1];
    v9 = self->_checkmarkCellAccessory;
    self->_checkmarkCellAccessory = v8;

    checkmarkCellAccessory = self->_checkmarkCellAccessory;
  }

  return checkmarkCellAccessory;
}

- (id)_buildAccessories
{
  v8.receiver = self;
  v8.super_class = (Class)HUCheckmarkIconCollectionListCell;
  v3 = [(HUIconCollectionListCell *)&v8 _buildAccessories];
  v4 = (void *)[v3 mutableCopy];

  if (![(HUCheckmarkIconCollectionListCell *)self hidesCheckmark])
  {
    v5 = [(HUCheckmarkIconCollectionListCell *)self checkmarkCellAccessory];
    [v4 addObject:v5];
  }
  id v6 = (void *)[v4 copy];

  return v6;
}

- (void)updateUIWithAnimation:(BOOL)a3
{
  v15.receiver = self;
  v15.super_class = (Class)HUCheckmarkIconCollectionListCell;
  [(HUIconCollectionListCell *)&v15 updateUIWithAnimation:a3];
  if (![(HUCheckmarkIconCollectionListCell *)self hidesCheckmark])
  {
    v4 = [(HUIconCollectionListCell *)self item];
    v5 = [v4 latestResults];
    id v6 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F68A08]];
    int v7 = [v6 BOOLValue];

    objc_super v8 = [(HUIconCollectionListCell *)self item];
    v9 = [v8 latestResults];
    v10 = [v9 objectForKeyedSubscript:*MEMORY[0x1E4F68BC0]];

    if (v10) {
      BOOL v11 = [v10 integerValue] == 2;
    }
    else {
      BOOL v11 = 0;
    }
    v12 = [(HUCheckmarkIconCollectionListCell *)self checkmarkAccessoryView];
    [v12 setChecked:v11];

    if ([(HUCheckmarkIconCollectionListCell *)self disablesCheckmark]) {
      uint64_t v13 = 1;
    }
    else {
      uint64_t v13 = [(HUIconCollectionListCell *)self isDisabled] | v7;
    }
    v14 = [(HUCheckmarkIconCollectionListCell *)self checkmarkAccessoryView];
    [v14 setDisabled:v13];
  }
}

- (BOOL)hidesCheckmark
{
  return self->_hidesCheckmark;
}

- (void)setHidesCheckmark:(BOOL)a3
{
  self->_hidesCheckmark = a3;
}

- (BOOL)disablesCheckmark
{
  return self->_disablesCheckmark;
}

- (void)setDisablesCheckmark:(BOOL)a3
{
  self->_disablesCheckmark = a3;
}

- (HUCheckmarkAccessoryView)checkmarkAccessoryView
{
  return self->_checkmarkAccessoryView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_checkmarkAccessoryView, 0);

  objc_storeStrong((id *)&self->_checkmarkCellAccessory, 0);
}

@end