@interface DMCEnrollmentNameListCell
- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5;
- (DMCEnrollmentNameListCell)initWithNames:(id)a3 numberOfColumns:(unint64_t)a4;
- (NSArray)names;
- (UICollectionView)collectionView;
- (double)cellHeight;
- (double)collectionView:(id)a3 layout:(id)a4 minimumInteritemSpacingForSectionAtIndex:(int64_t)a5;
- (double)collectionView:(id)a3 layout:(id)a4 minimumLineSpacingForSectionAtIndex:(int64_t)a5;
- (double)estimatedCellHeight;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInCollectionView:(id)a3;
- (unint64_t)numberOfColumns;
- (void)layoutSubviews;
- (void)setCellHeight:(double)a3;
- (void)setCollectionView:(id)a3;
- (void)setNames:(id)a3;
- (void)setNumberOfColumns:(unint64_t)a3;
@end

@implementation DMCEnrollmentNameListCell

- (DMCEnrollmentNameListCell)initWithNames:(id)a3 numberOfColumns:(unint64_t)a4
{
  v31[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  v7 = (objc_class *)objc_opt_class();
  v8 = NSStringFromClass(v7);
  v28.receiver = self;
  v28.super_class = (Class)DMCEnrollmentNameListCell;
  v9 = [(DMCEnrollmentNameListCell *)&v28 initWithStyle:0 reuseIdentifier:v8];

  if (v9)
  {
    [(DMCEnrollmentNameListCell *)v9 setSelectionStyle:0];
    [(DMCEnrollmentNameListCell *)v9 setUserInteractionEnabled:0];
    v10 = [MEMORY[0x263F1C550] secondarySystemBackgroundColor];
    [(DMCEnrollmentNameListCell *)v9 setBackgroundColor:v10];

    uint64_t v11 = [v6 copy];
    names = v9->_names;
    v9->_names = (NSArray *)v11;

    v9->_numberOfColumns = a4;
    id v13 = objc_alloc_init(MEMORY[0x263F1C508]);
    id v14 = objc_alloc(MEMORY[0x263F1C4E0]);
    v15 = objc_msgSend(v14, "initWithFrame:collectionViewLayout:", v13, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
    [v15 setDelegate:v9];
    [v15 setDataSource:v9];
    [v15 setTranslatesAutoresizingMaskIntoConstraints:0];
    [v15 setScrollEnabled:0];
    [v15 registerClass:objc_opt_class() forCellWithReuseIdentifier:@"DMCEnrollmentNameItemCell"];
    v16 = [(DMCEnrollmentNameListCell *)v9 contentView];
    [v16 addSubview:v15];

    v30 = @"collectionView";
    v31[0] = v15;
    v17 = [NSDictionary dictionaryWithObjects:v31 forKeys:&v30 count:1];
    v18 = [MEMORY[0x263F08938] constraintsWithVisualFormat:@"|-0-[collectionView]-0-|" options:0 metrics:0 views:v17];
    v19 = [MEMORY[0x263F08938] constraintsWithVisualFormat:@"V:|-0-[collectionView]-0-|" options:0 metrics:0 views:v17];
    v20 = [(DMCEnrollmentNameListCell *)v9 contentView];
    [v20 addConstraints:v18];

    v21 = [(DMCEnrollmentNameListCell *)v9 contentView];
    [v21 addConstraints:v19];

    objc_storeStrong((id *)&v9->_collectionView, v15);
    objc_initWeak(&location, v9);
    uint64_t v29 = objc_opt_class();
    v22 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v29 count:1];
    v25[0] = MEMORY[0x263EF8330];
    v25[1] = 3221225472;
    v25[2] = __59__DMCEnrollmentNameListCell_initWithNames_numberOfColumns___block_invoke;
    v25[3] = &unk_2645E8EB0;
    objc_copyWeak(&v26, &location);
    id v23 = (id)[(DMCEnrollmentNameListCell *)v9 registerForTraitChanges:v22 withHandler:v25];

    objc_destroyWeak(&v26);
    objc_destroyWeak(&location);
  }
  return v9;
}

void __59__DMCEnrollmentNameListCell_initWithNames_numberOfColumns___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [WeakRetained collectionView];
  [v1 reloadData];
}

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)DMCEnrollmentNameListCell;
  [(DMCEnrollmentNameListCell *)&v4 layoutSubviews];
  v3 = [(DMCEnrollmentNameListCell *)self collectionView];
  [v3 sizeToFit];

  [(DMCEnrollmentNameListCell *)self bounds];
  -[DMCEnrollmentNameListCell setSeparatorInset:](self, "setSeparatorInset:", 0.0, CGRectGetWidth(v5), 0.0, 0.0);
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6 = a4;
  v7 = [a3 dequeueReusableCellWithReuseIdentifier:@"DMCEnrollmentNameItemCell" forIndexPath:v6];
  v8 = [(DMCEnrollmentNameListCell *)self names];
  uint64_t v9 = [v6 row];

  v10 = [v8 objectAtIndexedSubscript:v9];
  uint64_t v11 = [v7 textLabel];
  [v11 setText:v10];

  v12 = [v7 textLabel];
  objc_msgSend(v12, "sizeThatFits:", 1.79769313e308, 1.79769313e308);
  [(DMCEnrollmentNameListCell *)self setCellHeight:v13];

  return v7;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  objc_super v4 = [(DMCEnrollmentNameListCell *)self names];
  int64_t v5 = [v4 count];

  return v5;
}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  return 1;
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5
{
  v31[1] = *MEMORY[0x263EF8340];
  id v7 = a5;
  id v8 = a3;
  uint64_t v9 = [(DMCEnrollmentNameListCell *)self names];
  uint64_t v10 = [v7 row];

  uint64_t v11 = [v9 objectAtIndexedSubscript:v10];
  uint64_t v30 = *MEMORY[0x263F814F0];
  v12 = +[DMCEnrollmentNameItemCell _titleFont];
  v31[0] = v12;
  double v13 = [NSDictionary dictionaryWithObjects:v31 forKeys:&v30 count:1];
  objc_msgSend(v11, "boundingRectWithSize:options:attributes:context:", 0, v13, 0, 1.79769313e308, 1.79769313e308);
  double v15 = v14;

  v16 = [(DMCEnrollmentNameListCell *)self names];
  unint64_t v17 = [v16 count];
  [v8 frame];
  CGFloat v19 = v18;
  CGFloat v21 = v20;
  CGFloat v23 = v22;
  CGFloat v25 = v24;

  v33.origin.x = v19;
  v33.origin.y = v21;
  v33.size.width = v23;
  v33.size.height = v25;
  double Width = CGRectGetWidth(v33);
  if (v17 >= 2)
  {
    double v27 = Width + (double)([(DMCEnrollmentNameListCell *)self numberOfColumns] - 1) * -5.0;
    double Width = v27 / (double)[(DMCEnrollmentNameListCell *)self numberOfColumns];
  }

  double v28 = Width;
  double v29 = v15;
  result.height = v29;
  result.width = v28;
  return result;
}

