@interface FBADevicePairingCell
+ (double)estimatedRowHeight;
- (NSLayoutConstraint)detailLabelTrailingConstraint;
- (UIActivityIndicatorView)activityIndicator;
- (UIImageView)deviceImage;
- (UIImageView)statusIndicatorImageView;
- (UILabel)detailLabel;
- (UILabel)mainLabel;
- (UILabel)subLabel;
- (double)detailLabelTrailingConstraintInitial;
- (double)spaceFromSuperViewToLabel;
- (void)awakeFromNib;
- (void)setActivityIndicator:(id)a3;
- (void)setDetailLabel:(id)a3;
- (void)setDetailLabelTrailingConstraint:(id)a3;
- (void)setDetailLabelTrailingConstraintInitial:(double)a3;
- (void)setDeviceImage:(id)a3;
- (void)setMainLabel:(id)a3;
- (void)setSelected:(BOOL)a3 animated:(BOOL)a4;
- (void)setStatusIndicatorImageView:(id)a3;
- (void)setSubLabel:(id)a3;
- (void)updateWithDevice:(id)a3 showsDetail:(BOOL)a4 showsTransport:(BOOL)a5;
- (void)updateWithDevice:(id)a3 showsDetail:(BOOL)a4 showsTransport:(BOOL)a5 isSelected:(BOOL)a6;
@end

@implementation FBADevicePairingCell

- (double)spaceFromSuperViewToLabel
{
  v2 = [(FBADevicePairingCell *)self mainLabel];
  [v2 frame];
  double v4 = v3;

  return v4;
}

+ (double)estimatedRowHeight
{
  return 181.0;
}

- (void)awakeFromNib
{
  v12.receiver = self;
  v12.super_class = (Class)FBADevicePairingCell;
  [(FBADevicePairingCell *)&v12 awakeFromNib];
  double v3 = [(FBADevicePairingCell *)self mainLabel];
  [v3 setText:&stru_1000F6658];

  double v4 = +[UIColor labelColor];
  v5 = [(FBADevicePairingCell *)self mainLabel];
  [v5 setTextColor:v4];

  v6 = [(FBADevicePairingCell *)self subLabel];
  [v6 setText:&stru_1000F6658];

  v7 = +[UIColor secondaryLabelColor];
  v8 = [(FBADevicePairingCell *)self subLabel];
  [v8 setTextColor:v7];

  v9 = [(FBADevicePairingCell *)self deviceImage];
  [v9 setImage:0];

  v10 = [(FBADevicePairingCell *)self activityIndicator];
  [v10 stopAnimating];

  v11 = [(FBADevicePairingCell *)self detailLabelTrailingConstraint];
  [v11 constant];
  -[FBADevicePairingCell setDetailLabelTrailingConstraintInitial:](self, "setDetailLabelTrailingConstraintInitial:");
}

- (void)setSelected:(BOOL)a3 animated:(BOOL)a4
{
  v4.receiver = self;
  v4.super_class = (Class)FBADevicePairingCell;
  [(FBADevicePairingCell *)&v4 setSelected:a3 animated:a4];
}

- (void)updateWithDevice:(id)a3 showsDetail:(BOOL)a4 showsTransport:(BOOL)a5
{
}

- (void)updateWithDevice:(id)a3 showsDetail:(BOOL)a4 showsTransport:(BOOL)a5 isSelected:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  BOOL v8 = a4;
  id v10 = a3;
  v11 = [v10 displayType];
  objc_super v12 = [(FBADevicePairingCell *)self detailLabel];
  [v12 setText:&stru_1000F6658];

  v13 = [(FBADevicePairingCell *)self statusIndicatorImageView];
  [v13 setHidden:0];

  if ([v10 isCurrentDevice])
  {
    v14 = [v10 deviceClass];
    v15 = [v14 lowercaseString];
    unsigned int v16 = [v15 containsString:@"iphone"];

    if (v16)
    {
      v17 = +[NSBundle mainBundle];
      v18 = v17;
      CFStringRef v19 = @"This iPhone";
    }
    else
    {
      v20 = [v14 lowercaseString];
      unsigned int v21 = [v20 containsString:@"ipad"];

      if (v21)
      {
        v17 = +[NSBundle mainBundle];
        v18 = v17;
        CFStringRef v19 = @"This iPad";
      }
      else
      {
        v23 = [v14 lowercaseString];
        unsigned int v24 = [v23 containsString:@"ipod"];

        if (v24)
        {
          v17 = +[NSBundle mainBundle];
          v18 = v17;
          CFStringRef v19 = @"This iPod";
        }
        else
        {
          v25 = [v14 lowercaseString];
          unsigned int v26 = [v25 containsString:@"mac"];

          v17 = +[NSBundle mainBundle];
          v18 = v17;
          if (!v26)
          {
            uint64_t v53 = [v17 localizedStringForKey:@"THIS_DEVICE_FORMAT" value:@"This %@" table:0];

            uint64_t v54 = [v10 deviceClass];
            v18 = (void *)v53;
            uint64_t v27 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v53, v54);

            v11 = (void *)v54;
            goto LABEL_15;
          }
          CFStringRef v19 = @"This Mac";
        }
      }
    }
    uint64_t v27 = [v17 localizedStringForKey:v19 value:v19 table:0];
