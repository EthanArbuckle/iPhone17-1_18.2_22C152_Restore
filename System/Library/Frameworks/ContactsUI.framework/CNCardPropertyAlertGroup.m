@interface CNCardPropertyAlertGroup
- (CNLabeledValue)labeledValue;
- (id)_loadPropertyItems;
- (void)setLabeledValue:(id)a3;
@end

@implementation CNCardPropertyAlertGroup

- (void).cxx_destruct
{
}

- (void)setLabeledValue:(id)a3
{
}

- (CNLabeledValue)labeledValue
{
  return self->_labeledValue;
}

- (id)_loadPropertyItems
{
  v12[1] = *MEMORY[0x1E4F143B8];
  v3 = [(CNCardGroup *)self contact];
  v4 = [(CNCardPropertyGroup *)self property];
  v5 = [v3 valueForKey:v4];

  if (v5)
  {
    v6 = [MEMORY[0x1E4F1BA20] labeledValueWithLabel:0 value:v5];
    [(CNCardPropertyAlertGroup *)self setLabeledValue:v6];
  }
  v7 = [(CNCardPropertyAlertGroup *)self labeledValue];
  v8 = [(CNCardGroup *)self contact];
  v9 = +[CNPropertyGroupItem propertyGroupItemWithLabeledValue:v7 group:self contact:v8];
  v12[0] = v9;
  v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1];

  return v10;
}

@end