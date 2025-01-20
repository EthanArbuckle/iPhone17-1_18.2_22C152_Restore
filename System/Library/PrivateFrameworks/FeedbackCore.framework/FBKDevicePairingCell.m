@interface FBKDevicePairingCell
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

@implementation FBKDevicePairingCell

- (double)spaceFromSuperViewToLabel
{
  v2 = [(FBKDevicePairingCell *)self mainLabel];
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
  v12.super_class = (Class)FBKDevicePairingCell;
  [(FBKDevicePairingCell *)&v12 awakeFromNib];
  double v3 = [(FBKDevicePairingCell *)self mainLabel];
  [v3 setText:&stru_26DDF6A30];

  double v4 = [MEMORY[0x263F825C8] labelColor];
  v5 = [(FBKDevicePairingCell *)self mainLabel];
  [v5 setTextColor:v4];

  v6 = [(FBKDevicePairingCell *)self subLabel];
  [v6 setText:&stru_26DDF6A30];

  v7 = [MEMORY[0x263F825C8] secondaryLabelColor];
  v8 = [(FBKDevicePairingCell *)self subLabel];
  [v8 setTextColor:v7];

  v9 = [(FBKDevicePairingCell *)self deviceImage];
  [v9 setImage:0];

  v10 = [(FBKDevicePairingCell *)self activityIndicator];
  [v10 stopAnimating];

  v11 = [(FBKDevicePairingCell *)self detailLabelTrailingConstraint];
  [v11 constant];
  -[FBKDevicePairingCell setDetailLabelTrailingConstraintInitial:](self, "setDetailLabelTrailingConstraintInitial:");
}

- (void)setSelected:(BOOL)a3 animated:(BOOL)a4
{
  v4.receiver = self;
  v4.super_class = (Class)FBKDevicePairingCell;
  [(FBKDevicePairingCell *)&v4 setSelected:a3 animated:a4];
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
  objc_super v12 = [(FBKDevicePairingCell *)self detailLabel];
  [v12 setText:&stru_26DDF6A30];

  v13 = [(FBKDevicePairingCell *)self statusIndicatorImageView];
  [v13 setHidden:0];

  if ([v10 isCurrentDevice])
  {
    v14 = [v10 deviceClass];
    v15 = [v14 lowercaseString];

    if ([v15 containsString:@"iphone"])
    {
      v16 = [MEMORY[0x263F086E0] FeedbackCore];
      v17 = v16;
      v18 = @"This iPhone";
    }
    else if ([v15 containsString:@"ipad"])
    {
      v16 = [MEMORY[0x263F086E0] FeedbackCore];
      v17 = v16;
      v18 = @"This iPad";
    }
    else if ([v15 containsString:@"ipod"])
    {
      v16 = [MEMORY[0x263F086E0] FeedbackCore];
      v17 = v16;
      v18 = @"This iPod";
    }
    else
    {
      int v20 = [v15 containsString:@"mac"];
      v16 = [MEMORY[0x263F086E0] FeedbackCore];
      v17 = v16;
      if (!v20)
      {
        uint64_t v48 = [v16 localizedStringForKey:@"THIS_DEVICE_FORMAT" value:@"This %@" table:0];

        v49 = NSString;
        uint64_t v50 = [v10 deviceClass];
        v51 = v49;
        v17 = (void *)v48;
        uint64_t v21 = objc_msgSend(v51, "stringWithFormat:", v48, v50);

        v11 = (void *)v50;
        goto LABEL_15;
      }
      v18 = @"This Mac";
    }
    uint64_t v21 = [v16 localizedStringForKey:v18 value:v18 table:0];
LABEL_15:

    v19 = [MEMORY[0x263F825C8] systemGreenColor];
    v22 = [(FBKDevicePairingCell *)self statusIndicatorImageView];
    [v22 setTintColor:v19];

    v11 = (void *)v21;
    goto LABEL_16;
  }
  if ([v10 isVisibleToDED]) {
    [MEMORY[0x263F825C8] systemGreenColor];
  }
  else {
  v15 = [MEMORY[0x263F825C8] systemGrayColor];
  }
  v19 = [(FBKDevicePairingCell *)self statusIndicatorImageView];
  [v19 setHidden:v15 != 0];
LABEL_16:

  v23 = [v10 displayName];
  v24 = [(FBKDevicePairingCell *)self mainLabel];
  [v24 setText:v23];

  v25 = [(FBKDevicePairingCell *)self subLabel];
  [v25 setText:v11];

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
      [(FBKDevicePairingCell *)self setAccessoryType:0];
      [(FBKDevicePairingCell *)self detailLabelTrailingConstraintInitial];
      double v27 = v26;
      v28 = [(FBKDevicePairingCell *)self detailLabelTrailingConstraint];
      v29 = v28;
      double v30 = v27;
      goto LABEL_25;
    }
    [(FBKDevicePairingCell *)self setAccessoryType:4];
    v28 = [(FBKDevicePairingCell *)self detailLabelTrailingConstraint];
    v29 = v28;
    double v30 = 0.0;
LABEL_25:
    [v28 setConstant:v30];

    if (!v7) {
      goto LABEL_27;
    }
    goto LABEL_26;
  }
  [(FBKDevicePairingCell *)self setAccessoryType:3];
  if (v7)
  {
LABEL_26:
    v31 = NSString;
    v32 = [(FBKDevicePairingCell *)self mainLabel];
    v33 = [v32 text];
    v34 = [v10 transportsForDisplay];
    v35 = [v31 stringWithFormat:@"%@ (%@)", v33, v34];
    v36 = [(FBKDevicePairingCell *)self subLabel];
    [v36 setText:v35];
  }
LABEL_27:
  v37 = [MEMORY[0x263F82B60] mainScreen];
  [v37 scale];
  *(float *)&double v38 = v38;
  v52[0] = MEMORY[0x263EF8330];
  v52[1] = 3221225472;
  v52[2] = __79__FBKDevicePairingCell_updateWithDevice_showsDetail_showsTransport_isSelected___block_invoke;
  v52[3] = &unk_264874DD8;
  v52[4] = self;
  [v10 fetchIconImageDataForScale:v52 completionCompletion:v38];

  v39 = [(FBKDevicePairingCell *)self traitCollection];
  v40 = [v39 preferredContentSizeCategory];
  BOOL IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v40);

  v42 = [(FBKDevicePairingCell *)self subLabel];
  v43 = v42;
  if (IsAccessibilityCategory)
  {
    [v42 setNumberOfLines:0];

    v44 = [(FBKDevicePairingCell *)self mainLabel];
    v45 = v44;
    uint64_t v46 = 0;
  }
  else
  {
    [v42 setNumberOfLines:1];

    v44 = [(FBKDevicePairingCell *)self mainLabel];
    v45 = v44;
    uint64_t v46 = 1;
  }
  [v44 setNumberOfLines:v46];

  v47 = [(FBKDevicePairingCell *)self contentView];
  [v47 setNeedsDisplay];
}

uint64_t __79__FBKDevicePairingCell_updateWithDevice_showsDetail_showsTransport_isSelected___block_invoke(uint64_t result, uint64_t a2)
{
  if (a2)
  {
    uint64_t v2 = result;
    double v3 = [MEMORY[0x263F827E8] imageWithData:a2];
    objc_super v4 = [*(id *)(v2 + 32) deviceImage];
    [v4 setImage:v3];

    v5 = *(void **)(v2 + 32);
    return [v5 setNeedsDisplay];
  }
  return result;
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