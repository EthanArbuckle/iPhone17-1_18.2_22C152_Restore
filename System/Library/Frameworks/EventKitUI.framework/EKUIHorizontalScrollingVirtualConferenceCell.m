@interface EKUIHorizontalScrollingVirtualConferenceCell
- (EKUIHorizontalScrollingVirtualConferenceCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (NSArray)roomTypes;
- (VirtualConferenceRoomTypeSelectionDelegate)delegate;
- (double)_heightOfCells;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)setDelegate:(id)a3;
- (void)setRoomTypes:(id)a3;
@end

@implementation EKUIHorizontalScrollingVirtualConferenceCell

- (EKUIHorizontalScrollingVirtualConferenceCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v53[1] = *MEMORY[0x1E4F143B8];
  v51.receiver = self;
  v51.super_class = (Class)EKUIHorizontalScrollingVirtualConferenceCell;
  v4 = [(EKUIHorizontalScrollingVirtualConferenceCell *)&v51 initWithStyle:a3 reuseIdentifier:a4];
  if (v4)
  {
    v5 = (void *)MEMORY[0x1E4FB1338];
    v6 = [MEMORY[0x1E4FB1308] fractionalWidthDimension:0.5];
    v7 = [MEMORY[0x1E4FB1308] fractionalHeightDimension:1.0];
    v50 = [v5 sizeWithWidthDimension:v6 heightDimension:v7];

    v49 = [MEMORY[0x1E4FB1328] itemWithLayoutSize:v50];
    v8 = (void *)MEMORY[0x1E4FB1338];
    v9 = [MEMORY[0x1E4FB1308] fractionalWidthDimension:0.9];
    v10 = [MEMORY[0x1E4FB1308] fractionalHeightDimension:1.0];
    v48 = [v8 sizeWithWidthDimension:v9 heightDimension:v10];

    v11 = (void *)MEMORY[0x1E4FB1318];
    v53[0] = v49;
    v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v53 count:1];
    v47 = [v11 horizontalGroupWithLayoutSize:v48 subitems:v12];

    v46 = [MEMORY[0x1E4FB1330] sectionWithGroup:v47];
    v13 = (void *)[objc_alloc(MEMORY[0x1E4FB1580]) initWithSection:v46];
    id v45 = objc_alloc_init(MEMORY[0x1E4FB1588]);
    [v45 setScrollDirection:1];
    v44 = v13;
    [v13 setConfiguration:v45];
    id v14 = objc_alloc(MEMORY[0x1E4FB1568]);
    uint64_t v15 = objc_msgSend(v14, "initWithFrame:collectionViewLayout:", v13, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    items = v4->_items;
    v4->_items = (UICollectionView *)v15;

    [(UICollectionView *)v4->_items setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UICollectionView *)v4->_items setDataSource:v4];
    [(UICollectionView *)v4->_items setDelegate:v4];
    v17 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
    [(UICollectionView *)v4->_items setBackgroundColor:v17];

    v18 = v4->_items;
    uint64_t v19 = objc_opt_class();
    v20 = (objc_class *)objc_opt_class();
    v21 = NSStringFromClass(v20);
    [(UICollectionView *)v18 registerClass:v19 forCellWithReuseIdentifier:v21];

    v22 = [(EKUIHorizontalScrollingVirtualConferenceCell *)v4 contentView];
    [v22 addSubview:v4->_items];

    v35 = (void *)MEMORY[0x1E4F28DC8];
    v42 = [(UICollectionView *)v4->_items leadingAnchor];
    v43 = [(EKUIHorizontalScrollingVirtualConferenceCell *)v4 contentView];
    v41 = [v43 leadingAnchor];
    v40 = [v42 constraintEqualToAnchor:v41];
    v52[0] = v40;
    v38 = [(UICollectionView *)v4->_items topAnchor];
    v39 = [(EKUIHorizontalScrollingVirtualConferenceCell *)v4 contentView];
    v37 = [v39 topAnchor];
    v36 = [v38 constraintEqualToAnchor:v37];
    v52[1] = v36;
    v33 = [(UICollectionView *)v4->_items bottomAnchor];
    v34 = [(EKUIHorizontalScrollingVirtualConferenceCell *)v4 contentView];
    v23 = [v34 bottomAnchor];
    v24 = [v33 constraintEqualToAnchor:v23];
    v52[2] = v24;
    v25 = [(UICollectionView *)v4->_items trailingAnchor];
    v26 = [(EKUIHorizontalScrollingVirtualConferenceCell *)v4 contentView];
    v27 = [v26 trailingAnchor];
    v28 = [v25 constraintEqualToAnchor:v27];
    v52[3] = v28;
    v29 = [(UICollectionView *)v4->_items heightAnchor];
    [(EKUIHorizontalScrollingVirtualConferenceCell *)v4 _heightOfCells];
    v30 = objc_msgSend(v29, "constraintEqualToConstant:");
    v52[4] = v30;
    v31 = [MEMORY[0x1E4F1C978] arrayWithObjects:v52 count:5];
    [v35 activateConstraints:v31];
  }
  return v4;
}

