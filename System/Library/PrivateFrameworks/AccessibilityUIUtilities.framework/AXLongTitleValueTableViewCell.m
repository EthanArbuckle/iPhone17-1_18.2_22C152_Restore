@interface AXLongTitleValueTableViewCell
- (AXLongTitleValueTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5;
- (CGSize)sizeThatFits:(CGSize)a3;
- (double)defaultCellContentTrailingPadding;
- (double)iconImageViewGap;
- (unint64_t)accessibilityTraits;
- (void)layoutSubviews;
@end

@implementation AXLongTitleValueTableViewCell

- (AXLongTitleValueTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5
{
  v10.receiver = self;
  v10.super_class = (Class)AXLongTitleValueTableViewCell;
  v5 = [(PSTableCell *)&v10 initWithStyle:a3 reuseIdentifier:a4 specifier:a5];
  v6 = v5;
  if (v5)
  {
    v7 = [(PSTableCell *)v5 valueLabel];
    [v7 setNumberOfLines:0];

    v8 = [(PSTableCell *)v6 titleLabel];
    [v8 setNumberOfLines:0];
  }
  return v6;
}

- (void)layoutSubviews
{
  v52.receiver = self;
  v52.super_class = (Class)AXLongTitleValueTableViewCell;
  [(PSTableCell *)&v52 layoutSubviews];
  v3 = [(AXLongTitleValueTableViewCell *)self traitCollection];
  v4 = [v3 preferredContentSizeCategory];
  BOOL IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v4);

  if (!IsAccessibilityCategory)
  {
    v6 = [(AXLongTitleValueTableViewCell *)self contentView];
    [v6 bounds];
    double v8 = v7;
    double v10 = v9;

    [(AXLongTitleValueTableViewCell *)self layoutMargins];
    double v12 = v11;
    if ([(AXLongTitleValueTableViewCell *)self accessoryType])
    {
      double v12 = 0.0;
      if (AXProcessIsSetup())
      {
        [(AXLongTitleValueTableViewCell *)self defaultCellContentTrailingPadding];
        double v12 = v13;
      }
    }
    v14 = [(PSTableCell *)self specifier];
    v15 = [v14 objectForKeyedSubscript:*MEMORY[0x1E4F93190]];
    if (v15)
    {
      BOOL v16 = 1;
    }
    else
    {
      v17 = [(PSTableCell *)self specifier];
      v18 = [v17 objectForKeyedSubscript:*MEMORY[0x1E4F931A0]];
      if (v18)
      {
        BOOL v16 = 1;
      }
      else
      {
        v19 = [(PSTableCell *)self specifier];
        v20 = [v19 objectForKeyedSubscript:*MEMORY[0x1E4F931C0]];
        BOOL v16 = v20 != 0;
      }
    }

    v21 = [(PSTableCell *)self iconImageView];
    v22 = v21;
    double v23 = 0.0;
    if (v16)
    {
      if (v21)
      {
        [v21 frame];
        if (v24 != 0.0)
        {
          [v22 frame];
          double v26 = v25;
          [(AXLongTitleValueTableViewCell *)self iconImageViewGap];
          double v23 = v27 + v26;
        }
      }
    }
    [(AXLongTitleValueTableViewCell *)self layoutMargins];
    double v29 = v8 - v28 - v12 + -6.0 - v23;
    v30 = [(PSTableCell *)self valueLabel];
    objc_msgSend(v30, "sizeThatFits:", v29 * 0.5, v10);
    double v32 = v31;
    double v34 = v33;

    v35 = [(PSTableCell *)self titleLabel];
    double v36 = v10;
    objc_msgSend(v35, "sizeThatFits:", v29 - v32, v10);
    double v51 = v37;
    double v39 = v38;

    v40 = [(PSTableCell *)self valueLabel];
    [v40 frame];

    v41 = [(PSTableCell *)self titleLabel];
    [v41 frame];
    double v43 = v42;

    if ([(AXLongTitleValueTableViewCell *)self _shouldReverseLayoutDirection])
    {
      [(AXLongTitleValueTableViewCell *)self layoutMargins];
      double v43 = v8 - v44 - v23 - v51;
    }
    else
    {
      double v12 = v8 - v32 - v12;
    }
    float v45 = (v36 - v34) * 0.5;
    double v46 = floorf(v45);
    float v47 = (v36 - v39) * 0.5;
    double v48 = floorf(v47);
    v49 = [(PSTableCell *)self valueLabel];
    objc_msgSend(v49, "setFrame:", v12, v46, v32, v34);

    v50 = [(PSTableCell *)self titleLabel];
    objc_msgSend(v50, "setFrame:", v43, v48, v51, v39);
  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  v6 = [(PSTableCell *)self specifier];
  double v7 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4F93190]];
  if (!v7)
  {
    double v7 = [(PSTableCell *)self specifier];
    double v8 = [v7 objectForKeyedSubscript:*MEMORY[0x1E4F931A0]];
    if (!v8)
    {
      v55 = [(PSTableCell *)self specifier];
      double v13 = [v55 objectForKeyedSubscript:*MEMORY[0x1E4F931C0]];

      if (!v13) {
        goto LABEL_10;
      }
      goto LABEL_5;
    }
  }
LABEL_5:
  double v9 = [(PSTableCell *)self iconImageView];

  if (v9)
  {
    double v10 = [(AXLongTitleValueTableViewCell *)self traitCollection];
    double v11 = [v10 preferredContentSizeCategory];
    BOOL IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v11);

    if (IsAccessibilityCategory)
    {
      LODWORD(v13) = 1;
    }
    else
    {
      v14 = [(PSTableCell *)self valueLabel];
      LODWORD(v13) = 1;
      [v14 setNumberOfLines:1];

      v15 = [(PSTableCell *)self titleLabel];
      [v15 setNumberOfLines:1];
    }
  }
  else
  {
    LODWORD(v13) = 0;
  }
