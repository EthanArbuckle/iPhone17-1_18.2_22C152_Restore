@interface CARSettingsTablePanel
- (BOOL)showCellImages;
- (CARSettingsPanelTableSource)tableSource;
- (CARTableView)tableView;
- (NSArray)cellSpecifiers;
- (NSArray)specifierSections;
- (id)preferredFocusEnvironments;
- (void)_performBatchUpdatesForReloadIndexPaths:(id)a3 insertIndexPaths:(id)a4 removeIndexPaths:(id)a5;
- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4;
- (void)reloadSpecifiers;
- (void)setTableSource:(id)a3;
- (void)setTableView:(id)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation CARSettingsTablePanel

- (void)viewDidLoad
{
  v53.receiver = self;
  v53.super_class = (Class)CARSettingsTablePanel;
  [(CARSettingsPanel *)&v53 viewDidLoad];
  v3 = [CARSettingsPanelTableSource alloc];
  v4 = [(CARSettingsTablePanel *)self cellSpecifiers];
  v5 = [(CARSettingsTablePanel *)self specifierSections];
  v6 = [(CARSettingsPanelTableSource *)v3 initWithSpecifiers:v4 specifierSections:v5];
  [(CARSettingsTablePanel *)self setTableSource:v6];

  BOOL v7 = [(CARSettingsTablePanel *)self showCellImages];
  v8 = [(CARSettingsTablePanel *)self tableSource];
  [v8 setShowCellImages:v7];

  v9 = -[CARTableView initWithFrame:style:]([CARTableView alloc], "initWithFrame:style:", 0, CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  [(CARSettingsTablePanel *)self setTableView:v9];

  v10 = [(CARSettingsTablePanel *)self tableView];
  [v10 setTranslatesAutoresizingMaskIntoConstraints:0];

  v11 = [(CARSettingsTablePanel *)self tableSource];
  v12 = [(CARSettingsTablePanel *)self tableView];
  [v12 setDataSource:v11];

  v13 = [(CARSettingsTablePanel *)self tableSource];
  v14 = [(CARSettingsTablePanel *)self tableView];
  [v14 setDelegate:v13];

  double left = UIEdgeInsetsZero.left;
  double bottom = UIEdgeInsetsZero.bottom;
  double right = UIEdgeInsetsZero.right;
  v18 = [(CARSettingsTablePanel *)self tableView];
  [v18 setContentInset:UIEdgeInsetsZero.top, left, bottom, right];

  v19 = [(CARSettingsTablePanel *)self tableView];
  [v19 _setHeaderAndFooterViewsFloat:0];

  v20 = [(CARSettingsTablePanel *)self tableView];
  uint64_t v21 = objc_opt_class();
  v22 = +[CARSettingsTableViewCell reuseIdentifier];
  [v20 registerClass:v21 forCellReuseIdentifier:v22];

  v23 = [(CARSettingsTablePanel *)self tableView];
  uint64_t v24 = objc_opt_class();
  v25 = +[CARSettingsTableFooterView identifier];
  [v23 registerClass:v24 forHeaderFooterViewReuseIdentifier:v25];

  v26 = [(CARSettingsTablePanel *)self tableView];
  uint64_t v27 = objc_opt_class();
  v28 = +[CARSettingsTableHeaderView identifier];
  [v26 registerClass:v27 forHeaderFooterViewReuseIdentifier:v28];

  v29 = [(CARSettingsTablePanel *)self view];
  v30 = [(CARSettingsTablePanel *)self tableView];
  [v29 addSubview:v30];

  v52 = [(CARSettingsTablePanel *)self tableView];
  v50 = [v52 topAnchor];
  v51 = [(CARSettingsTablePanel *)self view];
  v49 = [v51 topAnchor];
  v48 = [v50 constraintEqualToAnchor:v49];
  v54[0] = v48;
  v47 = [(CARSettingsTablePanel *)self tableView];
  v45 = [v47 leftAnchor];
  v46 = [(CARSettingsTablePanel *)self view];
  v44 = [v46 leftAnchor];
  v43 = [v45 constraintEqualToAnchor:v44];
  v54[1] = v43;
  v42 = [(CARSettingsTablePanel *)self tableView];
  v41 = [v42 rightAnchor];
  v31 = [(CARSettingsTablePanel *)self view];
  v32 = [v31 rightAnchor];
  v33 = [v41 constraintEqualToAnchor:v32];
  v54[2] = v33;
  v34 = [(CARSettingsTablePanel *)self tableView];
  v35 = [v34 bottomAnchor];
  v36 = [(CARSettingsTablePanel *)self view];
  v37 = [v36 safeAreaLayoutGuide];
  v38 = [v37 bottomAnchor];
  v39 = [v35 constraintEqualToAnchor:v38];
  v54[3] = v39;
  v40 = +[NSArray arrayWithObjects:v54 count:4];
  +[NSLayoutConstraint activateConstraints:v40];
}

- (void)viewWillAppear:(BOOL)a3
{
  v4 = [(CARSettingsTablePanel *)self tableView];
  id v6 = [v4 indexPathForSelectedRow];

  if (v6)
  {
    v5 = [(CARSettingsTablePanel *)self tableView];
    [v5 deselectRowAtIndexPath:v6 animated:0];
  }
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  id v8 = a3;
  v4 = [v8 previouslyFocusedItem];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  id v6 = v8;
  if (isKindOfClass)
  {
    BOOL v7 = [v8 previouslyFocusedItem];
    if ([v7 isSelected]) {
      [v7 setSelected:0 animated:0];
    }
    if ([v7 isHighlighted]) {
      [v7 setHighlighted:0 animated:0];
    }

    id v6 = v8;
  }
}

- (id)preferredFocusEnvironments
{
  v3 = [(CARSettingsTablePanel *)self tableSource];
  v4 = [(CARSettingsTablePanel *)self tableView];
  v5 = [v3 preferredFocusEnvironmentsForTableView:v4];

  if (v5)
  {
    id v6 = v5;
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)CARSettingsTablePanel;
    id v6 = [(CARSettingsTablePanel *)&v9 preferredFocusEnvironments];
  }
  BOOL v7 = v6;

  return v7;
}

