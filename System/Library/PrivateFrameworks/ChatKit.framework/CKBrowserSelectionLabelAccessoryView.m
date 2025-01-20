@interface CKBrowserSelectionLabelAccessoryView
- (CGSize)sizeThatFits:(CGSize)a3;
- (CKBrowserSelectionLabelAccessoryView)initWithCoder:(id)a3;
- (CKBrowserSelectionLabelAccessoryView)initWithFrame:(CGRect)a3;
- (CKBrowserSelectionLabelAccessoryView)initWithLabelAccessoryType:(unint64_t)a3;
- (UIImageView)plusDView;
- (UIImageView)plusLView;
- (void)setPlusDView:(id)a3;
- (void)setPlusLView:(id)a3;
@end

@implementation CKBrowserSelectionLabelAccessoryView

- (CKBrowserSelectionLabelAccessoryView)initWithLabelAccessoryType:(unint64_t)a3
{
  v12.receiver = self;
  v12.super_class = (Class)CKBrowserSelectionLabelAccessoryView;
  v4 = -[CKBrowserSelectionLabelAccessoryView initWithFrame:](&v12, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  v5 = v4;
  if (v4)
  {
    v6 = [(CKBrowserSelectionLabelAccessoryView *)v4 layer];
    [v6 setAllowsGroupBlending:0];

    if (a3 == 2)
    {
      if (initWithLabelAccessoryType__onceToken_36 != -1) {
        dispatch_once(&initWithLabelAccessoryType__onceToken_36, &__block_literal_global_38_0);
      }
      v7 = &initWithLabelAccessoryType____plusDImage_35;
      v8 = &initWithLabelAccessoryType____plusLImage_34;
    }
    else
    {
      if (a3 != 1)
      {
        v9 = 0;
        v10 = 0;
        goto LABEL_12;
      }
      if (initWithLabelAccessoryType__onceToken != -1) {
        dispatch_once(&initWithLabelAccessoryType__onceToken, &__block_literal_global_259);
      }
      v7 = &initWithLabelAccessoryType____plusDImage;
      v8 = &initWithLabelAccessoryType____plusLImage;
    }
    v9 = (void *)[objc_alloc(MEMORY[0x1E4F42AA0]) initWithImage:*v8];
    v10 = (void *)[objc_alloc(MEMORY[0x1E4F42AA0]) initWithImage:*v7];
LABEL_12:
    [(CKBrowserSelectionLabelAccessoryView *)v5 setPlusLView:v9];
    [(CKBrowserSelectionLabelAccessoryView *)v5 setPlusDView:v10];
    [(CKBrowserSelectionLabelAccessoryView *)v5 addSubview:v9];
    [(CKBrowserSelectionLabelAccessoryView *)v5 addSubview:v10];
  }
  return v5;
}

void __67__CKBrowserSelectionLabelAccessoryView_initWithLabelAccessoryType___block_invoke()
{
  id v6 = [MEMORY[0x1E4F42A80] ckImageNamed:@"IconNewDot"];
  v0 = [MEMORY[0x1E4F428B8] colorWithRed:0.0 green:0.393 blue:1.0 alpha:1.0];
  uint64_t v1 = [v6 _flatImageWithColor:v0];
  v2 = (void *)initWithLabelAccessoryType____plusLImage;
  initWithLabelAccessoryType____plusLImage = v1;

  v3 = [MEMORY[0x1E4F428B8] colorWithRed:0.0 green:0.393 blue:1.0 alpha:0.100000001];
  uint64_t v4 = [v6 _flatImageWithColor:v3];
  v5 = (void *)initWithLabelAccessoryType____plusDImage;
  initWithLabelAccessoryType____plusDImage = v4;
}

void __67__CKBrowserSelectionLabelAccessoryView_initWithLabelAccessoryType___block_invoke_2()
{
  id v6 = [MEMORY[0x1E4F42A80] ckImageNamed:@"IconNewDot"];
  v0 = [MEMORY[0x1E4F428B8] colorWithRed:0.992 green:0.51 blue:0.031 alpha:0.62];
  uint64_t v1 = [v6 _flatImageWithColor:v0];
  v2 = (void *)initWithLabelAccessoryType____plusLImage_34;
  initWithLabelAccessoryType____plusLImage_34 = v1;

  v3 = [MEMORY[0x1E4F428B8] colorWithRed:0.992 green:0.51 blue:0.031 alpha:0.398];
  uint64_t v4 = [v6 _flatImageWithColor:v3];
  v5 = (void *)initWithLabelAccessoryType____plusDImage_35;
  initWithLabelAccessoryType____plusDImage_35 = v4;
}

- (CKBrowserSelectionLabelAccessoryView)initWithFrame:(CGRect)a3
{
  return -[CKBrowserSelectionLabelAccessoryView initWithLabelAccessoryType:](self, "initWithLabelAccessoryType:", 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (CKBrowserSelectionLabelAccessoryView)initWithCoder:(id)a3
{
  id v3 = a3;
  id v4 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:@"This class does not support unarchiving from a nib" userInfo:0];
  objc_exception_throw(v4);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  v5 = [(CKBrowserSelectionLabelAccessoryView *)self plusLView];
  objc_msgSend(v5, "sizeThatFits:", width, height);
  double v7 = v6;
  double v9 = v8;

  double v10 = v7;
  double v11 = v9;
  result.double height = v11;
  result.double width = v10;
  return result;
}

- (UIImageView)plusLView
{
  return self->_plusLView;
}

- (void)setPlusLView:(id)a3
{
}

- (UIImageView)plusDView
{
  return self->_plusDView;
}

- (void)setPlusDView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_plusDView, 0);

  objc_storeStrong((id *)&self->_plusLView, 0);
}

@end