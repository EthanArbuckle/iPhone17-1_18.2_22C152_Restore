@interface _UIDocumentPickerSortOrderView
- (BOOL)listModeToggleHidden;
- (NSArray)centeredConstraints;
- (NSArray)leftAlignedConstraints;
- (UIButton)listModeToggle;
- (UISegmentedControl)sortOrder;
- (_UIDocumentPickerSortOrderView)initWithFrame:(CGRect)a3;
- (_UIDocumentPickerViewServiceViewController)serviceViewController;
- (int)value;
- (int64_t)listMode;
- (void)_toggleListMode:(id)a3;
- (void)layoutSubviews;
- (void)setCenteredConstraints:(id)a3;
- (void)setLeftAlignedConstraints:(id)a3;
- (void)setListMode:(int64_t)a3;
- (void)setListModeToggle:(id)a3;
- (void)setListModeToggleHidden:(BOOL)a3;
- (void)setNeedsLayout;
- (void)setServiceViewController:(id)a3;
- (void)setSortOrder:(id)a3;
- (void)setValue:(int)a3;
- (void)updateForListMode;
- (void)valueChanged:(id)a3;
@end

@implementation _UIDocumentPickerSortOrderView

- (_UIDocumentPickerSortOrderView)initWithFrame:(CGRect)a3
{
  v28[3] = *MEMORY[0x263EF8340];
  v27.receiver = self;
  v27.super_class = (Class)_UIDocumentPickerSortOrderView;
  v3 = -[_UIDocumentPickerSortOrderView initWithFrame:](&v27, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, 44.0);
  if (v3)
  {
    v4 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.CloudDocsUI"];
    v5 = [v4 localizedStringForKey:@"Date[sort option]" value:@"Date" table:@"Localizable"];

    v6 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.CloudDocsUI"];
    v7 = [v6 localizedStringForKey:@"Name[sort option]" value:@"Name" table:@"Localizable"];

    v8 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.CloudDocsUI"];
    v9 = [v8 localizedStringForKey:@"Tags[sort option]" value:@"Tags" table:@"Localizable"];

    id v10 = objc_alloc(MEMORY[0x263F1C968]);
    v28[0] = v5;
    v28[1] = v7;
    v28[2] = v9;
    v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v28 count:3];
    v12 = (void *)[v10 initWithItems:v11];
    [(_UIDocumentPickerSortOrderView *)v3 setSortOrder:v12];

    v13 = [(_UIDocumentPickerSortOrderView *)v3 sortOrder];
    [v13 setTranslatesAutoresizingMaskIntoConstraints:0];

    v14 = [(_UIDocumentPickerSortOrderView *)v3 sortOrder];
    [(_UIDocumentPickerSortOrderView *)v3 addSubview:v14];

    v15 = [MEMORY[0x263F1C488] buttonWithType:1];
    [(_UIDocumentPickerSortOrderView *)v3 setListModeToggle:v15];

    v16 = [(_UIDocumentPickerSortOrderView *)v3 listModeToggle];
    [v16 setTranslatesAutoresizingMaskIntoConstraints:0];

    v17 = [MEMORY[0x263F1C6B0] kitImageNamed:@"UIButtonBarListIcon.png"];
    v18 = [v17 imageWithRenderingMode:2];

    v19 = [(_UIDocumentPickerSortOrderView *)v3 listModeToggle];
    [v19 setImage:v18 forState:0];

    v20 = [(_UIDocumentPickerSortOrderView *)v3 listModeToggle];
    objc_msgSend(v20, "setContentEdgeInsets:", 8.0, 8.0, 8.0, 8.0);

    v21 = [(_UIDocumentPickerSortOrderView *)v3 listModeToggle];
    [(_UIDocumentPickerSortOrderView *)v3 addSubview:v21];

    v22 = [(_UIDocumentPickerSortOrderView *)v3 sortOrder];
    [v22 addTarget:v3 action:sel_valueChanged_ forControlEvents:4096];

    v23 = [(_UIDocumentPickerSortOrderView *)v3 listModeToggle];
    [v23 addTarget:v3 action:sel__toggleListMode_ forControlEvents:64];

    [(_UIDocumentPickerSortOrderView *)v3 updateForListMode];
    v24 = [(_UIDocumentPickerSortOrderView *)v3 heightAnchor];
    v25 = [v24 constraintEqualToConstant:44.0];
    [v25 setActive:1];
  }
  return v3;
}

- (void)setNeedsLayout
{
  v2.receiver = self;
  v2.super_class = (Class)_UIDocumentPickerSortOrderView;
  [(_UIDocumentPickerSortOrderView *)&v2 setNeedsLayout];
}

