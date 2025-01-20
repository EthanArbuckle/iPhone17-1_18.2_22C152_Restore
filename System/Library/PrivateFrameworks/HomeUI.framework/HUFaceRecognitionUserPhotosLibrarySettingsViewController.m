@interface HUFaceRecognitionUserPhotosLibrarySettingsViewController
- (Class)cellClassForItem:(id)a3 indexPath:(id)a4;
- (HUFaceRecognitionUserPhotosLibrarySettingsItemManager)photosLibrarySettingsItemManager;
- (HUFaceRecognitionUserPhotosLibrarySettingsModuleController)photosLibrarySettingsModuleController;
- (HUFaceRecognitionUserPhotosLibrarySettingsViewController)initWithItemManager:(id)a3 tableViewStyle:(int64_t)a4;
- (HUFaceRecognitionUserPhotosLibrarySettingsViewController)initWithUserPhotosLibraryItem:(id)a3;
- (id)buildItemModuleControllerForModule:(id)a3;
- (id)itemModuleControllers;
- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4;
- (unint64_t)automaticDisablingReasonsForItem:(id)a3;
- (void)setPhotosLibrarySettingsItemManager:(id)a3;
- (void)setPhotosLibrarySettingsModuleController:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)tappableTextView:(id)a3 tappedAtIndex:(unint64_t)a4 withAttributes:(id)a5;
- (void)updateCell:(id)a3 forItem:(id)a4 indexPath:(id)a5 animated:(BOOL)a6;
@end

@implementation HUFaceRecognitionUserPhotosLibrarySettingsViewController

- (HUFaceRecognitionUserPhotosLibrarySettingsViewController)initWithUserPhotosLibraryItem:(id)a3
{
  id v4 = a3;
  v5 = [HUFaceRecognitionUserPhotosLibrarySettingsItemManager alloc];
  v6 = (void *)[v4 copy];
  v7 = [(HUFaceRecognitionUserPhotosLibrarySettingsItemManager *)v5 initWithDelegate:0 sourceItem:v6];

  v20.receiver = self;
  v20.super_class = (Class)HUFaceRecognitionUserPhotosLibrarySettingsViewController;
  v8 = [(HUItemTableViewController *)&v20 initWithItemManager:v7 tableViewStyle:1];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_photosLibrarySettingsItemManager, v7);
    [(HFItemManager *)v9->_photosLibrarySettingsItemManager setDelegate:v9];
    v10 = [v4 user];
    v11 = [v10 name];
    v18 = HULocalizedStringWithFormat(@"HUFaceRecognitionUsersPhotosLibraryTableViewCellTitle", @"%@", v12, v13, v14, v15, v16, v17, (uint64_t)v11);
    [(HUFaceRecognitionUserPhotosLibrarySettingsViewController *)v9 setTitle:v18];
  }
  return v9;
}

- (HUFaceRecognitionUserPhotosLibrarySettingsViewController)initWithItemManager:(id)a3 tableViewStyle:(int64_t)a4
{
  v6 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3, a4);
  v7 = NSStringFromSelector(sel_initWithHome_);
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HUFaceRecognitionUserPhotosLibrarySettingsViewController.m", 49, @"%s is unavailable; use %@ instead",
    "-[HUFaceRecognitionUserPhotosLibrarySettingsViewController initWithItemManager:tableViewStyle:]",
    v7);

  return 0;
}

- (id)buildItemModuleControllerForModule:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    NSLog(&cfstr_UnexpectedModu.isa, v4);
  }
  v5 = [HUFaceRecognitionUserPhotosLibrarySettingsModuleController alloc];
  v6 = [(HUFaceRecognitionUserPhotosLibrarySettingsItemManager *)self->_photosLibrarySettingsItemManager photosLibrarySettingsModule];
  v7 = [(HUFaceRecognitionUserPhotosLibrarySettingsModuleController *)v5 initWithModule:v6 host:self];
  [(HUFaceRecognitionUserPhotosLibrarySettingsViewController *)self setPhotosLibrarySettingsModuleController:v7];

  v8 = [(HUFaceRecognitionUserPhotosLibrarySettingsViewController *)self photosLibrarySettingsModuleController];

  return v8;
}

- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4
{
  v13.receiver = self;
  v13.super_class = (Class)HUFaceRecognitionUserPhotosLibrarySettingsViewController;
  v5 = [(HUItemTableViewController *)&v13 tableView:a3 viewForFooterInSection:a4];
  objc_opt_class();
  id v6 = v5;
  if (objc_opt_isKindOfClass()) {
    v7 = v6;
  }
  else {
    v7 = 0;
  }
  id v8 = v7;

  v9 = [v8 messageTextView];
  [v9 setTappableTextViewDelegate:self];

  v10 = [v8 messageTextView];
  [v10 setSelectable:0];

  v11 = [v8 messageTextView];
  [v11 _setInteractiveTextSelectionDisabled:1];

  return v6;
}

- (Class)cellClassForItem:(id)a3 indexPath:(id)a4
{
  id v5 = a3;
  id v6 = [(HUFaceRecognitionUserPhotosLibrarySettingsViewController *)self photosLibrarySettingsItemManager];
  v7 = [v6 addNamesInPhotosLibraryItem];
  [v5 isEqual:v7];

  id v8 = objc_opt_class();

  return (Class)v8;
}

