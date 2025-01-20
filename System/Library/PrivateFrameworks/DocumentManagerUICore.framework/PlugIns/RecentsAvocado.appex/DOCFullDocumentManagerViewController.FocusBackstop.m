@interface DOCFullDocumentManagerViewController.FocusBackstop
- (BOOL)canBecomeFocused;
- (_TtCE14RecentsAvocadoCSo36DOCFullDocumentManagerViewControllerP33_0D5EAE977D1A08908DEB7D7025D6E4A613FocusBackstop)initWithCoder:(id)a3;
- (_TtCE14RecentsAvocadoCSo36DOCFullDocumentManagerViewControllerP33_0D5EAE977D1A08908DEB7D7025D6E4A613FocusBackstop)initWithFrame:(CGRect)a3;
@end

@implementation DOCFullDocumentManagerViewController.FocusBackstop

- (BOOL)canBecomeFocused
{
  return 1;
}

- (_TtCE14RecentsAvocadoCSo36DOCFullDocumentManagerViewControllerP33_0D5EAE977D1A08908DEB7D7025D6E4A613FocusBackstop)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v8.receiver = self;
  v8.super_class = (Class)_s13FocusBackstopCMa();
  return -[DOCFullDocumentManagerViewController.FocusBackstop initWithFrame:](&v8, "initWithFrame:", x, y, width, height);
}

- (_TtCE14RecentsAvocadoCSo36DOCFullDocumentManagerViewControllerP33_0D5EAE977D1A08908DEB7D7025D6E4A613FocusBackstop)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)_s13FocusBackstopCMa();
  return [(DOCFullDocumentManagerViewController.FocusBackstop *)&v5 initWithCoder:a3];
}

@end