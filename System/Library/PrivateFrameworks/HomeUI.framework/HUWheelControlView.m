@interface HUWheelControlView
+ (Class)valueClass;
- (BOOL)canBeHighlighted;
- (BOOL)isDisabled;
- (HUControlViewDelegate)delegate;
- (HUWheelControlView)initWithFrame:(CGRect)a3;
- (HUWheelControlViewDelegate)wheelDelegate;
- (NSArray)values;
- (NSArray)wheelValues;
- (NSFormatter)valueFormatter;
- (NSSet)customValues;
- (NSString)identifier;
- (UIPickerView)pickerView;
- (id)_formatValue:(id)a3;
- (id)pickerView:(id)a3 titleForRow:(int64_t)a4 forComponent:(int64_t)a5;
- (id)value;
- (int64_t)numberOfComponentsInPickerView:(id)a3;
- (int64_t)pickerView:(id)a3 numberOfRowsInComponent:(int64_t)a4;
- (void)_generateWheelValues;
- (void)_setupConstraints;
- (void)_updateUIToReachable;
- (void)pickerView:(id)a3 didSelectRow:(int64_t)a4 inComponent:(int64_t)a5;
- (void)setCanBeHighlighted:(BOOL)a3;
- (void)setCustomValues:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDisabled:(BOOL)a3;
- (void)setIdentifier:(id)a3;
- (void)setPickerView:(id)a3;
- (void)setValue:(id)a3;
- (void)setValueFormatter:(id)a3;
- (void)setValues:(id)a3;
- (void)setWheelDelegate:(id)a3;
- (void)setWheelValues:(id)a3;
@end

@implementation HUWheelControlView

- (HUWheelControlView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v14.receiver = self;
  v14.super_class = (Class)HUWheelControlView;
  v7 = -[HUWheelControlView initWithFrame:](&v14, sel_initWithFrame_);
  if (v7)
  {
    v8 = objc_msgSend(objc_alloc(MEMORY[0x1E4F42C78]), "initWithFrame:", x, y, width, height);
    [(HUWheelControlView *)v7 setPickerView:v8];

    v9 = [(HUWheelControlView *)v7 pickerView];
    [v9 setTranslatesAutoresizingMaskIntoConstraints:0];

    v10 = [(HUWheelControlView *)v7 pickerView];
    [v10 setDelegate:v7];

    v11 = [(HUWheelControlView *)v7 pickerView];
    [v11 setDataSource:v7];

    [(HUWheelControlView *)v7 addSubview:v7->_pickerView];
    -[HUWheelControlView setLayoutMargins:](v7, "setLayoutMargins:", 4.0, 4.0, 4.0, 4.0);
    [(HUWheelControlView *)v7 _setupConstraints];
    v12 = [(HUWheelControlView *)v7 pickerView];
    [v12 setUserInteractionEnabled:0];
  }
  return v7;
}

- (void)setValueFormatter:(id)a3
{
  id v6 = a3;
  if ((-[NSFormatter isEqual:](self->_valueFormatter, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_valueFormatter, a3);
    v5 = [(HUWheelControlView *)self pickerView];
    [v5 reloadComponent:0];
  }
}

- (void)setValues:(id)a3
{
  id v5 = a3;
  if (!-[NSArray isEqualToArray:](self->_values, "isEqualToArray:"))
  {
    objc_storeStrong((id *)&self->_values, a3);
    [(HUWheelControlView *)self _generateWheelValues];
  }
}

- (int64_t)numberOfComponentsInPickerView:(id)a3
{
  return 1;
}

- (int64_t)pickerView:(id)a3 numberOfRowsInComponent:(int64_t)a4
{
  v4 = [(HUWheelControlView *)self wheelValues];
  int64_t v5 = [v4 count];

  return v5;
}

- (id)pickerView:(id)a3 titleForRow:(int64_t)a4 forComponent:(int64_t)a5
{
  v7 = [(HUWheelControlView *)self wheelValues];
  v8 = [v7 objectAtIndex:a4];

  v9 = [(HUWheelControlView *)self _formatValue:v8];

  return v9;
}

- (void)pickerView:(id)a3 didSelectRow:(int64_t)a4 inComponent:(int64_t)a5
{
  id v6 = [(HUWheelControlView *)self delegate];
  [v6 controlViewDidBeginUserInteraction:self];

  v7 = [(HUWheelControlView *)self delegate];
  v8 = [(HUWheelControlView *)self value];
  [v7 controlView:self valueDidChange:v8];

  v9 = [(HUWheelControlView *)self wheelDelegate];
  v10 = [(HUWheelControlView *)self value];
  [v9 wheelControlView:self didUpdateValue:v10];

  id v11 = [(HUWheelControlView *)self delegate];
  [v11 controlViewDidEndUserInteraction:self];
}

- (void)setCustomValues:(id)a3
{
  objc_storeStrong((id *)&self->_customValues, a3);

  [(HUWheelControlView *)self _generateWheelValues];
}

+ (Class)valueClass
{
  return (Class)objc_opt_class();
}

- (id)value
{
  v3 = [(HUWheelControlView *)self pickerView];
  uint64_t v4 = [v3 selectedRowInComponent:0];

  int64_t v5 = [(HUWheelControlView *)self wheelValues];
  id v6 = [v5 objectAtIndex:v4];

  return v6;
}

- (void)setValue:(id)a3
{
  id v4 = a3;
  int64_t v5 = [(HUWheelControlView *)self wheelValues];
  uint64_t v6 = [v5 indexOfObject:v4];

  if (v6 == 0x7FFFFFFFFFFFFFFFLL) {
    uint64_t v7 = 0;
  }
  else {
    uint64_t v7 = v6;
  }
  v8 = [(HUWheelControlView *)self pickerView];
  [v8 selectRow:v7 inComponent:0 animated:1];

  v9 = [(HUWheelControlView *)self wheelDelegate];
  [v9 wheelControlView:self didUpdateValue:v4];

  [(HUWheelControlView *)self _updateUIToReachable];
}

- (BOOL)isDisabled
{
  v2 = [(HUWheelControlView *)self pickerView];
  char v3 = [v2 isUserInteractionEnabled] ^ 1;

  return v3;
}

- (void)setDisabled:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v5 = !a3;
  uint64_t v6 = [(HUWheelControlView *)self pickerView];
  [v6 setUserInteractionEnabled:v5];

  if (v3) {
    double v7 = 0.25;
  }
  else {
    double v7 = 1.0;
  }
  id v8 = [(HUWheelControlView *)self pickerView];
  [v8 setAlpha:v7];
}