- (void)reloadSpecifiers
{
  v3 = [(CARSettingsTablePanel *)self cellSpecifiers];
  v4 = [(CARSettingsTablePanel *)self specifierSections];
  if ([v3 count]
    || ([(CARSettingsTablePanel *)self tableSource],
        v5 = objc_claimAutoreleasedReturnValue(),
        [v5 specifiers],
        id v6 = objc_claimAutoreleasedReturnValue(),
        id v7 = [v6 count],
        v6,
        v5,
        v7))
  {
    id v8 = [(CARSettingsTablePanel *)self cellSpecifiers];
    objc_super v9 = [(CARSettingsTablePanel *)self tableSource];
    [v9 setSpecifiers:v8];

    v10 = [(CARSettingsTablePanel *)self tableView];
    [v10 reloadData];

    goto LABEL_4;
  }
  if ([v4 count])
  {
    v11 = [(CARSettingsTablePanel *)self tableSource];
    v12 = [v11 specifierSections];
    id v13 = [v12 count];

    if (v13)
    {
      v14 = [(CARSettingsTablePanel *)self tableSource];
      v15 = [v14 specifierSections];

      v16 = [(CARSettingsTablePanel *)self tableSource];
      [v16 setSpecifierSections:v4];

      v17 = +[NSMutableIndexSet indexSet];
      uint64_t v18 = +[NSMutableIndexSet indexSet];
      uint64_t v19 = +[NSMutableIndexSet indexSet];
      uint64_t v20 = +[NSMutableIndexSet indexSet];
      v57 = +[NSMutableIndexSet indexSet];
      uint64_t v21 = (char *)[v15 count];
      v22 = (char *)[v4 count];
      if (v21 <= v22) {
        v23 = v22;
      }
      else {
        v23 = v21;
      }
      v51 = v4;
      objc_super v53 = (void *)v19;
      v54 = (void *)v18;
      v56 = (void *)v20;
      if (v23)
      {
        uint64_t v24 = 0;
        char v58 = 1;
        v55 = v17;
        while (1)
        {
          if (objc_msgSend(v15, "count", v51) <= v24)
          {
            v25 = 0;
          }
          else
          {
            v25 = [v15 objectAtIndexedSubscript:v24];
          }
          v26 = [(CARSettingsTablePanel *)self tableSource];
          uint64_t v27 = [v26 specifierSections];
          v28 = (char *)[v27 count];

          if (v28 <= v24)
          {
            BOOL v33 = 0;
            v31 = 0;
            BOOL v32 = v25 == 0;
          }
          else
          {
            v29 = [(CARSettingsTablePanel *)self tableSource];
            v30 = [v29 specifierSections];
            v31 = [v30 objectAtIndexedSubscript:v24];

            BOOL v32 = v25 == 0;
            BOOL v33 = v31 != 0;
            if (!v25 && v31)
            {
              v34 = v56;
LABEL_31:
              [v34 addIndex:v24];
              char v58 = 0;
              goto LABEL_32;
            }
          }
          if (!v32 && !v33)
          {
            v34 = v57;
            goto LABEL_31;
          }
          if (([v25 isEqualToSpecifierSection:v31] & 1) == 0)
          {
            v35 = [v25 specifiers];
            id v36 = [v35 count];
            v37 = [v31 specifiers];
            if (v36 == [v37 count])
            {
              unsigned __int8 v38 = [v25 hasEqualSpecifiers:v31];

              if (v38)
              {
                if ([v25 hasEqualHeader:v31])
                {
                  if (([v25 hasEqualFooter:v31] & 1) == 0)
                  {
                    [v53 addIndex:v24];
                    v39 = [(CARSettingsTablePanel *)self tableSource];
                    v40 = [v39 specifierSections];
                    BOOL v41 = v24 == (char *)[v40 count] - 1;

                    v58 &= v41;
                  }
                }
                else
                {
                  [v54 addIndex:v24];
                  char v58 = 0;
                }
                v17 = v55;
                goto LABEL_32;
              }
            }
            else
            {
            }
            v17 = v55;
            v34 = v55;
            goto LABEL_31;
          }
LABEL_32:

          if (v23 == ++v24) {
            goto LABEL_37;
          }
        }
      }
      char v58 = 1;
LABEL_37:
      v64[0] = _NSConcreteStackBlock;
      v64[1] = 3221225472;
      v64[2] = sub_100012FC8;
      v64[3] = &unk_100092268;
      v64[4] = self;
      [v54 enumerateIndexesUsingBlock:v64, v51];
      v63[0] = _NSConcreteStackBlock;
      v63[1] = 3221225472;
      v63[2] = sub_10001308C;
      v63[3] = &unk_100092268;
      v63[4] = self;
      [v53 enumerateIndexesUsingBlock:v63];
      if (v58)
      {
        v59[0] = _NSConcreteStackBlock;
        v59[1] = 3221225472;
        v59[2] = sub_100013150;
        v59[3] = &unk_100092290;
        v59[4] = self;
        id v60 = v17;
        v42 = v56;
        id v61 = v56;
        v43 = v57;
        id v62 = v57;
        +[UIView performWithoutAnimation:v59];
      }
      else
      {
        v44 = [(CARSettingsTablePanel *)self tableView];
        [v44 beginUpdates];

        v42 = v56;
        v43 = v57;
        [(CARSettingsTablePanel *)self _performBatchUpdatesForReloadIndexPaths:v17 insertIndexPaths:v56 removeIndexPaths:v57];
        v45 = [(CARSettingsTablePanel *)self tableView];
        [v45 endUpdates];
      }
      v4 = v52;
    }
  }
  v46 = [(CARSettingsTablePanel *)self tableSource];
  v47 = [v46 savedFocusedIndexPath];

  if (v47)
  {
    v48 = self;
    id v49 = [objc_alloc((Class)_UIFocusUpdateRequest) initWithEnvironment:v48];
    [v49 setAllowsDeferral:0];
    v50 = +[UIFocusSystem focusSystemForEnvironment:v48];

    [v50 _requestFocusUpdate:v49];
  }
LABEL_4:
}

- (void)_performBatchUpdatesForReloadIndexPaths:(id)a3 insertIndexPaths:(id)a4 removeIndexPaths:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([v8 count] || objc_msgSend(v9, "count") || objc_msgSend(v10, "count"))
  {
    v11 = [(CARSettingsTablePanel *)self tableView];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_1000132E4;
    v12[3] = &unk_100092290;
    id v13 = v10;
    v14 = self;
    id v15 = v9;
    id v16 = v8;
    [v11 performBatchUpdates:v12 completion:0];
  }
}

- (NSArray)cellSpecifiers
{
  return self->_cellSpecifiers;
}

- (NSArray)specifierSections
{
  return self->_specifierSections;
}

- (BOOL)showCellImages
{
  return self->_showCellImages;
}

- (CARTableView)tableView
{
  return self->_tableView;
}

- (void)setTableView:(id)a3
{
}

- (CARSettingsPanelTableSource)tableSource
{
  return self->_tableSource;
}

- (void)setTableSource:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tableSource, 0);
  objc_storeStrong((id *)&self->_tableView, 0);
  objc_storeStrong((id *)&self->_specifierSections, 0);

  objc_storeStrong((id *)&self->_cellSpecifiers, 0);
}

@end