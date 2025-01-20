@interface HUPocketButtonViewController
+ (CGSize)calculatePreferredContentSizeForDescriptors:(id)a3;
- (HUPocketButtonViewController)initWithButtonDescriptors:(id)a3;
- (HUPocketButtonViewController)initWithCoder:(id)a3;
- (HUPocketButtonViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (NSArray)descriptors;
- (void)_buttonHit:(id)a3;
- (void)viewDidLoad;
@end

@implementation HUPocketButtonViewController

+ (CGSize)calculatePreferredContentSizeForDescriptors:(id)a3
{
  id v3 = a3;
  if ([v3 count])
  {
    v4 = [MEMORY[0x1E4F42D90] mainScreen];
    [v4 bounds];
    double v6 = v5;

    uint64_t v7 = [v3 count];
    if (v7)
    {
      double v8 = 10.0;
      do
      {
        double v8 = v8 + 50.0 + 10.0;
        --v7;
      }
      while (v7);
    }
    else
    {
      double v8 = 10.0;
    }
  }
  else
  {
    double v6 = *MEMORY[0x1E4F1DB30];
    double v8 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  }

  double v9 = v6;
  double v10 = v8;
  result.height = v10;
  result.width = v9;
  return result;
}

- (HUPocketButtonViewController)initWithButtonDescriptors:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    double v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"HUPocketButtonViewController.m", 143, @"Invalid parameter not satisfying: %@", @"descriptors" object file lineNumber description];
  }
  v11.receiver = self;
  v11.super_class = (Class)HUPocketButtonViewController;
  double v6 = [(HUPocketButtonViewController *)&v11 initWithNibName:0 bundle:0];
  if (v6)
  {
    uint64_t v7 = [v5 copy];
    descriptors = v6->_descriptors;
    v6->_descriptors = (NSArray *)v7;

    [(id)objc_opt_class() calculatePreferredContentSizeForDescriptors:v5];
    -[HUPocketButtonViewController setPreferredContentSize:](v6, "setPreferredContentSize:");
  }

  return v6;
}

- (HUPocketButtonViewController)initWithCoder:(id)a3
{
  id v5 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
  double v6 = NSStringFromSelector(sel_initWithButtonDescriptors_);
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HUPocketButtonViewController.m", 154, @"%s is unavailable; use %@ instead",
    "-[HUPocketButtonViewController initWithCoder:]",
    v6);

  return 0;
}

- (HUPocketButtonViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  double v6 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3, a4);
  uint64_t v7 = NSStringFromSelector(sel_initWithButtonDescriptors_);
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HUPocketButtonViewController.m", 159, @"%s is unavailable; use %@ instead",
    "-[HUPocketButtonViewController initWithNibName:bundle:]",
    v7);

  return 0;
}

- (void)viewDidLoad
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  v33.receiver = self;
  v33.super_class = (Class)HUPocketButtonViewController;
  [(HUPocketButtonViewController *)&v33 viewDidLoad];
  id v3 = objc_opt_new();
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id obj = [(HUPocketButtonViewController *)self descriptors];
  uint64_t v4 = [obj countByEnumeratingWithState:&v29 objects:v34 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v30;
    double v7 = *MEMORY[0x1E4F1DB28];
    double v8 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v9 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v10 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v30 != v6) {
          objc_enumerationMutation(obj);
        }
        v12 = *(void **)(*((void *)&v29 + 1) + 8 * v11);
        v13 = -[_HUPocketButton initWithFrame:highlightedAlpha:highlightedTextAlpha:]([_HUPocketButton alloc], "initWithFrame:highlightedAlpha:highlightedTextAlpha:", v7, v8, v9, v10, 0.75, 0.5);
        v14 = [v12 title];
        [(_HUPocketButton *)v13 setTitle:v14 forState:0];

        v15 = [v12 backgroundColor];

        if (v15)
        {
          v16 = [v12 backgroundColor];
          [(_HUPocketButton *)v13 setBackgroundColor:v16];
        }
        else
        {
          [(HUColoredButton *)v13 setBackgroundColorFollowsTintColor:1];
        }
        v17 = [v12 textColor];

        if (v17)
        {
          v18 = [v12 textColor];
          [(_HUPocketButton *)v13 setTitleColor:v18 forState:0];
        }
        v19 = [(HUPocketButtonViewController *)self descriptors];
        -[_HUPocketButton setTag:](v13, "setTag:", [v19 indexOfObject:v12]);

        [(_HUPocketButton *)v13 addTarget:self action:sel__buttonHit_ forControlEvents:64];
        [v3 addObject:v13];

        ++v11;
      }
      while (v5 != v11);
      uint64_t v5 = [obj countByEnumeratingWithState:&v29 objects:v34 count:16];
    }
    while (v5);
  }

  v20 = (void *)[objc_alloc(MEMORY[0x1E4F42E20]) initWithArrangedSubviews:v3];
  [v20 setAxis:1];
  [v20 setDistribution:4];
  [v20 setAlignment:3];
  objc_msgSend(v20, "setLayoutMargins:", 10.0, 0.0, 10.0, 0.0);
  [v20 setSpacing:10.0];
  [v20 setLayoutMarginsRelativeArrangement:1];
  [v20 setInsetsLayoutMarginsFromSafeArea:0];
  v21 = [(HUPocketButtonViewController *)self view];
  objc_msgSend(v21, "naui_addAutoLayoutSubview:", v20);

  v22 = (void *)MEMORY[0x1E4F28DC8];
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __43__HUPocketButtonViewController_viewDidLoad__block_invoke;
  v26[3] = &unk_1E638E568;
  id v27 = v20;
  v28 = self;
  id v23 = v20;
  v24 = __43__HUPocketButtonViewController_viewDidLoad__block_invoke((uint64_t)v26);
  [v22 activateConstraints:v24];
}

id __43__HUPocketButtonViewController_viewDidLoad__block_invoke(uint64_t a1)
{
  v2 = objc_opt_new();
  id v3 = [*(id *)(a1 + 32) leadingAnchor];
  uint64_t v4 = [*(id *)(a1 + 40) view];
  uint64_t v5 = [v4 layoutMarginsGuide];
  uint64_t v6 = [v5 leadingAnchor];
  double v7 = [v3 constraintEqualToAnchor:v6];
  [v2 addObject:v7];

  double v8 = [*(id *)(a1 + 32) trailingAnchor];
  double v9 = [*(id *)(a1 + 40) view];
  double v10 = [v9 layoutMarginsGuide];
  uint64_t v11 = [v10 trailingAnchor];
  v12 = [v8 constraintEqualToAnchor:v11];
  [v2 addObject:v12];

  v13 = [*(id *)(a1 + 32) bottomAnchor];
  v14 = [*(id *)(a1 + 40) view];
  v15 = [v14 bottomAnchor];
  v16 = [v13 constraintEqualToAnchor:v15];
  [v2 addObject:v16];

  v17 = [*(id *)(a1 + 32) topAnchor];
  v18 = [*(id *)(a1 + 40) view];
  v19 = [v18 topAnchor];
  v20 = [v17 constraintEqualToAnchor:v19];
  [v2 addObject:v20];

  return v2;
}

- (void)_buttonHit:(id)a3
{
  uint64_t v4 = [a3 tag];
  uint64_t v5 = [(HUPocketButtonViewController *)self descriptors];
  id v6 = [v5 objectAtIndexedSubscript:v4];

  [v6 execute];
}

- (NSArray)descriptors
{
  return self->_descriptors;
}

- (void).cxx_destruct
{
}

@end