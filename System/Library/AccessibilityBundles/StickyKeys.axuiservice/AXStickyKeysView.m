@interface AXStickyKeysView
- (AXStickyKeysView)initWithFrame:(CGRect)a3;
- (BOOL)accessibilityElementsHidden;
- (NSMutableArray)allStickyKeyHorizontalConstraints;
- (NSMutableArray)allStickyKeyLabels;
- (UIVisualEffectView)hudBackgroundView;
- (id)_newStickyKeyLabelForString:(id)a3;
- (void)_setUpHUDBackgroundViewAndAddConstraints:(id)a3;
- (void)addStickyKeyString:(id)a3;
- (void)highlightStickyKeyString:(id)a3;
- (void)removeAllStickyKeyStringsWithCompletion:(id)a3;
- (void)removeStickyKeyString:(id)a3;
- (void)setAllStickyKeyHorizontalConstraints:(id)a3;
- (void)setAllStickyKeyLabels:(id)a3;
- (void)setHudBackgroundView:(id)a3;
@end

@implementation AXStickyKeysView

- (AXStickyKeysView)initWithFrame:(CGRect)a3
{
  v7.receiver = self;
  v7.super_class = (Class)AXStickyKeysView;
  v3 = -[AXStickyKeysView initWithFrame:](&v7, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = +[NSMutableArray array];
    [(AXStickyKeysView *)v3 setAllStickyKeyLabels:v4];

    v5 = +[NSMutableArray array];
    [(AXStickyKeysView *)v3 setAllStickyKeyHorizontalConstraints:v5];
  }
  return v3;
}

