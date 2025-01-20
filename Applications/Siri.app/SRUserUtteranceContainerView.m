@interface SRUserUtteranceContainerView
- (BOOL)isFirstResponder;
- (CGSize)sizeThatFits:(CGSize)a3;
- (SRUserUtteranceView)displayView;
- (UIView)tableView;
- (double)baselineOffsetFromBottom;
- (double)firstLineBaselineOffsetFromTop;
- (void)animateToDisplayWithDuration:(double)a3 completion:(id)a4;
- (void)animateToEditWithDuration:(double)a3 completion:(id)a4;
- (void)layoutSubviews;
- (void)setDisplayView:(id)a3;
- (void)setTableView:(id)a3;
@end

@implementation SRUserUtteranceContainerView

- (BOOL)isFirstResponder
{
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x2020000000;
  char v19 = 0;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v2 = [(SRUserUtteranceContainerView *)self subviews];
  id v3 = [v2 countByEnumeratingWithState:&v12 objects:v20 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v13;
LABEL_3:
    uint64_t v5 = 0;
    while (1)
    {
      if (*(void *)v13 != v4) {
        objc_enumerationMutation(v2);
      }
      v6 = *(void **)(*((void *)&v12 + 1) + 8 * v5);
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v7 = v6;
        v11[0] = _NSConcreteStackBlock;
        v11[1] = 3221225472;
        v11[2] = sub_1000340CC;
        v11[3] = &unk_100143778;
        v11[4] = &v16;
        [v7 _enumerateDescendentViews:v11];
        BOOL v8 = *((unsigned char *)v17 + 24) == 0;

        if (!v8) {
          break;
        }
      }
      if (v3 == (id)++v5)
      {
        id v3 = [v2 countByEnumeratingWithState:&v12 objects:v20 count:16];
        if (v3) {
          goto LABEL_3;
        }
        break;
      }
    }
  }

  char v9 = *((unsigned char *)v17 + 24);
  _Block_object_dispose(&v16, 8);
  return v9;
}

- (void)animateToEditWithDuration:(double)a3 completion:(id)a4
{
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_tableView);
  [WeakRetained setAlpha:0.0];

  id v8 = objc_loadWeakRetained((id *)&self->_tableView);
  [(SRUserUtteranceContainerView *)self addSubview:v8];

  self->_showEditingView = 1;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10003429C;
  v12[3] = &unk_100142E88;
  v12[4] = self;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10003431C;
  v10[3] = &unk_1001437A0;
  v10[4] = self;
  id v11 = v6;
  id v9 = v6;
  +[UIView animateWithDuration:v12 animations:v10 completion:a3];
}

- (void)animateToDisplayWithDuration:(double)a3 completion:(id)a4
{
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_displayView);
  [WeakRetained setChevronHidden:0];

  id v8 = objc_loadWeakRetained((id *)&self->_displayView);
  [v8 setAlpha:0.0];

  id v9 = objc_loadWeakRetained((id *)&self->_displayView);
  [(SRUserUtteranceContainerView *)self addSubview:v9];

  self->_showEditingView = 0;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1000344D8;
  v13[3] = &unk_100142E88;
  v13[4] = self;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100034558;
  v11[3] = &unk_1001437A0;
  v11[4] = self;
  id v12 = v6;
  id v10 = v6;
  +[UIView animateWithDuration:v13 animations:v11 completion:a3];
}

- (double)firstLineBaselineOffsetFromTop
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_displayView);
  [WeakRetained firstLineBaselineOffsetFromTop];
  double v4 = v3;

  return v4;
}

- (double)baselineOffsetFromBottom
{
  if (self->_showEditingView)
  {
    id WeakRetained = +[UIFont siriui_userUtteranceFont];
    [WeakRetained descender];
    double v4 = -v3;
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_displayView);
    [WeakRetained baselineOffsetFromBottom];
    double v4 = v5;
  }

  return v4;
}

- (void)layoutSubviews
{
  v15.receiver = self;
  v15.super_class = (Class)SRUserUtteranceContainerView;
  [(SRUserUtteranceContainerView *)&v15 layoutSubviews];
  [(SRUserUtteranceContainerView *)self bounds];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  if (self->_showEditingView) {
    id v11 = &OBJC_IVAR___SRUserUtteranceContainerView__tableView;
  }
  else {
    id v11 = &OBJC_IVAR___SRUserUtteranceContainerView__displayView;
  }
  if (self->_showEditingView) {
    double v12 = -8.0;
  }
  else {
    double v12 = 0.0;
  }
  id WeakRetained = objc_loadWeakRetained((id *)((char *)&self->super.super.super.isa + *v11));
  v16.origin.x = v4;
  v16.origin.y = v6;
  v16.size.width = v8;
  v16.size.height = v10;
  double Width = CGRectGetWidth(v16);
  v17.origin.x = v4;
  v17.origin.y = v6;
  v17.size.width = v8;
  v17.size.height = v10;
  [WeakRetained setFrame:0.0, v12, Width, CGRectGetHeight(v17)];
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  if (self->_showEditingView)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_tableView);
    [WeakRetained sizeThatFits:width height];
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_displayView);
    [WeakRetained sizeThatFits:width, height];
    double width = v7;
  }
  double v8 = v6;

  double v9 = width;
  double v10 = v8;
  result.double height = v10;
  result.double width = v9;
  return result;
}

- (SRUserUtteranceView)displayView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_displayView);

  return (SRUserUtteranceView *)WeakRetained;
}

- (void)setDisplayView:(id)a3
{
}

- (UIView)tableView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_tableView);

  return (UIView *)WeakRetained;
}

- (void)setTableView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_tableView);

  objc_destroyWeak((id *)&self->_displayView);
}

@end