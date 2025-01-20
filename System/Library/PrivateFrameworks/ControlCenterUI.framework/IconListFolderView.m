@interface IconListFolderView
+ (Class)_scrollViewClass;
+ (Class)defaultIconListViewClass;
- (CCUIIconScrollView)scrollView;
- (CGRect)_frameForIconListAtIndex:(unint64_t)a3;
- (_TtC15ControlCenterUI18IconListFolderView)initWithConfiguration:(id)a3;
- (void)_configureIconListView:(id)a3;
- (void)scrollViewDidScroll:(id)a3;
@end

@implementation IconListFolderView

- (_TtC15ControlCenterUI18IconListFolderView)initWithConfiguration:(id)a3
{
  return (_TtC15ControlCenterUI18IconListFolderView *)sub_1D7BA64F0(a3);
}

+ (Class)defaultIconListViewClass
{
  type metadata accessor for IconListFolderView.IconListView();

  return (Class)swift_getObjCClassFromMetadata();
}

+ (Class)_scrollViewClass
{
  sub_1D7B2170C(0, &qword_1EBDFF940);

  return (Class)swift_getObjCClassFromMetadata();
}

- (CCUIIconScrollView)scrollView
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for IconListFolderView();
  v2 = [(SBFolderView *)&v5 scrollView];
  self;
  v3 = (void *)swift_dynamicCastObjCClassUnconditional();

  return (CCUIIconScrollView *)v3;
}

- (void)_configureIconListView:(id)a3
{
  id v4 = a3;
  objc_super v5 = self;
  sub_1D7BA6798(v4);
}

- (CGRect)_frameForIconListAtIndex:(unint64_t)a3
{
  id v4 = self;
  sub_1D7BA6978(a3);
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;

  double v13 = v6;
  double v14 = v8;
  double v15 = v10;
  double v16 = v12;
  result.size.height = v16;
  result.size.width = v15;
  result.origin.y = v14;
  result.origin.x = v13;
  return result;
}

- (void)scrollViewDidScroll:(id)a3
{
  id v4 = a3;
  double v5 = self;
  sub_1D7BA6B48((uint64_t)v4);
}

@end