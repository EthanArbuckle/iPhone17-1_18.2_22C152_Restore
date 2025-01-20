@interface UIView(MPUAutoLayout)
- (void)initForAutolayout;
@end

@implementation UIView(MPUAutoLayout)

- (void)initForAutolayout
{
  v1 = objc_msgSend(a1, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  v2 = v1;
  if (v1) {
    [v1 setTranslatesAutoresizingMaskIntoConstraints:0];
  }
  return v2;
}

@end