- (double)_heightOfCells
{
  [MEMORY[0x1E4F25510] conferenceImageSize];
  double v3 = v2 + 14.0;
  v4 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28C8]];
  [v4 _scaledValueForValue:v3];
  double v6 = v5 + 16.0;

  return v6;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  return [(NSArray *)self->_roomTypes count];
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = (objc_class *)objc_opt_class();
  v9 = NSStringFromClass(v8);
  v10 = [v7 dequeueReusableCellWithReuseIdentifier:v9 forIndexPath:v6];

  roomTypes = self->_roomTypes;
  uint64_t v12 = [v6 row];

  v13 = [(NSArray *)roomTypes objectAtIndex:v12];
  [v10 setCurrentRoomType:v13];
  id v14 = [v10 defaultContentConfiguration];
  uint64_t v15 = [v13 title];
  [v14 setText:v15];

  v16 = [v14 textProperties];
  [v16 setNumberOfLines:2];

  [v14 setImageToTextPadding:10.0];
  [MEMORY[0x1E4F25510] conferenceImageSize];
  double v18 = v17;
  uint64_t v19 = [v14 imageProperties];
  objc_msgSend(v19, "setReservedLayoutSize:", v18, v18);

  v20 = [v14 imageProperties];
  objc_msgSend(v20, "setMaximumSize:", v18, v18);

  [v10 setContentConfiguration:v14];
  v21 = (void *)MEMORY[0x1E4F57B50];
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __86__EKUIHorizontalScrollingVirtualConferenceCell_collectionView_cellForItemAtIndexPath___block_invoke;
  v27[3] = &unk_1E6089C20;
  id v22 = v10;
  id v28 = v22;
  v29 = v14;
  id v23 = v14;
  [v21 imageForRoomType:v13 completionHandler:v27];
  v24 = v29;
  id v25 = v22;

  return v25;
}

void __86__EKUIHorizontalScrollingVirtualConferenceCell_collectionView_cellForItemAtIndexPath___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __86__EKUIHorizontalScrollingVirtualConferenceCell_collectionView_cellForItemAtIndexPath___block_invoke_2;
  v9[3] = &unk_1E60890B0;
  id v10 = *(id *)(a1 + 32);
  id v11 = v6;
  id v12 = *(id *)(a1 + 40);
  id v13 = v5;
  id v7 = v5;
  id v8 = v6;
  dispatch_async(MEMORY[0x1E4F14428], v9);
}

void __86__EKUIHorizontalScrollingVirtualConferenceCell_collectionView_cellForItemAtIndexPath___block_invoke_2(uint64_t a1)
{
  double v2 = [*(id *)(a1 + 32) currentRoomType];
  int v3 = [v2 isEqual:*(void *)(a1 + 40)];

  if (v3)
  {
    [*(id *)(a1 + 48) setImage:*(void *)(a1 + 56)];
    uint64_t v4 = *(void *)(a1 + 48);
    id v5 = *(void **)(a1 + 32);
    [v5 setContentConfiguration:v4];
  }
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v5 = a4;
  id v9 = [(EKUIHorizontalScrollingVirtualConferenceCell *)self delegate];
  roomTypes = self->_roomTypes;
  uint64_t v7 = [v5 row];

  id v8 = [(NSArray *)roomTypes objectAtIndex:v7];
  [v9 selectedRoomType:v8];
}

- (VirtualConferenceRoomTypeSelectionDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (VirtualConferenceRoomTypeSelectionDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSArray)roomTypes
{
  return self->_roomTypes;
}

- (void)setRoomTypes:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_roomTypes, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_items, 0);
}

@end