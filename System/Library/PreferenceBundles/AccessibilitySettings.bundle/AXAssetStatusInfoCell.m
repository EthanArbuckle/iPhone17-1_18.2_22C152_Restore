@interface AXAssetStatusInfoCell
- (AXAssetStatusInfoCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5;
- (unint64_t)accessibilityTraits;
- (void)_deleteButtonTapped:(id)a3;
- (void)_downloadButtonTapped:(id)a3;
- (void)refreshCellContentsWithSpecifier:(id)a3;
- (void)updateConstraints;
@end

@implementation AXAssetStatusInfoCell

- (AXAssetStatusInfoCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5
{
  id v8 = a5;
  v18.receiver = self;
  v18.super_class = (Class)AXAssetStatusInfoCell;
  v9 = [(AXAssetStatusInfoCell *)&v18 initWithStyle:a3 reuseIdentifier:a4 specifier:v8];
  v10 = v9;
  if (v9)
  {
    v11 = [(AXAssetStatusInfoCell *)v9 contentView];
    v12 = (UILabel *)objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    infoLabel = v10->_infoLabel;
    v10->_infoLabel = v12;

    v14 = +[UIFont preferredFontForTextStyle:UIFontTextStyleSubheadline];
    [(UILabel *)v10->_infoLabel setFont:v14];

    [(UILabel *)v10->_infoLabel setEnabled:0];
    [(UILabel *)v10->_infoLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UILabel *)v10->_infoLabel setNumberOfLines:0];
    [(UILabel *)v10->_infoLabel setLineBreakMode:0];
    [(UILabel *)v10->_infoLabel setAccessibilityIdentifier:@"AX_ASSET_STATUS_INFO_CELL"];
    [v11 addSubview:v10->_infoLabel];
    v15 = (UIActivityIndicatorView *)[objc_alloc((Class)UIActivityIndicatorView) initWithActivityIndicatorStyle:100];
    spinner = v10->_spinner;
    v10->_spinner = v15;

    [(UIActivityIndicatorView *)v10->_spinner setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIActivityIndicatorView *)v10->_spinner setAccessibilityIdentifier:@"Spinner"];
    [(UIActivityIndicatorView *)v10->_spinner setHidesWhenStopped:1];
    [(UIActivityIndicatorView *)v10->_spinner sizeToFit];
    [v11 addSubview:v10->_spinner];
    -[AXAssetStatusInfoCell setSeparatorInset:](v10, "setSeparatorInset:", 0.0, 58.0, 0.0, 0.0);
    [(AXAssetStatusInfoCell *)v10 refreshCellContentsWithSpecifier:v8];
  }
  return v10;
}

