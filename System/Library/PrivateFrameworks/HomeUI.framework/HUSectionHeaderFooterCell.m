@interface HUSectionHeaderFooterCell
- (BOOL)prefersSeparatorsHidden;
- (CGSize)intrinsicContentSize;
- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5;
- (HUItemTableSectionHeaderFooterView)headerFooterView;
- (HUSectionHeaderFooterCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (void)prepareForReuse;
- (void)willMoveToSuperview:(id)a3;
@end

@implementation HUSectionHeaderFooterCell

- (HUSectionHeaderFooterCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v43[4] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  v42.receiver = self;
  v42.super_class = (Class)HUSectionHeaderFooterCell;
  v7 = [(HUSectionHeaderFooterCell *)&v42 initWithStyle:a3 reuseIdentifier:v6];
  if (v7)
  {
    v8 = [[HUItemTableSectionHeaderFooterView alloc] initWithReuseIdentifier:v6];
    headerFooterView = v7->_headerFooterView;
    v7->_headerFooterView = v8;

    double v10 = *MEMORY[0x1E4F437F8];
    double v11 = *(double *)(MEMORY[0x1E4F437F8] + 8);
    double v12 = *(double *)(MEMORY[0x1E4F437F8] + 16);
    double v13 = *(double *)(MEMORY[0x1E4F437F8] + 24);
    v14 = [(HUSectionHeaderFooterCell *)v7 headerFooterView];
    objc_msgSend(v14, "setIndentationInset:", v10, v11, v12, v13);

    v15 = [(HUSectionHeaderFooterCell *)v7 contentView];
    [(HUSectionHeaderFooterCell *)v7 headerFooterView];
    v16 = id v41 = v6;
    objc_msgSend(v15, "naui_addAutoLayoutSubview:", v16);

    v31 = (void *)MEMORY[0x1E4F28DC8];
    v40 = [(HUSectionHeaderFooterCell *)v7 contentView];
    v38 = [v40 leadingAnchor];
    v39 = [(HUSectionHeaderFooterCell *)v7 headerFooterView];
    v37 = [v39 leadingAnchor];
    v36 = [v38 constraintEqualToAnchor:v37];
    v43[0] = v36;
    v35 = [(HUSectionHeaderFooterCell *)v7 contentView];
    v33 = [v35 trailingAnchor];
    v34 = [(HUSectionHeaderFooterCell *)v7 headerFooterView];
    v32 = [v34 trailingAnchor];
    v30 = [v33 constraintEqualToAnchor:v32];
    v43[1] = v30;
    v29 = [(HUSectionHeaderFooterCell *)v7 contentView];
    v28 = [v29 topAnchor];
    v17 = [(HUSectionHeaderFooterCell *)v7 headerFooterView];
    v18 = [v17 topAnchor];
    v19 = [v28 constraintEqualToAnchor:v18];
    v43[2] = v19;
    v20 = [(HUSectionHeaderFooterCell *)v7 contentView];
    v21 = [v20 bottomAnchor];
    v22 = [(HUSectionHeaderFooterCell *)v7 headerFooterView];
    v23 = [v22 bottomAnchor];
    v24 = [v21 constraintEqualToAnchor:v23];
    v43[3] = v24;
    v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:v43 count:4];
    [v31 activateConstraints:v25];

    id v6 = v41;
    v26 = [MEMORY[0x1E4F428B8] clearColor];
    [(HUSectionHeaderFooterCell *)v7 setBackgroundColor:v26];
  }
  return v7;
}

- (void)willMoveToSuperview:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HUSectionHeaderFooterCell;
  [(HUSectionHeaderFooterCell *)&v9 willMoveToSuperview:v4];
  objc_opt_class();
  id v5 = v4;
  if (objc_opt_isKindOfClass()) {
    id v6 = v5;
  }
  else {
    id v6 = 0;
  }
  id v7 = v6;

  v8 = [(HUSectionHeaderFooterCell *)self headerFooterView];
  [v8 setTableView:v7];

  [(HUSectionHeaderFooterCell *)self invalidateIntrinsicContentSize];
  [(HUSectionHeaderFooterCell *)self setNeedsUpdateConstraints];
}

- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5
{
  double height = a3.height;
  double width = a3.width;
  objc_super v9 = [(HUSectionHeaderFooterCell *)self headerFooterView];
  *(float *)&double v10 = a4;
  *(float *)&double v11 = a5;
  objc_msgSend(v9, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:", width, height, v10, v11);
  double v13 = v12;
  double v15 = v14;

  double v16 = v13;
  double v17 = v15;
  result.double height = v17;
  result.double width = v16;
  return result;
}

- (CGSize)intrinsicContentSize
{
  LODWORD(v2) = 1148846080;
  LODWORD(v3) = 1148846080;
  -[HUSectionHeaderFooterCell systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:](self, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:", *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8), v2, v3);
  result.double height = v5;
  result.double width = v4;
  return result;
}

- (void)prepareForReuse
{
  double v3 = [(HUSectionHeaderFooterCell *)self headerFooterView];
  [v3 prepareForReuse];

  v4.receiver = self;
  v4.super_class = (Class)HUSectionHeaderFooterCell;
  [(HUSectionHeaderFooterCell *)&v4 prepareForReuse];
}

- (BOOL)prefersSeparatorsHidden
{
  return 1;
}

- (HUItemTableSectionHeaderFooterView)headerFooterView
{
  return self->_headerFooterView;
}

- (void).cxx_destruct
{
}

@end