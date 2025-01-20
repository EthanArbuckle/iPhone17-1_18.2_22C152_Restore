@interface MEMailComposeToolbarItemInfo
- (MEMailComposeToolbarItemInfo)initWithLabel:(id)a3 image:(id)a4 tooltip:(id)a5;
- (NSString)label;
- (NSString)tooltip;
- (UIImage)image;
- (void)setImage:(id)a3;
- (void)setLabel:(id)a3;
- (void)setTooltip:(id)a3;
@end

@implementation MEMailComposeToolbarItemInfo

- (MEMailComposeToolbarItemInfo)initWithLabel:(id)a3 image:(id)a4 tooltip:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)MEMailComposeToolbarItemInfo;
  v12 = [(MEMailComposeToolbarItemInfo *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_image, a4);
    objc_storeStrong((id *)&v13->_label, a3);
    objc_storeStrong((id *)&v13->_tooltip, a5);
  }

  return v13;
}

- (UIImage)image
{
  return self->_image;
}

- (void)setImage:(id)a3
{
}

- (NSString)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
}

- (NSString)tooltip
{
  return self->_tooltip;
}

- (void)setTooltip:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tooltip, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_image, 0);
}

@end