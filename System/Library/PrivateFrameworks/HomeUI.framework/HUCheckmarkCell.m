@interface HUCheckmarkCell
- (BOOL)checked;
- (HUCheckmarkCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (UIImage)checkedImage;
- (UIImage)uncheckedImage;
- (id)description;
- (void)prepareForReuse;
- (void)setChecked:(BOOL)a3;
- (void)setCheckedImage:(id)a3;
- (void)setUncheckedImage:(id)a3;
@end

@implementation HUCheckmarkCell

- (HUCheckmarkCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)HUCheckmarkCell;
  v4 = [(HUActivityIndicatorCell *)&v7 initWithStyle:a3 reuseIdentifier:a4];
  v5 = v4;
  if (v4) {
    [(HUCheckmarkCell *)v4 setChecked:0];
  }
  return v5;
}

- (void)prepareForReuse
{
  v3.receiver = self;
  v3.super_class = (Class)HUCheckmarkCell;
  [(HUActivityIndicatorCell *)&v3 prepareForReuse];
  [(HUCheckmarkCell *)self setChecked:0];
}

- (UIImage)checkedImage
{
  checkedImage = self->_checkedImage;
  if (checkedImage)
  {
    objc_super v3 = checkedImage;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E4F42A80], "hu_cellCheckmarkImage");
    objc_super v3 = (UIImage *)objc_claimAutoreleasedReturnValue();
  }

  return v3;
}

- (UIImage)uncheckedImage
{
  uncheckedImage = self->_uncheckedImage;
  if (uncheckedImage)
  {
    objc_super v3 = uncheckedImage;
  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "hu_emptyCheckmarkPlaceholderImage");
    objc_super v3 = (UIImage *)objc_claimAutoreleasedReturnValue();
  }

  return v3;
}

- (void)setChecked:(BOOL)a3
{
  if (self->_checked != a3)
  {
    self->_checked = a3;
    if (a3) {
      [(HUCheckmarkCell *)self checkedImage];
    }
    else {
    id v4 = [(HUCheckmarkCell *)self uncheckedImage];
    }
    [(HUActivityIndicatorCell *)self setIcon:v4];
  }
}

- (id)description
{
  objc_super v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = [(HUActivityIndicatorCell *)self titleText];
  objc_super v7 = [v3 stringWithFormat:@"<%@ %p \"%@\" (animating=%d, checked=%d)>", v5, self, v6, -[HUActivityIndicatorCell isAnimating](self, "isAnimating"), -[HUCheckmarkCell checked](self, "checked")];

  return v7;
}

- (BOOL)checked
{
  return self->_checked;
}

- (void)setCheckedImage:(id)a3
{
}

- (void)setUncheckedImage:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uncheckedImage, 0);

  objc_storeStrong((id *)&self->_checkedImage, 0);
}

@end