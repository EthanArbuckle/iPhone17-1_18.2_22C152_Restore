@interface QLPreviewController
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation QLPreviewController

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)QLPreviewController;
  v4 = self;
  [(QLPreviewController *)&v5 viewWillDisappear:v3];
  sub_1000E71C8();
}

@end