@interface AXColorPickerCell
- (AXColorPickerCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5;
- (BOOL)canReload;
- (BOOL)isAccessibilityElement;
- (id)_colorValue;
- (id)accessibilityValue;
- (id)controlValue;
- (id)newControl;
- (unint64_t)accessibilityTraits;
- (void)prepareForReuse;
- (void)reloadWithSpecifier:(id)a3 animated:(BOOL)a4;
- (void)setValue:(id)a3;
@end

@implementation AXColorPickerCell

- (AXColorPickerCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5
{
  v9.receiver = self;
  v9.super_class = (Class)AXColorPickerCell;
  v5 = [(PSControlTableCell *)&v9 initWithStyle:a3 reuseIdentifier:a4 specifier:a5];
  v6 = v5;
  if (v5)
  {
    v7 = [(PSControlTableCell *)v5 control];
    [(AXColorPickerCell *)v6 setAccessoryView:v7];
  }
  return v6;
}

- (void)prepareForReuse
{
  v4.receiver = self;
  v4.super_class = (Class)AXColorPickerCell;
  [(PSTableCell *)&v4 prepareForReuse];
  v3 = [(PSControlTableCell *)self control];
  [v3 setSelectedColor:0];
}

- (id)newControl
{
  v2 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1630]), "initWithFrame:", 0.0, 0.0, 28.0, 28.0);
  [v2 setUserInteractionEnabled:0];
  return v2;
}

- (BOOL)canReload
{
  return 1;
}

- (void)reloadWithSpecifier:(id)a3 animated:(BOOL)a4
{
  v9.receiver = self;
  v9.super_class = (Class)AXColorPickerCell;
  [(PSTableCell *)&v9 reloadWithSpecifier:a3 animated:a4];
  v5 = [(AXColorPickerCell *)self _colorValue];
  v6 = [*(id *)((char *)&self->super.super.super.super.super.super.isa + (int)*MEMORY[0x1E4F92EF0]) selectedColor];

  if (v5 != v6)
  {
    v7 = [(PSControlTableCell *)self control];
    v8 = [(AXColorPickerCell *)self _colorValue];
    [v7 setSelectedColor:v8];
  }
}

- (id)controlValue
{
  v2 = [(PSControlTableCell *)self control];
  v3 = [v2 selectedColor];

  return v3;
}

- (void)setValue:(id)a3
{
  uint64_t isKindOfClass = (uint64_t)a3;
  uint64_t v6 = isKindOfClass;
  v7 = (id *)((char *)&self->super.super.super.super.super.super.isa + (int)*MEMORY[0x1E4F92F80]);
  if (*v7 != (id)isKindOfClass)
  {
    uint64_t v9 = isKindOfClass;
    objc_opt_class();
    uint64_t isKindOfClass = objc_opt_isKindOfClass();
    uint64_t v6 = v9;
    if (!v9 || (isKindOfClass & 1) != 0)
    {
      objc_storeStrong(v7, a3);
      v8 = [(PSControlTableCell *)self control];
      [v8 setSelectedColor:v9];

      uint64_t v6 = v9;
    }
  }
  MEMORY[0x1F41817F8](isKindOfClass, v6);
}

- (id)_colorValue
{
  uint64_t v2 = (int)*MEMORY[0x1E4F92F80];
  if (*(Class *)((char *)&self->super.super.super.super.super.super.isa + v2)
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v4 = *(id *)((char *)&self->super.super.super.super.super.super.isa + v2);
  }
  else
  {
    id v4 = 0;
  }
  return v4;
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  v3.receiver = self;
  v3.super_class = (Class)AXColorPickerCell;
  return *MEMORY[0x1E4FB2540] | [(AXColorPickerCell *)&v3 accessibilityTraits];
}

- (id)accessibilityValue
{
  uint64_t v2 = [(AXColorPickerCell *)self _colorValue];
  objc_super v3 = v2;
  if (v2) {
    AXColorStringForColor(v2, 0);
  }
  else {
  id v4 = AXUILocalizedStringForKey(@"NOT_SET");
  }

  return v4;
}

@end