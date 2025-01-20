@interface AXHearingProgramCell
- (AXHearingProgramCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5;
- (void)dealloc;
- (void)layoutSubviews;
- (void)setChecked:(BOOL)a3;
@end

@implementation AXHearingProgramCell

- (AXHearingProgramCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5
{
  id v7 = a5;
  v11.receiver = self;
  v11.super_class = (Class)AXHearingProgramCell;
  v8 = [(AXHearingProgramCell *)&v11 initWithStyle:3 reuseIdentifier:a4 specifier:v7];
  if (v8)
  {
    v9 = [v7 userInfo];
    v8->_showStreamingIcon = [v9 isStreamOrMixingStream];
    -[AXHearingProgramCell setChecked:](v8, "setChecked:", [v9 isSelected]);
  }
  return v8;
}

- (void)dealloc
{
  [(UIImageView *)self->_checkedView removeFromSuperview];
  v3.receiver = self;
  v3.super_class = (Class)AXHearingProgramCell;
  [(AXHearingProgramCell *)&v3 dealloc];
}

- (void)setChecked:(BOOL)a3
{
  if (self->PSTableCell_opaque[OBJC_IVAR___PSTableCell__checked] != a3)
  {
    self->PSTableCell_opaque[OBJC_IVAR___PSTableCell__checked] = a3;
    if (a3)
    {
      if (self->_showStreamingIcon)
      {
        v4 = accessibilityHearingAidImageNamed();
        v5 = [v4 imageWithRenderingMode:2];

        v6 = (UIImageView *)[objc_alloc((Class)UIImageView) initWithImage:v5 highlightedImage:v5];
        checkedView = self->_checkedView;
        self->_checkedView = v6;

        v8 = self->_checkedView;
        v9 = +[UIColor systemGrayColor];
        [(UIImageView *)v8 setTintColor:v9];
      }
      else
      {
        objc_super v11 = +[UIImage kitImageNamed:@"UIPreferencesBlueCheck.png"];
        v5 = [v11 imageWithRenderingMode:2];

        v12 = +[UIImage kitImageNamed:@"UIPreferencesWhiteCheck.png"];
        v9 = [v12 imageWithRenderingMode:2];

        v13 = (UIImageView *)[objc_alloc((Class)UIImageView) initWithImage:v5 highlightedImage:v9];
        v14 = self->_checkedView;
        self->_checkedView = v13;

        v15 = self->_checkedView;
        v16 = +[UIColor systemBlueColor];
        [(UIImageView *)v15 setTintColor:v16];
      }
      v17 = [(AXHearingProgramCell *)self contentView];
      [v17 addSubview:self->_checkedView];

      [(AXHearingProgramCell *)self setNeedsLayout];
    }
    else
    {
      [(UIImageView *)self->_checkedView removeFromSuperview];
      v10 = self->_checkedView;
      self->_checkedView = 0;
    }
  }
}

- (void)layoutSubviews
{
  v32.receiver = self;
  v32.super_class = (Class)AXHearingProgramCell;
  [(AXHearingProgramCell *)&v32 layoutSubviews];
  [(AXHearingProgramCell *)self setSelectionStyle:1];
  id WeakRetained = objc_loadWeakRetained((id *)&self->PSTableCell_opaque[OBJC_IVAR___PSTableCell__specifier]);
  v4 = [WeakRetained userInfo];

  self->_showStreamingIcon = [v4 isStreamOrMixingStream];
  -[AXHearingProgramCell setChecked:](self, "setChecked:", [v4 isSelected]);
  checkedView = self->_checkedView;
  if (checkedView)
  {
    [(UIImageView *)checkedView frame];
    double v7 = v6;
    double v9 = v8;
    v10 = [(AXHearingProgramCell *)self contentView];
    [v10 frame];
    float v12 = floor(v11 * 0.5);
    float v13 = floor(v9 * 0.5);
    double v14 = (float)(v12 - v13);

    id v15 = [UIApp userInterfaceLayoutDirection];
    double v16 = 10.0;
    if (!v15)
    {
      [(AXHearingProgramCell *)self bounds];
      double v16 = v17 - v7 + -10.0;
    }
    -[UIImageView setFrame:](self->_checkedView, "setFrame:", v16, v14, v7, v9);
  }
  v18 = [(AXHearingProgramCell *)self titleLabel];
  v19 = [v4 name];
  [v18 setText:v19];

  [v18 frame];
  double v21 = v20;
  double v23 = v22;
  double v25 = v24;
  v26 = [(AXHearingProgramCell *)self contentView];
  [v26 frame];
  double v28 = v27;
  [(UIImageView *)self->_checkedView frame];
  double v30 = v28 - v29 + -30.0;

  if ([UIApp userInterfaceLayoutDirection])
  {
    [(AXHearingProgramCell *)self bounds];
    double v21 = v31 - v30 + -14.0 + -10.0;
  }
  objc_msgSend(v18, "setFrame:", v21, v23, v30, v25);
}

- (void).cxx_destruct
{
}

@end