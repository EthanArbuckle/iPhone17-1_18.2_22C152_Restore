@interface LPButtonAction
+ (id)actionWithTitle:(id)a3 image:(id)a4 handler:(id)a5;
- (BOOL)isHeader;
- (BOOL)isSelected;
- (LPImage)image;
- (LPImage)visibleImage;
- (NSString)title;
- (NSString)visibleTitle;
- (id)handler;
- (void)setHandler:(id)a3;
- (void)setHeader:(BOOL)a3;
- (void)setImage:(id)a3;
- (void)setSelected:(BOOL)a3;
- (void)setTitle:(id)a3;
- (void)setVisibleImage:(id)a3;
- (void)setVisibleTitle:(id)a3;
@end

@implementation LPButtonAction

+ (id)actionWithTitle:(id)a3 image:(id)a4 handler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = objc_alloc_init((Class)a1);
  [v11 setTitle:v8];
  [v11 setImage:v9];
  [v11 setHandler:v10];

  return v11;
}

- (NSString)visibleTitle
{
  visibleTitle = self->_visibleTitle;
  if (!visibleTitle) {
    visibleTitle = self->_title;
  }
  return visibleTitle;
}

- (LPImage)visibleImage
{
  visibleImage = self->_visibleImage;
  if (!visibleImage) {
    visibleImage = self->_image;
  }
  return visibleImage;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (void)setVisibleTitle:(id)a3
{
}

- (LPImage)image
{
  return self->_image;
}

- (void)setImage:(id)a3
{
}

- (void)setVisibleImage:(id)a3
{
}

- (id)handler
{
  return self->_handler;
}

- (void)setHandler:(id)a3
{
}

- (BOOL)isSelected
{
  return self->_selected;
}

- (void)setSelected:(BOOL)a3
{
  self->_selected = a3;
}

- (BOOL)isHeader
{
  return self->_header;
}

- (void)setHeader:(BOOL)a3
{
  self->_header = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_handler, 0);
  objc_storeStrong((id *)&self->_visibleImage, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_visibleTitle, 0);

  objc_storeStrong((id *)&self->_title, 0);
}

@end