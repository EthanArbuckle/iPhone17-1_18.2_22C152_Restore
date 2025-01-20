@interface IconListFolderView.IconListView
+ (unint64_t)defaultIconViewConfigurationOptions;
- (NSString)iconDragTypeIdentifier;
- (_TtCC15ControlCenterUI18IconListFolderViewP33_DD187FCCAF2994A2EE3FBE03915C670412IconListView)initWithModel:(id)a3 layoutProvider:(id)a4 iconLocation:(id)a5 orientation:(int64_t)a6 iconViewProvider:(id)a7;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (id)makeEmptyGridCellView;
- (void)configureIconView:(id)a3 forIcon:(id)a4;
- (void)willRotateWithTransitionCoordinator:(id)a3;
@end

@implementation IconListFolderView.IconListView

- (NSString)iconDragTypeIdentifier
{
  v2 = (void *)sub_1D7BB7228();

  return (NSString *)v2;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  v12.receiver = self;
  v12.super_class = (Class)type metadata accessor for IconListFolderView.IconListView();
  id v7 = v12.receiver;
  id v8 = a4;
  id v9 = -[IconListFolderView.IconListView hitTest:withEvent:](&v12, sel_hitTest_withEvent_, v8, x, y);
  if (!v9 || (v10 = v9, v8, id v8 = v7, v10 == v7))
  {

    id v10 = 0;
  }

  return v10;
}

+ (unint64_t)defaultIconViewConfigurationOptions
{
  return sub_1D7BA6DB8();
}

- (void)configureIconView:(id)a3 forIcon:(id)a4
{
  v10.receiver = self;
  v10.super_class = (Class)type metadata accessor for IconListFolderView.IconListView();
  id v6 = a3;
  id v7 = a4;
  id v8 = v10.receiver;
  [(SBIconListView *)&v10 configureIconView:v6 forIcon:v7];
  id v9 = objc_msgSend(v6, sel_contentContainerView, v10.receiver, v10.super_class);
  objc_msgSend(v9, sel_setOverrideUserInterfaceStyle_, 1);
}

- (id)makeEmptyGridCellView
{
  id v2 = sub_1D7BA7148();

  return v2;
}

- (void)willRotateWithTransitionCoordinator:(id)a3
{
  swift_unknownObjectRetain();
  v5 = self;
  sub_1D7BA6ED8(a3);
  swift_unknownObjectRelease();
}

- (_TtCC15ControlCenterUI18IconListFolderViewP33_DD187FCCAF2994A2EE3FBE03915C670412IconListView)initWithModel:(id)a3 layoutProvider:(id)a4 iconLocation:(id)a5 orientation:(int64_t)a6 iconViewProvider:(id)a7
{
  v13.receiver = self;
  v13.super_class = (Class)type metadata accessor for IconListFolderView.IconListView();
  return [(SBIconListView *)&v13 initWithModel:a3 layoutProvider:a4 iconLocation:a5 orientation:a6 iconViewProvider:a7];
}

@end