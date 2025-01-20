@interface GKSearchBarView
+ (BOOL)requiresConstraintBasedLayout;
+ (double)defaultHeight;
+ (void)initialize;
- (GKSearchBar)searchBar;
- (GKSearchBarView)initWithFrame:(CGRect)a3;
- (NSArray)searchBarConstraints;
- (NSNumber)usePadConstraints;
- (UISearchBarDelegate)delegate;
- (double)leadingMargin;
- (double)trailingMargin;
- (void)applyLayoutAttributes:(id)a3;
- (void)establishSearchBarConstraints;
- (void)prepareForReuse;
- (void)setDelegate:(id)a3;
- (void)setLeadingMargin:(double)a3;
- (void)setSearchBar:(id)a3;
- (void)setSearchBarConstraints:(id)a3;
- (void)setTrailingMargin:(double)a3;
- (void)setUsePadConstraints:(id)a3;
- (void)updateConstraints;
@end

@implementation GKSearchBarView

+ (BOOL)requiresConstraintBasedLayout
{
  return 1;
}

+ (void)initialize
{
  v23[2] = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4FB1E20] traitCollectionWithUserInterfaceIdiom:1];
  v19 = [MEMORY[0x1E4FB1E20] traitCollectionWithHorizontalSizeClass:1];
  v18 = [MEMORY[0x1E4FB1E20] traitCollectionWithHorizontalSizeClass:2];
  v3 = (void *)MEMORY[0x1E4FB1E20];
  v23[0] = v2;
  v23[1] = v19;
  v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:2];
  v5 = [v3 traitCollectionWithTraitsFromCollections:v4];

  v6 = (void *)MEMORY[0x1E4FB1E20];
  v22[0] = v2;
  v22[1] = v18;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:2];
  v8 = [v6 traitCollectionWithTraitsFromCollections:v7];

  v9 = [(id)objc_opt_class() appearanceForTraitCollection:v5];
  uint64_t v10 = MEMORY[0x1E4F1CC28];
  [v9 setUsePadConstraints:MEMORY[0x1E4F1CC28]];
  v11 = [(id)objc_opt_class() appearanceForTraitCollection:v8];
  [v11 setUsePadConstraints:MEMORY[0x1E4F1CC38]];
  v12 = objc_opt_class();
  uint64_t v21 = objc_opt_class();
  v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v21 count:1];
  v14 = [v12 appearanceWhenContainedInInstancesOfClasses:v13];

  [v14 setUsePadConstraints:v10];
  v15 = objc_opt_class();
  uint64_t v20 = objc_opt_class();
  v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v20 count:1];
  v17 = [v15 appearanceWhenContainedInInstancesOfClasses:v16];

  [v17 setUsePadConstraints:v10];
}

+ (double)defaultHeight
{
  return 45.0;
}

- (GKSearchBarView)initWithFrame:(CGRect)a3
{
  v17.receiver = self;
  v17.super_class = (Class)GKSearchBarView;
  v3 = -[GKSearchBarView initWithFrame:](&v17, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_alloc_init(GKSearchBar);
    searchBar = v3->_searchBar;
    v3->_searchBar = v4;

    [(GKSearchBar *)v3->_searchBar setBackgroundColor:0];
    [(GKSearchBar *)v3->_searchBar setTranslatesAutoresizingMaskIntoConstraints:0];
    [(GKSearchBar *)v3->_searchBar setOpaque:0];
    [(GKSearchBar *)v3->_searchBar setSearchBarStyle:2];
    v6 = GKGameCenterUIFrameworkBundle();
    v7 = GKGetLocalizedStringFromTableInBundle();
    [(GKSearchBar *)v3->_searchBar setPlaceholder:v7];

    [(GKSearchBarView *)v3 addSubview:v3->_searchBar];
    v8 = [MEMORY[0x1E4F28DC8] constraintWithItem:v3->_searchBar attribute:3 relatedBy:0 toItem:v3 attribute:3 multiplier:1.0 constant:0.0];
    [(GKSearchBarView *)v3 addConstraint:v8];

    v9 = NSNumber;
    uint64_t v10 = [MEMORY[0x1E4FB16C8] currentDevice];
    uint64_t v11 = [v10 userInterfaceIdiom];

    uint64_t v12 = 0;
    if (v11 == 1)
    {
      if (*MEMORY[0x1E4F63830]) {
        BOOL v13 = *MEMORY[0x1E4F63A38] == 0;
      }
      else {
        BOOL v13 = 0;
      }
      uint64_t v12 = !v13;
    }
    uint64_t v14 = [v9 numberWithBool:v12];
    usePadConstraints = v3->_usePadConstraints;
    v3->_usePadConstraints = (NSNumber *)v14;
  }
  return v3;
}

- (void)updateConstraints
{
  v3.receiver = self;
  v3.super_class = (Class)GKSearchBarView;
  [(GKSearchBarView *)&v3 updateConstraints];
  if (!self->_searchBarConstraints) {
    [(GKSearchBarView *)self establishSearchBarConstraints];
  }
}

