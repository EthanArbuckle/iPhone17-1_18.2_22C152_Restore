@interface AXStaticFrameView
- (void)setFrame:(CGRect)a3;
@end

@implementation AXStaticFrameView

- (void)setFrame:(CGRect)a3
{
  v4 = objc_msgSend(MEMORY[0x263F1C920], "mainScreen", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  [v4 bounds];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;

  v13.receiver = self;
  v13.super_class = (Class)AXStaticFrameView;
  -[AXStaticFrameView setFrame:](&v13, sel_setFrame_, v6, v8, v10, v12);
}

@end