@interface SettingsPanelCollectionSource
- (BOOL)collectionView:(id)a3 shouldDeselectItemAtIndexPath:(id)a4;
- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4;
- (BOOL)needsScrollBar;
- (CARSettingsCollectionPanel)panel;
- (CGSize)collectionView:(id)a3 layout:(id)a4 referenceSizeForHeaderInSection:(int64_t)a5;
- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5;
- (NSArray)sections;
- (NSArray)specifiers;
- (SettingsPanelCollectionSource)initWithPanel:(id)a3 sections:(id)a4;
- (SettingsPanelCollectionSource)initWithPanel:(id)a3 specifiers:(id)a4;
- (id)_specifierAtIndexPath:(id)a3;
- (id)accessibilityNumberFormatter;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5;
- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInCollectionView:(id)a3;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)collectionView:(id)a3 didUpdateContentSize:(CGSize)a4;
- (void)setNeedsScrollBar:(BOOL)a3;
- (void)setPanel:(id)a3;
- (void)setSections:(id)a3;
- (void)setSpecifiers:(id)a3;
@end

@implementation SettingsPanelCollectionSource

- (SettingsPanelCollectionSource)initWithPanel:(id)a3 specifiers:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)SettingsPanelCollectionSource;
  v8 = [(SettingsPanelCollectionSource *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_panel, v6);
    objc_storeStrong((id *)&v9->_specifiers, a4);
  }

  return v9;
}

- (SettingsPanelCollectionSource)initWithPanel:(id)a3 sections:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)SettingsPanelCollectionSource;
  v8 = [(SettingsPanelCollectionSource *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_panel, v6);
    objc_storeStrong((id *)&v9->_sections, a4);
  }

  return v9;
}

- (BOOL)needsScrollBar
{
  v2 = [(SettingsPanelCollectionSource *)self panel];
  unsigned __int8 v3 = [v2 needsScrollBar];

  return v3;
}

- (void)setNeedsScrollBar:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(SettingsPanelCollectionSource *)self panel];
  [v4 setNeedsScrollBar:v3];
}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  id v4 = [(SettingsPanelCollectionSource *)self sections];

  if (!v4) {
    return 1;
  }
  v5 = [(SettingsPanelCollectionSource *)self sections];
  id v6 = [v5 count];

  return (int64_t)v6;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  id v6 = [(SettingsPanelCollectionSource *)self sections];

  if (v6)
  {
    id v7 = [(SettingsPanelCollectionSource *)self sections];
    v8 = [v7 objectAtIndexedSubscript:a4];

    v9 = [v8 specifiers];
    id v10 = [v9 count];
  }
  else
  {
    v8 = [(SettingsPanelCollectionSource *)self specifiers];
    id v10 = [v8 count];
  }

  return (int64_t)v10;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = +[CARSettingsCollectionViewCell reuseIdentifier];
  v9 = [v7 dequeueReusableCellWithReuseIdentifier:v8 forIndexPath:v6];

  id v10 = [(SettingsPanelCollectionSource *)self _specifierAtIndexPath:v6];
  [v9 setSpecifier:v10];

  objc_super v11 = (char *)[v6 row];
  v12 = +[NSNumber numberWithInteger:v11 + 1];
  v13 = [(SettingsPanelCollectionSource *)self accessibilityNumberFormatter];
  v14 = [v13 stringFromNumber:v12];

  v17 = v14;
  v15 = +[NSArray arrayWithObjects:&v17 count:1];
  [v9 setAccessibilityUserInputLabels:v15];

  return v9;
}

- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if ([a4 isEqualToString:UICollectionElementKindSectionHeader])
  {
    id v10 = +[CARSettingsCollectionViewHeader reuseIdentifier];
    objc_super v11 = [v8 dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:v10 forIndexPath:v9];

    v12 = [(SettingsPanelCollectionSource *)self sections];
    v13 = objc_msgSend(v12, "objectAtIndexedSubscript:", objc_msgSend(v9, "section"));

    v14 = [v13 title];
    [v11 setTitle:v14];

    v15 = [(SettingsPanelCollectionSource *)self panel];
    [v15 effectiveSectionHeaderInset];
    [v11 setSectionInsets:];
  }
  else
  {
    objc_super v11 = 0;
  }

  return v11;
}

- (void)collectionView:(id)a3 didUpdateContentSize:(CGSize)a4
{
  double height = a4.height;
  [a3 frame:a4.width];

  [(SettingsPanelCollectionSource *)self setNeedsScrollBar:height > v6];
}

- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4
{
  id v4 = [(SettingsPanelCollectionSource *)self _specifierAtIndexPath:a4];
  objc_opt_class();
  id v5 = v4;
  if (v5 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v6 = v5;
  }
  else {
    id v6 = 0;
  }

  unsigned __int8 v7 = [v6 canBecomeFocused];
  return v7;
}

- (BOOL)collectionView:(id)a3 shouldDeselectItemAtIndexPath:(id)a4
{
  return 1;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v6 = [(SettingsPanelCollectionSource *)self _specifierAtIndexPath:a4];
  id v4 = [v6 actionBlock];

  if (v4)
  {
    id v5 = [v6 actionBlock];
    v5[2](v5, 0);
  }
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5
{
  id v7 = a3;
  id v8 = [(SettingsPanelCollectionSource *)self _specifierAtIndexPath:a5];
  [v8 intrinsicContentSize];
  double v11 = v10;
  double v12 = v9;
  if (v10 == UIViewNoIntrinsicMetric && v9 == UIViewNoIntrinsicMetric)
  {
    v14 = [(SettingsPanelCollectionSource *)self panel];
    [v14 calculatedCellWidth];
    double v16 = floor(v15);
    double v11 = v16 * 0.5 + v16 * 0.5;

    v17 = [(SettingsPanelCollectionSource *)self panel];
    [v17 calculatedCellHeight];
    double v19 = v18;

    [v8 systemLayoutSizeFittingSize:v11, UILayoutFittingCompressedSize.height];
    if (v20 == 0.0)
    {
      double v21 = floor(v19);
      double v12 = v21 * 0.5 + v21 * 0.5;
      [v8 systemLayoutSizeFittingSize:];
      if (v22 <= 0.0) {
        goto LABEL_11;
      }
      v23 = [v7 traitCollection];
      [v23 displayScale];
      UIFloorToScale();
      double v11 = v24;
    }
    else
    {
      v23 = [v7 traitCollection];
      [v23 displayScale];
      UIFloorToScale();
      double v12 = v25;
    }
  }
LABEL_11:

  double v26 = v11;
  double v27 = v12;
  result.double height = v27;
  result.width = v26;
  return result;
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 referenceSizeForHeaderInSection:(int64_t)a5
{
  id v7 = [(SettingsPanelCollectionSource *)self sections];

  if (v7)
  {
    id v8 = [(SettingsPanelCollectionSource *)self sections];
    double v9 = [v8 objectAtIndexedSubscript:a5];

    double v10 = [v9 title];

    if (v10) {
      double width = 1.0;
    }
    else {
      double width = CGSizeZero.width;
    }
    if (v10) {
      double height = 32.0;
    }
    else {
      double height = CGSizeZero.height;
    }
  }
  else
  {
    double width = CGSizeZero.width;
    double height = CGSizeZero.height;
  }
  double v13 = width;
  double v14 = height;
  result.double height = v14;
  result.double width = v13;
  return result;
}

- (id)_specifierAtIndexPath:(id)a3
{
  id v4 = a3;
  id v5 = [(SettingsPanelCollectionSource *)self sections];

  if (v5)
  {
    id v6 = [(SettingsPanelCollectionSource *)self sections];
    id v7 = objc_msgSend(v6, "objectAtIndexedSubscript:", objc_msgSend(v4, "section"));

    id v8 = [v7 specifiers];
    id v9 = [v4 row];

    double v10 = [v8 objectAtIndexedSubscript:v9];
  }
  else
  {
    id v7 = [(SettingsPanelCollectionSource *)self specifiers];
    id v11 = [v4 row];

    double v10 = [v7 objectAtIndexedSubscript:v11];
  }

  return v10;
}

- (id)accessibilityNumberFormatter
{
  if (qword_1000B08B8 != -1) {
    dispatch_once(&qword_1000B08B8, &stru_100092770);
  }
  v2 = (void *)qword_1000B08B0;

  return v2;
}

- (CARSettingsCollectionPanel)panel
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_panel);

  return (CARSettingsCollectionPanel *)WeakRetained;
}

- (void)setPanel:(id)a3
{
}

- (NSArray)specifiers
{
  return self->_specifiers;
}

- (void)setSpecifiers:(id)a3
{
}

- (NSArray)sections
{
  return self->_sections;
}

- (void)setSections:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sections, 0);
  objc_storeStrong((id *)&self->_specifiers, 0);

  objc_destroyWeak((id *)&self->_panel);
}

@end