- (void)layoutSubviews
{
  v74[5] = *MEMORY[0x263EF8340];
  v72.receiver = self;
  v72.super_class = (Class)_UIDocumentPickerSortOrderView;
  [(_UIDocumentPickerSortOrderView *)&v72 layoutSubviews];
  [(_UIDocumentPickerSortOrderView *)self size];
  double v4 = v3;
  v5 = [(_UIDocumentPickerSortOrderView *)self listModeToggle];
  [v5 size];
  v7 = &OBJC_IVAR____UIDocumentPickerCell__item;
  if (v4 > (v6 + 13.0 + 13.0) * 2.0 + 263.0)
  {

    goto LABEL_4;
  }
  BOOL listModeToggleHidden = self->_listModeToggleHidden;

  if (listModeToggleHidden)
  {
LABEL_4:
    v9 = [(_UIDocumentPickerSortOrderView *)self leftAlignedConstraints];
    id v10 = [v9 firstObject];
    int v11 = [v10 isActive];

    if (v11)
    {
      v12 = (void *)MEMORY[0x263F08938];
      v13 = [(_UIDocumentPickerSortOrderView *)self leftAlignedConstraints];
      [v12 deactivateConstraints:v13];
    }
    v14 = [(_UIDocumentPickerSortOrderView *)self centeredConstraints];

    if (!v14)
    {
      v70 = [(_UIDocumentPickerSortOrderView *)self sortOrder];
      v68 = [v70 centerXAnchor];
      v66 = [(_UIDocumentPickerSortOrderView *)self centerXAnchor];
      v64 = [v68 constraintEqualToAnchor:v66];
      v73[0] = v64;
      v62 = [(_UIDocumentPickerSortOrderView *)self sortOrder];
      v60 = [v62 centerYAnchor];
      v58 = [(_UIDocumentPickerSortOrderView *)self centerYAnchor];
      v56 = [v60 constraintEqualToAnchor:v58];
      v73[1] = v56;
      v54 = [(_UIDocumentPickerSortOrderView *)self sortOrder];
      v52 = [v54 widthAnchor];
      v50 = [v52 constraintGreaterThanOrEqualToConstant:263.0];
      v73[2] = v50;
      v15 = [(_UIDocumentPickerSortOrderView *)self trailingAnchor];
      v16 = [(_UIDocumentPickerSortOrderView *)self listModeToggle];
      v17 = [v16 trailingAnchor];
      v18 = [v15 constraintEqualToAnchor:v17 constant:13.0];
      v73[3] = v18;
      v19 = [(_UIDocumentPickerSortOrderView *)self listModeToggle];
      v20 = [v19 centerYAnchor];
      v21 = [(_UIDocumentPickerSortOrderView *)self centerYAnchor];
      v22 = [v20 constraintEqualToAnchor:v21];
      v73[4] = v22;
      v23 = [MEMORY[0x263EFF8C0] arrayWithObjects:v73 count:5];
      [(_UIDocumentPickerSortOrderView *)self setCenteredConstraints:v23];

      v7 = &OBJC_IVAR____UIDocumentPickerCell__item;
    }
    v24 = [(_UIDocumentPickerSortOrderView *)self centeredConstraints];
    v25 = [v24 firstObject];
    char v26 = [v25 isActive];

    if ((v26 & 1) == 0)
    {
      objc_super v27 = (void *)MEMORY[0x263F08938];
      uint64_t v28 = [(_UIDocumentPickerSortOrderView *)self centeredConstraints];
LABEL_10:
      v29 = (void *)v28;
      [v27 activateConstraints:v28];

      goto LABEL_11;
    }
    goto LABEL_11;
  }
  v32 = [(_UIDocumentPickerSortOrderView *)self centeredConstraints];
  v33 = [v32 firstObject];
  int v34 = [v33 isActive];

  if (v34)
  {
    v35 = (void *)MEMORY[0x263F08938];
    v36 = [(_UIDocumentPickerSortOrderView *)self centeredConstraints];
    [v35 deactivateConstraints:v36];
  }
  v37 = [(_UIDocumentPickerSortOrderView *)self leftAlignedConstraints];

  if (!v37)
  {
    v71 = [(_UIDocumentPickerSortOrderView *)self sortOrder];
    v69 = [v71 leadingAnchor];
    v67 = [(_UIDocumentPickerSortOrderView *)self leadingAnchor];
    v65 = [v69 constraintEqualToAnchor:v67 constant:8.0];
    v74[0] = v65;
    v63 = [(_UIDocumentPickerSortOrderView *)self sortOrder];
    v61 = [v63 centerYAnchor];
    v59 = [(_UIDocumentPickerSortOrderView *)self centerYAnchor];
    v57 = [v61 constraintEqualToAnchor:v59];
    v74[1] = v57;
    v55 = [(_UIDocumentPickerSortOrderView *)self sortOrder];
    v53 = [v55 widthAnchor];
    v51 = [v53 constraintGreaterThanOrEqualToConstant:263.0];
    v74[2] = v51;
    v38 = [(_UIDocumentPickerSortOrderView *)self trailingAnchor];
    v39 = [(_UIDocumentPickerSortOrderView *)self listModeToggle];
    v40 = [v39 trailingAnchor];
    v41 = [v38 constraintEqualToAnchor:v40 constant:5.0];
    v74[3] = v41;
    v42 = [(_UIDocumentPickerSortOrderView *)self listModeToggle];
    v43 = [v42 centerYAnchor];
    v44 = [(_UIDocumentPickerSortOrderView *)self centerYAnchor];
    v45 = [v43 constraintEqualToAnchor:v44];
    v74[4] = v45;
    v46 = [MEMORY[0x263EFF8C0] arrayWithObjects:v74 count:5];
    [(_UIDocumentPickerSortOrderView *)self setLeftAlignedConstraints:v46];

    v7 = &OBJC_IVAR____UIDocumentPickerCell__item;
  }
  v47 = [(_UIDocumentPickerSortOrderView *)self leftAlignedConstraints];
  v48 = [v47 firstObject];
  char v49 = [v48 isActive];

  if ((v49 & 1) == 0)
  {
    objc_super v27 = (void *)MEMORY[0x263F08938];
    uint64_t v28 = [(_UIDocumentPickerSortOrderView *)self leftAlignedConstraints];
    goto LABEL_10;
  }
LABEL_11:
  uint64_t v30 = *((unsigned __int8 *)&self->super.super.super.super.isa + v7[29]);
  v31 = [(_UIDocumentPickerSortOrderView *)self listModeToggle];
  [v31 setHidden:v30];
}

