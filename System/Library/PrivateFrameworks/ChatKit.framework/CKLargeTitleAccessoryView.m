@interface CKLargeTitleAccessoryView
+ (id)newComposeButton;
+ (id)newOptionsButton;
- (CGSize)_intrinsicSizeWithinSize:(CGSize)a3;
- (NSArray)accessoryButtons;
- (void)layoutSubviews;
- (void)setAccessoryButtons:(id)a3;
@end

@implementation CKLargeTitleAccessoryView

- (void)layoutSubviews
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  v28.receiver = self;
  v28.super_class = (Class)CKLargeTitleAccessoryView;
  [(CKLargeTitleAccessoryView *)&v28 layoutSubviews];
  [(CKLargeTitleAccessoryView *)self bounds];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  v11 = self->_accessoryButtons;
  uint64_t v12 = [(NSArray *)v11 countByEnumeratingWithState:&v24 objects:v29 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v25;
    double v15 = v4;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v25 != v14) {
          objc_enumerationMutation(v11);
        }
        v17 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        objc_msgSend(v17, "bounds", (void)v24);
        double v19 = v18;
        double v21 = v20;
        v31.origin.x = v4;
        v31.origin.y = v6;
        v31.size.width = v8;
        v31.size.height = v10;
        objc_msgSend(v17, "setFrame:", v15, CGRectGetMidY(v31) + v21 * -0.5, v19, v21);
        v22 = +[CKUIBehavior sharedBehaviors];
        [v22 conversationListComposeButtonSpacing];
        double v15 = v15 + v19 + v23;
      }
      uint64_t v13 = [(NSArray *)v11 countByEnumeratingWithState:&v24 objects:v29 count:16];
    }
    while (v13);
  }
}

- (CGSize)_intrinsicSizeWithinSize:(CGSize)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  CGFloat v4 = self->_accessoryButtons;
  uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v19 objects:v23 count:16];
  double v6 = 0.0;
  double v7 = 0.0;
  double v8 = 0.0;
  if (v5)
  {
    uint64_t v9 = v5;
    uint64_t v10 = *(void *)v20;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v20 != v10) {
          objc_enumerationMutation(v4);
        }
        objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * v11), "bounds", (void)v19);
        double v8 = fmax(v12, v8);
        double v7 = v7 + v13;
        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [(NSArray *)v4 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v9);
  }

  if ([(NSArray *)self->_accessoryButtons count])
  {
    int64_t v14 = [(NSArray *)self->_accessoryButtons count] - 1;
    double v15 = +[CKUIBehavior sharedBehaviors];
    [v15 conversationListComposeButtonSpacing];
    double v6 = v16 * (double)v14;
  }
  double v17 = v7 + v6;
  double v18 = v8;
  result.height = v18;
  result.width = v17;
  return result;
}

- (void)setAccessoryButtons:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  uint64_t v5 = self->_accessoryButtons;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v21 objects:v26 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v22;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v22 != v8) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v21 + 1) + 8 * v9++) removeFromSuperview];
      }
      while (v7 != v9);
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v21 objects:v26 count:16];
    }
    while (v7);
  }

  uint64_t v10 = (NSArray *)[v4 copy];
  accessoryButtons = self->_accessoryButtons;
  self->_accessoryButtons = v10;

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v12 = v4;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v17 objects:v25 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v18;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v18 != v15) {
          objc_enumerationMutation(v12);
        }
        -[CKLargeTitleAccessoryView addSubview:](self, "addSubview:", *(void *)(*((void *)&v17 + 1) + 8 * v16++), (void)v17);
      }
      while (v14 != v16);
      uint64_t v14 = [v12 countByEnumeratingWithState:&v17 objects:v25 count:16];
    }
    while (v14);
  }
}

+ (id)newComposeButton
{
  v2 = [MEMORY[0x1E4F427E0] buttonWithType:0];
  double v3 = [v2 imageView];
  [v3 setContentMode:4];

  id v4 = +[CKUIBehavior sharedBehaviors];
  uint64_t v5 = (void *)[v4 newComposeImage];
  [v2 setImage:v5 forState:0];

  uint64_t v6 = +[CKUIBehavior sharedBehaviors];
  uint64_t v7 = [v6 theme];
  uint64_t v8 = [v7 appTintColor];
  [v2 setBackgroundColor:v8];

  uint64_t v9 = [MEMORY[0x1E4F428B8] systemWhiteColor];
  [v2 setTintColor:v9];

  [v2 setAccessibilityIdentifier:@"composeButton"];
  [v2 setTitle:0 forState:0];
  objc_msgSend(v2, "setBounds:", 0.0, 0.0, 30.0, 30.0);
  if (CKMainScreenScale_once_0 != -1) {
    dispatch_once(&CKMainScreenScale_once_0, &__block_literal_global_2);
  }
  double v10 = *(double *)&CKMainScreenScale_sMainScreenScale_0;
  if (*(double *)&CKMainScreenScale_sMainScreenScale_0 == 0.0) {
    double v10 = 1.0;
  }
  double v11 = round(v10 * 15.0) / v10;
  id v12 = [v2 layer];
  [v12 setCornerRadius:v11];

  [v2 setShowsLargeContentViewer:1];
  uint64_t v13 = CKFrameworkBundle();
  uint64_t v14 = [v13 localizedStringForKey:@"COMPOSE" value:&stru_1EDE4CA38 table:@"ChatKit"];
  [v2 setLargeContentTitle:v14];

  uint64_t v15 = [MEMORY[0x1E4F42A80] systemImageNamed:@"square.and.pencil"];
  [v2 setLargeContentImage:v15];

  [v2 setScalesLargeContentImage:1];
  return v2;
}

+ (id)newOptionsButton
{
  v2 = [MEMORY[0x1E4F427E0] buttonWithType:0];
  double v3 = [v2 imageView];
  [v3 setContentMode:4];

  id v4 = +[CKUIBehavior sharedBehaviors];
  uint64_t v5 = [v4 optionsImage];
  [v2 setImage:v5 forState:0];

  uint64_t v6 = [MEMORY[0x1E4F428B8] secondarySystemFillColor];
  [v2 setBackgroundColor:v6];

  uint64_t v7 = +[CKUIBehavior sharedBehaviors];
  uint64_t v8 = [v7 theme];
  uint64_t v9 = [v8 appTintColor];
  [v2 setTintColor:v9];

  [v2 setAccessibilityIdentifier:@"optionsButton"];
  [v2 setTitle:0 forState:0];
  objc_msgSend(v2, "setBounds:", 0.0, 0.0, 30.0, 30.0);
  if (CKMainScreenScale_once_0 != -1) {
    dispatch_once(&CKMainScreenScale_once_0, &__block_literal_global_2);
  }
  double v10 = *(double *)&CKMainScreenScale_sMainScreenScale_0;
  if (*(double *)&CKMainScreenScale_sMainScreenScale_0 == 0.0) {
    double v10 = 1.0;
  }
  double v11 = round(v10 * 15.0) / v10;
  id v12 = [v2 layer];
  [v12 setCornerRadius:v11];

  [v2 setShowsLargeContentViewer:1];
  uint64_t v13 = CKFrameworkBundle();
  uint64_t v14 = [v13 localizedStringForKey:@"MORE" value:&stru_1EDE4CA38 table:@"ChatKit"];
  [v2 setLargeContentTitle:v14];

  return v2;
}

- (NSArray)accessoryButtons
{
  return self->_accessoryButtons;
}

- (void).cxx_destruct
{
}

@end