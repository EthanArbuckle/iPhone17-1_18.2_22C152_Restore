@interface CARSettingsCellSpecifier
- (BOOL)detailSizeToFit;
- (BOOL)isEnabled;
- (CARObserverHashTable)observers;
- (CARSettingsCellSpecifier)initWithTitle:(id)a3 image:(id)a4 accessoryType:(int64_t)a5;
- (CARSettingsCellSpecifier)initWithTitle:(id)a3 image:(id)a4 accessoryType:(int64_t)a5 actionBlock:(id)a6;
- (CARSettingsCellSpecifier)initWithTitle:(id)a3 subtitle:(id)a4 image:(id)a5 accessoryType:(int64_t)a6;
- (CARSettingsCellSpecifier)initWithTitle:(id)a3 subtitle:(id)a4 image:(id)a5 accessoryType:(int64_t)a6 actionBlock:(id)a7;
- (CGSize)intrinsicContentSize;
- (NSAttributedString)attributedTitle;
- (NSString)detail;
- (NSString)subtitle;
- (NSString)title;
- (UIColor)titleColor;
- (UIImage)image;
- (id)actionBlock;
- (id)cellValue;
- (int64_t)accessoryType;
- (int64_t)detailLineBreakMode;
- (int64_t)detailNumberOfLines;
- (int64_t)selectionStyle;
- (void)addObserver:(id)a3;
- (void)removeObserver:(id)a3;
- (void)setAccessoryType:(int64_t)a3;
- (void)setActionBlock:(id)a3;
- (void)setAttributedTitle:(id)a3;
- (void)setCellValue:(id)a3;
- (void)setDetail:(id)a3;
- (void)setDetail:(id)a3 sizeToFit:(BOOL)a4 withNumberOfLines:(int64_t)a5 lineBreakMode:(int64_t)a6;
- (void)setDetailLineBreakMode:(int64_t)a3;
- (void)setDetailNumberOfLines:(int64_t)a3;
- (void)setDetailSizeToFit:(BOOL)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setImage:(id)a3;
- (void)setObservers:(id)a3;
- (void)setSelectionStyle:(int64_t)a3;
- (void)setSubtitle:(id)a3;
- (void)setTitle:(id)a3;
- (void)setTitleColor:(id)a3;
@end

@implementation CARSettingsCellSpecifier

- (CARSettingsCellSpecifier)initWithTitle:(id)a3 image:(id)a4 accessoryType:(int64_t)a5
{
  return [(CARSettingsCellSpecifier *)self initWithTitle:a3 subtitle:0 image:a4 accessoryType:a5];
}

- (CARSettingsCellSpecifier)initWithTitle:(id)a3 subtitle:(id)a4 image:(id)a5 accessoryType:(int64_t)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v21.receiver = self;
  v21.super_class = (Class)CARSettingsCellSpecifier;
  v13 = [(CARSettingsCellSpecifier *)&v21 init];
  if (v13)
  {
    v14 = (CARObserverHashTable *)[objc_alloc((Class)CARObserverHashTable) initWithProtocol:&OBJC_PROTOCOL___CARSettingsCellSpecifierObserver];
    observers = v13->_observers;
    v13->_observers = v14;

    v16 = (NSString *)[v10 copy];
    title = v13->_title;
    v13->_title = v16;

    v18 = (NSString *)[v11 copy];
    subtitle = v13->_subtitle;
    v13->_subtitle = v18;

    objc_storeStrong((id *)&v13->_image, a5);
    v13->_accessoryType = a6;
    v13->_selectionStyle = 1;
    v13->_enabled = 1;
  }

  return v13;
}

- (CARSettingsCellSpecifier)initWithTitle:(id)a3 image:(id)a4 accessoryType:(int64_t)a5 actionBlock:(id)a6
{
  id v10 = a6;
  id v11 = [(CARSettingsCellSpecifier *)self initWithTitle:a3 image:a4 accessoryType:a5];
  if (v11)
  {
    id v12 = objc_retainBlock(v10);
    id actionBlock = v11->_actionBlock;
    v11->_id actionBlock = v12;
  }
  return v11;
}

- (CARSettingsCellSpecifier)initWithTitle:(id)a3 subtitle:(id)a4 image:(id)a5 accessoryType:(int64_t)a6 actionBlock:(id)a7
{
  id v12 = a7;
  v13 = [(CARSettingsCellSpecifier *)self initWithTitle:a3 subtitle:a4 image:a5 accessoryType:a6];
  if (v13)
  {
    id v14 = objc_retainBlock(v12);
    id actionBlock = v13->_actionBlock;
    v13->_id actionBlock = v14;
  }
  return v13;
}

- (void)setTitle:(id)a3
{
  id v7 = a3;
  if (!-[NSString isEqualToString:](self->_title, "isEqualToString:"))
  {
    v4 = (NSString *)[v7 copy];
    title = self->_title;
    self->_title = v4;

    v6 = [(CARSettingsCellSpecifier *)self observers];
    [v6 specifier:self didUpdateTitle:v7];
  }
}

- (void)setSubtitle:(id)a3
{
  id v7 = a3;
  if (!-[NSString isEqualToString:](self->_subtitle, "isEqualToString:"))
  {
    v4 = (NSString *)[v7 copy];
    subtitle = self->_subtitle;
    self->_subtitle = v4;

    v6 = [(CARSettingsCellSpecifier *)self observers];
    [v6 specifier:self didUpdateSubtitle:v7];
  }
}

