@interface HUHomeTheaterAudioItemModuleController
- (Class)cellClassForItem:(id)a3;
- (unint64_t)didSelectItem:(id)a3;
- (void)setupCell:(id)a3 forItem:(id)a4;
- (void)updateCell:(id)a3 forItem:(id)a4 animated:(BOOL)a5;
@end

@implementation HUHomeTheaterAudioItemModuleController

- (Class)cellClassForItem:(id)a3
{
  return (Class)objc_opt_class();
}

- (void)updateCell:(id)a3 forItem:(id)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  v21.receiver = self;
  v21.super_class = (Class)HUHomeTheaterAudioItemModuleController;
  [(HUItemModuleController *)&v21 updateCell:v8 forItem:v9 animated:v5];
  objc_opt_class();
  id v10 = v8;
  if (objc_opt_isKindOfClass()) {
    v11 = v10;
  }
  else {
    v11 = 0;
  }
  id v12 = v11;

  v13 = [v9 latestResults];
  v14 = [v13 objectForKeyedSubscript:*MEMORY[0x1E4F68AB8]];
  [v12 setTitleText:v14];

  v15 = [v9 latestResults];
  v16 = [v15 objectForKeyedSubscript:*MEMORY[0x1E4F68C48]];
  int v17 = [v16 BOOLValue];

  if (v17)
  {
    v18 = (void *)[objc_alloc(MEMORY[0x1E4F42708]) initWithActivityIndicatorStyle:100];
    [v18 startAnimating];
    [v12 setAccessoryView:v18];
  }
  else
  {
    [v12 setAccessoryView:0];
    v18 = [v9 latestResults];
    v19 = [v18 objectForKeyedSubscript:*MEMORY[0x1E4F68B40]];
    if ([v19 BOOLValue]) {
      uint64_t v20 = 3;
    }
    else {
      uint64_t v20 = 0;
    }
    [v12 setAccessoryType:v20];
  }
}

- (unint64_t)didSelectItem:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  BOOL v5 = [(HUItemModuleController *)self module];
  if (objc_opt_isKindOfClass()) {
    v6 = v5;
  }
  else {
    v6 = 0;
  }
  id v7 = v6;

  id v8 = [v7 allItems];
  int v9 = [v8 containsObject:v4];

  if (v9) {
    [v7 selectItem:v4];
  }

  return 0;
}

- (void)setupCell:(id)a3 forItem:(id)a4
{
  id v4 = a3;
  [v4 setIconDisplayStyle:1];
  BOOL v5 = +[HUIconCellContentMetrics compactMetrics];
  [v4 setContentMetrics:v5];

  [v4 setDisableContinuousIconAnimation:1];
  [v4 setIconForegroundColorFollowsTintColor:0];
  id v6 = [MEMORY[0x1E4F428B8] secondaryLabelColor];
  [v4 setIconForegroundColor:v6];
}

@end