@interface HUAccessorySceneListContentViewController
+ (id)computeNumberOfItemsToDisplayForContentSource:(unint64_t)a3 serviceLikeItem:(id)a4 home:(id)a5;
- (BOOL)canSelectItem:(id)a3 indexPath:(id)a4;
- (BOOL)collectionView:(id)a3 shouldHighlightItemAtIndexPath:(id)a4;
- (BOOL)includeTopMargin;
- (BOOL)persistAddedSuggestions;
- (BOOL)presentationCoordinator:(id)a3 shouldBeginInteractivePresentationWithTouchLocation:(CGPoint)a4 view:(id)a5;
- (HFItem)currentlyOpenedItem;
- (HFServiceLikeItem)serviceLikeItem;
- (HUAccessorySceneListContentViewController)initWithServiceLikeItem:(id)a3 contentSource:(unint64_t)a4 selectionType:(unint64_t)a5;
- (HUAccessorySceneListContentViewControllerDelegate)delegate;
- (NSSet)selectedActionSetBuilders;
- (NSString)analyticsPresentationContext;
- (id)commitChangesToSelectedActionBuilders;
- (id)layoutOptionsForSection:(int64_t)a3;
- (unint64_t)contentSource;
- (unint64_t)itemTypeForItem:(id)a3;
- (unint64_t)selectionType;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)configureCell:(id)a3 forItem:(id)a4;
- (void)didChangeSelection;
- (void)sceneEditor:(id)a3 didCommitActionSet:(id)a4;
- (void)setAnalyticsPresentationContext:(id)a3;
- (void)setCurrentlyOpenedItem:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setIncludeTopMargin:(BOOL)a3;
- (void)setPersistAddedSuggestions:(BOOL)a3;
@end

@implementation HUAccessorySceneListContentViewController

+ (id)computeNumberOfItemsToDisplayForContentSource:(unint64_t)a3 serviceLikeItem:(id)a4 home:(id)a5
{
  return +[HUAccessorySceneListContentItemManager computeNumberOfItemsToDisplayForContentSource:a3 serviceLikeItem:a4 home:a5];
}

- (HUAccessorySceneListContentViewController)initWithServiceLikeItem:(id)a3 contentSource:(unint64_t)a4 selectionType:(unint64_t)a5
{
  id v9 = a3;
  v10 = [[HUAccessorySceneListContentItemManager alloc] initWithDelegate:self contentSource:a4 serviceLikeItem:v9];
  v14.receiver = self;
  v14.super_class = (Class)HUAccessorySceneListContentViewController;
  v11 = [(HUSelectableServiceGridViewController *)&v14 initWithServiceGridItemManager:v10];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_serviceLikeItem, a3);
    v12->_contentSource = a4;
    v12->_selectionType = a5;
    v12->_includeTopMargin = 1;
  }

  return v12;
}

- (id)commitChangesToSelectedActionBuilders
{
  v3 = [(HUItemCollectionViewController *)self itemManager];
  v4 = [(HUSelectableServiceGridViewController *)self selectedItems];
  v5 = [v4 toSet];
  v6 = [v3 commitSelectionChangesWithSelectedItems:v5];

  return v6;
}

- (NSSet)selectedActionSetBuilders
{
  v3 = [(HUSelectableServiceGridViewController *)self selectedItems];
  v4 = [v3 toSet];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __70__HUAccessorySceneListContentViewController_selectedActionSetBuilders__block_invoke;
  v7[3] = &unk_1E6389C58;
  v7[4] = self;
  v5 = objc_msgSend(v4, "na_map:", v7);

  return (NSSet *)v5;
}

id __70__HUAccessorySceneListContentViewController_selectedActionSetBuilders__block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  v4 = [v2 itemManager];
  v5 = [v4 actionSetBuilderForItem:v3];

  return v5;
}

- (void)setPersistAddedSuggestions:(BOOL)a3
{
  BOOL v3 = a3;
  self->_persistAddedSuggestions = a3;
  id v4 = [(HUItemCollectionViewController *)self itemManager];
  [v4 setPersistAddedSuggestions:v3];
}

- (BOOL)canSelectItem:(id)a3 indexPath:(id)a4
{
  return [(HUAccessorySceneListContentViewController *)self selectionType] == 1;
}

