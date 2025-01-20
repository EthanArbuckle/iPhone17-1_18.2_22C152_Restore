@interface HUPendingAccessoriesGridViewController
- (BOOL)collectionView:(id)a3 shouldHighlightItemAtIndexPath:(id)a4;
- (BOOL)presentationCoordinator:(id)a3 shouldBeginInteractivePresentationWithTouchLocation:(CGPoint)a4 view:(id)a5;
- (HUPendingAccessoriesGridViewController)initWithUser:(id)a3 home:(id)a4;
- (id)layoutOptionsForSection:(int64_t)a3;
- (void)viewDidLoad;
@end

@implementation HUPendingAccessoriesGridViewController

- (HUPendingAccessoriesGridViewController)initWithUser:(id)a3 home:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc(MEMORY[0x1E4F69590]);
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __60__HUPendingAccessoriesGridViewController_initWithUser_home___block_invoke;
  v17[3] = &unk_1E6387E60;
  id v18 = v6;
  id v9 = v6;
  v10 = (void *)[v8 initWithDelegate:self itemProvidersCreator:v17];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __60__HUPendingAccessoriesGridViewController_initWithUser_home___block_invoke_2;
  v15[3] = &unk_1E6385000;
  id v16 = v7;
  id v11 = v7;
  [v10 setHomeCreator:v15];
  v14.receiver = self;
  v14.super_class = (Class)HUPendingAccessoriesGridViewController;
  v12 = [(HUServiceGridViewController *)&v14 initWithItemManager:v10];

  return v12;
}

id __60__HUPendingAccessoriesGridViewController_initWithUser_home___block_invoke(uint64_t a1, void *a2)
{
  v9[2] = *MEMORY[0x1E4F143B8];
  v3 = (objc_class *)MEMORY[0x1E4F68E10];
  id v4 = a2;
  v5 = (void *)[[v3 alloc] initWithHome:v4 user:*(void *)(a1 + 32)];
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F68E08]) initWithHome:v4 user:*(void *)(a1 + 32)];

  v9[0] = v5;
  v9[1] = v6;
  id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:2];

  return v7;
}

uint64_t __60__HUPendingAccessoriesGridViewController_initWithUser_home___block_invoke_2(uint64_t a1)
{
  return [MEMORY[0x1E4F7A0D8] futureWithResult:*(void *)(a1 + 32)];
}

- (void)viewDidLoad
{
  v10.receiver = self;
  v10.super_class = (Class)HUPendingAccessoriesGridViewController;
  [(HUServiceGridViewController *)&v10 viewDidLoad];
  v3 = [(HUPendingAccessoriesGridViewController *)self collectionView];
  [v3 _setShouldDeriveVisibleBoundsFromContainingScrollView:1];

  id v4 = [(HUPendingAccessoriesGridViewController *)self collectionView];
  [v4 setScrollEnabled:0];

  v5 = [(HUPendingAccessoriesGridViewController *)self collectionView];
  [v5 setClipsToBounds:1];

  id v6 = [MEMORY[0x1E4F428B8] clearColor];
  id v7 = [(HUPendingAccessoriesGridViewController *)self collectionView];
  [v7 setBackgroundColor:v6];

  id v8 = [MEMORY[0x1E4F428B8] clearColor];
  id v9 = [(HUPendingAccessoriesGridViewController *)self view];
  [v9 setBackgroundColor:v8];
}

- (BOOL)presentationCoordinator:(id)a3 shouldBeginInteractivePresentationWithTouchLocation:(CGPoint)a4 view:(id)a5
{
  return 0;
}

- (BOOL)collectionView:(id)a3 shouldHighlightItemAtIndexPath:(id)a4
{
  return 0;
}

- (id)layoutOptionsForSection:(int64_t)a3
{
  v6.receiver = self;
  v6.super_class = (Class)HUPendingAccessoriesGridViewController;
  v3 = [(HUServiceGridViewController *)&v6 layoutOptionsForSection:a3];
  id v4 = [v3 serviceCellOptions];
  [v4 setShowDescription:0];

  return v3;
}

@end