- (void)updateCell:(id)a3 forItem:(id)a4 indexPath:(id)a5 animated:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a3;
  v18.receiver = self;
  v18.super_class = (Class)HUFaceRecognitionUserPhotosLibrarySettingsViewController;
  id v11 = a4;
  [(HUItemTableViewController *)&v18 updateCell:v10 forItem:v11 indexPath:a5 animated:v6];
  uint64_t v12 = [(HUFaceRecognitionUserPhotosLibrarySettingsViewController *)self photosLibrarySettingsItemManager];
  objc_super v13 = [v12 addNamesInPhotosLibraryItem];
  LODWORD(self) = [v11 isEqual:v13];

  if (self)
  {
    objc_opt_class();
    id v14 = v10;
    if (objc_opt_isKindOfClass()) {
      uint64_t v15 = v14;
    }
    else {
      uint64_t v15 = 0;
    }
    id v16 = v15;

    uint64_t v17 = [v16 textLabel];
    [v17 setNumberOfLines:0];
  }
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a4;
  v19.receiver = self;
  v19.super_class = (Class)HUFaceRecognitionUserPhotosLibrarySettingsViewController;
  id v7 = a3;
  [(HUItemTableViewController *)&v19 tableView:v7 didSelectRowAtIndexPath:v6];
  objc_msgSend(v7, "deselectRowAtIndexPath:animated:", v6, 1, v19.receiver, v19.super_class);

  uint64_t v8 = [v6 section];
  v9 = [(HUItemTableViewController *)self itemManager];
  uint64_t v10 = [v9 sectionIndexForDisplayedSectionIdentifier:@"HUFaceRecognitionAddNamesInPhotosLibrarySection"];

  if (v8 == v10)
  {
    id v11 = [(HUItemTableViewController *)self itemManager];
    uint64_t v12 = [v11 displayedItemAtIndexPath:v6];
    objc_super v13 = [(HUFaceRecognitionUserPhotosLibrarySettingsViewController *)self photosLibrarySettingsItemManager];
    id v14 = [v13 addNamesInPhotosLibraryItem];
    int v15 = [v12 isEqual:v14];

    if (v15)
    {
      id v16 = [MEMORY[0x1E4F69378] sharedInstance];
      uint64_t v17 = objc_msgSend(MEMORY[0x1E4F1CB10], "hf_photosLibraryPeopleAlbumURL");
      id v18 = (id)[v16 openURL:v17];
    }
  }
}

- (id)itemModuleControllers
{
  v3 = objc_opt_new();
  v7.receiver = self;
  v7.super_class = (Class)HUFaceRecognitionUserPhotosLibrarySettingsViewController;
  id v4 = [(HUItemTableViewController *)&v7 itemModuleControllers];
  [v3 unionSet:v4];

  id v5 = [(HUFaceRecognitionUserPhotosLibrarySettingsViewController *)self photosLibrarySettingsModuleController];
  objc_msgSend(v3, "na_safeAddObject:", v5);

  return v3;
}

- (void)tappableTextView:(id)a3 tappedAtIndex:(unint64_t)a4 withAttributes:(id)a5
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  uint64_t v8 = *MEMORY[0x1E4F42530];
  id v9 = a3;
  uint64_t v10 = [a5 objectForKeyedSubscript:v8];
  id v11 = [v10 absoluteString];
  uint64_t v12 = objc_msgSend(MEMORY[0x1E4F1CB10], "hf_photosLibraryPeopleAlbumURL");
  objc_super v13 = [v12 absoluteString];
  int v14 = [v11 isEqualToString:v13];

  int v15 = _HULocalizedStringWithDefaultValue(@"HUFaceRecognitionUsePhotosLibrarySectionFooterPhotosLink", @"HUFaceRecognitionUsePhotosLibrarySectionFooterPhotosLink", 1);
  id v16 = [v9 text];

  unint64_t v17 = [v16 rangeOfString:v15];
  uint64_t v19 = v18;

  if (v17 != 0x7FFFFFFFFFFFFFFFLL && v17 <= a4 && v17 + v19 > a4 && v14)
  {
    objc_super v20 = [MEMORY[0x1E4F223E0] defaultWorkspace];
    v21 = objc_msgSend(MEMORY[0x1E4F1CB10], "hf_photosLibraryPeopleAlbumURL");
    id v25 = 0;
    [v20 openSensitiveURL:v21 withOptions:0 error:&v25];
    id v22 = v25;

    if (v22)
    {
      v23 = HFLogForCategory();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        v24 = objc_msgSend(MEMORY[0x1E4F1CB10], "hf_photosLibraryPeopleAlbumURL");
        *(_DWORD *)buf = 138412802;
        v27 = self;
        __int16 v28 = 2080;
        v29 = "-[HUFaceRecognitionUserPhotosLibrarySettingsViewController tappableTextView:tappedAtIndex:withAttributes:]";
        __int16 v30 = 2112;
        v31 = v24;
        _os_log_error_impl(&dword_1BE345000, v23, OS_LOG_TYPE_ERROR, "%@ (%s): Cannot open sensitive url %@", buf, 0x20u);
      }
    }
    else
    {
      [MEMORY[0x1E4F68EE0] sendEvent:6];
    }
  }
}

- (unint64_t)automaticDisablingReasonsForItem:(id)a3
{
  return 1;
}

- (HUFaceRecognitionUserPhotosLibrarySettingsItemManager)photosLibrarySettingsItemManager
{
  return self->_photosLibrarySettingsItemManager;
}

- (void)setPhotosLibrarySettingsItemManager:(id)a3
{
}

- (HUFaceRecognitionUserPhotosLibrarySettingsModuleController)photosLibrarySettingsModuleController
{
  return self->_photosLibrarySettingsModuleController;
}

- (void)setPhotosLibrarySettingsModuleController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_photosLibrarySettingsModuleController, 0);

  objc_storeStrong((id *)&self->_photosLibrarySettingsItemManager, 0);
}

@end