- (void)didChangeSelection
{
  v7.receiver = self;
  v7.super_class = (Class)HUAccessorySceneListContentViewController;
  [(HUSelectableServiceGridViewController *)&v7 didChangeSelection];
  BOOL v3 = [(HUAccessorySceneListContentViewController *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    v5 = [(HUAccessorySceneListContentViewController *)self delegate];
    v6 = [(HUAccessorySceneListContentViewController *)self selectedActionSetBuilders];
    [v5 sceneListContentViewController:self didUpdateSelectedActionSetBuilders:v6];
  }
}

- (id)layoutOptionsForSection:(int64_t)a3
{
  v6.receiver = self;
  v6.super_class = (Class)HUAccessorySceneListContentViewController;
  char v4 = [(HUServiceGridViewController *)&v6 layoutOptionsForSection:a3];
  [v4 setSectionLeadingMargin:0.0];
  [v4 setSectionTrailingMargin:0.0];
  if (![(HUAccessorySceneListContentViewController *)self includeTopMargin]) {
    [v4 setSectionTopMargin:0.0];
  }

  return v4;
}

- (unint64_t)itemTypeForItem:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    unint64_t v5 = 1;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)HUAccessorySceneListContentViewController;
    unint64_t v5 = [(HUServiceGridViewController *)&v7 itemTypeForItem:v4];
  }

  return v5;
}

- (void)configureCell:(id)a3 forItem:(id)a4
{
  id v6 = a3;
  v16.receiver = self;
  v16.super_class = (Class)HUAccessorySceneListContentViewController;
  [(HUSelectableServiceGridViewController *)&v16 configureCell:v6 forItem:a4];
  uint64_t v7 = objc_opt_class();
  id v8 = v6;
  if (!v8) {
    goto LABEL_7;
  }
  if (objc_opt_isKindOfClass()) {
    id v9 = v8;
  }
  else {
    id v9 = 0;
  }
  v10 = v8;
  if (!v9)
  {
    v11 = [MEMORY[0x1E4F28B00] currentHandler];
    v12 = objc_msgSend(NSString, "stringWithUTF8String:", "id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)");
    [v11 handleFailureInFunction:v12, @"NSObject+NAAdditions.h", 54, @"Expected class of %@ but was %@", v7, objc_opt_class() file lineNumber description];

LABEL_7:
    v10 = 0;
  }

  if (![(HUAccessorySceneListContentViewController *)self selectionType])
  {
    if (_MergedGlobals_2 != -1) {
      dispatch_once(&_MergedGlobals_2, &__block_literal_global_20_0);
    }
    id v13 = (id)qword_1EA12DF90;
    objc_super v14 = (void *)[objc_alloc(MEMORY[0x1E4F42AA0]) initWithImage:v13];
    v15 = [MEMORY[0x1E4F428B8] colorWithRed:0.780392157 green:0.780392157 blue:0.8 alpha:1.0];
    [v14 setTintColor:v15];

    [v10 setAccessoryView:v14];
    [v10 setUseDefaultCellBackgroundColor:1];
  }
}

void __67__HUAccessorySceneListContentViewController_configureCell_forItem___block_invoke_2()
{
  uint64_t v0 = [MEMORY[0x1E4F42A80] systemImageNamed:@"chevron.forward"];
  v1 = (void *)qword_1EA12DF90;
  qword_1EA12DF90 = v0;
}

- (BOOL)presentationCoordinator:(id)a3 shouldBeginInteractivePresentationWithTouchLocation:(CGPoint)a4 view:(id)a5
{
  return 0;
}

