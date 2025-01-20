@interface HUServicePlaceholderItemModuleController
- (Class)collectionCellClassForItem:(id)a3;
- (HUCollectionLayoutManager)collectionLayoutManager;
- (HUServicePlaceholderItemModuleController)initWithModule:(id)a3;
- (id)collectionLayoutSectionForSectionWithIdentifier:(id)a3 layoutEnvironment:(id)a4;
- (void)configureCell:(id)a3 forItem:(id)a4;
- (void)setCollectionLayoutManager:(id)a3;
@end

@implementation HUServicePlaceholderItemModuleController

- (HUServicePlaceholderItemModuleController)initWithModule:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  id v6 = v4;
  if (v6)
  {
    if (objc_opt_isKindOfClass()) {
      v7 = v6;
    }
    else {
      v7 = 0;
    }
    v8 = v6;
    if (v7) {
      goto LABEL_8;
    }
    v9 = [MEMORY[0x1E4F28B00] currentHandler];
    v10 = objc_msgSend(NSString, "stringWithUTF8String:", "id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)");
    [v9 handleFailureInFunction:v10, @"NSObject+NAAdditions.h", 54, @"Expected class of %@ but was %@", v5, objc_opt_class() file lineNumber description];
  }
  v8 = 0;
LABEL_8:

  v14.receiver = self;
  v14.super_class = (Class)HUServicePlaceholderItemModuleController;
  v11 = [(HUItemModuleController *)&v14 initWithModule:v6];
  if (v11)
  {
    v12 = objc_alloc_init(HUCollectionLayoutManager);
    [(HUServicePlaceholderItemModuleController *)v11 setCollectionLayoutManager:v12];
  }
  return v11;
}

- (void)setCollectionLayoutManager:(id)a3
{
}

- (id)collectionLayoutSectionForSectionWithIdentifier:(id)a3 layoutEnvironment:(id)a4
{
  id v5 = a4;
  id v6 = [(HUServicePlaceholderItemModuleController *)self collectionLayoutManager];
  v7 = [(HUItemModuleController *)self module];
  v8 = [v7 allItems];
  v9 = [v8 allObjects];
  v10 = [v6 buildAdaptiveTileSectionFor:v9 layoutEnvironment:v5];

  [v10 contentInsets];
  double v12 = v11;
  [v10 contentInsets];
  objc_msgSend(v10, "setContentInsets:", v12, 0.0);

  return v10;
}

- (void)configureCell:(id)a3 forItem:(id)a4
{
  id v6 = a3;
  v18.receiver = self;
  v18.super_class = (Class)HUServicePlaceholderItemModuleController;
  id v7 = a4;
  [(HUItemModuleController *)&v18 configureCell:v6 forItem:v7];
  uint64_t v8 = objc_opt_class();
  id v9 = v6;
  if (!v9) {
    goto LABEL_7;
  }
  if (objc_opt_isKindOfClass()) {
    v10 = v9;
  }
  else {
    v10 = 0;
  }
  double v11 = v9;
  if (!v10)
  {
    double v12 = [MEMORY[0x1E4F28B00] currentHandler];
    v13 = objc_msgSend(NSString, "stringWithUTF8String:", "id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)");
    [v12 handleFailureInFunction:v13, @"NSObject+NAAdditions.h", 54, @"Expected class of %@ but was %@", v8, objc_opt_class(), v18.receiver, v18.super_class file lineNumber description];

LABEL_7:
    double v11 = 0;
  }

  [v11 setItem:v7];
  [v11 setToggleable:0];
  objc_super v14 = [(HUServicePlaceholderItemModuleController *)self collectionLayoutManager];
  uint64_t v15 = [v14 gridSizeForItem:v7];
  uint64_t v17 = v16;

  objc_msgSend(v11, "setGridSize:", v15, v17);
}

- (Class)collectionCellClassForItem:(id)a3
{
  return (Class)objc_opt_class();
}

- (HUCollectionLayoutManager)collectionLayoutManager
{
  return self->_collectionLayoutManager;
}

- (void).cxx_destruct
{
}

@end