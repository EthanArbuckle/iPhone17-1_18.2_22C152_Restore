@interface HUAccessoryDebugViewController
- (HFHomeKitObject)homeKitObject;
- (HUAccessoryDebugModuleController)debugModuleController;
- (HUAccessoryDebugViewController)initWithHomeKitObject:(id)a3;
- (id)buildItemModuleControllerForModule:(id)a3;
- (void)setDebugModuleController:(id)a3;
@end

@implementation HUAccessoryDebugViewController

- (HUAccessoryDebugViewController)initWithHomeKitObject:(id)a3
{
  id v6 = a3;
  if (!v6)
  {
    v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"HUAccessoryDebugViewController.m", 22, @"Invalid parameter not satisfying: %@", @"homeKitObject" object file lineNumber description];
  }
  v7 = (void *)[objc_alloc(MEMORY[0x1E4F69590]) initWithDelegate:self];
  v8 = (objc_class *)objc_opt_class();
  v9 = NSStringFromClass(v8);
  [v7 setIdentifier:v9];

  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __56__HUAccessoryDebugViewController_initWithHomeKitObject___block_invoke;
  v16[3] = &unk_1E6387A08;
  id v10 = v6;
  id v17 = v10;
  [v7 setItemModuleCreator:v16];
  v15.receiver = self;
  v15.super_class = (Class)HUAccessoryDebugViewController;
  v11 = [(HUItemTableViewController *)&v15 initWithItemManager:v7 tableViewStyle:1];
  v12 = v11;
  if (v11) {
    objc_storeStrong((id *)&v11->_homeKitObject, a3);
  }

  return v12;
}

id __56__HUAccessoryDebugViewController_initWithHomeKitObject___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  v8[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [[HUAccessoryDebugModule alloc] initWithItemUpdater:v4 homeKitObject:*(void *)(a1 + 32)];

  v8[0] = v5;
  id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];

  return v6;
}

- (id)buildItemModuleControllerForModule:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    NSLog(&cfstr_UnexpectedModu.isa, v4);
  }
  v5 = [[HUAccessoryDebugModuleController alloc] initWithModule:v4];
  [(HUAccessoryDebugViewController *)self setDebugModuleController:v5];

  id v6 = [(HUAccessoryDebugViewController *)self debugModuleController];

  return v6;
}

- (HFHomeKitObject)homeKitObject
{
  return self->_homeKitObject;
}

- (HUAccessoryDebugModuleController)debugModuleController
{
  return self->_debugModuleController;
}

- (void)setDebugModuleController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_debugModuleController, 0);

  objc_storeStrong((id *)&self->_homeKitObject, 0);
}

@end