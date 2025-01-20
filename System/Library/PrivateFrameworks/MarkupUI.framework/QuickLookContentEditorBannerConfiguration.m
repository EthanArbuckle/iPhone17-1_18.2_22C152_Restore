@interface QuickLookContentEditorBannerConfiguration
+ (id)configurationWithImage:(id)a3 title:(id)a4 subtitle:(id)a5 primaryAction:(id)a6 dismissAction:(id)a7;
- (NSString)subtitle;
- (NSString)title;
- (UIAction)dismissAction;
- (UIAction)primaryAction;
- (UIImage)image;
- (void)setDismissAction:(id)a3;
- (void)setImage:(id)a3;
- (void)setPrimaryAction:(id)a3;
- (void)setSubtitle:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation QuickLookContentEditorBannerConfiguration

+ (id)configurationWithImage:(id)a3 title:(id)a4 subtitle:(id)a5 primaryAction:(id)a6 dismissAction:(id)a7
{
  id v11 = a7;
  id v12 = a6;
  id v13 = a5;
  id v14 = a4;
  id v15 = a3;
  v16 = objc_opt_new();
  [v16 setImage:v15];

  [v16 setTitle:v14];
  [v16 setSubtitle:v13];

  [v16 setPrimaryAction:v12];
  [v16 setDismissAction:v11];

  return v16;
}

- (UIImage)image
{
  return self->_image;
}

- (void)setImage:(id)a3
{
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (void)setSubtitle:(id)a3
{
}

- (UIAction)primaryAction
{
  return self->_primaryAction;
}

- (void)setPrimaryAction:(id)a3
{
}

- (UIAction)dismissAction
{
  return self->_dismissAction;
}

- (void)setDismissAction:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dismissAction, 0);
  objc_storeStrong((id *)&self->_primaryAction, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_image, 0);
}

@end