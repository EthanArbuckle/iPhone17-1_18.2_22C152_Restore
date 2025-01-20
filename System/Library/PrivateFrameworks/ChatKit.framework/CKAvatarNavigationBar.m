@interface CKAvatarNavigationBar
+ (BOOL)_supportsCanvasView;
- (CGSize)sizeThatFits:(CGSize)a3;
@end

@implementation CKAvatarNavigationBar

+ (BOOL)_supportsCanvasView
{
  return 1;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  v6 = [MEMORY[0x1E4F42948] currentDevice];
  uint64_t v7 = [v6 userInterfaceIdiom];

  if ((v7 & 0xFFFFFFFFFFFFFFFBLL) == 1)
  {
    v18.receiver = self;
    v18.super_class = (Class)CKAvatarNavigationBar;
    -[CKAvatarNavigationBar sizeThatFits:](&v18, sel_sizeThatFits_, width, height);
    double v9 = v8;
    v10 = +[CKUIBehavior sharedBehaviors];
    [v10 maxNavigationBarExpandedHeightValue];
    double v12 = v11;
  }
  else
  {
    v17.receiver = self;
    v17.super_class = (Class)CKAvatarNavigationBar;
    -[CKAvatarNavigationBar sizeThatFits:](&v17, sel_sizeThatFits_, width, height);
    double v9 = v13;
    double v12 = v14;
  }
  double v15 = v9;
  double v16 = v12;
  result.double height = v16;
  result.double width = v15;
  return result;
}

@end