- (BOOL)collectionView:(id)a3 shouldHighlightItemAtIndexPath:(id)a4
{
  return 1;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(HUAccessorySceneListContentViewController *)self selectionType])
  {
    v26.receiver = self;
    v26.super_class = (Class)HUAccessorySceneListContentViewController;
    [(HUSelectableServiceGridViewController *)&v26 collectionView:v6 didSelectItemAtIndexPath:v7];
  }
  else
  {
    id v8 = [(HUItemCollectionViewController *)self itemManager];
    id v9 = [v8 displayedItemAtIndexPath:v7];

    [(HUAccessorySceneListContentViewController *)self setCurrentlyOpenedItem:v9];
    v10 = [(HUItemCollectionViewController *)self itemManager];
    v11 = [v10 actionSetBuilderForItem:v9];

    v12 = [v11 actionSet];
    id v13 = [v12 actions];
    BOOL v14 = [v13 count] == 0;

    v15 = [[HUSceneActionEditorViewController alloc] initWithActionSetBuilder:v11 mode:v14];
    [(HUSceneActionEditorViewController *)v15 setSceneEditorDelegate:self];
    objc_super v16 = [(UIViewController *)self hu_delegateForModalPresentation];
    [(HUSceneActionEditorViewController *)v15 setPresentationDelegate:v16];

    v17 = [MEMORY[0x1E4F1CA80] set];
    v18 = [(HUAccessorySceneListContentViewController *)self serviceLikeItem];
    v19 = [v18 homeKitObject];
    if ([v19 conformsToProtocol:&unk_1F1AD8588]) {
      v20 = v19;
    }
    else {
      v20 = 0;
    }
    id v21 = v20;

    if (v21)
    {
      [v17 addObject:v21];
    }
    else
    {
      v22 = [(HUAccessorySceneListContentViewController *)self serviceLikeItem];
      v23 = [v22 services];
      [v17 unionSet:v23];
    }
    [(HUSceneActionEditorViewController *)v15 setPrioritizedAccessories:v17];
    v24 = (void *)[objc_alloc(MEMORY[0x1E4F42BF8]) initWithRootViewController:v15];
    [v24 setModalPresentationStyle:2];
    id v25 = [(UIViewController *)self hu_presentPreloadableViewController:v24 animated:1];
  }
}

- (void)sceneEditor:(id)a3 didCommitActionSet:(id)a4
{
  unint64_t v5 = [(HUAccessorySceneListContentViewController *)self currentlyOpenedItem];
  id v6 = [v5 latestResults];
  id v20 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4F68BC8]];

  [(HUAccessorySceneListContentViewController *)self setCurrentlyOpenedItem:0];
  id v7 = v20;
  if (v20)
  {
    id v8 = [(HUAccessorySceneListContentViewController *)self serviceLikeItem];
    id v9 = [v8 services];
    v10 = objc_msgSend(v9, "na_map:", &__block_literal_global_155);

    v11 = (void *)MEMORY[0x1E4F6A310];
    v12 = [(HUAccessorySceneListContentViewController *)self serviceLikeItem];
    id v13 = [v11 accessoryCategoryAnalyticsDescription:v12];

    BOOL v14 = [v20 analyticsData];
    v15 = (void *)[v14 mutableCopy];

    uint64_t v16 = MEMORY[0x1E4F1CC38];
    [v15 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*MEMORY[0x1E4F681F8]];
    [v15 setObject:v16 forKeyedSubscript:*MEMORY[0x1E4F68188]];
    if (v13) {
      [v15 setObject:v13 forKeyedSubscript:*MEMORY[0x1E4F68158]];
    }
    if ([v10 count] == 1)
    {
      v17 = [v10 anyObject];
      [v15 setObject:v17 forKeyedSubscript:*MEMORY[0x1E4F681E0]];
    }
    v18 = [(HUAccessorySceneListContentViewController *)self analyticsPresentationContext];

    if (v18)
    {
      v19 = [(HUAccessorySceneListContentViewController *)self analyticsPresentationContext];
      [v15 setObject:v19 forKeyedSubscript:*MEMORY[0x1E4F681C8]];
    }
    [MEMORY[0x1E4F68EE0] sendEvent:14 withData:v15];

    id v7 = v20;
  }
}

uint64_t __76__HUAccessorySceneListContentViewController_sceneEditor_didCommitActionSet___block_invoke(uint64_t a1, void *a2)
{
  return [a2 serviceType];
}

- (HUAccessorySceneListContentViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (HUAccessorySceneListContentViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (unint64_t)contentSource
{
  return self->_contentSource;
}

- (unint64_t)selectionType
{
  return self->_selectionType;
}

- (HFServiceLikeItem)serviceLikeItem
{
  return self->_serviceLikeItem;
}

- (NSString)analyticsPresentationContext
{
  return self->_analyticsPresentationContext;
}

- (void)setAnalyticsPresentationContext:(id)a3
{
}

- (BOOL)includeTopMargin
{
  return self->_includeTopMargin;
}

- (void)setIncludeTopMargin:(BOOL)a3
{
  self->_includeTopMargin = a3;
}

- (BOOL)persistAddedSuggestions
{
  return self->_persistAddedSuggestions;
}

- (HFItem)currentlyOpenedItem
{
  return self->_currentlyOpenedItem;
}

- (void)setCurrentlyOpenedItem:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentlyOpenedItem, 0);
  objc_storeStrong((id *)&self->_analyticsPresentationContext, 0);
  objc_storeStrong((id *)&self->_serviceLikeItem, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end