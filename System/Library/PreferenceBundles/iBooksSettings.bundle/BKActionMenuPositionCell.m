@interface BKActionMenuPositionCell
+ (int64_t)cellStyle;
- (BKActionMenuPositionCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5;
- (BKImageRadioButtonView)leftView;
- (BKImageRadioButtonView)rightView;
- (BOOL)isAccessibilityElement;
- (id)accessibilityElements;
- (void)_selectOnLeft:(BOOL)a3;
- (void)_setActionMenuOnLeft:(id)a3;
- (void)_setActionMenuOnRight:(id)a3;
- (void)_updateSelection:(BOOL)a3;
- (void)setLeftView:(id)a3;
- (void)setRightView:(id)a3;
@end

@implementation BKActionMenuPositionCell

+ (int64_t)cellStyle
{
  return 0;
}

- (BKActionMenuPositionCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5
{
  v92.receiver = self;
  v92.super_class = (Class)BKActionMenuPositionCell;
  v5 = [(BKActionMenuPositionCell *)&v92 initWithStyle:a3 reuseIdentifier:a4 specifier:a5];
  if (v5)
  {
    v6 = [BKImageRadioButtonView alloc];
    v7 = BKSettingsBundle();
    v8 = [v7 localizedStringForKey:@"Left" value:&stru_18CA0 table:@"Settings"];
    v9 = [(BKImageRadioButtonView *)v6 initWithImageName:@"ActionMenuSettingLeft" title:v8];

    objc_storeWeak((id *)&v5->_leftView, v9);
    v10 = [BKImageRadioButtonView alloc];
    v11 = BKSettingsBundle();
    v12 = [v11 localizedStringForKey:@"Right" value:&stru_18CA0 table:@"Settings"];
    v13 = [(BKImageRadioButtonView *)v10 initWithImageName:@"ActionMenuSettingRight" title:v12];

    objc_storeWeak((id *)&v5->_rightView, v13);
    v14 = +[BooksSettings shared];
    id v15 = [v14 menuOnLeft];

    [(BKActionMenuPositionCell *)v5 _updateSelection:v15];
    v16 = [(BKActionMenuPositionCell *)v5 contentView];
    [v16 addSubview:v9];

    v17 = [(BKActionMenuPositionCell *)v5 contentView];
    [v17 addSubview:v13];

    v18 = [[BKViewTapGestureRecognizer alloc] initWithTarget:v5 action:"_setActionMenuOnLeft:"];
    [(BKImageRadioButtonView *)v9 addGestureRecognizer:v18];

    v19 = [[BKViewTapGestureRecognizer alloc] initWithTarget:v5 action:"_setActionMenuOnRight:"];
    [(BKImageRadioButtonView *)v13 addGestureRecognizer:v19];

    v20 = objc_opt_new();
    v95[0] = v20;
    v21 = objc_opt_new();
    v95[1] = v21;
    v22 = objc_opt_new();
    v95[2] = v22;
    v23 = +[NSArray arrayWithObjects:v95 count:3];

    long long v90 = 0u;
    long long v91 = 0u;
    long long v88 = 0u;
    long long v89 = 0u;
    id v24 = v23;
    id v25 = [v24 countByEnumeratingWithState:&v88 objects:v94 count:16];
    if (v25)
    {
      id v26 = v25;
      uint64_t v27 = *(void *)v89;
      do
      {
        for (i = 0; i != v26; i = (char *)i + 1)
        {
          if (*(void *)v89 != v27) {
            objc_enumerationMutation(v24);
          }
          v29 = *(void **)(*((void *)&v88 + 1) + 8 * i);
          [v29 setTranslatesAutoresizingMaskIntoConstraints:0];
          v30 = [(BKActionMenuPositionCell *)v5 backgroundColor];
          [v29 setBackgroundColor:v30];

          v31 = [(BKActionMenuPositionCell *)v5 contentView];
          [v31 addSubview:v29];

          v32 = [v29 heightAnchor];
          v33 = [v32 constraintEqualToConstant:10.0];
          [v33 setActive:1];
        }
        id v26 = [v24 countByEnumeratingWithState:&v88 objects:v94 count:16];
      }
      while (v26);
    }

    v86 = [(BKImageRadioButtonView *)v9 topAnchor];
    v87 = [(BKActionMenuPositionCell *)v5 contentView];
    v85 = [v87 topAnchor];
    v84 = [v86 constraintEqualToAnchor:v85];
    v93[0] = v84;
    v82 = [(BKImageRadioButtonView *)v9 bottomAnchor];
    v83 = [(BKActionMenuPositionCell *)v5 contentView];
    v81 = [v83 bottomAnchor];
    v80 = [v82 constraintEqualToAnchor:v81];
    v93[1] = v80;
    v78 = [(BKImageRadioButtonView *)v13 topAnchor];
    v79 = [(BKActionMenuPositionCell *)v5 contentView];
    v77 = [v79 topAnchor];
    v76 = [v78 constraintEqualToAnchor:v77];
    v93[2] = v76;
    v74 = [(BKImageRadioButtonView *)v13 bottomAnchor];
    v75 = [(BKActionMenuPositionCell *)v5 contentView];
    v73 = [v75 bottomAnchor];
    v72 = [v74 constraintEqualToAnchor:v73];
    v93[3] = v72;
    v71 = [v24 objectAtIndexedSubscript:0];
    v70 = [v71 leftAnchor];
    v69 = [(BKActionMenuPositionCell *)v5 leftAnchor];
    v68 = [v70 constraintEqualToAnchor:v69];
    v93[4] = v68;
    v66 = [(BKImageRadioButtonView *)v9 leftAnchor];
    v67 = [v24 objectAtIndexedSubscript:0];
    v65 = [v67 rightAnchor];
    v64 = [v66 constraintEqualToAnchor:v65];
    v93[5] = v64;
    v63 = [v24 objectAtIndexedSubscript:1];
    v60 = [v63 leftAnchor];
    v59 = [(BKImageRadioButtonView *)v9 rightAnchor];
    v58 = [v60 constraintEqualToAnchor:v59];
    v93[6] = v58;
    v56 = [(BKImageRadioButtonView *)v13 leftAnchor];
    v57 = [v24 objectAtIndexedSubscript:1];
    v55 = [v57 rightAnchor];
    v54 = [v56 constraintEqualToAnchor:v55];
    v93[7] = v54;
    v53 = [v24 objectAtIndexedSubscript:2];
    v52 = [v53 leftAnchor];
    v51 = [(BKImageRadioButtonView *)v13 rightAnchor];
    v50 = [v52 constraintEqualToAnchor:v51];
    v93[8] = v50;
    v49 = [v24 objectAtIndexedSubscript:2];
    v48 = [v49 rightAnchor];
    v47 = [(BKActionMenuPositionCell *)v5 rightAnchor];
    v46 = [v48 constraintEqualToAnchor:v47];
    v93[9] = v46;
    v45 = [v24 objectAtIndexedSubscript:0];
    v43 = [v45 widthAnchor];
    v44 = [v24 objectAtIndexedSubscript:1];
    v34 = [v44 widthAnchor];
    [v43 constraintEqualToAnchor:v34];
    v35 = v62 = v9;
    v93[10] = v35;
    [v24 objectAtIndexedSubscript:1];
    v36 = v61 = v13;
    v37 = [v36 widthAnchor];
    v38 = [v24 objectAtIndexedSubscript:2];
    v39 = [v38 widthAnchor];
    v40 = [v37 constraintEqualToAnchor:v39];
    v93[11] = v40;
    v41 = +[NSArray arrayWithObjects:v93 count:12];
    +[NSLayoutConstraint activateConstraints:v41];

    [(BKActionMenuPositionCell *)v5 setShouldHideTitle:1];
  }
  return v5;
}

- (void)_setActionMenuOnLeft:(id)a3
{
}

- (void)_setActionMenuOnRight:(id)a3
{
}

- (void)_updateSelection:(BOOL)a3
{
  BOOL v3 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_leftView);
  [WeakRetained setSelected:v3];

  id v6 = objc_loadWeakRetained((id *)&self->_rightView);
  [v6 setSelected:v3 ^ 1];
}

- (void)_selectOnLeft:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = +[BooksSettings shared];
  [v5 setMenuOnLeft:v3];

  [(BKActionMenuPositionCell *)self _updateSelection:v3];
}

- (BOOL)isAccessibilityElement
{
  return 0;
}

- (id)accessibilityElements
{
  p_leftView = &self->_leftView;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_leftView);
  if (WeakRetained
    && (v5 = WeakRetained,
        p_rightView = &self->_rightView,
        id v7 = objc_loadWeakRetained((id *)p_rightView),
        v7,
        v5,
        v7))
  {
    id v8 = objc_loadWeakRetained((id *)p_leftView);
    v12[0] = v8;
    id v9 = objc_loadWeakRetained((id *)p_rightView);
    v12[1] = v9;
    v10 = +[NSArray arrayWithObjects:v12 count:2];
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (BKImageRadioButtonView)leftView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_leftView);

  return (BKImageRadioButtonView *)WeakRetained;
}

- (void)setLeftView:(id)a3
{
}

- (BKImageRadioButtonView)rightView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_rightView);

  return (BKImageRadioButtonView *)WeakRetained;
}

- (void)setRightView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_rightView);

  objc_destroyWeak((id *)&self->_leftView);
}

@end