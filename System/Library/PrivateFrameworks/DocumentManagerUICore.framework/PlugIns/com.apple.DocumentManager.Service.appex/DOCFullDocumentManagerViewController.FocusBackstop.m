@interface DOCFullDocumentManagerViewController.FocusBackstop
- (BOOL)canBecomeFocused;
- (_TtCE33com_apple_DocumentManager_ServiceCSo36DOCFullDocumentManagerViewControllerP33_00EA65900D9DCE9F7E690744F7FCE59213FocusBackstop)initWithCoder:(id)a3;
- (_TtCE33com_apple_DocumentManager_ServiceCSo36DOCFullDocumentManagerViewControllerP33_00EA65900D9DCE9F7E690744F7FCE59213FocusBackstop)initWithFrame:(CGRect)a3;
@end

@implementation DOCFullDocumentManagerViewController.FocusBackstop

- (BOOL)canBecomeFocused
{
  return 1;
}

- (_TtCE33com_apple_DocumentManager_ServiceCSo36DOCFullDocumentManagerViewControllerP33_00EA65900D9DCE9F7E690744F7FCE59213FocusBackstop)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v8.receiver = self;
  v8.super_class = (Class)_s13FocusBackstopCMa();
  return -[DOCFullDocumentManagerViewController.FocusBackstop initWithFrame:](&v8, "initWithFrame:", x, y, width, height);
}

- (_TtCE33com_apple_DocumentManager_ServiceCSo36DOCFullDocumentManagerViewControllerP33_00EA65900D9DCE9F7E690744F7FCE59213FocusBackstop)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)_s13FocusBackstopCMa();
  return [(DOCFullDocumentManagerViewController.FocusBackstop *)&v5 initWithCoder:a3];
}

@end