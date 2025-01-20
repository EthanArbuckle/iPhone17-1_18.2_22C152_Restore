@interface CRKOverlayButton
- (void)setBackgroundColor:(id)a3 forState:(unint64_t)a4;
- (void)setSelected:(BOOL)a3 animated:(BOOL)a4;
@end

@implementation CRKOverlayButton

- (void)setBackgroundColor:(id)a3 forState:(unint64_t)a4
{
  id v6 = a3;
  v12.width = 1.0;
  v12.height = 1.0;
  UIGraphicsBeginImageContext(v12);
  CurrentContext = UIGraphicsGetCurrentContext();
  id v8 = v6;
  v9 = (CGColor *)[v8 CGColor];

  CGContextSetFillColorWithColor(CurrentContext, v9);
  v13.origin.x = 0.0;
  v13.origin.y = 0.0;
  v13.size.width = 1.0;
  v13.size.height = 1.0;
  CGContextFillRect(CurrentContext, v13);
  UIGraphicsGetImageFromCurrentImageContext();
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  UIGraphicsEndImageContext();
  [(CRKOverlayButton *)self setBackgroundImage:v10 forState:a4];
}

- (void)setSelected:(BOOL)a3 animated:(BOOL)a4
{
  if (a4)
  {
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __41__CRKOverlayButton_setSelected_animated___block_invoke;
    v7[3] = &unk_26470F0A0;
    v7[4] = self;
    BOOL v8 = a3;
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __41__CRKOverlayButton_setSelected_animated___block_invoke_2;
    v5[3] = &unk_26470F0C8;
    v5[4] = self;
    BOOL v6 = a3;
    [MEMORY[0x263F1CB60] animateWithDuration:v7 animations:v5 completion:0.3];
  }
  else
  {
    [(CRKOverlayButton *)self setSelected:a3];
  }
}

void __41__CRKOverlayButton_setSelected_animated___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) _backgroundView];
  id v4 = v2;
  double v3 = 1.0;
  if (!*(unsigned char *)(a1 + 40)) {
    double v3 = 0.0;
  }
  [v2 setAlpha:v3];
}

void __41__CRKOverlayButton_setSelected_animated___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) setSelected:*(unsigned __int8 *)(a1 + 40)];
  v2 = [*(id *)(a1 + 32) _backgroundView];
  id v4 = v2;
  double v3 = 0.0;
  if (!*(unsigned char *)(a1 + 40)) {
    double v3 = 1.0;
  }
  [v2 setAlpha:v3];
}

@end