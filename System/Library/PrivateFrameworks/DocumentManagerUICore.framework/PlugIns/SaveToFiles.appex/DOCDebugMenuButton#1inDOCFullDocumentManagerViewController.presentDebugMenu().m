@interface DOCDebugMenuButton#1inDOCFullDocumentManagerViewController.presentDebugMenu()
- (_TtCFE11SaveToFilesCSo36DOCFullDocumentManagerViewControllerP33_E191B585E8636B111F989B8BD22B4F6A16presentDebugMenuFT_T_L_18DOCDebugMenuButton)initWithFrame:;
- (id)contextMenuInteraction:configurationForMenuAtLocation:;
- (void)contextMenuInteraction:willEndForConfiguration:animator:;
@end

@implementation DOCDebugMenuButton#1inDOCFullDocumentManagerViewController.presentDebugMenu()

- (id)contextMenuInteraction:configurationForMenuAtLocation:
{
  id v5 = a3;
  v6 = self;
  id v7 = sub_10026C540();

  return v7;
}

- (void)contextMenuInteraction:willEndForConfiguration:animator:
{
}

- (_TtCFE11SaveToFilesCSo36DOCFullDocumentManagerViewControllerP33_E191B585E8636B111F989B8BD22B4F6A16presentDebugMenuFT_T_L_18DOCDebugMenuButton)initWithFrame:
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtCFE11SaveToFilesCSo36DOCFullDocumentManagerViewControllerP33_E191B585E8636B111F989B8BD22B4F6A16presentDebugMenuFT_T_L_18DOCDebugMenuButton_menuInteraction) = 0;
  swift_unknownObjectWeakInit();
  v9.receiver = self;
  v9.super_class = (Class)_s18DOCDebugMenuButtonCMa();
  return -[DOCView initWithFrame:](&v9, "initWithFrame:", x, y, width, height);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtCFE11SaveToFilesCSo36DOCFullDocumentManagerViewControllerP33_E191B585E8636B111F989B8BD22B4F6A16presentDebugMenuFT_T_L_18DOCDebugMenuButton_menuInteraction));
  swift_unknownObjectWeakDestroy();
}

@end