@interface HKEmergencyCardTableItem
- (BOOL)canEditRowAtIndex:(int64_t)a3;
- (BOOL)hasPresentableData;
- (BOOL)isInEditMode;
- (BOOL)isSecondaryProfile;
- (BOOL)shouldHighlightRowAtIndex:(int64_t)a3;
- (BOOL)shouldShowHints;
- (HKEmergencyCardTableItem)init;
- (NSString)profileFirstName;
- (UIEdgeInsets)separatorInset;
- (UIViewController)owningViewController;
- (_HKMedicalIDData)data;
- (double)tableView:(id)a3 estimatedHeightForRowAtIndex:(int64_t)a4;
- (double)tableView:(id)a3 heightForRowAtIndex:(int64_t)a4;
- (id)_dequeueNoValueCellInTableView:(id)a3 withTitle:(id)a4;
- (id)_dequeueNoValueCellInTableView:(id)a3 withTitle:(id)a4 disabled:(BOOL)a5;
- (id)initInEditMode:(BOOL)a3;
- (id)tableView:(id)a3 cellForRowAtIndex:(int64_t)a4;
- (id)title;
- (id)titleForFooter;
- (id)titleForHeader;
- (int64_t)commitEditingStyle:(int64_t)a3 forRowAtIndex:(int64_t)a4;
- (int64_t)editingStyleForRowAtIndex:(int64_t)a3;
- (int64_t)numberOfRows;
- (void)setData:(id)a3;
- (void)setIsSecondaryProfile:(BOOL)a3;
- (void)setOwningViewController:(id)a3;
- (void)setProfileFirstName:(id)a3;
- (void)setShouldShowHints:(BOOL)a3;
@end

@implementation HKEmergencyCardTableItem

- (id)initInEditMode:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)HKEmergencyCardTableItem;
  id result = [(HKEmergencyCardTableItem *)&v5 init];
  if (result) {
    *((unsigned char *)result + 9) = a3;
  }
  return result;
}

- (HKEmergencyCardTableItem)init
{
  return (HKEmergencyCardTableItem *)[(HKEmergencyCardTableItem *)self initInEditMode:0];
}

- (id)title
{
  return 0;
}

- (UIEdgeInsets)separatorInset
{
  double v2 = 16.0;
  if (self->_isInEditMode) {
    double v2 = 46.0;
  }
  double v3 = 0.0;
  double v4 = 0.0;
  double v5 = 0.0;
  result.right = v5;
  result.bottom = v4;
  result.left = v2;
  result.top = v3;
  return result;
}

- (int64_t)numberOfRows
{
  return 1;
}

- (double)tableView:(id)a3 estimatedHeightForRowAtIndex:(int64_t)a4
{
  if (HKUIApplicationIsUsingAccessibilityContentSizeCategory()
    && [(HKEmergencyCardTableItem *)self isInEditMode])
  {
    return *MEMORY[0x1E4FB2F28];
  }
  else
  {
    return 44.0 + 24.0;
  }
}

- (double)tableView:(id)a3 heightForRowAtIndex:(int64_t)a4
{
  return *MEMORY[0x1E4FB2F28];
}

- (id)titleForHeader
{
  return 0;
}

- (id)titleForFooter
{
  return 0;
}

- (BOOL)shouldHighlightRowAtIndex:(int64_t)a3
{
  return 0;
}

- (BOOL)canEditRowAtIndex:(int64_t)a3
{
  return 0;
}

- (int64_t)editingStyleForRowAtIndex:(int64_t)a3
{
  return 0;
}

- (int64_t)commitEditingStyle:(int64_t)a3 forRowAtIndex:(int64_t)a4
{
  return 0;
}

- (id)_dequeueNoValueCellInTableView:(id)a3 withTitle:(id)a4
{
  return [(HKEmergencyCardTableItem *)self _dequeueNoValueCellInTableView:a3 withTitle:a4 disabled:0];
}

- (id)_dequeueNoValueCellInTableView:(id)a3 withTitle:(id)a4 disabled:(BOOL)a5
{
  id v6 = a4;
  v7 = [a3 dequeueReusableCellWithIdentifier:0x1F3BAE580];
  v8 = [v7 addValueLabel];
  [v8 setText:v6];

  return v7;
}

- (_HKMedicalIDData)data
{
  return self->_data;
}

- (void)setData:(id)a3
{
}

- (NSString)profileFirstName
{
  return self->_profileFirstName;
}

- (void)setProfileFirstName:(id)a3
{
}

- (UIViewController)owningViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_owningViewController);
  return (UIViewController *)WeakRetained;
}

- (void)setOwningViewController:(id)a3
{
}

- (BOOL)isSecondaryProfile
{
  return self->_isSecondaryProfile;
}

- (void)setIsSecondaryProfile:(BOOL)a3
{
  self->_isSecondaryProfile = a3;
}

- (BOOL)isInEditMode
{
  return self->_isInEditMode;
}

- (BOOL)shouldShowHints
{
  return self->_shouldShowHints;
}

- (void)setShouldShowHints:(BOOL)a3
{
  self->_shouldShowHints = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_owningViewController);
  objc_storeStrong((id *)&self->_profileFirstName, 0);
  objc_storeStrong((id *)&self->_data, 0);
}

- (BOOL)hasPresentableData
{
  objc_opt_class();
  NSRequestConcreteImplementation();
  double v3 = [(HKEmergencyCardTableItem *)self data];
  BOOL v4 = v3 != 0;

  return v4;
}

- (id)tableView:(id)a3 cellForRowAtIndex:(int64_t)a4
{
  return 0;
}

@end