- (void)updateConstraints
{
  v3 = [(AXAssetStatusInfoCell *)self contentView];
  uint64_t v4 = _NSDictionaryOfVariableBindings(@"_infoLabel, _spinner", self->_infoLabel, self->_spinner, 0);
  if ([(NSMutableArray *)self->_constraints count]) {
    +[NSLayoutConstraint deactivateConstraints:self->_constraints];
  }
  v5 = +[NSMutableArray array];
  constraints = self->_constraints;
  self->_constraints = v5;

  v7 = self->_constraints;
  +[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", @"H:|-[_infoLabel]-10-|", 0, 0, v4);
  id v8 = v20 = (void *)v4;
  [(NSMutableArray *)v7 addObjectsFromArray:v8];

  v9 = self->_constraints;
  v10 = +[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", @"V:|-10-[_infoLabel]-10-|", 0, 0, v4);
  [(NSMutableArray *)v9 addObjectsFromArray:v10];

  v11 = self->_constraints;
  v12 = [(UIActivityIndicatorView *)self->_spinner centerXAnchor];
  v13 = [v3 centerXAnchor];
  [v12 constraintEqualToAnchor:v13];
  v14 = v19 = v3;
  v22[0] = v14;
  v15 = [(UIActivityIndicatorView *)self->_spinner centerYAnchor];
  v16 = [v3 centerYAnchor];
  v17 = [v15 constraintEqualToAnchor:v16];
  v22[1] = v17;
  objc_super v18 = +[NSArray arrayWithObjects:v22 count:2];
  [(NSMutableArray *)v11 addObjectsFromArray:v18];

  +[NSLayoutConstraint activateConstraints:self->_constraints];
  v21.receiver = self;
  v21.super_class = (Class)AXAssetStatusInfoCell;
  [(AXAssetStatusInfoCell *)&v21 updateConstraints];
}

- (void)refreshCellContentsWithSpecifier:(id)a3
{
  id v4 = a3;
  v30.receiver = self;
  v30.super_class = (Class)AXAssetStatusInfoCell;
  [(AXAssetStatusInfoCell *)&v30 refreshCellContentsWithSpecifier:v4];
  [(AXAssetStatusInfoCell *)self setUserInteractionEnabled:1];
  id v5 = objc_msgSend(v4, "ax_assetState");
  v6 = objc_msgSend(v4, "ax_asset");
  spinner = self->_spinner;
  if (v5)
  {
    [(UIActivityIndicatorView *)spinner stopAnimating];
    [(UILabel *)self->_infoLabel setAlpha:1.0];
    switch((unint64_t)v5)
    {
      case 1uLL:
        if (v6)
        {
          id v8 = [v6 downloadSize];
          id v9 = [v8 longLongValue];
        }
        else
        {
          id v9 = objc_msgSend(v4, "ax_assetDownloadBytesExpected");
        }
        v10 = +[NSByteCountFormatter stringFromByteCount:v9 countStyle:0];
        v24 = AXAssetLocalizedString();
        v25 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v24, v10);
        [(UILabel *)self->_infoLabel setText:v25];

        if (objc_msgSend(v4, "ax_assetDownloadButtonHidden")) {
          break;
        }
        v22 = +[UIImage systemImageNamed:@"icloud.and.arrow.down"];
        v26 = "_downloadButtonTapped:";
        goto LABEL_25;
      case 2uLL:
        id v12 = objc_msgSend(v4, "ax_assetDownloadBytesReceived");
        id v13 = objc_msgSend(v4, "ax_assetDownloadBytesExpected");
        if (!v13)
        {
          v10 = AXAssetLocalizedString();
          infoLabel = self->_infoLabel;
          goto LABEL_6;
        }
        v14 = +[NSNumber numberWithDouble:(double)(uint64_t)v12 / (double)(uint64_t)v13];
        v10 = +[NSNumberFormatter localizedStringFromNumber:v14 numberStyle:3];

        v15 = AXAssetLocalizedString();
        +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v15, v10, v29);
        v17 = LABEL_10:;
        [(UILabel *)self->_infoLabel setText:v17];

        break;
      case 3uLL:
        v16 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", (double)(uint64_t)objc_msgSend(v4, "ax_assetDownloadBytesReceived")/ (double)(uint64_t)objc_msgSend(v4, "ax_assetDownloadBytesExpected"));
        v10 = +[NSNumberFormatter localizedStringFromNumber:v16 numberStyle:3];

        v15 = AXAssetLocalizedString();
        +[NSString localizedStringWithFormat:@"%@ (%@)", v15, v10];
        goto LABEL_10;
      case 4uLL:
        if (v6)
        {
          objc_super v18 = [v6 unarchivedFileSize];
          id v19 = [v18 longLongValue];
        }
        else
        {
          id v19 = objc_msgSend(v4, "ax_assetUnarchivedFileSize");
        }
        v10 = +[NSByteCountFormatter stringFromByteCount:v19 countStyle:0];
        v27 = AXAssetLocalizedString();
        v28 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v27, v10);
        [(UILabel *)self->_infoLabel setText:v28];

        if (objc_msgSend(v4, "ax_assetDeleteButtonHidden")) {
          break;
        }
        v22 = +[UIImage systemImageNamed:@"trash"];
        v26 = "_deleteButtonTapped:";
LABEL_25:
        v23 = +[UIButton systemButtonWithImage:v22 target:self action:v26];
        [(AXAssetStatusInfoCell *)self setAccessoryView:v23];
        goto LABEL_26;
      case 5uLL:
        v10 = objc_msgSend(v4, "ax_assetError");
        if (!v10)
        {
          v10 = _AXAssetMakeError();
        }
        int v20 = AXIsInternalInstall();
        objc_super v21 = [v10 localizedDescription];
        v22 = v21;
        if (v20)
        {
          v23 = [v21 stringByAppendingString:@"\nInternal Only: Are you on the internal network?"];
          [(UILabel *)self->_infoLabel setText:v23];
LABEL_26:
        }
        else
        {
          [(UILabel *)self->_infoLabel setText:v21];
        }

        break;
      default:
        goto LABEL_29;
    }
  }
  else
  {
    [(UIActivityIndicatorView *)spinner startAnimating];
    [(UILabel *)self->_infoLabel setAlpha:0.0];
    v10 = AXAssetLocalizedString();
    infoLabel = self->_infoLabel;
LABEL_6:
    [(UILabel *)infoLabel setText:v10];
  }

LABEL_29:
  [(AXAssetStatusInfoCell *)self setNeedsUpdateConstraints];
  [(AXAssetStatusInfoCell *)self setNeedsDisplay];
}

- (void)_downloadButtonTapped:(id)a3
{
  id v4 = [(AXAssetStatusInfoCell *)self specifier];
  objc_msgSend(v4, "ax_assetDownloadButtonTapHandler");
  v6 = (void (**)(id, void *))objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    id v5 = [(AXAssetStatusInfoCell *)self specifier];
    v6[2](v6, v5);
  }
}

- (void)_deleteButtonTapped:(id)a3
{
  id v4 = [(AXAssetStatusInfoCell *)self specifier];
  objc_msgSend(v4, "ax_assetDeleteButtonTapHandler");
  v6 = (void (**)(id, void *))objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    id v5 = [(AXAssetStatusInfoCell *)self specifier];
    v6[2](v6, v5);
  }
}

- (unint64_t)accessibilityTraits
{
  return UIAccessibilityTraitNone;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_spinner, 0);
  objc_storeStrong((id *)&self->_infoLabel, 0);

  objc_storeStrong((id *)&self->_constraints, 0);
}

@end