- (void)setAttributedTitle:(id)a3
{
  id v7 = a3;
  if (!-[NSAttributedString isEqualToAttributedString:](self->_attributedTitle, "isEqualToAttributedString:"))
  {
    v4 = (NSAttributedString *)[v7 copy];
    attributedTitle = self->_attributedTitle;
    self->_attributedTitle = v4;

    v6 = [(CARSettingsCellSpecifier *)self observers];
    [v6 specifier:self didUpdateAttributedTitle:v7];
  }
}

- (void)setAccessoryType:(int64_t)a3
{
  if (self->_accessoryType != a3)
  {
    self->_accessoryType = a3;
    id v4 = [(CARSettingsCellSpecifier *)self observers];
    [v4 specifier:self didUpdateAccessoryType:self->_accessoryType];
  }
}

- (void)setDetail:(id)a3
{
  id v7 = a3;
  if (!-[NSString isEqualToString:](self->_detail, "isEqualToString:"))
  {
    id v4 = (NSString *)[v7 copy];
    detail = self->_detail;
    self->_detail = v4;

    v6 = [(CARSettingsCellSpecifier *)self observers];
    [v6 specifier:self didUpdateDetail:self->_detail];
  }
}

- (void)setDetail:(id)a3 sizeToFit:(BOOL)a4 withNumberOfLines:(int64_t)a5 lineBreakMode:(int64_t)a6
{
  id v13 = a3;
  if (!-[NSString isEqualToString:](self->_detail, "isEqualToString:"))
  {
    id v10 = (NSString *)[v13 copy];
    detail = self->_detail;
    self->_detail = v10;

    self->_detailSizeToFit = a4;
    self->_detailLineBreakMode = a6;
    self->_detailNumberOfLines = a5;
    id v12 = [(CARSettingsCellSpecifier *)self observers];
    [v12 specifier:self didUpdateDetail:self->_detail];
  }
}

- (void)setTitleColor:(id)a3
{
  id v7 = a3;
  if ((-[UIColor isEqual:](self->_titleColor, "isEqual:") & 1) == 0)
  {
    id v4 = (UIColor *)[v7 copy];
    titleColor = self->_titleColor;
    self->_titleColor = v4;

    v6 = [(CARSettingsCellSpecifier *)self observers];
    [v6 specifier:self didUpdateTitleColor:v7];
  }
}

- (void)setSelectionStyle:(int64_t)a3
{
  if (self->_selectionStyle != a3)
  {
    self->_selectionStyle = a3;
    id v5 = [(CARSettingsCellSpecifier *)self observers];
    [v5 specifier:self didUpdateSelectionStyle:a3];
  }
}

- (void)setCellValue:(id)a3
{
  objc_storeStrong(&self->_cellValue, a3);
  id v5 = a3;
  id v6 = [(CARSettingsCellSpecifier *)self observers];
  [v6 specifier:self didUpdateValue:v5];
}

- (void)setImage:(id)a3
{
  objc_storeStrong((id *)&self->_image, a3);
  id v5 = a3;
  id v6 = [(CARSettingsCellSpecifier *)self observers];
  [v6 specifier:self didUpdateImage:v5];
}

- (void)setEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  self->_enabled = a3;
  id v5 = [(CARSettingsCellSpecifier *)self observers];
  [v5 specifier:self didUpdateEnabled:v3];
}

- (CGSize)intrinsicContentSize
{
  v2 = [(CARSettingsCellSpecifier *)self image];
  [v2 size];
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (void)addObserver:(id)a3
{
  id v4 = a3;
  id v5 = [(CARSettingsCellSpecifier *)self observers];
  [v5 addObserver:v4];
}

- (void)removeObserver:(id)a3
{
  id v4 = a3;
  id v5 = [(CARSettingsCellSpecifier *)self observers];
  [v5 removeObserver:v4];
}

- (NSString)title
{
  return self->_title;
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (NSAttributedString)attributedTitle
{
  return self->_attributedTitle;
}

- (UIImage)image
{
  return self->_image;
}

- (int64_t)accessoryType
{
  return self->_accessoryType;
}

- (NSString)detail
{
  return self->_detail;
}

- (int64_t)detailLineBreakMode
{
  return self->_detailLineBreakMode;
}

- (void)setDetailLineBreakMode:(int64_t)a3
{
  self->_detailLineBreakMode = a3;
}

- (int64_t)detailNumberOfLines
{
  return self->_detailNumberOfLines;
}

- (void)setDetailNumberOfLines:(int64_t)a3
{
  self->_detailNumberOfLines = a3;
}

- (BOOL)detailSizeToFit
{
  return self->_detailSizeToFit;
}

- (void)setDetailSizeToFit:(BOOL)a3
{
  self->_detailSizeToFit = a3;
}

- (UIColor)titleColor
{
  return self->_titleColor;
}

- (id)actionBlock
{
  return self->_actionBlock;
}

- (void)setActionBlock:(id)a3
{
}

- (int64_t)selectionStyle
{
  return self->_selectionStyle;
}

- (id)cellValue
{
  return self->_cellValue;
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (CARObserverHashTable)observers
{
  return (CARObserverHashTable *)objc_getProperty(self, a2, 112, 1);
}

- (void)setObservers:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong(&self->_cellValue, 0);
  objc_storeStrong(&self->_actionBlock, 0);
  objc_storeStrong((id *)&self->_titleColor, 0);
  objc_storeStrong((id *)&self->_detail, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_attributedTitle, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);

  objc_storeStrong((id *)&self->_title, 0);
}

@end