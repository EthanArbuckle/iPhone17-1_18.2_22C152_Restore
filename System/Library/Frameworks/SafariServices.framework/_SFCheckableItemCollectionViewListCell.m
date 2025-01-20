@interface _SFCheckableItemCollectionViewListCell
+ (NSString)reuseIdentifier;
- (BOOL)isChecked;
- (NSString)text;
- (void)setChecked:(BOOL)a3;
- (void)setText:(id)a3;
- (void)updateConfigurationUsingState:(id)a3;
@end

@implementation _SFCheckableItemCollectionViewListCell

+ (NSString)reuseIdentifier
{
  return (NSString *)@"_SFCheckableItemCollectionViewListCellReuseIdentifier";
}

- (void)updateConfigurationUsingState:(id)a3
{
  id v4 = a3;
  [(_SFCheckableItemCollectionViewListCell *)self setAutomaticallyUpdatesBackgroundConfiguration:0];
  id v7 = (id)[v4 copy];

  [v7 setHighlighted:0];
  [v7 setSelected:0];
  v5 = [MEMORY[0x1E4FB1498] listGroupedCellConfiguration];
  v6 = [v5 updatedConfigurationForState:v7];

  [(_SFCheckableItemCollectionViewListCell *)self setBackgroundConfiguration:v6];
}

- (void)setText:(id)a3
{
  v12[1] = *MEMORY[0x1E4F143B8];
  id v4 = (NSString *)[a3 copy];
  text = self->_text;
  self->_text = v4;

  v6 = [(_SFCheckableItemCollectionViewListCell *)self defaultContentConfiguration];
  [v6 setText:self->_text];
  [(_SFCheckableItemCollectionViewListCell *)self setContentConfiguration:v6];
  id v7 = objc_alloc_init(MEMORY[0x1E4FB1EB0]);
  [(_SFCheckableItemCollectionViewListCell *)self setSelectedBackgroundView:v7];

  v8 = (UICellAccessory *)objc_alloc_init(MEMORY[0x1E4FB14F8]);
  cellAccessoryCheckmark = self->_cellAccessoryCheckmark;
  self->_cellAccessoryCheckmark = v8;

  [(UICellAccessory *)self->_cellAccessoryCheckmark setDisplayedState:0];
  [(UICellAccessory *)self->_cellAccessoryCheckmark setHidden:1];
  v10 = [MEMORY[0x1E4FB1618] systemBlueColor];
  [(UICellAccessory *)self->_cellAccessoryCheckmark setTintColor:v10];

  v12[0] = self->_cellAccessoryCheckmark;
  v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1];
  [(_SFCheckableItemCollectionViewListCell *)self setAccessories:v11];
}

- (BOOL)isChecked
{
  return ![(UICellAccessory *)self->_cellAccessoryCheckmark isHidden];
}

- (void)setChecked:(BOOL)a3
{
  BOOL v3 = a3;
  v6[1] = *MEMORY[0x1E4F143B8];
  if ([(UICellAccessory *)self->_cellAccessoryCheckmark isHidden] == a3)
  {
    [(UICellAccessory *)self->_cellAccessoryCheckmark setHidden:!v3];
    v6[0] = self->_cellAccessoryCheckmark;
    v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:1];
    [(_SFCheckableItemCollectionViewListCell *)self setAccessories:v5];
  }
}

- (NSString)text
{
  return self->_text;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_text, 0);

  objc_storeStrong((id *)&self->_cellAccessoryCheckmark, 0);
}

@end