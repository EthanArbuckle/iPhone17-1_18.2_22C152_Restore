@interface QLErrorView
- (QLErrorView)initWithTitle:(id)a3;
@end

@implementation QLErrorView

- (QLErrorView)initWithTitle:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)QLErrorView;
  return -[_UIContentUnavailableView initWithFrame:title:style:](&v4, sel_initWithFrame_title_style_, a3, 0, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
}

@end