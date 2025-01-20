@interface IconListRootFolderController
+ (Class)_contentViewClass;
- (_TtC15ControlCenterUI22IconListRootFolderView)folderView;
- (_TtC15ControlCenterUI28IconListRootFolderController)initWithConfiguration:(id)a3;
@end

@implementation IconListRootFolderController

- (_TtC15ControlCenterUI22IconListRootFolderView)folderView
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for IconListRootFolderController();
  v2 = [(IconListFolderController *)&v5 folderView];
  type metadata accessor for IconListRootFolderView();
  v3 = (void *)swift_dynamicCastClassUnconditional();

  return (_TtC15ControlCenterUI22IconListRootFolderView *)v3;
}

+ (Class)_contentViewClass
{
  type metadata accessor for IconListRootFolderView();

  return (Class)swift_getObjCClassFromMetadata();
}

- (_TtC15ControlCenterUI28IconListRootFolderController)initWithConfiguration:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for IconListRootFolderController();
  return [(IconListFolderController *)&v5 initWithConfiguration:a3];
}

@end