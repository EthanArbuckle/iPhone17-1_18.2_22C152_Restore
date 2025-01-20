@interface GKBasePlayerCell
+ (BOOL)requiresConstraintBasedLayout;
+ (double)defaultRowHeight;
+ (id)itemHeightList;
+ (id)itemHeightListForIdiom:(int64_t)a3;
+ (id)padMetrics;
+ (id)phoneMetrics;
+ (void)initialize;
- (BOOL)canRemoveItem;
- (CGRect)alignmentRectForText;
- (GKBasePlayerCell)initWithFrame:(CGRect)a3;
- (GKDashboardPlayerPhotoView)iconView;
- (NSDictionary)metricsOverrides;
- (UILabel)nameLabel;
- (void)didUpdateModel;
- (void)prepareForReuse;
- (void)setIconView:(id)a3;
- (void)setMetricsOverrides:(id)a3;
- (void)setNameLabel:(id)a3;
- (void)setRepresentedItem:(id)a3;
@end

@implementation GKBasePlayerCell

+ (void)initialize
{
  v6[1] = *MEMORY[0x1E4F143B8];
  v2 = objc_opt_class();
  v6[0] = objc_opt_class();
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:1];
  v4 = [v2 appearanceWhenContainedInInstancesOfClasses:v3];

  v5 = [(id)objc_opt_class() phoneMetrics];
  [v4 setMetricsOverrides:v5];
}

+ (BOOL)requiresConstraintBasedLayout
{
  return 1;
}

+ (id)itemHeightList
{
  v3 = [MEMORY[0x1E4FB16C8] currentDevice];
  uint64_t v4 = [v3 userInterfaceIdiom];

  if (v4 == 1)
  {
    if (*MEMORY[0x1E4F63830]) {
      BOOL v5 = *MEMORY[0x1E4F63A38] == 0;
    }
    else {
      BOOL v5 = 0;
    }
    uint64_t v6 = !v5;
  }
  else
  {
    uint64_t v6 = 0;
  }

  return (id)[a1 itemHeightListForIdiom:v6];
}

+ (id)itemHeightListForIdiom:(int64_t)a3
{
  v12[2] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *MEMORY[0x1E4FB28C8];
  if (a3 == 1)
  {
    v11[0] = @"GKFixedHeightSentinel";
    v11[1] = v3;
    v12[0] = &unk_1F0811D00;
    v12[1] = &unk_1F08125D8;
    uint64_t v4 = (void *)MEMORY[0x1E4F1C9E8];
    BOOL v5 = v12;
    uint64_t v6 = v11;
  }
  else
  {
    v9[0] = @"GKFixedHeightSentinel";
    v9[1] = v3;
    v10[0] = &unk_1F08125E8;
    v10[1] = &unk_1F08125D8;
    uint64_t v4 = (void *)MEMORY[0x1E4F1C9E8];
    BOOL v5 = v10;
    uint64_t v6 = v9;
  }
  v7 = [v4 dictionaryWithObjects:v5 forKeys:v6 count:2];

  return v7;
}

+ (id)padMetrics
{
  v2 = objc_opt_class();

  return (id)[v2 _gkStandardConstraintMetricsForIdiom:1];
}

+ (id)phoneMetrics
{
  v2 = objc_opt_class();

  return (id)[v2 _gkStandardConstraintMetricsForIdiom:0];
}

+ (double)defaultRowHeight
{
  v2 = [MEMORY[0x1E4FB16C8] currentDevice];
  uint64_t v3 = [v2 userInterfaceIdiom];

  if (v3 != 1) {
    return 65.0;
  }
  if (*MEMORY[0x1E4F63A38]) {
    BOOL v4 = 1;
  }
  else {
    BOOL v4 = *MEMORY[0x1E4F63830] == 0;
  }
  double result = 65.0;
  if (v4) {
    return 90.0;
  }
  return result;
}

- (CGRect)alignmentRectForText
{
  [(UILabel *)self->_nameLabel frame];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  v11 = [(UILabel *)self->_nameLabel superview];
  -[GKBasePlayerCell convertRect:fromView:](self, "convertRect:fromView:", v11, v4, v6, v8, v10);
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;

  double v20 = v13;
  double v21 = v15;
  double v22 = v17;
  double v23 = v19;
  result.size.height = v23;
  result.size.width = v22;
  result.origin.y = v21;
  result.origin.x = v20;
  return result;
}

