@interface HUSceneSuggestionsViewController
+ (id)computeNumberOfSuggestionsInHome:(id)a3;
- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4;
- (Class)cellClassForItem:(id)a3 indexPath:(id)a4;
- (HUPresentationDelegate)presentationDelegate;
- (HUSceneEditorDelegate)sceneEditorDelegate;
- (HUSceneSuggestionsItemManager)suggestionsItemManager;
- (HUSceneSuggestionsViewController)init;
- (void)_cancel:(id)a3;
- (void)_showActionEditorForActionSetSuggestionItem:(id)a3;
- (void)_showActionEditorForNewCustomScene;
- (void)setPresentationDelegate:(id)a3;
- (void)setSceneEditorDelegate:(id)a3;
- (void)setSuggestionsItemManager:(id)a3;
- (void)setupCell:(id)a3 forItem:(id)a4 indexPath:(id)a5;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
@end

@implementation HUSceneSuggestionsViewController

- (HUSceneSuggestionsViewController)init
{
  v3 = [(HFItemManager *)[HUSceneSuggestionsItemManager alloc] initWithDelegate:self];
  v14.receiver = self;
  v14.super_class = (Class)HUSceneSuggestionsViewController;
  v4 = [(HUItemTableViewController *)&v14 initWithItemManager:v3 tableViewStyle:1];
  v5 = v4;
  if (v4)
  {
    [(HUSceneSuggestionsViewController *)v4 setSuggestionsItemManager:v3];
    v6 = _HULocalizedStringWithDefaultValue(@"HUSceneSuggestionsTitle", @"HUSceneSuggestionsTitle", 1);
    [(HUSceneSuggestionsViewController *)v5 setTitle:v6];

    v7 = (void *)[objc_alloc(MEMORY[0x1E4F427C0]) initWithBarButtonSystemItem:1 target:v5 action:sel__cancel_];
    v8 = [(HUSceneSuggestionsViewController *)v5 navigationItem];
    [v8 setLeftBarButtonItem:v7];

    v9 = _HULocalizedStringWithDefaultValue(@"HUSceneSuggestionsBackButton", @"HUSceneSuggestionsBackButton", 1);
    v10 = [(HUSceneSuggestionsViewController *)v5 navigationItem];
    [v10 setBackButtonTitle:v9];

    v11 = [(HUSceneSuggestionsViewController *)v5 navigationItem];
    v12 = [v11 leftBarButtonItem];
    [v12 setAccessibilityIdentifier:@"Home.NewScene.Cancel"];
  }
  return v5;
}

- (void)_cancel:(id)a3
{
  id v5 = [(HUSceneSuggestionsViewController *)self presentationDelegate];
  id v4 = (id)[v5 finishPresentation:self animated:1];
}

- (void)_showActionEditorForActionSetSuggestionItem:(id)a3
{
  id v11 = a3;
  id v4 = [v11 latestResults];
  id v5 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F688A8]];

  if (v5)
  {
    v6 = [[HUSceneActionEditorViewController alloc] initWithActionSetBuilder:v5 mode:1];
    [(HUSceneActionEditorViewController *)v6 setShowCancelButton:0];
    v7 = [(HUSceneSuggestionsViewController *)self sceneEditorDelegate];
    [(HUSceneActionEditorViewController *)v6 setSceneEditorDelegate:v7];

    v8 = [(HUSceneSuggestionsViewController *)self presentationDelegate];
    [(HUSceneActionEditorViewController *)v6 setPresentationDelegate:v8];

    v9 = [(HUSceneSuggestionsViewController *)self navigationController];
    id v10 = (id)objc_msgSend(v9, "hu_pushPreloadableViewController:animated:", v6, 1);
  }
  else
  {
    NSLog(&cfstr_Hfactionsetsug.isa, v11);
  }
}

