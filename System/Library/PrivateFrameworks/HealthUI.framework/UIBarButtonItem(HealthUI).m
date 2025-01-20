@interface UIBarButtonItem(HealthUI)
+ (id)hk_backButtonForDate:()HealthUI;
+ (id)hk_backButtonWithTitle:()HealthUI;
+ (id)hk_sequencingButtonWithTitle:()HealthUI accessibilityFormatString:;
@end

@implementation UIBarButtonItem(HealthUI)

+ (id)hk_backButtonWithTitle:()HealthUI
{
  v3 = (objc_class *)MEMORY[0x1E4FB14A8];
  id v4 = a3;
  v5 = (void *)[[v3 alloc] initWithTitle:v4 style:0 target:0 action:0];

  return v5;
}

+ (id)hk_backButtonForDate:()HealthUI
{
  id v3 = a3;
  id v4 = objc_opt_class();
  v5 = HKLocalizedStringForDateAndTemplate(v3, 12);

  v6 = objc_msgSend(v4, "hk_backButtonWithTitle:", v5);

  return v6;
}

+ (id)hk_sequencingButtonWithTitle:()HealthUI accessibilityFormatString:
{
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_alloc(MEMORY[0x1E4FB1930]);
  v8 = objc_msgSend(v7, "initWithFrame:", *MEMORY[0x1E4F1DB20], *(double *)(MEMORY[0x1E4F1DB20] + 8), *(double *)(MEMORY[0x1E4F1DB20] + 16), *(double *)(MEMORY[0x1E4F1DB20] + 24));
  [v8 setText:v5];
  v9 = [MEMORY[0x1E4FB1618] systemGrayColor];
  [v8 setTextColor:v9];

  if (v6)
  {
    v10 = [NSString stringWithValidatedFormat:v6, @"%@", 0, v5 validFormatSpecifiers error];
    [v8 setAccessibilityLabel:v10];
  }
  v11 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithCustomView:v8];

  return v11;
}

@end