- (void)establishSearchBarConstraints
{
  if (self->_searchBarConstraints) {
    -[GKSearchBarView removeConstraints:](self, "removeConstraints:");
  }
  id v14 = [MEMORY[0x1E4F1CA48] array];
  BOOL v3 = [(NSNumber *)self->_usePadConstraints BOOLValue];
  v4 = (void *)MEMORY[0x1E4F28DC8];
  if (v3)
  {
    v5 = [MEMORY[0x1E4F28DC8] constraintWithItem:self->_searchBar attribute:7 relatedBy:0 toItem:0 attribute:0 multiplier:1.0 constant:540.0];
    [v14 addObject:v5];

    v6 = [MEMORY[0x1E4F28DC8] constraintWithItem:self->_searchBar attribute:9 relatedBy:0 toItem:self attribute:9 multiplier:1.0 constant:0.0];
    [v14 addObject:v6];
  }
  else
  {
    v7 = _NSDictionaryOfVariableBindings(&cfstr_Searchbar_1.isa, self->_searchBar, 0);
    v8 = [v4 constraintsWithVisualFormat:@"|[_searchBar]|" options:0 metrics:0 views:v7];
    [v14 addObjectsFromArray:v8];

    v9 = [v14 firstObject];
    uint64_t v10 = [v14 lastObject];
    [(UICollectionReusableView *)self _gkSetLeadingGuideConstraint:v9 trailingGuideConstraint:v10];

    [(GKSearchBarView *)self leadingMargin];
    double v12 = v11;
    [(GKSearchBarView *)self trailingMargin];
    if (v12 >= v13) {
      double v13 = v12;
    }
    [MEMORY[0x1E4FB1560] _gkAdjustConstraintMargins:v14 leading:v13 trailing:v13];
  }
  [(GKSearchBarView *)self setSearchBarConstraints:v14];
  [(GKSearchBarView *)self addConstraints:self->_searchBarConstraints];
}

- (void)setUsePadConstraints:(id)a3
{
  v5 = (NSNumber *)a3;
  p_usePadConstraints = &self->_usePadConstraints;
  if (self->_usePadConstraints != v5)
  {
    v7 = v5;
    objc_storeStrong((id *)p_usePadConstraints, a3);
    if (self->_searchBarConstraints)
    {
      -[GKSearchBarView removeConstraints:](self, "removeConstraints:");
      [(GKSearchBarView *)self setSearchBarConstraints:0];
    }
    p_usePadConstraints = (NSNumber **)[(GKSearchBarView *)self setNeedsUpdateConstraints];
    v5 = v7;
  }

  MEMORY[0x1F41817F8](p_usePadConstraints, v5);
}

- (void)applyLayoutAttributes:(id)a3
{
  id v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)GKSearchBarView;
  [(GKSearchBarView *)&v26 applyLayoutAttributes:v4];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    v6 = [v5 dataSource];
    v7 = [(GKSearchBarView *)self searchBar];
    [v7 setDataSource:v6];

    [v5 leadingMargin];
    double v9 = v8;
    [v5 trailingMargin];
    double v11 = v10;
    double v12 = [MEMORY[0x1E4FB16C8] currentDevice];
    uint64_t v13 = [v12 userInterfaceIdiom];

    if (!v13)
    {
      if (([MEMORY[0x1E4FB1BA8] mainScreen],
            id v14 = objc_claimAutoreleasedReturnValue(),
            [v14 bounds],
            double v16 = v15,
            double v18 = v17,
            v14,
            v16 >= 414.0)
        && v18 >= 736.0
        || (v18 >= 414.0 ? (BOOL v19 = v16 < 736.0) : (BOOL v19 = 1), !v19))
      {
        double v11 = v11 + -8.0;
        double v9 = v9 + -8.0;
      }
    }
    [(GKSearchBarView *)self setLeadingMargin:v9];
    [(GKSearchBarView *)self setTrailingMargin:v11];
    uint64_t v20 = [(GKSearchBarView *)self searchBarConstraints];
    if (v20)
    {
      if (v9 < v11) {
        double v9 = v11;
      }
      uint64_t v21 = (void *)MEMORY[0x1E4FB1560];
      v22 = [(GKSearchBarView *)self searchBarConstraints];
      [v21 _gkAdjustConstraintMargins:v22 leading:v9 trailing:v9];
    }
  }
  v23 = [v4 indexPath];
  uint64_t v24 = [v23 section];
  v25 = [(GKSearchBarView *)self searchBar];
  [v25 setSectionIndex:v24];
}

- (void)prepareForReuse
{
  v3.receiver = self;
  v3.super_class = (Class)GKSearchBarView;
  [(GKSearchBarView *)&v3 prepareForReuse];
  [(GKSearchBarView *)self setDelegate:0];
}

- (void)setDelegate:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_delegate, obj);
    [(GKSearchBar *)self->_searchBar setDelegate:obj];
  }
}

- (GKSearchBar)searchBar
{
  return self->_searchBar;
}

- (void)setSearchBar:(id)a3
{
}

- (NSNumber)usePadConstraints
{
  return self->_usePadConstraints;
}

- (UISearchBarDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (UISearchBarDelegate *)WeakRetained;
}

- (NSArray)searchBarConstraints
{
  return self->_searchBarConstraints;
}

- (void)setSearchBarConstraints:(id)a3
{
}

- (double)leadingMargin
{
  return self->_leadingMargin;
}

- (void)setLeadingMargin:(double)a3
{
  self->_leadingMargin = a3;
}

- (double)trailingMargin
{
  return self->_trailingMargin;
}

- (void)setTrailingMargin:(double)a3
{
  self->_trailingMargin = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchBarConstraints, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_usePadConstraints, 0);

  objc_storeStrong((id *)&self->_searchBar, 0);
}

@end