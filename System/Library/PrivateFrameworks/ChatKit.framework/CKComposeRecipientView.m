@interface CKComposeRecipientView
- (CKComposeRecipientView)initWithFrame:(CGRect)a3;
- (CKComposeRecipientViewDelegate)layoutDelegate;
- (UIEdgeInsets)layoutMargins;
- (UIEdgeInsets)safeAreaInsets;
- (void)atomTextViewDidBecomeFirstResponder:(id)a3;
- (void)layoutSubviews;
- (void)reset;
- (void)setFrame:(CGRect)a3;
- (void)setLayoutDelegate:(id)a3;
@end

@implementation CKComposeRecipientView

- (CKComposeRecipientView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CKComposeRecipientView;
  v3 = -[CNComposeRecipientTextView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3) {
    [(CNComposeRecipientTextView *)v3 setExpandRecipientsInNamedGroups:0];
  }
  return v4;
}

- (void)layoutSubviews
{
  v2.receiver = self;
  v2.super_class = (Class)CKComposeRecipientView;
  [(CNComposeRecipientTextView *)&v2 layoutSubviews];
}

- (void)setFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v8 = [(CKComposeRecipientView *)self traitCollection];
  [v8 displayScale];
  double v10 = round(x * v9) / v9;
  double v11 = round(y * v9) / v9;
  double v12 = round(width * v9) / v9;
  double v13 = round(height * v9) / v9;

  v14.receiver = self;
  v14.super_class = (Class)CKComposeRecipientView;
  -[CNComposeRecipientTextView setFrame:](&v14, sel_setFrame_, v10, v11, v12, v13);
}

- (void)reset
{
  v3 = [MEMORY[0x1E4F1C978] array];
  [(CNComposeRecipientTextView *)self setRecipients:v3];

  v4 = [MEMORY[0x1E4F1C978] array];
  [(CNComposeRecipientTextView *)self setAddresses:v4];

  [(CNComposeRecipientTextView *)self clearText];
}

- (void)atomTextViewDidBecomeFirstResponder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CKComposeRecipientView;
  [(CNComposeRecipientTextView *)&v5 atomTextViewDidBecomeFirstResponder:a3];
  v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v4 postNotificationName:@"com.apple.ChatKit.CKComposeRecipientView.BecameFirstResponder" object:self];
}

- (UIEdgeInsets)safeAreaInsets
{
  v22.receiver = self;
  v22.super_class = (Class)CKComposeRecipientView;
  [(CKComposeRecipientView *)&v22 safeAreaInsets];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v10 = v3;
  if (v6 > 0.0 || v3 > 0.0)
  {
    double v11 = [(CKComposeRecipientView *)self window];
    double v12 = [v11 windowScene];

    if (v12 && (unint64_t)([v12 interfaceOrientation] - 3) <= 1)
    {
      double v13 = +[CKUIBehavior sharedBehaviors];
      [v13 landscapeKeyboardInsets];
      double v15 = v14;
      double v17 = v16;

      if (v7 > 0.0) {
        double v7 = v15;
      }
      if (v10 > 0.0) {
        double v10 = v17;
      }
    }
  }
  double v18 = v5;
  double v19 = v7;
  double v20 = v9;
  double v21 = v10;
  result.right = v21;
  result.bottom = v20;
  result.left = v19;
  result.top = v18;
  return result;
}

- (UIEdgeInsets)layoutMargins
{
  [(CKComposeRecipientView *)self safeAreaInsets];
  double v3 = [(CKComposeRecipientView *)self layoutDelegate];
  [v3 layoutMarginsForComposeRecipientView:self];

  UIEdgeInsetsAdd();
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v12 = [(CKComposeRecipientView *)self traitCollection];
  [v12 displayScale];
  if (v13 == 0.0)
  {
    if (CKMainScreenScale_once_50 != -1) {
      dispatch_once(&CKMainScreenScale_once_50, &__block_literal_global_127);
    }
    double v14 = *(double *)&CKMainScreenScale_sMainScreenScale_50;
    if (*(double *)&CKMainScreenScale_sMainScreenScale_50 == 0.0) {
      double v14 = 1.0;
    }
    double v15 = floor(v5 * v14) / v14;
    double v16 = *(double *)&CKMainScreenScale_sMainScreenScale_50;
    if (*(double *)&CKMainScreenScale_sMainScreenScale_50 == 0.0) {
      double v16 = 1.0;
    }
    double v17 = floor(v7 * v16) / v16;
    double v18 = *(double *)&CKMainScreenScale_sMainScreenScale_50;
    if (*(double *)&CKMainScreenScale_sMainScreenScale_50 == 0.0) {
      double v18 = 1.0;
    }
    double v19 = floor(v9 * v18) / v18;
    double v13 = *(double *)&CKMainScreenScale_sMainScreenScale_50;
    if (*(double *)&CKMainScreenScale_sMainScreenScale_50 == 0.0) {
      double v13 = 1.0;
    }
  }
  else
  {
    double v15 = floor(v5 * v13) / v13;
    double v17 = floor(v7 * v13) / v13;
    double v19 = floor(v9 * v13) / v13;
  }
  double v20 = floor(v11 * v13) / v13;

  double v21 = v15;
  double v22 = v17;
  double v23 = v19;
  double v24 = v20;
  result.right = v24;
  result.bottom = v23;
  result.left = v22;
  result.top = v21;
  return result;
}

- (CKComposeRecipientViewDelegate)layoutDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->layoutDelegate);

  return (CKComposeRecipientViewDelegate *)WeakRetained;
}

- (void)setLayoutDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end