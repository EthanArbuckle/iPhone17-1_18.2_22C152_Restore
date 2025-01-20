@interface QLPreviewControllerView
- (_TtC9QuickLook23QLPreviewControllerView)initWithCoder:(id)a3;
- (_TtC9QuickLook23QLPreviewControllerView)initWithFrame:(CGRect)a3;
- (void)_intelligenceCollectContentIn:(CGRect)a3 collector:(id)a4;
@end

@implementation QLPreviewControllerView

- (_TtC9QuickLook23QLPreviewControllerView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  swift_unknownObjectWeakInit();
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for QLPreviewControllerView();
  return -[QLPreviewControllerView initWithFrame:](&v9, sel_initWithFrame_, x, y, width, height);
}

- (_TtC9QuickLook23QLPreviewControllerView)initWithCoder:(id)a3
{
  swift_unknownObjectWeakInit();
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for QLPreviewControllerView();
  return [(QLPreviewControllerView *)&v6 initWithCoder:a3];
}

- (void).cxx_destruct
{
}

- (void)_intelligenceCollectContentIn:(CGRect)a3 collector:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v9 = a4;
  v10 = self;
  sub_218013118(v9, x, y, width, height);
}

@end