LABEL_10:
  v70.receiver = self;
  v70.super_class = (Class)AXLongTitleValueTableViewCell;
  -[AXLongTitleValueTableViewCell sizeThatFits:](&v70, sel_sizeThatFits_, width, height);
  double v17 = v16;
  double v19 = v18;
  v20 = [(AXLongTitleValueTableViewCell *)self traitCollection];
  v21 = [v20 preferredContentSizeCategory];
  BOOL v22 = UIContentSizeCategoryIsAccessibilityCategory(v21);

  if (!v22)
  {
    double v23 = [(AXLongTitleValueTableViewCell *)self contentView];
    objc_msgSend(v23, "sizeThatFits:", v17, v19);
    double v25 = v24;
    double v27 = v26;

    uint64_t v64 = 0;
    v65 = (double *)&v64;
    uint64_t v66 = 0x4010000000;
    v67 = &unk_1C3A38CE1;
    long long v28 = *(_OWORD *)(MEMORY[0x1E4F1DB28] + 16);
    long long v68 = *MEMORY[0x1E4F1DB28];
    long long v69 = v28;
    double v29 = 0.0;
    if (v13)
    {
      uint64_t v56 = MEMORY[0x1E4F143A8];
      uint64_t v57 = 3221225472;
      v58 = __46__AXLongTitleValueTableViewCell_sizeThatFits___block_invoke;
      v59 = &unk_1E649C818;
      v60 = self;
      v61 = &v64;
      double v62 = v25;
      double v63 = v27;
      AXPerformSafeBlock();
      double v30 = v65[6];
      if (v30 != 0.0)
      {
        [(AXLongTitleValueTableViewCell *)self iconImageViewGap];
        double v29 = v30 + v31;
      }
      double v32 = [(PSTableCell *)self valueLabel];
      [v32 setNumberOfLines:0];

      double v33 = [(PSTableCell *)self titleLabel];
      [v33 setNumberOfLines:0];
    }
    [(AXLongTitleValueTableViewCell *)self layoutMargins];
    double v35 = v34;
    if ([(AXLongTitleValueTableViewCell *)self accessoryType])
    {
      double v35 = 0.0;
      if (AXProcessIsSetup())
      {
        [(AXLongTitleValueTableViewCell *)self defaultCellContentTrailingPadding];
        double v35 = v36;
      }
    }
    [(AXLongTitleValueTableViewCell *)self layoutMargins];
    double v38 = v37;
    double v39 = [(PSTableCell *)self valueLabel];
    double v40 = v25 - v38 - v35 + -6.0 - v29;
    objc_msgSend(v39, "sizeThatFits:", v40 * 0.5, v27);
    double v42 = v41;
    double v44 = v43;

    float v45 = [(PSTableCell *)self titleLabel];
    objc_msgSend(v45, "sizeThatFits:", v40 - v42, v27);
    double v47 = v46;

    [(AXLongTitleValueTableViewCell *)self layoutMargins];
    double v49 = v48;
    [(AXLongTitleValueTableViewCell *)self layoutMargins];
    if (v47 >= v44) {
      double v51 = v47;
    }
    else {
      double v51 = v44;
    }
    double v52 = v51 + v49 + v50;
    if (v19 < v52) {
      double v19 = v52;
    }
    _Block_object_dispose(&v64, 8);
  }
  double v53 = v17;
  double v54 = v19;
  result.double height = v54;
  result.double width = v53;
  return result;
}

uint64_t __46__AXLongTitleValueTableViewCell_sizeThatFits___block_invoke(uint64_t a1)
{
  uint64_t result = objc_msgSend(*(id *)(a1 + 32), "imageRectForContentRect:", 0.0, 0.0, *(double *)(a1 + 48), *(double *)(a1 + 56));
  v3 = *(void **)(*(void *)(a1 + 40) + 8);
  v3[4] = v4;
  v3[5] = v5;
  v3[6] = v6;
  v3[7] = v7;
  return result;
}

- (double)iconImageViewGap
{
  v2 = [(AXLongTitleValueTableViewCell *)self traitCollection];
  if ([v2 userInterfaceIdiom] == 3) {
    double v3 = 8.0;
  }
  else {
    double v3 = 15.0;
  }

  return v3;
}

- (double)defaultCellContentTrailingPadding
{
  return 8.0;
}

- (unint64_t)accessibilityTraits
{
  v14.receiver = self;
  v14.super_class = (Class)AXLongTitleValueTableViewCell;
  unint64_t v3 = [(AXLongTitleValueTableViewCell *)&v14 accessibilityTraits];
  uint64_t v4 = [(PSTableCell *)self specifier];
  uint64_t v5 = [v4 propertyForKey:@"VOCommandContext"];

  uint64_t v6 = [(PSTableCell *)self specifier];
  uint64_t v7 = [v6 propertyForKey:@"command"];

  double v8 = [(PSTableCell *)self specifier];
  double v9 = [v8 propertyForKey:@"AXLongTitleValueTableViewCellButtonBoolKey"];
  int v10 = [v9 BOOLValue];

  if ([(PSTableCell *)self type] == 4 && ([(PSTableCell *)self cellEnabled] & v10) == 1)
  {
    if (v5
      || ([(PSTableCell *)self specifier],
          double v11 = objc_claimAutoreleasedReturnValue(),
          uint64_t v12 = [v11 detailControllerClass] | v7,
          v11,
          v12))
    {
      v3 |= *MEMORY[0x1E4FB2540];
    }
  }

  return v3;
}

@end