- (void)addStickyKeyString:(id)a3
{
  id v4 = a3;
  v5 = +[NSMutableArray array];
  uint64_t v6 = +[NSMutableArray array];
  objc_super v7 = +[NSMutableArray array];
  v8 = [(AXStickyKeysView *)self allStickyKeyLabels];
  id v9 = [v8 count];

  v57 = (void *)v6;
  if (v9)
  {
    id v10 = [(AXStickyKeysView *)self _newStickyKeyLabelForString:v4];
    [v10 setAlpha:0.0];
  }
  else
  {
    [(AXStickyKeysView *)self _setUpHUDBackgroundViewAndAddConstraints:v5];
    id v10 = [(AXStickyKeysView *)self _newStickyKeyLabelForString:v4];
  }
  v11 = [(AXStickyKeysView *)self hudBackgroundView];
  v12 = [v11 contentView];
  [v12 addSubview:v10];

  v13 = [(AXStickyKeysView *)self hudBackgroundView];
  v14 = +[NSLayoutConstraint constraintWithItem:v10 attribute:11 relatedBy:0 toItem:v13 attribute:3 multiplier:1.0 constant:55.0];
  [v5 addObject:v14];

  v15 = [(AXStickyKeysView *)self hudBackgroundView];
  v16 = +[NSLayoutConstraint constraintWithItem:v10 attribute:5 relatedBy:0 toItem:v15 attribute:5 multiplier:1.0 constant:15.0];

  v17 = [(AXStickyKeysView *)self allStickyKeyLabels];
  id v18 = [v17 count];

  v58 = v5;
  if (v18)
  {
    v55 = v7;
    id v56 = v4;
    v19 = [(AXStickyKeysView *)self allStickyKeyLabels];
    uint64_t v20 = [v19 lastObject];

    v53 = (void *)v20;
    uint64_t v54 = +[NSLayoutConstraint constraintWithItem:v10 attribute:6 relatedBy:0 toItem:v20 attribute:5 multiplier:1.0 constant:0.0];
    v21 = [(AXStickyKeysView *)self allStickyKeyHorizontalConstraints];
    v22 = (char *)[v21 count];
    v23 = [(AXStickyKeysView *)self allStickyKeyLabels];
    v24 = (char *)[v23 count] + 1;

    if (v22 != v24) {
      _AXAssert();
    }
    v25 = [(AXStickyKeysView *)self allStickyKeyHorizontalConstraints];
    v52 = [v25 lastObject];

    v26 = [(AXStickyKeysView *)self allStickyKeyHorizontalConstraints];
    v27 = [(AXStickyKeysView *)self allStickyKeyHorizontalConstraints];
    v28 = objc_msgSend(v26, "objectAtIndex:", (char *)objc_msgSend(v27, "count") - 2);

    id v29 = [v28 firstAttribute];
    id v30 = [v28 relation];
    v31 = [v28 secondItem];
    id v32 = [v28 secondAttribute];
    [v28 multiplier];
    double v34 = v33;
    [v28 constant];
    v36 = +[NSLayoutConstraint constraintWithItem:v10 attribute:v29 relatedBy:v30 toItem:v31 attribute:v32 multiplier:v34 constant:v35];

    [v58 addObject:v36];
    v66[0] = v16;
    v66[1] = v54;
    v37 = +[NSArray arrayWithObjects:v66 count:2];
    v38 = v57;
    [v57 addObjectsFromArray:v37];

    v65[0] = v52;
    v65[1] = v36;
    v39 = +[NSArray arrayWithObjects:v65 count:2];
    [v55 addObjectsFromArray:v39];

    v40 = &AudioServicesPlaySystemSound_ptr;
    uint64_t v41 = v54;

    objc_super v7 = v55;
    id v4 = v56;
    v42 = v53;
  }
  else
  {
    v43 = [(AXStickyKeysView *)self hudBackgroundView];
    uint64_t v41 = +[NSLayoutConstraint constraintWithItem:v10 attribute:6 relatedBy:0 toItem:v43 attribute:6 multiplier:1.0 constant:-15.0];

    v64[0] = v16;
    v64[1] = v41;
    v42 = +[NSArray arrayWithObjects:v64 count:2];
    [v5 addObjectsFromArray:v42];
    v40 = &AudioServicesPlaySystemSound_ptr;
    v38 = v57;
  }

  v44 = [(AXStickyKeysView *)self allStickyKeyLabels];
  [v44 addObject:v10];

  v45 = [(AXStickyKeysView *)self allStickyKeyHorizontalConstraints];
  [v45 removeLastObject];

  v46 = [(AXStickyKeysView *)self allStickyKeyHorizontalConstraints];
  v63[0] = v41;
  v63[1] = v16;
  v47 = [v40[45] arrayWithObjects:v63 count:2];
  [v46 addObjectsFromArray:v47];

  [(AXStickyKeysView *)self addConstraints:v58];
  [(AXStickyKeysView *)self layoutIfNeeded];
  v59[0] = _NSConcreteStackBlock;
  v59[1] = 3221225472;
  v59[2] = sub_4A8C;
  v59[3] = &unk_8218;
  v59[4] = self;
  id v60 = v7;
  id v61 = v38;
  id v62 = v10;
  id v48 = v10;
  id v49 = v38;
  v50 = (void *)v41;
  id v51 = v7;
  +[UIView animateWithDuration:v59 animations:0.25];
}

