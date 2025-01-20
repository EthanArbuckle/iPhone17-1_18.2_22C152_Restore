@interface IconListFolderController
+ (Class)_contentViewClass;
+ (NSString)iconLocation;
- (BOOL)_canShowWhileLocked;
- (BOOL)ccui_shouldPropagateAppearanceCalls;
- (BOOL)shouldAutomaticallyForwardAppearanceMethods;
- (_TtC15ControlCenterUI18IconListFolderView)folderView;
- (_TtC15ControlCenterUI24IconListFolderController)initWithConfiguration:(id)a3;
- (void)iconListView:(id)a3 didAddIconView:(id)a4;
- (void)iconListView:(id)a3 didRemoveIconView:(id)a4;
- (void)iconView:(id)a3 didChangeCustomImageViewController:(id)a4;
@end

@implementation IconListFolderController

+ (NSString)iconLocation
{
  if (qword_1EBDFF900 != -1) {
    swift_once();
  }
  v2 = (void *)qword_1EBE008F0;

  return (NSString *)v2;
}

- (_TtC15ControlCenterUI18IconListFolderView)folderView
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for IconListFolderController();
  v2 = [(SBFolderController *)&v5 folderView];
  type metadata accessor for IconListFolderView();
  v3 = (void *)swift_dynamicCastClassUnconditional();

  return (_TtC15ControlCenterUI18IconListFolderView *)v3;
}

+ (Class)_contentViewClass
{
  type metadata accessor for IconListFolderView();

  return (Class)swift_getObjCClassFromMetadata();
}

- (void)iconListView:(id)a3 didAddIconView:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for IconListFolderController();
  id v6 = a3;
  id v7 = a4;
  v8 = (char *)v9.receiver;
  [(SBFolderController *)&v9 iconListView:v6 didAddIconView:v7];
  if (MEMORY[0x1D947FB60](&v8[OBJC_IVAR____TtC15ControlCenterUI24IconListFolderController_iconListFolderDelegate]))
  {
    sub_1D7B950A8(v7, v6);
    swift_unknownObjectRelease();
  }
  sub_1D7B70964(v7);
}

- (void)iconView:(id)a3 didChangeCustomImageViewController:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for IconListFolderController();
  id v6 = a3;
  id v7 = a4;
  id v8 = v9.receiver;
  [(SBFolderController *)&v9 iconView:v6 didChangeCustomImageViewController:v7];
  sub_1D7B70BF0((uint64_t)a4);
  sub_1D7B70964(v6);
}

- (void)iconListView:(id)a3 didRemoveIconView:(id)a4
{
  v10.receiver = self;
  v10.super_class = (Class)type metadata accessor for IconListFolderController();
  id v6 = a3;
  id v7 = a4;
  id v8 = v10.receiver;
  [(SBFolderController *)&v10 iconListView:v6 didRemoveIconView:v7];
  id v9 = objc_msgSend(v7, sel_customIconImageViewController, v10.receiver, v10.super_class);
  sub_1D7B70BF0((uint64_t)v9);
}

- (BOOL)shouldAutomaticallyForwardAppearanceMethods
{
  return 0;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (BOOL)ccui_shouldPropagateAppearanceCalls
{
  return 1;
}

- (_TtC15ControlCenterUI24IconListFolderController)initWithConfiguration:(id)a3
{
  *(void *)((char *)&self->super.super.super.super._responderFlags
            + OBJC_IVAR____TtC15ControlCenterUI24IconListFolderController_iconListFolderDelegate) = 0;
  swift_unknownObjectWeakInit();
  *((unsigned char *)&self->super.super.super.super.super.isa
  + OBJC_IVAR____TtC15ControlCenterUI24IconListFolderController_allowsIconAdornments) = 1;
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for IconListFolderController();
  return [(SBFolderController *)&v6 initWithConfiguration:a3];
}

- (void).cxx_destruct
{
}

@end