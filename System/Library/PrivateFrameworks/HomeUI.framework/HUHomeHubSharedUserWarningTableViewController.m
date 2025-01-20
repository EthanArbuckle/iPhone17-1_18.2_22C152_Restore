@interface HUHomeHubSharedUserWarningTableViewController
- (Class)cellClassForItem:(id)a3 indexPath:(id)a4;
- (void)loadView;
- (void)updateCell:(id)a3 forItem:(id)a4 indexPath:(id)a5 animated:(BOOL)a6;
@end

@implementation HUHomeHubSharedUserWarningTableViewController

- (void)loadView
{
  v4.receiver = self;
  v4.super_class = (Class)HUHomeHubSharedUserWarningTableViewController;
  [(HUHomeHubSharedUserWarningTableViewController *)&v4 loadView];
  v3 = [(HUHomeHubSharedUserWarningTableViewController *)self tableView];
  [v3 setAllowsSelection:0];
}

- (Class)cellClassForItem:(id)a3 indexPath:(id)a4
{
  return (Class)objc_opt_class();
}

- (void)updateCell:(id)a3 forItem:(id)a4 indexPath:(id)a5 animated:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a3;
  id v11 = a4;
  v24.receiver = self;
  v24.super_class = (Class)HUHomeHubSharedUserWarningTableViewController;
  [(HUItemTableViewController *)&v24 updateCell:v10 forItem:v11 indexPath:a5 animated:v6];
  objc_opt_class();
  id v12 = v11;
  if (objc_opt_isKindOfClass()) {
    v13 = v12;
  }
  else {
    v13 = 0;
  }
  id v14 = v13;

  if (v14)
  {
    uint64_t v15 = objc_opt_class();
    id v16 = v10;
    if (v16)
    {
      if (objc_opt_isKindOfClass()) {
        v17 = v16;
      }
      else {
        v17 = 0;
      }
      v18 = v16;
      if (v17) {
        goto LABEL_12;
      }
      v19 = [MEMORY[0x1E4F28B00] currentHandler];
      v20 = objc_msgSend(NSString, "stringWithUTF8String:", "id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)");
      [v19 handleFailureInFunction:v20, @"NSObject+NAAdditions.h", 54, @"Expected class of %@ but was %@", v15, objc_opt_class() file lineNumber description];
    }
    v18 = 0;
LABEL_12:

    v21 = [v14 home];
    v22 = [v14 user];
    v23 = objc_msgSend(v21, "hf_handleForUser:", v22);
    [v18 setUserHandle:v23];
  }
  [v10 setAccessoryType:0];
}

@end