- (void)_showActionEditorForNewCustomScene
{
  v7 = [[HUSceneActionEditorViewController alloc] initWithActionSetBuilder:0 mode:2];
  [(HUSceneActionEditorViewController *)v7 setShowCancelButton:0];
  v3 = [(HUSceneSuggestionsViewController *)self sceneEditorDelegate];
  [(HUSceneActionEditorViewController *)v7 setSceneEditorDelegate:v3];

  id v4 = [(HUSceneSuggestionsViewController *)self presentationDelegate];
  [(HUSceneActionEditorViewController *)v7 setPresentationDelegate:v4];

  id v5 = [(HUSceneSuggestionsViewController *)self navigationController];
  id v6 = (id)objc_msgSend(v5, "hu_pushPreloadableViewController:animated:", v7, 1);
}

- (Class)cellClassForItem:(id)a3 indexPath:(id)a4
{
  id v5 = a3;
  id v6 = [(HUSceneSuggestionsViewController *)self suggestionsItemManager];
  v7 = [v6 addCustomSceneItem];

  v8 = objc_opt_class();

  return (Class)v8;
}

- (void)setupCell:(id)a3 forItem:(id)a4 indexPath:(id)a5
{
  id v14 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v14;
    [v5 setHideDescription:1];
    [v5 setAccessoryType:1];
    [v5 setIconDisplayStyle:1];
    id v6 = NSString;
    v7 = [v5 titleText];
    v8 = [v7 stringByReplacingOccurrencesOfString:@" " withString:&stru_1F18F92B8];
    v9 = [v6 stringWithFormat:@"Home.NewScene.%@", v8];
    [v5 setAccessibilityIdentifier:v9];

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      id v10 = +[HUGridSceneCellLayoutOptions defaultOptionsForCellSizeSubclass:1];
      id v11 = [v10 font];
      [v5 setTitleFont:v11];
    }
  }
  else
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    v13 = v14;
    if ((isKindOfClass & 1) == 0) {
      goto LABEL_8;
    }
    [v14 setAccessibilityIdentifier:@"Home.NewScene.Custom"];
  }
  v13 = v14;
LABEL_8:
}

- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4
{
  return 1;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  v13.receiver = self;
  v13.super_class = (Class)HUSceneSuggestionsViewController;
  id v6 = a4;
  id v7 = a3;
  [(HUItemTableViewController *)&v13 tableView:v7 didSelectRowAtIndexPath:v6];
  objc_msgSend(v7, "deselectRowAtIndexPath:animated:", v6, 1, v13.receiver, v13.super_class);

  v8 = [(HUItemTableViewController *)self itemManager];
  v9 = [v8 displayedItemAtIndexPath:v6];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [(HUSceneSuggestionsViewController *)self _showActionEditorForActionSetSuggestionItem:v9];
  }
  else
  {
    id v10 = [(HUSceneSuggestionsViewController *)self suggestionsItemManager];
    id v11 = [v10 addCustomSceneItem];
    int v12 = [v9 isEqual:v11];

    if (v12) {
      [(HUSceneSuggestionsViewController *)self _showActionEditorForNewCustomScene];
    }
  }
}

+ (id)computeNumberOfSuggestionsInHome:(id)a3
{
  return +[HUSceneSuggestionsItemManager computeNumberOfSuggestionsInHome:a3];
}

- (HUPresentationDelegate)presentationDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presentationDelegate);

  return (HUPresentationDelegate *)WeakRetained;
}

- (void)setPresentationDelegate:(id)a3
{
}

- (HUSceneEditorDelegate)sceneEditorDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_sceneEditorDelegate);

  return (HUSceneEditorDelegate *)WeakRetained;
}

- (void)setSceneEditorDelegate:(id)a3
{
}

- (HUSceneSuggestionsItemManager)suggestionsItemManager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_suggestionsItemManager);

  return (HUSceneSuggestionsItemManager *)WeakRetained;
}

- (void)setSuggestionsItemManager:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_suggestionsItemManager);
  objc_destroyWeak((id *)&self->_sceneEditorDelegate);

  objc_destroyWeak((id *)&self->_presentationDelegate);
}

@end