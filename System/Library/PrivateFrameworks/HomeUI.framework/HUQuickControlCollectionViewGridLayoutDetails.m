@interface HUQuickControlCollectionViewGridLayoutDetails
- (CGRect)contentFrame;
- (HUQuickControlCollectionGridLayoutSettings)settings;
- (HUQuickControlCollectionViewGridLayoutRowInfo)sectionHeaderLayout;
- (NSArray)rowLayouts;
- (id)indexPathForRow:(unint64_t)a3 column:(unint64_t)a4;
- (id)indexPathForSectionHeader;
- (unint64_t)numberOfColumnsInRow:(unint64_t)a3;
- (unint64_t)sectionIndex;
- (void)setContentFrame:(CGRect)a3;
- (void)setRowLayouts:(id)a3;
- (void)setSectionHeaderLayout:(id)a3;
- (void)setSectionIndex:(unint64_t)a3;
- (void)setSettings:(id)a3;
@end

@implementation HUQuickControlCollectionViewGridLayoutDetails

- (id)indexPathForSectionHeader
{
  v3 = [(HUQuickControlCollectionViewGridLayoutDetails *)self sectionHeaderLayout];
  if (v3)
  {
    v4 = objc_msgSend(MEMORY[0x1E4F28D58], "indexPathForItem:inSection:", 0, -[HUQuickControlCollectionViewGridLayoutDetails sectionIndex](self, "sectionIndex"));
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)indexPathForRow:(unint64_t)a3 column:(unint64_t)a4
{
  v7 = [(HUQuickControlCollectionViewGridLayoutDetails *)self settings];
  unint64_t v8 = a4 + [v7 numberOfColumns] * a3;

  v9 = (void *)MEMORY[0x1E4F28D58];
  unint64_t v10 = [(HUQuickControlCollectionViewGridLayoutDetails *)self sectionIndex];

  return (id)[v9 indexPathForItem:v8 inSection:v10];
}

- (unint64_t)numberOfColumnsInRow:(unint64_t)a3
{
  v5 = [(HUQuickControlCollectionViewGridLayoutDetails *)self settings];
  unint64_t v6 = [v5 numberOfColumns];

  if (v6)
  {
    v7 = [(HUQuickControlCollectionViewGridLayoutDetails *)self settings];
    uint64_t v8 = [v7 numberOfRows] - 1;

    if (v8 == a3)
    {
      v9 = [(HUQuickControlCollectionViewGridLayoutDetails *)self settings];
      unint64_t v10 = [v9 numberOfItems];
      v11 = [(HUQuickControlCollectionViewGridLayoutDetails *)self settings];
      unint64_t v12 = v10 % [v11 numberOfColumns];

      if (v12) {
        return v12;
      }
    }
  }
  return v6;
}

- (HUQuickControlCollectionGridLayoutSettings)settings
{
  return self->_settings;
}

- (void)setSettings:(id)a3
{
}

- (CGRect)contentFrame
{
  double x = self->_contentFrame.origin.x;
  double y = self->_contentFrame.origin.y;
  double width = self->_contentFrame.size.width;
  double height = self->_contentFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setContentFrame:(CGRect)a3
{
  self->_contentFrame = a3;
}

- (unint64_t)sectionIndex
{
  return self->_sectionIndex;
}

- (void)setSectionIndex:(unint64_t)a3
{
  self->_sectionIndedouble x = a3;
}

- (HUQuickControlCollectionViewGridLayoutRowInfo)sectionHeaderLayout
{
  return self->_sectionHeaderLayout;
}

- (void)setSectionHeaderLayout:(id)a3
{
}

- (NSArray)rowLayouts
{
  return self->_rowLayouts;
}

- (void)setRowLayouts:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rowLayouts, 0);
  objc_storeStrong((id *)&self->_sectionHeaderLayout, 0);

  objc_storeStrong((id *)&self->_settings, 0);
}

@end