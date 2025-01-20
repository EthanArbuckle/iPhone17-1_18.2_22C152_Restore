@interface HUQuickControlWheelPickerViewItem
- (BOOL)isEqual:(id)a3;
- (BOOL)isSelected;
- (HUQuickControlWheelPickerViewItem)initWithHFMultiStateControlItemValue:(id)a3 text:(id)a4 isSelected:(BOOL)a5;
- (HUQuickControlWheelPickerViewItem)initWithHFTVInputControlItemValue:(id)a3;
- (NSString)text;
- (id)value;
@end

@implementation HUQuickControlWheelPickerViewItem

- (HUQuickControlWheelPickerViewItem)initWithHFTVInputControlItemValue:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)HUQuickControlWheelPickerViewItem;
  v5 = [(HUQuickControlWheelPickerViewItem *)&v12 init];
  if (v5)
  {
    objc_opt_class();
    id v6 = v4;
    if (objc_opt_isKindOfClass()) {
      v7 = v6;
    }
    else {
      v7 = 0;
    }
    id v8 = v7;

    if (v8)
    {
      objc_storeStrong(&v5->_value, v7);
      uint64_t v9 = [v8 name];
      text = v5->_text;
      v5->_text = (NSString *)v9;

      v5->_isSelected = [v8 isSelected];
    }
  }
  return v5;
}

- (HUQuickControlWheelPickerViewItem)initWithHFMultiStateControlItemValue:(id)a3 text:(id)a4 isSelected:(BOOL)a5
{
  id v9 = a3;
  id v10 = a4;
  v16.receiver = self;
  v16.super_class = (Class)HUQuickControlWheelPickerViewItem;
  v11 = [(HUQuickControlWheelPickerViewItem *)&v16 init];
  if (v11)
  {
    objc_opt_class();
    id v12 = v9;
    if (objc_opt_isKindOfClass()) {
      v13 = v12;
    }
    else {
      v13 = 0;
    }
    id v14 = v13;

    if (v14)
    {
      objc_storeStrong(&v11->_value, a3);
      objc_storeStrong((id *)&v11->_text, a4);
      v11->_isSelected = a5;
    }
  }
  return v11;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    v13.receiver = self;
    v13.super_class = (Class)HUQuickControlWheelPickerViewItem;
    if ([(HUQuickControlWheelPickerViewItem *)&v13 isEqual:v5])
    {
      id v6 = [(HUQuickControlWheelPickerViewItem *)self value];
      v7 = [v5 value];
      if ([v6 isEqual:v7])
      {
        id v8 = [(HUQuickControlWheelPickerViewItem *)self text];
        id v9 = [v5 text];
        if ([v8 isEqualToString:v9])
        {
          BOOL v10 = [(HUQuickControlWheelPickerViewItem *)self isSelected];
          int v11 = v10 ^ [v5 isSelected] ^ 1;
        }
        else
        {
          LOBYTE(v11) = 0;
        }
      }
      else
      {
        LOBYTE(v11) = 0;
      }
    }
    else
    {
      LOBYTE(v11) = 0;
    }
  }
  else
  {
    LOBYTE(v11) = 0;
  }

  return v11;
}

- (id)value
{
  return self->_value;
}

- (NSString)text
{
  return self->_text;
}

- (BOOL)isSelected
{
  return self->_isSelected;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_text, 0);

  objc_storeStrong(&self->_value, 0);
}

@end