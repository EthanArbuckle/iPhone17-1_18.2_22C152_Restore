@interface HUWheelControlPopUpButton
+ (Class)valueClass;
- (BOOL)isDisabled;
- (HUControlViewDelegate)delegate;
- (NSArray)values;
- (NSFormatter)valueFormatter;
- (NSString)identifier;
- (id)_createMenu;
- (id)value;
- (void)setDelegate:(id)a3;
- (void)setDisabled:(BOOL)a3;
- (void)setIdentifier:(id)a3;
- (void)setValue:(id)a3;
- (void)setValueFormatter:(id)a3;
- (void)setValues:(id)a3;
@end

@implementation HUWheelControlPopUpButton

- (id)_createMenu
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  objc_initWeak(&location, self);
  v4 = [(HUWheelControlPopUpButton *)self values];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __40__HUWheelControlPopUpButton__createMenu__block_invoke;
  v8[3] = &unk_1E638CF08;
  objc_copyWeak(&v10, &location);
  id v5 = v3;
  id v9 = v5;
  [v4 enumerateObjectsUsingBlock:v8];

  v6 = [MEMORY[0x1E4F42B80] menuWithTitle:&stru_1F18F92B8 children:v5];

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);

  return v6;
}

void __40__HUWheelControlPopUpButton__createMenu__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v7 = (void *)MEMORY[0x1E4F426E8];
  v8 = [WeakRetained valueFormatter];
  id v9 = [v8 stringForObjectValue:v5];
  uint64_t v15 = MEMORY[0x1E4F143A8];
  uint64_t v16 = 3221225472;
  v17 = __40__HUWheelControlPopUpButton__createMenu__block_invoke_2;
  v18 = &unk_1E6388758;
  id v19 = WeakRetained;
  id v20 = v5;
  id v10 = v5;
  v11 = [v7 actionWithTitle:v9 image:0 identifier:0 handler:&v15];

  v12 = objc_msgSend(WeakRetained, "values", v15, v16, v17, v18, v19);
  v13 = [WeakRetained value];
  uint64_t v14 = [v12 indexOfObject:v13];

  [v11 setState:v14 == a3];
  [*(id *)(a1 + 32) addObject:v11];
}

void __40__HUWheelControlPopUpButton__createMenu__block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) setValue:*(void *)(a1 + 40)];
  v2 = [*(id *)(a1 + 32) _createMenu];
  [*(id *)(a1 + 32) setMenu:v2];

  id v3 = [*(id *)(a1 + 32) delegate];
  [v3 controlView:*(void *)(a1 + 32) valueDidChange:*(void *)(a1 + 40)];
}

- (void)setValues:(id)a3
{
  id v6 = a3;
  if (!-[NSArray isEqualToArray:](self->_values, "isEqualToArray:"))
  {
    objc_storeStrong((id *)&self->_values, a3);
    id v5 = [(HUWheelControlPopUpButton *)self _createMenu];
    [(HUWheelControlPopUpButton *)self setMenu:v5];
  }
}

- (void)setValueFormatter:(id)a3
{
  id v6 = a3;
  if ((-[NSFormatter isEqual:](self->_valueFormatter, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_valueFormatter, a3);
    id v5 = [(HUWheelControlPopUpButton *)self _createMenu];
    [(HUWheelControlPopUpButton *)self setMenu:v5];
  }
}

+ (Class)valueClass
{
  return (Class)objc_opt_class();
}

- (void)setValue:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    id v10 = v5;
    char v6 = [self->_value isEqualToNumber:v5];
    id v5 = v10;
    if ((v6 & 1) == 0)
    {
      objc_storeStrong(&self->_value, a3);
      v7 = [(HUWheelControlPopUpButton *)self valueFormatter];
      v8 = [v7 stringForObjectValue:v10];
      [(HUWheelControlPopUpButton *)self setTitle:v8 forState:0];

      id v9 = [(HUWheelControlPopUpButton *)self _createMenu];
      [(HUWheelControlPopUpButton *)self setMenu:v9];

      id v5 = v10;
    }
  }
}

- (BOOL)isDisabled
{
  return [(HUWheelControlPopUpButton *)self isEnabled] ^ 1;
}

- (void)setDisabled:(BOOL)a3
{
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (HUControlViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (HUControlViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (id)value
{
  return self->_value;
}

- (NSArray)values
{
  return self->_values;
}

- (NSFormatter)valueFormatter
{
  return self->_valueFormatter;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_valueFormatter, 0);
  objc_storeStrong((id *)&self->_values, 0);
  objc_storeStrong(&self->_value, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_identifier, 0);
}

@end