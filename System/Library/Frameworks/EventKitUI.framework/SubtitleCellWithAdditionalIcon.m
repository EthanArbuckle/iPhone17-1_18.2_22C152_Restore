@interface SubtitleCellWithAdditionalIcon
- (BOOL)leftFrame:(CGRect)a3 overlapsRightFrame:(CGRect)a4 difference:(double *)a5;
- (UIImageView)icon;
- (id)source;
- (void)layoutSubviews;
- (void)setSource:(id)a3;
@end

@implementation SubtitleCellWithAdditionalIcon

- (UIImageView)icon
{
  icon = self->_icon;
  if (!icon)
  {
    v4 = (UIImageView *)objc_alloc_init(MEMORY[0x1E4FB1838]);
    v5 = self->_icon;
    self->_icon = v4;

    v6 = [(SubtitleCellWithAdditionalIcon *)self contentView];
    [v6 addSubview:self->_icon];

    icon = self->_icon;
  }

  return icon;
}

- (void)layoutSubviews
{
  v85.receiver = self;
  v85.super_class = (Class)SubtitleCellWithAdditionalIcon;
  [(EKUITableViewCell *)&v85 layoutSubviews];
  v3 = [(SubtitleCellWithAdditionalIcon *)self contentView];
  [v3 bounds];
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;

  if (self->_icon)
  {
    v12 = [(SubtitleCellWithAdditionalIcon *)self textLabel];
    [v12 sizeToFit];

    v13 = [(SubtitleCellWithAdditionalIcon *)self detailTextLabel];
    [v13 sizeToFit];

    [(UIImageView *)self->_icon sizeToFit];
    v14 = [(SubtitleCellWithAdditionalIcon *)self textLabel];
    [v14 frame];
    double v78 = v15;
    double v80 = v16;
    double v76 = v17;
    double v19 = v18;

    v20 = [(SubtitleCellWithAdditionalIcon *)self detailTextLabel];
    [v20 frame];
    double v22 = v21;
    double v24 = v23;
    double v82 = v25;
    double v27 = v26;

    v28 = [(SubtitleCellWithAdditionalIcon *)self traitCollection];
    BOOL v29 = EKUIUsesLargeTextLayout(v28);

    icon = self->_icon;
    if (v29)
    {
      [(UIImageView *)icon removeFromSuperview];
    }
    else
    {
      double v72 = v19;
      double v74 = v24;
      [(UIImageView *)icon frame];
      double v32 = v31;
      double v75 = v33;
      double v34 = 6.0;
      if (CalInterfaceIsLeftToRight())
      {
        v86.origin.x = v5;
        v86.origin.y = v7;
        v86.size.width = v9;
        v86.size.height = v11;
        double v34 = CGRectGetMaxX(v86) + -6.0 - v32;
      }
      v87.origin.x = v5;
      v87.origin.y = v7;
      v87.size.width = v9;
      v87.size.height = v11;
      double v35 = round((CGRectGetMaxY(v87) - v75) * 0.5);
      -[UIImageView setFrame:](self->_icon, "setFrame:", v34, v35, v32, v75);
      v36 = [(SubtitleCellWithAdditionalIcon *)self contentView];
      [v36 addSubview:self->_icon];

      int IsLeftToRight = CalInterfaceIsLeftToRight();
      if (IsLeftToRight) {
        double v38 = v78;
      }
      else {
        double v38 = v34;
      }
      if (IsLeftToRight) {
        double v39 = v80;
      }
      else {
        double v39 = v35;
      }
      double v69 = v39;
      double v70 = v38;
      if (IsLeftToRight) {
        double v40 = v76;
      }
      else {
        double v40 = v32;
      }
      if (IsLeftToRight) {
        double v41 = v72;
      }
      else {
        double v41 = v75;
      }
      double v67 = v41;
      double v68 = v40;
      int v42 = CalInterfaceIsLeftToRight();
      if (v42) {
        double v43 = v35;
      }
      else {
        double v43 = v80;
      }
      if (v42) {
        double v44 = v34;
      }
      else {
        double v44 = v78;
      }
      double v71 = v32;
      if (v42) {
        double v45 = v32;
      }
      else {
        double v45 = v76;
      }
      if (v42) {
        double v46 = v75;
      }
      else {
        double v46 = v72;
      }
      double v84 = 0.0;
      if (-[SubtitleCellWithAdditionalIcon leftFrame:overlapsRightFrame:difference:](self, "leftFrame:overlapsRightFrame:difference:", &v84, v70, v69, v68, v67, v44, v43, v45, v46, *(void *)&v67, *(void *)&v68))
      {
        double v47 = v76 - v84;
        int v48 = CalInterfaceIsLeftToRight();
        double v49 = v84;
        if (v48) {
          double v49 = -0.0;
        }
        double v50 = v78 + v49;
        v51 = [(SubtitleCellWithAdditionalIcon *)self textLabel];
        objc_msgSend(v51, "setFrame:", v50, v80, v47, v72);
      }
      int v52 = CalInterfaceIsLeftToRight();
      if (v52) {
        double v53 = v22;
      }
      else {
        double v53 = v34;
      }
      if (v52) {
        double v54 = v74;
      }
      else {
        double v54 = v35;
      }
      double v79 = v54;
      double v81 = v53;
      if (v52) {
        double v55 = v82;
      }
      else {
        double v55 = v71;
      }
      double v77 = v55;
      if (v52) {
        double v56 = v27;
      }
      else {
        double v56 = v75;
      }
      double v73 = v56;
      int v57 = CalInterfaceIsLeftToRight();
      if (v57) {
        double v58 = v34;
      }
      else {
        double v58 = v22;
      }
      if (v57) {
        double v59 = v35;
      }
      else {
        double v59 = v74;
      }
      if (v57) {
        double v60 = v71;
      }
      else {
        double v60 = v82;
      }
      if (v57) {
        double v61 = v75;
      }
      else {
        double v61 = v27;
      }
      double v83 = 0.0;
      if (-[SubtitleCellWithAdditionalIcon leftFrame:overlapsRightFrame:difference:](self, "leftFrame:overlapsRightFrame:difference:", &v83, v81, v79, v77, v73, v58, v59, v60, v61))
      {
        double v62 = v82 - v83;
        int v63 = CalInterfaceIsLeftToRight();
        double v64 = v83;
        if (v63) {
          double v64 = -0.0;
        }
        double v65 = v22 + v64;
        v66 = [(SubtitleCellWithAdditionalIcon *)self detailTextLabel];
        objc_msgSend(v66, "setFrame:", v65, v74, v62, v27);
      }
    }
  }
}

- (BOOL)leftFrame:(CGRect)a3 overlapsRightFrame:(CGRect)a4 difference:(double *)a5
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  double MaxX = CGRectGetMaxX(a3);
  v13.origin.CGFloat x = x;
  v13.origin.CGFloat y = y;
  v13.size.CGFloat width = width;
  v13.size.CGFloat height = height;
  double v11 = MaxX - (CGRectGetMinX(v13) + -5.0);
  *a5 = v11;
  return v11 > 0.0;
}

- (id)source
{
  return self->_source;
}

- (void)setSource:(id)a3
{
  self->_source = a3;
}

- (void).cxx_destruct
{
}

@end