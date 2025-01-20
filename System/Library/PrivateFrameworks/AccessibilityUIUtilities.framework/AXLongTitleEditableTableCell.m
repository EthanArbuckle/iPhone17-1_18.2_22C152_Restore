@interface AXLongTitleEditableTableCell
- (AXLongTitleEditableTableCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5;
- (CGSize)sizeThatFits:(CGSize)a3;
- (void)layoutSubviews;
@end

@implementation AXLongTitleEditableTableCell

- (AXLongTitleEditableTableCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5
{
  v9.receiver = self;
  v9.super_class = (Class)AXLongTitleEditableTableCell;
  v5 = [(PSEditableTableCell *)&v9 initWithStyle:a3 reuseIdentifier:a4 specifier:a5];
  v6 = v5;
  if (v5)
  {
    v7 = [(PSTableCell *)v5 titleLabel];
    [v7 setNumberOfLines:0];
  }
  return v6;
}

- (void)layoutSubviews
{
  v54[1] = *MEMORY[0x1E4F143B8];
  v52.receiver = self;
  v52.super_class = (Class)AXLongTitleEditableTableCell;
  [(PSEditableTableCell *)&v52 layoutSubviews];
  v3 = [(PSTableCell *)self titleLabel];
  v4 = [v3 text];
  uint64_t v5 = [v4 length];

  if (v5)
  {
    v6 = [(AXLongTitleEditableTableCell *)self traitCollection];
    v7 = [v6 preferredContentSizeCategory];
    BOOL IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v7);

    if (!IsAccessibilityCategory)
    {
      objc_super v9 = [(AXLongTitleEditableTableCell *)self editableTextField];
      [v9 frame];
      double v11 = v10;
      double v13 = v12;
      double v15 = v14;
      double v17 = v16;
      uint64_t v53 = *MEMORY[0x1E4FB12B0];
      v18 = [MEMORY[0x1E4FB1798] preferredFontForTextStyle:*MEMORY[0x1E4FB28C8]];
      v54[0] = v18;
      v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v54 forKeys:&v53 count:1];

      v20 = [v9 text];
      [v20 sizeWithAttributes:v19];
      double v22 = v21;

      if (v22 <= v15)
      {
        [v9 setAdjustsFontSizeToFitWidth:1];
      }
      else
      {
        double v51 = v13;
        double v23 = v22 - v15;
        v24 = [(AXLongTitleEditableTableCell *)self contentView];
        [v24 bounds];
        double v26 = v25;
        double v28 = v27;

        v29 = [(PSTableCell *)self titleLabel];
        [v29 frame];
        double v31 = v30;
        double v33 = v32;

        if (v33 - v23 >= v26 * 0.25) {
          double v34 = v33 - v23;
        }
        else {
          double v34 = v26 * 0.25;
        }
        [v9 setAdjustsFontSizeToFitWidth:0];
        double v35 = v33 - v34;
        v36 = [(PSTableCell *)self titleLabel];
        objc_msgSend(v36, "sizeThatFits:", v34, v28);
        double v38 = v37;
        double v40 = v39;

        float v41 = (v28 - v40) * 0.5;
        double v42 = floorf(v41);
        double v43 = v15 + v35;
        int v44 = [(AXLongTitleEditableTableCell *)self _shouldReverseLayoutDirection];
        double v45 = v35 + 8.0;
        if (!v44) {
          double v45 = -0.0;
        }
        double v46 = v31 + v45;
        double v47 = 0.0;
        if (!v44) {
          double v47 = v35;
        }
        double v48 = v11 - v47;
        v49 = [(PSTableCell *)self titleLabel];
        [v49 setNumberOfLines:0];

        v50 = [(PSTableCell *)self titleLabel];
        objc_msgSend(v50, "setFrame:", v46, v42, v38, v40);

        objc_msgSend(v9, "setFrame:", v48, v51, v43, v17);
      }
    }
  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  v42[1] = *MEMORY[0x1E4F143B8];
  v40.receiver = self;
  v40.super_class = (Class)AXLongTitleEditableTableCell;
  -[AXLongTitleEditableTableCell sizeThatFits:](&v40, sel_sizeThatFits_, a3.width, a3.height);
  double v5 = v4;
  double v7 = v6;
  v8 = [(PSTableCell *)self titleLabel];
  objc_super v9 = [v8 text];
  uint64_t v10 = [v9 length];

  if (v10)
  {
    double v11 = [(AXLongTitleEditableTableCell *)self traitCollection];
    double v12 = [v11 preferredContentSizeCategory];
    BOOL IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v12);

    if (!IsAccessibilityCategory)
    {
      double v14 = [(AXLongTitleEditableTableCell *)self contentView];
      objc_msgSend(v14, "sizeThatFits:", v5, v7);
      double v16 = v15;
      double v18 = v17;

      [(AXLongTitleEditableTableCell *)self layoutMargins];
      double v20 = v16 - v19;
      [(AXLongTitleEditableTableCell *)self layoutMargins];
      double v22 = v20 - v21 + -8.0;
      uint64_t v41 = *MEMORY[0x1E4FB12B0];
      double v23 = [MEMORY[0x1E4FB1798] preferredFontForTextStyle:*MEMORY[0x1E4FB28C8]];
      v42[0] = v23;
      v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v42 forKeys:&v41 count:1];

      double v25 = [(AXLongTitleEditableTableCell *)self editableTextField];
      double v26 = [v25 text];
      [v26 sizeWithAttributes:v24];
      double v28 = v27;
      double v30 = v29;

      if (v22 - v28 >= v16 * 0.25) {
        double v31 = v22 - v28;
      }
      else {
        double v31 = v16 * 0.25;
      }
      double v32 = [(PSTableCell *)self titleLabel];
      objc_msgSend(v32, "sizeThatFits:", v31, v18);
      double v34 = v33;

      if (v34 < v30) {
        double v34 = v30;
      }
      [(AXLongTitleEditableTableCell *)self layoutMargins];
      double v36 = v34 + v35;
      [(AXLongTitleEditableTableCell *)self layoutMargins];
      if (v7 < v36 + v37) {
        double v7 = v36 + v37;
      }
    }
  }
  double v38 = v5;
  double v39 = v7;
  result.height = v39;
  result.width = v38;
  return result;
}

@end