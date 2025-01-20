@interface CARSettingsGroupCellSpecifier
- (CARSettingsGroupCellSpecifier)initWithTitles:(id)a3 actionBlock:(id)a4;
- (CARSettingsGroupCellSpecifier)initWithTitles:(id)a3 subtitles:(id)a4 actionBlock:(id)a5;
- (NSArray)groupSpecifiers;
- (NSString)selectedTitle;
- (unint64_t)selectedIndex;
- (void)setSelectedIndex:(unint64_t)a3;
@end

@implementation CARSettingsGroupCellSpecifier

- (CARSettingsGroupCellSpecifier)initWithTitles:(id)a3 actionBlock:(id)a4
{
  return [(CARSettingsGroupCellSpecifier *)self initWithTitles:a3 subtitles:0 actionBlock:a4];
}

- (CARSettingsGroupCellSpecifier)initWithTitles:(id)a3 subtitles:(id)a4 actionBlock:(id)a5
{
  id v8 = a3;
  id v20 = a4;
  id v9 = a5;
  v26.receiver = self;
  v26.super_class = (Class)CARSettingsGroupCellSpecifier;
  v10 = [(CARSettingsGroupCellSpecifier *)&v26 init];
  v11 = v10;
  if (v10)
  {
    v10->_selectedIndex = 0x7FFFFFFFFFFFFFFFLL;
    v12 = (NSArray *)objc_opt_new();
    if ([v8 count])
    {
      unint64_t v13 = 0;
      do
      {
        v14 = [v8 objectAtIndexedSubscript:v13];
        v15 = [v20 objectAtIndexedSubscript:v13];
        objc_initWeak(&location, v11);
        v16 = [CARSettingsCellSpecifier alloc];
        v21[0] = _NSConcreteStackBlock;
        v21[1] = 3221225472;
        v21[2] = sub_10002495C;
        v21[3] = &unk_100092698;
        objc_copyWeak(&v23, &location);
        int v24 = v13;
        id v22 = v9;
        v17 = [(CARSettingsCellSpecifier *)v16 initWithTitle:v14 subtitle:v15 image:0 accessoryType:0 actionBlock:v21];
        [(NSArray *)v12 addObject:v17];

        objc_destroyWeak(&v23);
        objc_destroyWeak(&location);

        ++v13;
      }
      while ((unint64_t)[v8 count] > v13);
    }
    groupSpecifiers = v11->_groupSpecifiers;
    v11->_groupSpecifiers = v12;

    [(CARSettingsGroupCellSpecifier *)v11 setSelectedIndex:0];
  }

  return v11;
}

- (void)setSelectedIndex:(unint64_t)a3
{
  unint64_t selectedIndex = self->_selectedIndex;
  if (selectedIndex != a3)
  {
    if (selectedIndex != 0x7FFFFFFFFFFFFFFFLL)
    {
      v6 = [(CARSettingsGroupCellSpecifier *)self groupSpecifiers];
      v7 = [v6 objectAtIndexedSubscript:self->_selectedIndex];
      [v7 setAccessoryType:0];
    }
    if (a3 != 0x7FFFFFFFFFFFFFFFLL)
    {
      id v8 = [(CARSettingsGroupCellSpecifier *)self groupSpecifiers];
      id v9 = [v8 objectAtIndexedSubscript:a3];
      [v9 setAccessoryType:3];
    }
    self->_unint64_t selectedIndex = a3;
  }
}

- (NSString)selectedTitle
{
  if ([(CARSettingsGroupCellSpecifier *)self selectedIndex] == 0x7FFFFFFFFFFFFFFFLL)
  {
    v3 = &stru_100094078;
  }
  else
  {
    v4 = [(CARSettingsGroupCellSpecifier *)self groupSpecifiers];
    v5 = [v4 objectAtIndexedSubscript:[self selectedIndex]];
    v3 = [v5 title];
  }

  return (NSString *)v3;
}

- (NSArray)groupSpecifiers
{
  return self->_groupSpecifiers;
}

- (unint64_t)selectedIndex
{
  return self->_selectedIndex;
}

- (void).cxx_destruct
{
}

@end