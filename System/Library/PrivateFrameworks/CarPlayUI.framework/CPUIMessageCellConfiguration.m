@interface CPUIMessageCellConfiguration
+ (id)configurationWithText:(id)a3 detailText:(id)a4 image:(id)a5 unread:(BOOL)a6 showsPin:(BOOL)a7 showsStar:(BOOL)a8 showsMute:(BOOL)a9 trailingText:(id)a10 trailingImage:(id)a11;
+ (id)configurationWithText:(id)a3 detailText:(id)a4 image:(id)a5 unread:(BOOL)a6 showsPin:(BOOL)a7 showsStar:(BOOL)a8 showsMute:(BOOL)a9 trailingText:(id)a10 trailingImage:(id)a11 enabled:(BOOL)a12;
- (BOOL)enabled;
- (BOOL)isUnread;
- (BOOL)showsMute;
- (BOOL)showsPin;
- (BOOL)showsStar;
- (NSString)detailText;
- (NSString)text;
- (NSString)trailingText;
- (UIImage)image;
- (UIImage)trailingImage;
- (void)setDetailText:(id)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setImage:(id)a3;
- (void)setShowsMute:(BOOL)a3;
- (void)setShowsPin:(BOOL)a3;
- (void)setShowsStar:(BOOL)a3;
- (void)setText:(id)a3;
- (void)setTrailingImage:(id)a3;
- (void)setTrailingText:(id)a3;
- (void)setUnread:(BOOL)a3;
@end

@implementation CPUIMessageCellConfiguration

+ (id)configurationWithText:(id)a3 detailText:(id)a4 image:(id)a5 unread:(BOOL)a6 showsPin:(BOOL)a7 showsStar:(BOOL)a8 showsMute:(BOOL)a9 trailingText:(id)a10 trailingImage:(id)a11
{
  LOBYTE(v13) = 1;
  LOBYTE(v12) = a9;
  return (id)[a1 configurationWithText:a3 detailText:a4 image:a5 unread:a6 showsPin:a7 showsStar:a8 showsMute:v12 trailingText:a10 trailingImage:a11 enabled:v13];
}

+ (id)configurationWithText:(id)a3 detailText:(id)a4 image:(id)a5 unread:(BOOL)a6 showsPin:(BOOL)a7 showsStar:(BOOL)a8 showsMute:(BOOL)a9 trailingText:(id)a10 trailingImage:(id)a11 enabled:(BOOL)a12
{
  BOOL v24 = a8;
  BOOL v12 = a7;
  BOOL v13 = a6;
  id v17 = a11;
  id v18 = a10;
  id v19 = a5;
  id v20 = a4;
  id v21 = a3;
  v22 = objc_opt_new();
  [v22 setText:v21];

  [v22 setDetailText:v20];
  [v22 setImage:v19];

  [v22 setUnread:v13];
  [v22 setTrailingText:v18];

  [v22 setTrailingImage:v17];
  [v22 setShowsPin:v12];
  [v22 setShowsStar:v24];
  [v22 setShowsMute:a9];
  [v22 setEnabled:a12];
  return v22;
}

- (NSString)text
{
  return self->_text;
}

- (void)setText:(id)a3
{
}

- (NSString)detailText
{
  return self->_detailText;
}

- (void)setDetailText:(id)a3
{
}

- (UIImage)trailingImage
{
  return self->_trailingImage;
}

- (void)setTrailingImage:(id)a3
{
}

- (UIImage)image
{
  return self->_image;
}

- (void)setImage:(id)a3
{
}

- (BOOL)isUnread
{
  return self->_unread;
}

- (void)setUnread:(BOOL)a3
{
  self->_unread = a3;
}

- (NSString)trailingText
{
  return self->_trailingText;
}

- (void)setTrailingText:(id)a3
{
}

- (BOOL)showsPin
{
  return self->_showsPin;
}

- (void)setShowsPin:(BOOL)a3
{
  self->_showsPin = a3;
}

- (BOOL)showsStar
{
  return self->_showsStar;
}

- (void)setShowsStar:(BOOL)a3
{
  self->_showsStar = a3;
}

- (BOOL)showsMute
{
  return self->_showsMute;
}

- (void)setShowsMute:(BOOL)a3
{
  self->_showsMute = a3;
}

- (BOOL)enabled
{
  return self->_enabled;
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trailingText, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_trailingImage, 0);
  objc_storeStrong((id *)&self->_detailText, 0);
  objc_storeStrong((id *)&self->_text, 0);
}

@end