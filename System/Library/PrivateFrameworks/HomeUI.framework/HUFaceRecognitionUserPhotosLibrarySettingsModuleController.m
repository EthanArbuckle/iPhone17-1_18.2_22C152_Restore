@interface HUFaceRecognitionUserPhotosLibrarySettingsModuleController
- (Class)cellClassForItem:(id)a3;
- (HUFaceRecognitionUserPhotosLibrarySettingsModuleController)initWithModule:(id)a3;
- (HUFaceRecognitionUserPhotosLibrarySettingsModuleController)initWithModule:(id)a3 host:(id)a4;
- (unint64_t)didSelectItem:(id)a3;
- (void)setupCell:(id)a3 forItem:(id)a4;
- (void)updateCell:(id)a3 forItem:(id)a4 animated:(BOOL)a5;
@end

@implementation HUFaceRecognitionUserPhotosLibrarySettingsModuleController

- (HUFaceRecognitionUserPhotosLibrarySettingsModuleController)initWithModule:(id)a3
{
  v5 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
  v6 = NSStringFromSelector(sel_initWithModule_host_);
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HUFaceRecognitionUserPhotosLibrarySettingsModuleController.m", 23, @"%s is unavailable; use %@ instead",
    "-[HUFaceRecognitionUserPhotosLibrarySettingsModuleController initWithModule:]",
    v6);

  return 0;
}

- (HUFaceRecognitionUserPhotosLibrarySettingsModuleController)initWithModule:(id)a3 host:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = objc_opt_class();
  id v9 = v6;
  if (v9)
  {
    if (objc_opt_isKindOfClass()) {
      v10 = v9;
    }
    else {
      v10 = 0;
    }
    v11 = v9;
    if (v10) {
      goto LABEL_8;
    }
    v12 = [MEMORY[0x1E4F28B00] currentHandler];
    v13 = objc_msgSend(NSString, "stringWithUTF8String:", "id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)");
    [v12 handleFailureInFunction:v13, @"NSObject+NAAdditions.h", 54, @"Expected class of %@ but was %@", v8, objc_opt_class() file lineNumber description];
  }
  v11 = 0;
LABEL_8:

  v17.receiver = self;
  v17.super_class = (Class)HUFaceRecognitionUserPhotosLibrarySettingsModuleController;
  v14 = [(HUItemModuleController *)&v17 initWithModule:v9];
  v15 = v14;
  if (v14) {
    [(HUItemModuleController *)v14 setHost:v7];
  }

  return v15;
}

- (Class)cellClassForItem:(id)a3
{
  return (Class)objc_opt_class();
}

- (void)setupCell:(id)a3 forItem:(id)a4
{
  id v6 = a3;
  v17.receiver = self;
  v17.super_class = (Class)HUFaceRecognitionUserPhotosLibrarySettingsModuleController;
  [(HUItemModuleController *)&v17 setupCell:v6 forItem:a4];
  objc_opt_class();
  id v7 = v6;
  if (objc_opt_isKindOfClass()) {
    uint64_t v8 = v7;
  }
  else {
    uint64_t v8 = 0;
  }
  id v9 = v8;

  if (v9)
  {
    [v9 setValueColorFollowsTintColor:1];
    [v9 setHideIcon:1];
  }
  objc_opt_class();
  v10 = [(HUItemModuleController *)self module];
  if (objc_opt_isKindOfClass()) {
    v11 = v10;
  }
  else {
    v11 = 0;
  }
  id v12 = v11;

  int v13 = [v12 shouldUseProxCardPresentationStyle];
  if (v13)
  {
    v14 = objc_opt_new();
    [v7 setBackgroundView:v14];

    v15 = [MEMORY[0x1E4F428B8] secondarySystemBackgroundColor];
    v16 = [v7 backgroundView];
    [v16 setBackgroundColor:v15];
  }
}

- (void)updateCell:(id)a3 forItem:(id)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  v12.receiver = self;
  v12.super_class = (Class)HUFaceRecognitionUserPhotosLibrarySettingsModuleController;
  id v7 = a4;
  id v8 = a3;
  [(HUItemModuleController *)&v12 updateCell:v8 forItem:v7 animated:v5];
  id v9 = objc_msgSend(v7, "latestResults", v12.receiver, v12.super_class);

  v10 = [v9 objectForKeyedSubscript:*MEMORY[0x1E4F68B40]];
  if ([v10 BOOLValue]) {
    uint64_t v11 = 3;
  }
  else {
    uint64_t v11 = 0;
  }
  [v8 setAccessoryType:v11];
}

- (unint64_t)didSelectItem:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  BOOL v5 = [(HUItemModuleController *)self module];
  if (objc_opt_isKindOfClass()) {
    id v6 = v5;
  }
  else {
    id v6 = 0;
  }
  id v7 = v6;

  if (([MEMORY[0x1E4F69758] isCloudPhotosOn] & 1) == 0)
  {
    id v8 = [v7 photoLibraryAccessNever];
    char v9 = [v4 isEqual:v8];

    if ((v9 & 1) == 0)
    {
      v14 = (void *)MEMORY[0x1E4F42728];
      v15 = _HULocalizedStringWithDefaultValue(@"HUFaceRecognitionTurnOniCloudPhotosAlertTitle", @"HUFaceRecognitionTurnOniCloudPhotosAlertTitle", 1);
      v16 = _HULocalizedStringWithDefaultValue(@"HUFaceRecognitionTurnOniCloudPhotosAlertMessage", @"HUFaceRecognitionTurnOniCloudPhotosAlertMessage", 1);
      objc_super v12 = [v14 alertControllerWithTitle:v15 message:v16 preferredStyle:1];

      objc_super v17 = (void *)MEMORY[0x1E4F42720];
      v18 = _HULocalizedStringWithDefaultValue(@"HUOkTitle", @"HUOkTitle", 1);
      v19 = [v17 actionWithTitle:v18 style:1 handler:0];
      [v12 addAction:v19];

      v20 = +[HUViewControllerPresentationRequest requestWithViewController:v12];
      v21 = [(HUItemModuleController *)self host];
      id v22 = (id)[v21 moduleController:self presentViewControllerForRequest:v20];

      goto LABEL_9;
    }
  }
  v10 = [(HUItemModuleController *)self module];
  char v11 = objc_opt_respondsToSelector();

  if (v11)
  {
    objc_super v12 = [(HUItemModuleController *)self module];
    id v13 = (id)[v12 didSelectItem:v4];
LABEL_9:
  }
  return 0;
}

@end