- (void)highlightStickyKeyString:(id)a3
{
  id v4 = a3;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  v5 = [(AXStickyKeysView *)self allStickyKeyLabels];
  id v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v15;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        v11 = [v10 text];
        unsigned int v12 = [v11 isEqualToString:v4];

        if (v12)
        {
          v13 = +[UIColor whiteColor];
          [v10 setTextColor:v13];

          goto LABEL_11;
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_11:
}

- (void)removeStickyKeyString:(id)a3
{
  id v4 = a3;
  v5 = +[NSMutableArray array];
  id v6 = +[NSMutableArray array];
  id v7 = [(AXStickyKeysView *)self allStickyKeyLabels];
  uint64_t v8 = (char *)[v7 count];

  if (v8)
  {
    id v9 = 0;
    while (1)
    {
      id v10 = [(AXStickyKeysView *)self allStickyKeyLabels];
      v11 = [v10 objectAtIndexedSubscript:v9];

      unsigned int v12 = [v11 text];
      unsigned int v13 = [v12 isEqualToString:v4];

      if (v13) {
        break;
      }
      [(AXStickyKeysView *)self removeConstraints:v6];
      [(AXStickyKeysView *)self addConstraints:v5];

      if (v8 == ++v9) {
        goto LABEL_15;
      }
    }
    long long v14 = v8 - 1;
    BOOL v15 = v8 == (unsigned char *)&dword_0 + 1;
    if (v8 != (unsigned char *)&dword_0 + 1)
    {
      long long v16 = [(AXStickyKeysView *)self allStickyKeyHorizontalConstraints];
      long long v17 = [v16 objectAtIndexedSubscript:v9];

      id v18 = &AudioServicesPlaySystemSound_ptr;
      BOOL v66 = v15;
      v64 = v14;
      if (v14 != v9)
      {
        v19 = [(AXStickyKeysView *)self allStickyKeyLabels];
        id v62 = [v19 objectAtIndexedSubscript:v9 + 1];

        uint64_t v20 = [(AXStickyKeysView *)self allStickyKeyHorizontalConstraints];
        id v60 = [v20 objectAtIndexedSubscript:v9 + 1];

        id v56 = [v17 firstAttribute];
        id v21 = [v17 relation];
        [v17 secondItem];
        v23 = v22 = v17;
        id v24 = [v22 secondAttribute];
        [v22 multiplier];
        double v26 = v25;
        [v22 constant];
        id v27 = v21;
        BOOL v15 = v66;
        id v29 = +[NSLayoutConstraint constraintWithItem:v62 attribute:v56 relatedBy:v27 toItem:v23 attribute:v24 multiplier:v26 constant:v28];

        [v6 addObject:v60];
        [v5 addObject:v29];
        id v30 = [(AXStickyKeysView *)self allStickyKeyHorizontalConstraints];
        [v30 setObject:v29 atIndexedSubscript:v9];

        long long v17 = v22;
        id v18 = &AudioServicesPlaySystemSound_ptr;
      }
      if (v9)
      {
        id v61 = v17;
        v31 = v18;
        id v32 = [(AXStickyKeysView *)self allStickyKeyLabels];
        v63 = [v32 objectAtIndexedSubscript:v9 - 1];

        double v33 = [(AXStickyKeysView *)self allStickyKeyHorizontalConstraints];
        double v34 = [v33 objectAtIndexedSubscript:v9 - 1];

        v59 = v31[46];
        double v35 = v34;
        id v57 = [v34 firstAttribute];
        id v36 = [v34 relation];
        v37 = [v34 secondItem];
        id v38 = [v34 secondAttribute];
        [v35 multiplier];
        double v40 = v39;
        [v35 constant];
        v42 = [v59 constraintWithItem:v11 attribute:v57 relatedBy:v36 toItem:v37 attribute:v38 multiplier:v40 constant:v41];

        if (v64 == v9)
        {
          v43 = [(AXStickyKeysView *)self allStickyKeyHorizontalConstraints];
          [v43 objectAtIndexedSubscript:v9 + 1];
          v44 = v65 = v42;

          id v58 = [v44 firstAttribute];
          id v55 = [v44 relation];
          v45 = [v44 secondItem];
          id v46 = [v44 secondAttribute];
          [v44 multiplier];
          double v48 = v47;
          [v44 constant];
          v50 = +[NSLayoutConstraint constraintWithItem:v63 attribute:v58 relatedBy:v55 toItem:v45 attribute:v46 multiplier:v48 constant:v49];

          [v6 addObject:v44];
          [v5 addObject:v50];
          id v51 = [(AXStickyKeysView *)self allStickyKeyHorizontalConstraints];
          [v51 setObject:v50 atIndexedSubscript:v9];

          v42 = v65;
        }
        long long v17 = v61;
        [v6 addObject:v61];
        [v5 addObject:v42];

        BOOL v15 = v66;
      }
    }
    v52 = [(AXStickyKeysView *)self allStickyKeyLabels];
    [v52 removeObjectAtIndex:v9];

    v53 = [(AXStickyKeysView *)self allStickyKeyHorizontalConstraints];
    [v53 removeObjectAtIndex:v9 + 1];

    [(AXStickyKeysView *)self layoutIfNeeded];
    v70[0] = _NSConcreteStackBlock;
    v70[1] = 3221225472;
    v70[2] = sub_5218;
    v70[3] = &unk_8240;
    BOOL v74 = v15;
    v70[4] = self;
    id v71 = v11;
    id v72 = v6;
    id v73 = v5;
    v67[0] = _NSConcreteStackBlock;
    v67[1] = 3221225472;
    v67[2] = sub_5298;
    v67[3] = &unk_8268;
    id v68 = v71;
    v69 = self;
    id v54 = v71;
    +[UIView animateWithDuration:v70 animations:v67 completion:0.25];
  }
LABEL_15:
}

- (void)removeAllStickyKeyStringsWithCompletion:(id)a3
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_540C;
  v6[3] = &unk_8290;
  v6[4] = self;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_5454;
  v4[3] = &unk_82B8;
  v4[4] = self;
  id v5 = a3;
  id v3 = v5;
  +[UIView animateWithDuration:v6 animations:v4 completion:0.25];
}

