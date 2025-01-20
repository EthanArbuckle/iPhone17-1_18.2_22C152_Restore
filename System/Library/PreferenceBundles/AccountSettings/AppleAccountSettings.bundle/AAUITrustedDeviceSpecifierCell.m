@interface AAUITrustedDeviceSpecifierCell
- (id)blankIcon;
- (id)getLazyIcon;
- (void)refreshCellContentsWithSpecifier:(id)a3;
@end

@implementation AAUITrustedDeviceSpecifierCell

- (id)blankIcon
{
  if (qword_90008 != -1) {
    dispatch_once(&qword_90008, &stru_75E58);
  }
  v2 = (void *)qword_90000;

  return v2;
}

- (id)getLazyIcon
{
  v3 = [_AAUITrustedDeviceImage alloc];
  v7.receiver = self;
  v7.super_class = (Class)AAUITrustedDeviceSpecifierCell;
  id v4 = [(AAUITrustedDeviceSpecifierCell *)&v7 getLazyIcon];
  v5 = -[_AAUITrustedDeviceImage initWithCGImage:](v3, "initWithCGImage:", [v4 CGImage]);

  return v5;
}

- (void)refreshCellContentsWithSpecifier:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)AAUITrustedDeviceSpecifierCell;
  [(AAUITrustedDeviceSpecifierCell *)&v5 refreshCellContentsWithSpecifier:a3];
  id v4 = [(AAUITrustedDeviceSpecifierCell *)self imageView];
  [v4 setContentMode:2];
}

@end