- (double)collectionView:(id)a3 layout:(id)a4 minimumLineSpacingForSectionAtIndex:(int64_t)a5
{
  return 5.0;
}

- (double)collectionView:(id)a3 layout:(id)a4 minimumInteritemSpacingForSectionAtIndex:(int64_t)a5
{
  return 5.0;
}

- (double)cellHeight
{
  v18[1] = *MEMORY[0x263EF8340];
  v3 = [(DMCEnrollmentNameListCell *)self names];
  uint64_t v4 = [v3 count];

  if (!v4) {
    return 0.0;
  }
  uint64_t v5 = 0;
  int v6 = 0;
  uint64_t v7 = *MEMORY[0x263F814F0];
  double v8 = 0.0;
  do
  {
    uint64_t v9 = [(DMCEnrollmentNameListCell *)self names];
    uint64_t v10 = [v9 objectAtIndexedSubscript:v5];
    uint64_t v17 = v7;
    uint64_t v11 = +[DMCEnrollmentNameItemCell _titleFont];
    v18[0] = v11;
    v12 = [NSDictionary dictionaryWithObjects:v18 forKeys:&v17 count:1];
    objc_msgSend(v10, "boundingRectWithSize:options:attributes:context:", 0, v12, 0, 1.79769313e308, 1.79769313e308);
    double v8 = v8 + v13;

    if (v6) {
      double v8 = v8 + 5.0;
    }
    v6 += [(DMCEnrollmentNameListCell *)self numberOfColumns];
    uint64_t v5 = v6;
    double v14 = [(DMCEnrollmentNameListCell *)self names];
    unint64_t v15 = [v14 count];
  }
  while (v15 > v6);
  return v8;
}

- (double)estimatedCellHeight
{
  return 25.0;
}

- (UICollectionView)collectionView
{
  return self->_collectionView;
}

- (void)setCollectionView:(id)a3
{
}

- (unint64_t)numberOfColumns
{
  return self->_numberOfColumns;
}

- (void)setNumberOfColumns:(unint64_t)a3
{
  self->_numberOfColumns = a3;
}

- (NSArray)names
{
  return self->_names;
}

- (void)setNames:(id)a3
{
}

- (void)setCellHeight:(double)a3
{
  self->_cellHeight = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_names, 0);
  objc_storeStrong((id *)&self->_collectionView, 0);
}

@end