- (void)_setUpHUDBackgroundViewAndAddConstraints:(id)a3
{
  id v4 = a3;
  id v5 = [(AXStickyKeysView *)self hudBackgroundView];

  if (!v5)
  {
    id v6 = objc_alloc((Class)UIVisualEffectView);
    id v7 = +[UIBlurEffect effectWithStyle:2];
    id v8 = [v6 initWithEffect:v7];

    id v9 = [v8 layer];
    [v9 setCornerRadius:10.0];

    [v8 setClipsToBounds:1];
    [v8 setTranslatesAutoresizingMaskIntoConstraints:0];
    [v8 setAlpha:0.0];
    [(AXStickyKeysView *)self addSubview:v8];
    id v10 = +[NSLayoutConstraint constraintWithItem:v8 attribute:6 relatedBy:0 toItem:self attribute:6 multiplier:1.0 constant:-18.0];
    v11 = +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v8, 3, 0, self, 3, 1.0, 47.0, v10);
    v14[1] = v11;
    unsigned int v12 = +[NSLayoutConstraint constraintWithItem:v8 attribute:8 relatedBy:0 toItem:0 attribute:0 multiplier:0.0 constant:75.0];
    v14[2] = v12;
    unsigned int v13 = +[NSArray arrayWithObjects:v14 count:3];
    [v4 addObjectsFromArray:v13];

    [(AXStickyKeysView *)self setHudBackgroundView:v8];
  }
}

- (id)_newStickyKeyLabelForString:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)UILabel);
  [v4 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v4 setText:v3];
  unsigned __int8 v5 = [v3 isEqualToString:@"fn"];

  if (v5) {
    +[UIFont systemFontOfSize:44.0];
  }
  else {
  id v6 = +[UIFont boldSystemFontOfSize:44.0];
  }
  [v4 setFont:v6];

  id v7 = +[UIColor colorWithWhite:1.0 alpha:0.7];
  [v4 setTextColor:v7];

  [v4 _setDrawsAsBackdropOverlayWithBlendMode:3];
  return v4;
}

- (BOOL)accessibilityElementsHidden
{
  return 1;
}

- (NSMutableArray)allStickyKeyLabels
{
  return self->_allStickyKeyLabels;
}

- (void)setAllStickyKeyLabels:(id)a3
{
}

- (NSMutableArray)allStickyKeyHorizontalConstraints
{
  return self->_allStickyKeyHorizontalConstraints;
}

- (void)setAllStickyKeyHorizontalConstraints:(id)a3
{
}

- (UIVisualEffectView)hudBackgroundView
{
  return self->_hudBackgroundView;
}

- (void)setHudBackgroundView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hudBackgroundView, 0);
  objc_storeStrong((id *)&self->_allStickyKeyHorizontalConstraints, 0);

  objc_storeStrong((id *)&self->_allStickyKeyLabels, 0);
}

@end