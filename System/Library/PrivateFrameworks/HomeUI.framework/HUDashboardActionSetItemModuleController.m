@interface HUDashboardActionSetItemModuleController
- (Class)collectionCellClassForItem:(id)a3;
- (void)configureCell:(id)a3 forItem:(id)a4;
@end

@implementation HUDashboardActionSetItemModuleController

- (Class)collectionCellClassForItem:(id)a3
{
  return (Class)objc_opt_class();
}

- (void)configureCell:(id)a3 forItem:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = objc_opt_class();
  id v9 = v6;
  id v21 = v9;
  if (!v9) {
    goto LABEL_7;
  }
  if (objc_opt_isKindOfClass()) {
    v10 = v21;
  }
  else {
    v10 = 0;
  }
  id v11 = v10;
  id v9 = v21;
  v12 = v21;
  if (!v11)
  {
    v13 = [MEMORY[0x1E4F28B00] currentHandler];
    v14 = objc_msgSend(NSString, "stringWithUTF8String:", "id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)");
    [v13 handleFailureInFunction:v14, @"NSObject+NAAdditions.h", 54, @"Expected class of %@ but was %@", v8, objc_opt_class() file lineNumber description];

    id v9 = v21;
LABEL_7:
    v12 = 0;
  }

  [v12 setItem:v7];
  objc_opt_class();
  v15 = [(HUItemModuleController *)self host];
  if (objc_opt_isKindOfClass()) {
    v16 = v15;
  }
  else {
    v16 = 0;
  }
  id v17 = v16;

  if (v17)
  {
    v18 = [v17 layoutManager];
    uint64_t v19 = [v18 gridSizeForItem:v7];
    objc_msgSend(v12, "setGridSize:", v19, v20);
  }
}

@end