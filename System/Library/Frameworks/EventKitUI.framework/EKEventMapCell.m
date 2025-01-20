@interface EKEventMapCell
- (BOOL)currentlyLoading;
- (BOOL)mapViewSetup;
- (BOOL)setupAsEmptyView;
- (EKEventMapCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (EKEventMapDetailItem)detailItem;
- (void)layoutSubviews;
- (void)setCurrentlyLoading:(BOOL)a3;
- (void)setDetailItem:(id)a3;
- (void)setMapViewSetup:(BOOL)a3;
- (void)setSetupAsEmptyView:(BOOL)a3;
@end

@implementation EKEventMapCell

- (EKEventMapCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v15[1] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  v14.receiver = self;
  v14.super_class = (Class)EKEventMapCell;
  v7 = [(EKEventMapCell *)&v14 initWithStyle:a3 reuseIdentifier:v6];
  if (v7)
  {
    objc_initWeak(&location, v7);
    v15[0] = objc_opt_class();
    v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:1];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __48__EKEventMapCell_initWithStyle_reuseIdentifier___block_invoke;
    v11[3] = &unk_1E60874F8;
    objc_copyWeak(&v12, &location);
    id v9 = (id)[(EKEventMapCell *)v7 registerForTraitChanges:v8 withHandler:v11];

    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }

  return v7;
}

void __48__EKEventMapCell_initWithStyle_reuseIdentifier___block_invoke(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    id v2 = objc_loadWeakRetained(WeakRetained + 128);
    [v2 updateViewColors];

    WeakRetained = v3;
  }
}

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)EKEventMapCell;
  [(EKEventMapCell *)&v4 layoutSubviews];
  if (!*(_WORD *)&self->_mapViewSetup)
  {
    self->_mapViewSetup = 1;
    self->_currentlyLoading = 1;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_detailItem);
    [WeakRetained setupMapView];
  }
}

- (EKEventMapDetailItem)detailItem
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_detailItem);

  return (EKEventMapDetailItem *)WeakRetained;
}

- (void)setDetailItem:(id)a3
{
}

- (BOOL)currentlyLoading
{
  return self->_currentlyLoading;
}

- (void)setCurrentlyLoading:(BOOL)a3
{
  self->_currentlyLoading = a3;
}

- (BOOL)mapViewSetup
{
  return self->_mapViewSetup;
}

- (void)setMapViewSetup:(BOOL)a3
{
  self->_mapViewSetup = a3;
}

- (BOOL)setupAsEmptyView
{
  return self->_setupAsEmptyView;
}

- (void)setSetupAsEmptyView:(BOOL)a3
{
  self->_setupAsEmptyView = a3;
}

- (void).cxx_destruct
{
}

@end