- (GKBasePlayerCell)initWithFrame:(CGRect)a3
{
  v16.receiver = self;
  v16.super_class = (Class)GKBasePlayerCell;
  double v3 = -[GKCollectionViewCell initWithFrame:](&v16, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    double v4 = [GKDashboardPlayerPhotoView alloc];
    uint64_t v5 = -[GKDashboardPlayerPhotoView initWithFrame:](v4, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    iconView = v3->_iconView;
    v3->_iconView = (GKDashboardPlayerPhotoView *)v5;

    [(GKDashboardPlayerPhotoView *)v3->_iconView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(GKDashboardPlayerPhotoView *)v3->_iconView setAvatarSize:0x10000];
    uint64_t v7 = [(UICollectionReusableView *)v3 _gkNewStandardTitleLabel];
    nameLabel = v3->_nameLabel;
    v3->_nameLabel = (UILabel *)v7;

    double v9 = [(GKCollectionViewCell *)v3 staticContentView];
    [v9 addSubview:v3->_nameLabel];

    double v10 = [(GKCollectionViewCell *)v3 staticContentView];
    [v10 addSubview:v3->_iconView];

    v11 = [MEMORY[0x1E4FB16C8] currentDevice];
    uint64_t v12 = [v11 userInterfaceIdiom];

    if (v12 == 1 && (!*MEMORY[0x1E4F63830] || *MEMORY[0x1E4F63A38]))
    {
      double v13 = [(id)objc_opt_class() padMetrics];
    }
    else
    {
      double v13 = [(id)objc_opt_class() phoneMetrics];
    }
    double v14 = v13;
    objc_storeStrong((id *)&v3->_metricsOverrides, v13);
  }
  return v3;
}

- (void)setRepresentedItem:(id)a3
{
  id v4 = a3;
  id v5 = [(GKCollectionViewCell *)self representedItem];
  if (v5 != v4)
  {
    double v6 = [(GKBasePlayerCell *)self iconView];
    [v6 setPlayer:v4];

    v7.receiver = self;
    v7.super_class = (Class)GKBasePlayerCell;
    [(GKCollectionViewCell *)&v7 setRepresentedItem:v4];
  }
}

- (void)didUpdateModel
{
  id v4 = [(GKBasePlayerCell *)self player];
  double v3 = [v4 displayNameWithOptions:0];
  [(UILabel *)self->_nameLabel setText:v3];
}

- (BOOL)canRemoveItem
{
  return 1;
}

- (void)prepareForReuse
{
  v3.receiver = self;
  v3.super_class = (Class)GKBasePlayerCell;
  [(GKCollectionViewCell *)&v3 prepareForReuse];
  [(GKDashboardPlayerPhotoView *)self->_iconView setPlayer:0];
}

- (void)setMetricsOverrides:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = (NSDictionary *)a3;
  if (self->_metricsOverrides != v5)
  {
    objc_storeStrong((id *)&self->_metricsOverrides, a3);
    double v6 = [(GKBasePlayerCell *)self iconView];
    objc_super v7 = [(NSDictionary *)self->_metricsOverrides objectForKeyedSubscript:@"iconSize"];
    [v7 doubleValue];
    double v9 = v8;

    if (v9 > 0.0)
    {
      long long v22 = 0u;
      long long v23 = 0u;
      long long v20 = 0u;
      long long v21 = 0u;
      double v10 = [(GKCollectionViewCell *)self staticContentView];
      v11 = [v10 constraints];

      uint64_t v12 = [v11 countByEnumeratingWithState:&v20 objects:v24 count:16];
      if (v12)
      {
        uint64_t v13 = v12;
        uint64_t v14 = *(void *)v21;
        do
        {
          uint64_t v15 = 0;
          do
          {
            if (*(void *)v21 != v14) {
              objc_enumerationMutation(v11);
            }
            objc_super v16 = *(void **)(*((void *)&v20 + 1) + 8 * v15);
            double v17 = [v16 firstItem];
            if (v17 == v6 && ![v16 relation])
            {
              double v18 = [v16 secondItem];

              if (!v18 && ([v16 firstAttribute] == 8 || objc_msgSend(v16, "firstAttribute") == 7)) {
                [v16 setConstant:v9];
              }
            }
            else
            {
            }
            ++v15;
          }
          while (v13 != v15);
          uint64_t v19 = [v11 countByEnumeratingWithState:&v20 objects:v24 count:16];
          uint64_t v13 = v19;
        }
        while (v19);
      }
    }
  }
}

- (UILabel)nameLabel
{
  return self->_nameLabel;
}

- (void)setNameLabel:(id)a3
{
}

- (GKDashboardPlayerPhotoView)iconView
{
  return self->_iconView;
}

- (void)setIconView:(id)a3
{
}

- (NSDictionary)metricsOverrides
{
  return self->_metricsOverrides;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metricsOverrides, 0);
  objc_storeStrong((id *)&self->_iconView, 0);

  objc_storeStrong((id *)&self->_nameLabel, 0);
}

@end