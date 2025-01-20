@interface _UIDocumentPickerManagementViewControllerCell
- (BOOL)showNewlyAdded;
- (UIImageView)newlyAddedView;
- (_UIDocumentPickerManagementViewControllerCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (id)_dotImage;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)setNewlyAddedView:(id)a3;
- (void)setShowNewlyAdded:(BOOL)a3;
@end

@implementation _UIDocumentPickerManagementViewControllerCell

- (_UIDocumentPickerManagementViewControllerCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v12.receiver = self;
  v12.super_class = (Class)_UIDocumentPickerManagementViewControllerCell;
  v4 = [(_UIDocumentPickerManagementViewControllerCell *)&v12 initWithStyle:3 reuseIdentifier:a4];
  if (v4)
  {
    id v5 = objc_alloc_init(MEMORY[0x263F1C6D0]);
    [(_UIDocumentPickerManagementViewControllerCell *)v4 setNewlyAddedView:v5];

    v6 = [(_UIDocumentPickerManagementViewControllerCell *)v4 newlyAddedView];
    [v6 setContentMode:4];

    v7 = [(_UIDocumentPickerManagementViewControllerCell *)v4 newlyAddedView];
    [v7 setClipsToBounds:1];

    v8 = [(_UIDocumentPickerManagementViewControllerCell *)v4 contentView];
    [v8 addSubview:v4->_newlyAddedView];

    v9 = [MEMORY[0x263F1C550] systemBackgroundColor];
    v10 = [(_UIDocumentPickerManagementViewControllerCell *)v4 contentView];
    [v10 setBackgroundColor:v9];
  }
  return v4;
}

- (void)prepareForReuse
{
  v4.receiver = self;
  v4.super_class = (Class)_UIDocumentPickerManagementViewControllerCell;
  [(_UIDocumentPickerManagementViewControllerCell *)&v4 prepareForReuse];
  v3 = [(_UIDocumentPickerManagementViewControllerCell *)self newlyAddedView];
  [v3 setImage:0];
}

- (id)_dotImage
{
  v3 = (void *)MEMORY[0x263F1C6B0];
  objc_super v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v5 = [(_UIDocumentPickerManagementViewControllerCell *)self traitCollection];
  v6 = [v3 imageNamed:@"UIImageNameIndicatorDot" inBundle:v4 compatibleWithTraitCollection:v5];
  v7 = [v6 imageWithRenderingMode:2];

  return v7;
}

- (void)setShowNewlyAdded:(BOOL)a3
{
  if (a3)
  {
    id v5 = [(_UIDocumentPickerManagementViewControllerCell *)self _dotImage];
    objc_super v4 = [(_UIDocumentPickerManagementViewControllerCell *)self newlyAddedView];
    [v4 setImage:v5];
  }
  else
  {
    id v5 = [(_UIDocumentPickerManagementViewControllerCell *)self newlyAddedView];
    [v5 setImage:0];
  }
}

- (BOOL)showNewlyAdded
{
  v2 = [(_UIDocumentPickerManagementViewControllerCell *)self newlyAddedView];
  v3 = [v2 image];
  BOOL v4 = v3 != 0;

  return v4;
}

- (void)layoutSubviews
{
  v18.receiver = self;
  v18.super_class = (Class)_UIDocumentPickerManagementViewControllerCell;
  [(_UIDocumentPickerManagementViewControllerCell *)&v18 layoutSubviews];
  v3 = [(_UIDocumentPickerManagementViewControllerCell *)self _dotImage];
  BOOL v4 = [(_UIDocumentPickerManagementViewControllerCell *)self imageView];
  [v4 frame];
  CGFloat v6 = v5;
  double v8 = v7;
  CGFloat v10 = v9;
  double v12 = v11;

  v19.origin.x = v6;
  v19.origin.y = v8;
  v19.size.width = v10;
  v19.size.height = v12;
  CGRectGetMaxX(v19);
  UIRoundToViewScale();
  double v14 = v13;
  [v3 size];
  double v16 = v15;
  v17 = [(_UIDocumentPickerManagementViewControllerCell *)self newlyAddedView];
  objc_msgSend(v17, "setFrame:", v14, v8, v16, v12);
}

- (UIImageView)newlyAddedView
{
  return self->_newlyAddedView;
}

- (void)setNewlyAddedView:(id)a3
{
}

- (void).cxx_destruct
{
}

@end