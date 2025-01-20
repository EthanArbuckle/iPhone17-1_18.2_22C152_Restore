@interface GroupSessionPreviewSourceView
- (_TtC22_GroupActivities_UIKit29GroupSessionPreviewSourceView)initWithCoder:(id)a3;
- (_TtC22_GroupActivities_UIKit29GroupSessionPreviewSourceView)initWithFrame:(CGRect)a3;
@end

@implementation GroupSessionPreviewSourceView

- (_TtC22_GroupActivities_UIKit29GroupSessionPreviewSourceView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for GroupSessionPreviewSourceView();
  return -[GroupSessionPreviewSourceView initWithFrame:](&v8, sel_initWithFrame_, x, y, width, height);
}

- (_TtC22_GroupActivities_UIKit29GroupSessionPreviewSourceView)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for GroupSessionPreviewSourceView();
  return [(GroupSessionPreviewSourceView *)&v5 initWithCoder:a3];
}

@end