- (void)updateForListMode
{
  BOOL v2 = self->_listMode == 2;
  id v3 = [(_UIDocumentPickerSortOrderView *)self listModeToggle];
  [v3 setSelected:v2];
}

- (void)setValue:(int)a3
{
  uint64_t v3 = a3;
  id v4 = [(_UIDocumentPickerSortOrderView *)self sortOrder];
  [v4 setSelectedSegmentIndex:v3];
}

- (int)value
{
  BOOL v2 = [(_UIDocumentPickerSortOrderView *)self sortOrder];
  int v3 = [v2 selectedSegmentIndex];

  return v3;
}

- (void)valueChanged:(id)a3
{
  id v4 = [(_UIDocumentPickerSortOrderView *)self sortOrder];
  -[_UIDocumentPickerSortOrderView setValue:](self, "setValue:", [v4 selectedSegmentIndex]);

  [(_UIDocumentPickerSortOrderView *)self sendActionsForControlEvents:4096];
}

- (void)setListMode:(int64_t)a3
{
  if (self->_listMode != a3)
  {
    self->_listMode = a3;
    [(_UIDocumentPickerSortOrderView *)self updateForListMode];
  }
}

- (void)_toggleListMode:(id)a3
{
  if (self->_listMode == 1) {
    uint64_t v4 = 2;
  }
  else {
    uint64_t v4 = 1;
  }
  [(_UIDocumentPickerSortOrderView *)self setListMode:v4];

  [(_UIDocumentPickerSortOrderView *)self sendActionsForControlEvents:4096];
}

- (void)setListModeToggleHidden:(BOOL)a3
{
  self->_BOOL listModeToggleHidden = a3;
  [(_UIDocumentPickerSortOrderView *)self setNeedsLayout];
}

- (_UIDocumentPickerViewServiceViewController)serviceViewController
{
  return self->_serviceViewController;
}

- (void)setServiceViewController:(id)a3
{
  self->_serviceViewController = (_UIDocumentPickerViewServiceViewController *)a3;
}

- (int64_t)listMode
{
  return self->_listMode;
}

- (BOOL)listModeToggleHidden
{
  return self->_listModeToggleHidden;
}

- (UISegmentedControl)sortOrder
{
  return self->_sortOrder;
}

- (void)setSortOrder:(id)a3
{
}

- (UIButton)listModeToggle
{
  return self->_listModeToggle;
}

- (void)setListModeToggle:(id)a3
{
}

- (NSArray)leftAlignedConstraints
{
  return self->_leftAlignedConstraints;
}

- (void)setLeftAlignedConstraints:(id)a3
{
}

- (NSArray)centeredConstraints
{
  return self->_centeredConstraints;
}

- (void)setCenteredConstraints:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_centeredConstraints, 0);
  objc_storeStrong((id *)&self->_leftAlignedConstraints, 0);
  objc_storeStrong((id *)&self->_listModeToggle, 0);

  objc_storeStrong((id *)&self->_sortOrder, 0);
}

@end