LABEL_15:

    v22 = +[UIColor systemGreenColor];
    v28 = [(FBADevicePairingCell *)self statusIndicatorImageView];
    [v28 setTintColor:v22];

    v11 = (void *)v27;
    goto LABEL_16;
  }
  if ([v10 isVisibleToDED]) {
    +[UIColor systemGreenColor];
  }
  else {
  v14 = +[UIColor systemGrayColor];
  }
  v22 = [(FBADevicePairingCell *)self statusIndicatorImageView];
  [v22 setHidden:v14 != 0];
LABEL_16:

  v29 = [v10 displayName];
  v30 = [(FBADevicePairingCell *)self mainLabel];
  [v30 setText:v29];

  v31 = [(FBADevicePairingCell *)self subLabel];
  [v31 setText:v11];

  if (!v6)
  {
    if (v8)
    {
      if ([v10 isCurrentDevice] && !v7) {
        goto LABEL_22;
      }
    }
    else if (!v7)
    {
LABEL_22:
      [(FBADevicePairingCell *)self setAccessoryType:0];
      [(FBADevicePairingCell *)self detailLabelTrailingConstraintInitial];
      double v33 = v32;
      v34 = [(FBADevicePairingCell *)self detailLabelTrailingConstraint];
      v35 = v34;
      double v36 = v33;
      goto LABEL_25;
    }
    [(FBADevicePairingCell *)self setAccessoryType:4];
    v34 = [(FBADevicePairingCell *)self detailLabelTrailingConstraint];
    v35 = v34;
    double v36 = 0.0;
LABEL_25:
    [v34 setConstant:v36];

    if (!v7) {
      goto LABEL_27;
    }
    goto LABEL_26;
  }
  [(FBADevicePairingCell *)self setAccessoryType:3];
  if (v7)
  {
LABEL_26:
    v37 = [(FBADevicePairingCell *)self mainLabel];
    v38 = [v37 text];
    v39 = [v10 transportsForDisplay];
    v40 = +[NSString stringWithFormat:@"%@ (%@)", v38, v39];
    v41 = [(FBADevicePairingCell *)self subLabel];
    [v41 setText:v40];
  }
LABEL_27:
  v42 = +[UIScreen mainScreen];
  [v42 scale];
  *(float *)&double v43 = v43;
  v55[0] = _NSConcreteStackBlock;
  v55[1] = 3221225472;
  v55[2] = sub_10003351C;
  v55[3] = &unk_1000F33A0;
  v55[4] = self;
  [v10 fetchIconImageDataForScale:v55 completionCompletion:v43];

  v44 = [(FBADevicePairingCell *)self traitCollection];
  v45 = [v44 preferredContentSizeCategory];
  BOOL IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v45);

  v47 = [(FBADevicePairingCell *)self subLabel];
  v48 = v47;
  if (IsAccessibilityCategory)
  {
    [v47 setNumberOfLines:0];

    v49 = [(FBADevicePairingCell *)self mainLabel];
    v50 = v49;
    uint64_t v51 = 0;
  }
  else
  {
    [v47 setNumberOfLines:1];

    v49 = [(FBADevicePairingCell *)self mainLabel];
    v50 = v49;
    uint64_t v51 = 1;
  }
  [v49 setNumberOfLines:v51];

  v52 = [(FBADevicePairingCell *)self contentView];
  [v52 setNeedsDisplay];
}

- (UIImageView)deviceImage
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_deviceImage);

  return (UIImageView *)WeakRetained;
}

- (void)setDeviceImage:(id)a3
{
}

- (UILabel)mainLabel
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_mainLabel);

  return (UILabel *)WeakRetained;
}

- (void)setMainLabel:(id)a3
{
}

- (UILabel)detailLabel
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_detailLabel);

  return (UILabel *)WeakRetained;
}

- (void)setDetailLabel:(id)a3
{
}

- (UIImageView)statusIndicatorImageView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_statusIndicatorImageView);

  return (UIImageView *)WeakRetained;
}

- (void)setStatusIndicatorImageView:(id)a3
{
}

- (UIActivityIndicatorView)activityIndicator
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_activityIndicator);

  return (UIActivityIndicatorView *)WeakRetained;
}

- (void)setActivityIndicator:(id)a3
{
}

- (NSLayoutConstraint)detailLabelTrailingConstraint
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_detailLabelTrailingConstraint);

  return (NSLayoutConstraint *)WeakRetained;
}

- (void)setDetailLabelTrailingConstraint:(id)a3
{
}

- (double)detailLabelTrailingConstraintInitial
{
  return self->_detailLabelTrailingConstraintInitial;
}

- (void)setDetailLabelTrailingConstraintInitial:(double)a3
{
  self->_detailLabelTrailingConstraintInitial = a3;
}

- (UILabel)subLabel
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_subLabel);

  return (UILabel *)WeakRetained;
}

- (void)setSubLabel:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_subLabel);
  objc_destroyWeak((id *)&self->_detailLabelTrailingConstraint);
  objc_destroyWeak((id *)&self->_activityIndicator);
  objc_destroyWeak((id *)&self->_statusIndicatorImageView);
  objc_destroyWeak((id *)&self->_detailLabel);
  objc_destroyWeak((id *)&self->_mainLabel);

  objc_destroyWeak((id *)&self->_deviceImage);
}

@end