- (void)_generateWheelValues
{
  v13[1] = *MEMORY[0x1E4F143B8];
  BOOL v3 = (void *)MEMORY[0x1E4F1CA80];
  id v4 = [(HUWheelControlView *)self values];
  BOOL v5 = [v3 setWithArray:v4];

  uint64_t v6 = [(HUWheelControlView *)self customValues];
  uint64_t v7 = [v6 count];

  if (v7)
  {
    id v8 = [(HUWheelControlView *)self customValues];
    [v5 unionSet:v8];
  }
  v9 = (void *)[objc_alloc(MEMORY[0x1E4F29008]) initWithKey:@"doubleValue" ascending:1];
  v13[0] = v9;
  v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1];
  id v11 = [v5 sortedArrayUsingDescriptors:v10];
  [(HUWheelControlView *)self setWheelValues:v11];

  v12 = [(HUWheelControlView *)self pickerView];
  [v12 reloadComponent:0];
}

- (void)_setupConstraints
{
  id v23 = [MEMORY[0x1E4F1CA48] array];
  BOOL v3 = [(HUWheelControlView *)self pickerView];
  id v4 = [v3 leadingAnchor];
  BOOL v5 = [(HUWheelControlView *)self layoutMarginsGuide];
  uint64_t v6 = [v5 leadingAnchor];
  uint64_t v7 = [v4 constraintEqualToAnchor:v6];
  [v23 addObject:v7];

  id v8 = [(HUWheelControlView *)self pickerView];
  v9 = [v8 trailingAnchor];
  v10 = [(HUWheelControlView *)self layoutMarginsGuide];
  id v11 = [v10 trailingAnchor];
  v12 = [v9 constraintEqualToAnchor:v11];
  [v23 addObject:v12];

  v13 = [(HUWheelControlView *)self pickerView];
  objc_super v14 = [v13 topAnchor];
  v15 = [(HUWheelControlView *)self layoutMarginsGuide];
  v16 = [v15 topAnchor];
  v17 = [v14 constraintEqualToAnchor:v16];
  [v23 addObject:v17];

  v18 = [(HUWheelControlView *)self layoutMarginsGuide];
  v19 = [v18 heightAnchor];
  v20 = [(HUWheelControlView *)self pickerView];
  v21 = [v20 heightAnchor];
  v22 = [v19 constraintGreaterThanOrEqualToAnchor:v21];
  [v23 addObject:v22];

  [MEMORY[0x1E4F28DC8] activateConstraints:v23];
}

- (id)_formatValue:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(HUWheelControlView *)self valueFormatter];
  uint64_t v6 = [v5 stringForObjectValue:v4];

  return v6;
}

- (void)_updateUIToReachable
{
  id v2 = [(HUWheelControlView *)self pickerView];
  [v2 setUserInteractionEnabled:1];
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

- (BOOL)canBeHighlighted
{
  return self->_canBeHighlighted;
}

- (void)setCanBeHighlighted:(BOOL)a3
{
  self->_canBeHighlighted = a3;
}

- (HUWheelControlViewDelegate)wheelDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_wheelDelegate);

  return (HUWheelControlViewDelegate *)WeakRetained;
}

- (void)setWheelDelegate:(id)a3
{
}

- (NSArray)values
{
  return self->_values;
}

- (NSFormatter)valueFormatter
{
  return self->_valueFormatter;
}

- (NSSet)customValues
{
  return self->_customValues;
}

- (UIPickerView)pickerView
{
  return self->_pickerView;
}

- (void)setPickerView:(id)a3
{
}

- (NSArray)wheelValues
{
  return self->_wheelValues;
}

- (void)setWheelValues:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wheelValues, 0);
  objc_storeStrong((id *)&self->_pickerView, 0);
  objc_storeStrong((id *)&self->_customValues, 0);
  objc_storeStrong((id *)&self->_valueFormatter, 0);
  objc_storeStrong((id *)&self->_values, 0);
  objc_destroyWeak((id *)&self->_wheelDelegate);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_identifier, 0);
}

@end