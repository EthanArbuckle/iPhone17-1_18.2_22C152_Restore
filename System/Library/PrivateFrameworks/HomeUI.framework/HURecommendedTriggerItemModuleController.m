@interface HURecommendedTriggerItemModuleController
- (Class)cellClassForItem:(id)a3;
- (HURecommendedTriggerItemModuleControllerDelegate)delegate;
- (NSString)analyticsPresentationContext;
- (unint64_t)didSelectItem:(id)a3;
- (void)didCommitTriggerBuilderForItem:(id)a3 withError:(id)a4;
- (void)setAnalyticsPresentationContext:(id)a3;
- (void)setDelegate:(id)a3;
- (void)updateCell:(id)a3 forItem:(id)a4 animated:(BOOL)a5;
@end

@implementation HURecommendedTriggerItemModuleController

- (Class)cellClassForItem:(id)a3
{
  id v4 = a3;
  v5 = [(HUItemModuleController *)self module];
  v6 = [v5 moreButtonItem];

  v7 = objc_opt_class();

  return (Class)v7;
}

- (void)updateCell:(id)a3 forItem:(id)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_opt_class();
    id v10 = v8;
    if (objc_opt_isKindOfClass()) {
      v11 = v10;
    }
    else {
      v11 = 0;
    }
    id v12 = v11;

    [v12 setIconDisplayStyle:1];
    HUDefaultSizeForIconSize();
    double v14 = v13;
    double v16 = v15;
    v17 = [v12 contentMetrics];
    objc_msgSend(v17, "setIconSize:", v14, v16);

    v18 = [v12 contentMetrics];
    objc_msgSend(v18, "setContentInset:", 12.0, 0.0, 12.0, 0.0);
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v19 = [v9 latestResults];
    v20 = [v19 objectForKeyedSubscript:*MEMORY[0x1E4F68A08]];
    uint64_t v21 = [v20 BOOLValue];

    id v22 = v8;
    [v22 setDisabled:v21];
    [v22 setAccessoryType:v21 ^ 1];
    if (v21) {
      double v23 = 0.200000003;
    }
    else {
      double v23 = 1.0;
    }
    [v22 setIconAlpha:v23];
    [v22 setTextAlpha:v23];
    [v22 setIconDisplayStyle:1];
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v8 setAccessoryType:1];
  }
  v24.receiver = self;
  v24.super_class = (Class)HURecommendedTriggerItemModuleController;
  [(HUItemModuleController *)&v24 updateCell:v8 forItem:v9 animated:v5];
}

- (unint64_t)didSelectItem:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  id v5 = v4;
  if (objc_opt_isKindOfClass()) {
    v6 = v5;
  }
  else {
    v6 = 0;
  }
  id v7 = v6;

  if (v7)
  {
    id v8 = [v7 recommendation];
    uint64_t v9 = objc_msgSend(v8, "hu_triggerBuilderIfAny");
    if (v9)
    {
      id v10 = (void *)v9;
      v11 = [HUTriggerBuilderContext alloc];
      id v12 = [v10 context];
      double v13 = [(HUTriggerBuilderContext *)v11 initWithTriggerBuilderContext:v12];

      [(HUTriggerBuilderContext *)v13 setSuggestionItem:v7];
      double v14 = [v10 triggerBuilderWithContext:v13];

      double v15 = [(HURecommendedTriggerItemModuleController *)self delegate];
      [v15 recommendedTriggerModuleController:self didSelectToOpenTriggerBuilder:v14];
    }
  }
  double v16 = [(HUItemModuleController *)self module];
  id v17 = [v16 moreButtonItem];

  if (v17 == v5)
  {
    v18 = [(HURecommendedTriggerItemModuleController *)self delegate];
    [v18 recommendedTriggerModuleControllerDidSelectShowMore:self];
  }
  return 0;
}

- (void)didCommitTriggerBuilderForItem:(id)a3 withError:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_opt_class();
  id v17 = v6;
  if (objc_opt_isKindOfClass()) {
    id v8 = v17;
  }
  else {
    id v8 = 0;
  }
  id v9 = v8;

  id v10 = [v9 recommendation];
  v11 = v10;
  if (v10)
  {
    id v12 = [v10 analyticsData];
    double v13 = (void *)[v12 mutableCopy];

    double v14 = [NSNumber numberWithBool:v7 == 0];
    [v13 setObject:v14 forKeyedSubscript:*MEMORY[0x1E4F681F8]];

    [v13 setObject:&unk_1F19B5450 forKeyedSubscript:*MEMORY[0x1E4F68188]];
    if (v7) {
      [v13 setObject:v7 forKeyedSubscript:*MEMORY[0x1E4F68190]];
    }
    double v15 = [(HURecommendedTriggerItemModuleController *)self analyticsPresentationContext];

    if (v15)
    {
      double v16 = [(HURecommendedTriggerItemModuleController *)self analyticsPresentationContext];
      [v13 setObject:v16 forKeyedSubscript:*MEMORY[0x1E4F681C8]];
    }
    [MEMORY[0x1E4F68EE0] sendEvent:14 withData:v13];
  }
}

- (HURecommendedTriggerItemModuleControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (HURecommendedTriggerItemModuleControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSString)analyticsPresentationContext
{
  return self->_analyticsPresentationContext;
}

- (void)setAnalyticsPresentationContext:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_analyticsPresentationContext, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end