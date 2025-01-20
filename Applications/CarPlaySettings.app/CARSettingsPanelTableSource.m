@interface CARSettingsPanelTableSource
- (BOOL)showCellImages;
- (CARSettingsPanelTableSource)initWithSpecifiers:(id)a3 specifierSections:(id)a4;
- (NSArray)specifierSections;
- (NSArray)specifiers;
- (NSIndexPath)savedFocusedIndexPath;
- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4;
- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4;
- (id)preferredFocusEnvironmentsForTableView:(id)a3;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4;
- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)setSavedFocusedIndexPath:(id)a3;
- (void)setShowCellImages:(BOOL)a3;
- (void)setSpecifierSections:(id)a3;
- (void)setSpecifiers:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
@end

@implementation CARSettingsPanelTableSource

- (CARSettingsPanelTableSource)initWithSpecifiers:(id)a3 specifierSections:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CARSettingsPanelTableSource;
  v9 = [(CARSettingsPanelTableSource *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_specifiers, a3);
    objc_storeStrong((id *)&v10->_specifierSections, a4);
  }

  return v10;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = +[CARSettingsTableViewCell reuseIdentifier];
  v9 = [v7 dequeueReusableCellWithIdentifier:v8 forIndexPath:v6];

  [v9 setShowImageView:[self showCellImages]];
  v10 = [(CARSettingsPanelTableSource *)self specifierSections];

  if (v10)
  {
    v11 = [(CARSettingsPanelTableSource *)self specifierSections];
    objc_super v12 = [v11 objectAtIndexedSubscript:[v6 section]];
    v13 = [v12 specifiers];
    v14 = [v13 objectAtIndexedSubscript:[v6 row]];
    [v9 setSpecifier:v14];
  }
  else
  {
    v11 = [(CARSettingsPanelTableSource *)self specifiers];
    objc_super v12 = [v11 objectAtIndexedSubscript:[v6 row]];
    [v9 setSpecifier:v12];
  }

  return v9;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  v4 = [(CARSettingsPanelTableSource *)self specifierSections];

  if (!v4) {
    return 1;
  }
  v5 = [(CARSettingsPanelTableSource *)self specifierSections];
  id v6 = [v5 count];

  return (int64_t)v6;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v6 = [(CARSettingsPanelTableSource *)self specifierSections];

  if (v6)
  {
    id v7 = [(CARSettingsPanelTableSource *)self specifierSections];
    id v8 = [v7 objectAtIndexedSubscript:a4];
    v9 = [v8 specifiers];
    id v10 = [v9 count];
  }
  else
  {
    id v7 = [(CARSettingsPanelTableSource *)self specifiers];
    id v10 = [v7 count];
  }

  return (int64_t)v10;
}

- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4
{
  id v6 = a3;
  id v7 = [(CARSettingsPanelTableSource *)self specifierSections];
  id v8 = [v7 objectAtIndexedSubscript:a4];
  v9 = [v8 footer];
  id v10 = [v9 length];

  if (v10)
  {
    v11 = +[CARSettingsTableFooterView identifier];
    objc_super v12 = [v6 dequeueReusableHeaderFooterViewWithIdentifier:v11];

    v13 = [(CARSettingsPanelTableSource *)self specifierSections];
    v14 = [v13 objectAtIndexedSubscript:a4];
    v15 = [v14 footer];
    [v12 setText:v15];
  }
  else
  {
    objc_super v12 = 0;
  }

  return v12;
}

- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4
{
  v5 = [(CARSettingsPanelTableSource *)self specifierSections];
  id v6 = [v5 objectAtIndexedSubscript:a4];
  id v7 = [v6 footer];
  id v8 = [v7 length];

  double result = UITableViewAutomaticDimension;
  if (!v8) {
    return 0.0;
  }
  return result;
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  id v6 = a3;
  id v7 = +[CARSettingsTableHeaderView identifier];
  id v8 = [v6 dequeueReusableHeaderFooterViewWithIdentifier:v7];

  v9 = [(CARSettingsPanelTableSource *)self specifierSections];

  if (v9)
  {
    id v10 = [(CARSettingsPanelTableSource *)self specifierSections];
    v11 = [v10 objectAtIndexedSubscript:a4];
    objc_super v12 = [v11 title];
    [v8 setText:v12];
  }
  else
  {
    [v8 setText:0];
  }

  return v8;
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  id v6 = [(CARSettingsPanelTableSource *)self specifierSections];
  id v7 = [v6 objectAtIndexedSubscript:a4];
  id v8 = [v7 title];
  if (v8)
  {
    BOOL v9 = 1;
  }
  else
  {
    BOOL v10 = a4 < 1;
    int64_t v11 = a4 - 1;
    if (v10)
    {
      BOOL v9 = 0;
    }
    else
    {
      objc_super v12 = [(CARSettingsPanelTableSource *)self specifierSections];
      v13 = [v12 objectAtIndexedSubscript:v11];
      v14 = [v13 footer];
      BOOL v9 = [v14 length] == 0;
    }
  }

  double result = UITableViewAutomaticDimension;
  if (!v9) {
    return 0.0;
  }
  return result;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v27 = a3;
  id v6 = a4;
  id v7 = [v27 window];
  id v8 = [v7 screen];
  if ([v8 supportsFocus])
  {
    BOOL v9 = [v27 cellForRowAtIndexPath:v6];
    unsigned int v10 = [v9 isFocused];
  }
  else
  {
    unsigned int v10 = 0;
  }

  int64_t v11 = [(CARSettingsPanelTableSource *)self specifierSections];

  if (v11)
  {
    objc_super v12 = [(CARSettingsPanelTableSource *)self specifierSections];
    v13 = objc_msgSend(v12, "objectAtIndexedSubscript:", objc_msgSend(v6, "section"));
    v14 = [v13 specifiers];
    v15 = objc_msgSend(v14, "objectAtIndexedSubscript:", objc_msgSend(v6, "row"));
  }
  else
  {
    objc_super v12 = [(CARSettingsPanelTableSource *)self specifiers];
    v15 = [v12 objectAtIndexedSubscript:[v6 row]];
  }

  objc_opt_class();
  int isKindOfClass = objc_opt_isKindOfClass();
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v17 = [v27 cellForRowAtIndexPath:v6];
    v18 = [v17 accessoryView];

    if (v18)
    {
      v19 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v18 isOn] ^ 1);
      [v15 setCellValue:v19];
    }
  }
  int v20 = isKindOfClass & v10;
  v21 = [v15 actionBlock];

  if (v21)
  {
    v22 = [v15 actionBlock];
    v23 = [v15 cellValue];
    ((void (**)(void, void *))v22)[2](v22, v23);
  }
  if (v20)
  {
    [(CARSettingsPanelTableSource *)self setSavedFocusedIndexPath:v6];
    id v24 = v27;
    id v25 = [objc_alloc((Class)_UIFocusUpdateRequest) initWithEnvironment:v24];
    [v25 setAllowsDeferral:0];
    v26 = +[UIFocusSystem focusSystemForEnvironment:v24];

    [v26 _requestFocusUpdate:v25];
  }
  else
  {
    [v27 deselectRowAtIndexPath:v6 animated:1];
    [(CARSettingsPanelTableSource *)self setSavedFocusedIndexPath:0];
  }
}

- (id)preferredFocusEnvironmentsForTableView:(id)a3
{
  id v4 = a3;
  v5 = [(CARSettingsPanelTableSource *)self savedFocusedIndexPath];

  if (v5)
  {
    id v6 = [(CARSettingsPanelTableSource *)self savedFocusedIndexPath];
    id v7 = [v4 cellForRowAtIndexPath:v6];

    if (v7)
    {
      BOOL v9 = v7;
      v5 = +[NSArray arrayWithObjects:&v9 count:1];
    }
    else
    {
      v5 = 0;
    }
  }

  return v5;
}

- (NSArray)specifiers
{
  return self->_specifiers;
}

- (void)setSpecifiers:(id)a3
{
}

- (NSArray)specifierSections
{
  return self->_specifierSections;
}

- (void)setSpecifierSections:(id)a3
{
}

- (BOOL)showCellImages
{
  return self->_showCellImages;
}

- (void)setShowCellImages:(BOOL)a3
{
  self->_showCellImages = a3;
}

- (NSIndexPath)savedFocusedIndexPath
{
  return self->_savedFocusedIndexPath;
}

- (void)setSavedFocusedIndexPath:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_savedFocusedIndexPath, 0);
  objc_storeStrong((id *)&self->_specifierSections, 0);

  objc_storeStrong((id *)&self->_specifiers, 0);
}

@end