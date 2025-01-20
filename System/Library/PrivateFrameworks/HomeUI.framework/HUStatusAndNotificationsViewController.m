@interface HUStatusAndNotificationsViewController
- (BOOL)shouldHideHeaderAboveSection:(int64_t)a3;
- (BOOL)showStatusSection;
- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4;
- (Class)cellClassForItem:(id)a3 indexPath:(id)a4;
- (HFServiceLikeItem)item;
- (HUCameraSmartNotificationSettingsModuleController)cameraSmartSettingsModuleController;
- (HUStatusAndNotificationsViewController)initWithServiceItem:(id)a3 inHome:(id)a4 displayingDetails:(BOOL)a5;
- (HUTriggerConditionEditorItemModuleController)conditionModuleController;
- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4;
- (id)itemModuleControllers;
- (unint64_t)automaticDisablingReasonsForItem:(id)a3;
- (void)_toggleSmartActivityNotificationWithAlertNotificationForCell:(id)a3 didTurnOn:(BOOL)a4;
- (void)conditionEditorModuleController:(id)a3 didUpdateConditionCollection:(id)a4;
- (void)conditionEditorModuleController:(id)a3 dismissDetailViewController:(id)a4;
- (void)conditionEditorModuleController:(id)a3 presentDetailViewController:(id)a4;
- (void)setItem:(id)a3;
- (void)setShowStatusSection:(BOOL)a3;
- (void)setupCell:(id)a3 forItem:(id)a4 indexPath:(id)a5;
- (void)smartNotificationSettingsModuleController:(id)a3 didUpdateConditionCollection:(id)a4;
- (void)switchCell:(id)a3 didTurnOn:(BOOL)a4;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)updateCell:(id)a3 forItem:(id)a4 indexPath:(id)a5 animated:(BOOL)a6;
@end

@implementation HUStatusAndNotificationsViewController

- (HUStatusAndNotificationsViewController)initWithServiceItem:(id)a3 inHome:(id)a4 displayingDetails:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  v10 = [[HUStatusAndNotificationsItemManager alloc] initWithServiceItem:v8 delegate:self home:v9];
  v31.receiver = self;
  v31.super_class = (Class)HUStatusAndNotificationsViewController;
  v11 = [(HUItemTableViewController *)&v31 initWithItemManager:v10 tableViewStyle:1];
  v12 = v11;
  if (v11)
  {
    [(HUStatusAndNotificationsViewController *)v11 setItem:v8];
    if (v5)
    {
      [(HUStatusAndNotificationsViewController *)v12 setUseServiceNameAsTitle:0];
      v13 = [(HUItemTableViewController *)v12 itemManager];
      [v13 setShowsForServiceDetails:1];
    }
    else
    {
      [(HUStatusAndNotificationsViewController *)v12 setShowStatusSection:0];
      [(HUStatusAndNotificationsViewController *)v12 setUseServiceNameAsTitle:1];
    }
    if ((objc_msgSend(v9, "hf_currentUserIsAdministrator") & 1) == 0) {
      [(HUStatusAndNotificationsViewController *)v12 setShowStatusSection:0];
    }
    int v14 = [MEMORY[0x1E4F68F98] cameraContainsMotionServiceItem:v8];
    v15 = [(HUStatusAndNotificationsItemManager *)v10 conditionModule];
    if (v15) {
      int v16 = v14;
    }
    else {
      int v16 = 1;
    }

    if ((v16 & 1) == 0)
    {
      v17 = [HUTriggerConditionEditorItemModuleController alloc];
      v18 = [(HUStatusAndNotificationsItemManager *)v10 conditionModule];
      uint64_t v19 = [(HUTriggerConditionEditorItemModuleController *)v17 initWithModule:v18 delegate:v12];
      conditionModuleController = v12->_conditionModuleController;
      v12->_conditionModuleController = (HUTriggerConditionEditorItemModuleController *)v19;
    }
    v21 = [(HUStatusAndNotificationsItemManager *)v10 cameraSmartDetectionSettingsModule];

    if (v21)
    {
      v22 = [HUCameraSmartNotificationSettingsModuleController alloc];
      v23 = [(HUStatusAndNotificationsItemManager *)v10 cameraSmartDetectionSettingsModule];
      uint64_t v24 = [(HUCameraSmartNotificationSettingsModuleController *)v22 initWithModule:v23];
      cameraSmartSettingsModuleController = v12->_cameraSmartSettingsModuleController;
      v12->_cameraSmartSettingsModuleController = (HUCameraSmartNotificationSettingsModuleController *)v24;

      [(HUCameraSmartNotificationSettingsModuleController *)v12->_cameraSmartSettingsModuleController setDelegate:v12];
      [(HUItemModuleController *)v12->_cameraSmartSettingsModuleController setHost:v12];
    }
    BOOL v26 = [(HUStatusAndNotificationsViewController *)v12 showStatusSection];
    v27 = @"HUNotificationsTitle";
    if (v26) {
      v27 = @"HUStatusAndNotificationsTitle";
    }
    if (v16) {
      v28 = @"HUStatusTitle";
    }
    else {
      v28 = v27;
    }
    v29 = _HULocalizedStringWithDefaultValue(v28, v28, 1);
    [(HUStatusAndNotificationsViewController *)v12 setTitle:v29];
  }
  return v12;
}

- (BOOL)showStatusSection
{
  v2 = [(HUItemTableViewController *)self itemManager];
  char v3 = [v2 showStatusSection];

  return v3;
}

- (void)setShowStatusSection:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(HUItemTableViewController *)self itemManager];
  [v4 setShowStatusSection:v3];
}

- (Class)cellClassForItem:(id)a3 indexPath:(id)a4
{
  id v5 = a3;
  v6 = [(HUItemTableViewController *)self itemManager];
  v7 = [v6 chimeOnAccessoriesListItem];
  [v5 isEqual:v7];

  id v8 = objc_opt_class();

  return (Class)v8;
}

- (void)updateCell:(id)a3 forItem:(id)a4 indexPath:(id)a5 animated:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a3;
  id v11 = a4;
  v21.receiver = self;
  v21.super_class = (Class)HUStatusAndNotificationsViewController;
  [(HUItemTableViewController *)&v21 updateCell:v10 forItem:v11 indexPath:a5 animated:v6];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v12 = v10;
    [v12 setDelegate:self];
    v13 = [(HUItemTableViewController *)self itemManager];
    int v14 = [v13 includeInStatusItem];
    int v15 = [v11 isEqual:v14];

    if (v15)
    {
      int v16 = [(HUStatusAndNotificationsViewController *)self item];
      v17 = [v16 homeKitObject];
      if ([v17 conformsToProtocol:&unk_1F1ABACC0]) {
        v18 = v17;
      }
      else {
        v18 = 0;
      }
      id v19 = v18;

      uint64_t v20 = objc_msgSend(v19, "hf_isForcedVisibleInHomeStatus");
      [v12 setDisabled:v20];
    }
  }
}

- (void)setupCell:(id)a3 forItem:(id)a4 indexPath:(id)a5
{
  id v17 = a3;
  id v7 = a4;
  id v8 = [(HUItemTableViewController *)self itemManager];
  id v9 = [v8 chimeOnAccessoriesListItem];
  int v10 = [v7 isEqual:v9];

  if (v10)
  {
    uint64_t v11 = objc_opt_class();
    id v12 = v17;
    if (v12)
    {
      if (objc_opt_isKindOfClass()) {
        v13 = v12;
      }
      else {
        v13 = 0;
      }
      int v14 = v12;
      if (v13) {
        goto LABEL_9;
      }
      int v15 = [MEMORY[0x1E4F28B00] currentHandler];
      int v16 = objc_msgSend(NSString, "stringWithUTF8String:", "id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)");
      [v15 handleFailureInFunction:v16, @"NSObject+NAAdditions.h", 54, @"Expected class of %@ but was %@", v11, objc_opt_class() file lineNumber description];
    }
    int v14 = 0;
LABEL_9:

    [v14 setHideIcon:1];
    [v14 setAccessoryType:1];
  }
}

- (unint64_t)automaticDisablingReasonsForItem:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)HUStatusAndNotificationsViewController;
  unint64_t v5 = [(HUItemTableViewController *)&v13 automaticDisablingReasonsForItem:v4];
  BOOL v6 = [(HUItemTableViewController *)self itemManager];
  uint64_t v7 = [v6 allowNotificationsItem];
  if ((id)v7 == v4)
  {
  }
  else
  {
    id v8 = (void *)v7;
    id v9 = [(HUItemTableViewController *)self itemManager];
    int v10 = [v9 conditionModule];
    int v11 = [v10 containsItem:v4];

    if (!v11) {
      goto LABEL_6;
    }
  }
  unint64_t v5 = 1;
LABEL_6:

  return v5;
}

- (id)itemModuleControllers
{
  BOOL v3 = objc_opt_new();
  id v4 = [(HUStatusAndNotificationsViewController *)self conditionModuleController];
  objc_msgSend(v3, "na_safeAddObject:", v4);

  unint64_t v5 = [(HUStatusAndNotificationsViewController *)self cameraSmartSettingsModuleController];
  objc_msgSend(v3, "na_safeAddObject:", v5);

  return v3;
}

- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4
{
  id v6 = a3;
  uint64_t v7 = [(HUItemTableViewController *)self itemManager];
  id v8 = [v7 displayedSectionIdentifierForSectionIndex:a4];
  int v9 = [v8 isEqualToString:@"HUStatusAndNotificationsConditionSectionIdentifier"];

  int v10 = [(HUItemTableViewController *)self itemManager];
  if ([v10 numberOfSections] - 1 <= (unint64_t)a4)
  {
  }
  else
  {
    int v11 = [(HUItemTableViewController *)self itemManager];
    id v12 = [v11 displayedSectionIdentifierForSectionIndex:a4 + 1];
    int v13 = [v12 isEqualToString:@"HUCameraSmartDetectionSettingsOnOffSectionIdentifier"];

    double v14 = 10.0;
    if (v9 & v13) {
      goto LABEL_6;
    }
  }
  v17.receiver = self;
  v17.super_class = (Class)HUStatusAndNotificationsViewController;
  [(HUItemTableViewController *)&v17 tableView:v6 heightForFooterInSection:a4];
  double v14 = v15;
LABEL_6:

  return v14;
}

- (BOOL)shouldHideHeaderAboveSection:(int64_t)a3
{
  unint64_t v5 = [(HUItemTableViewController *)self itemManager];
  id v6 = [v5 displayedSectionIdentifierForSectionIndex:a3];
  char v7 = [v6 isEqualToString:@"HUCameraSmartDetectionSettingsOnOffSectionIdentifier"];

  BOOL v8 = a3 < 1;
  int64_t v9 = a3 - 1;
  if (v8)
  {
    char v12 = 0;
  }
  else
  {
    int v10 = [(HUItemTableViewController *)self itemManager];
    int v11 = [v10 displayedSectionIdentifierForSectionIndex:v9];
    char v12 = [v11 isEqualToString:@"HUStatusAndNotificationsConditionSectionIdentifier"];
  }
  return v7 & v12;
}

- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = [v6 cellForRowAtIndexPath:v7];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    BOOL v10 = 0;
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)HUStatusAndNotificationsViewController;
    BOOL v10 = [(HUItemTableViewController *)&v12 tableView:v6 shouldHighlightRowAtIndexPath:v7];
  }

  return v10;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  v15.receiver = self;
  v15.super_class = (Class)HUStatusAndNotificationsViewController;
  id v6 = a4;
  [(HUItemTableViewController *)&v15 tableView:a3 didSelectRowAtIndexPath:v6];
  id v7 = [(HUItemTableViewController *)self itemManager];
  BOOL v8 = [v7 displayedItemAtIndexPath:v6];

  int64_t v9 = [(HUItemTableViewController *)self itemManager];
  BOOL v10 = [v9 chimeOnAccessoriesListItem];
  int v11 = [v8 isEqual:v10];

  if (v11)
  {
    objc_super v12 = objc_alloc_init(HUDoorbellChimeDevicesViewController);
    int v13 = [(HUStatusAndNotificationsViewController *)self navigationController];
    id v14 = (id)objc_msgSend(v13, "hu_pushPreloadableViewController:animated:", v12, 1);
  }
}

- (void)switchCell:(id)a3 didTurnOn:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = [(HUStatusAndNotificationsViewController *)self tableView];
  BOOL v8 = [v7 indexPathForCell:v6];

  int64_t v9 = [(HUItemTableViewController *)self itemManager];
  BOOL v10 = [v9 displayedItemAtIndexPath:v8];

  int v11 = [(HUItemTableViewController *)self itemManager];
  objc_super v12 = [v11 includeInStatusItem];
  int v13 = [v10 isEqual:v12];

  if (v13)
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __63__HUStatusAndNotificationsViewController_switchCell_didTurnOn___block_invoke;
    aBlock[3] = &unk_1E6387DC8;
    aBlock[4] = self;
    id v14 = _Block_copy(aBlock);
    v59[0] = MEMORY[0x1E4F143A8];
    v59[1] = 3221225472;
    v59[2] = __63__HUStatusAndNotificationsViewController_switchCell_didTurnOn___block_invoke_3;
    v59[3] = &unk_1E6386518;
    v59[4] = self;
    BOOL v60 = v4;
    objc_super v15 = __63__HUStatusAndNotificationsViewController_switchCell_didTurnOn___block_invoke_3((uint64_t)v59);
    id v16 = (id)[v15 addSuccessBlock:v14];
  }
  else
  {
    objc_super v17 = [(HUItemTableViewController *)self itemManager];
    v18 = [v17 allowNotificationsItem];
    int v19 = [v10 isEqual:v18];

    uint64_t v20 = [(HUItemTableViewController *)self itemManager];
    id v14 = v20;
    if (v19)
    {
      objc_super v21 = [v20 updateAllowNotifications:v4];
      objc_super v15 = v21;
      v22 = &__block_literal_global_186;
    }
    else
    {
      v23 = [v20 allowAudioNotificationsItem];
      int v24 = [v10 isEqual:v23];

      v25 = [(HUItemTableViewController *)self itemManager];
      id v14 = v25;
      if (v24)
      {
        objc_super v21 = [v25 updateAllowAudioNotifications:v4];
        objc_super v15 = v21;
        v22 = &__block_literal_global_91;
      }
      else
      {
        BOOL v26 = [v25 allowActivityNotificationsItem];
        int v27 = [v10 isEqual:v26];

        if (v27)
        {
          [(HUStatusAndNotificationsViewController *)self _toggleSmartActivityNotificationWithAlertNotificationForCell:v6 didTurnOn:v4];
          goto LABEL_25;
        }
        v28 = [(HUItemTableViewController *)self itemManager];
        v29 = [v28 allowDoorbellNotificationsItem];
        int v30 = [v10 isEqual:v29];

        objc_super v31 = [(HUItemTableViewController *)self itemManager];
        id v14 = v31;
        if (v30)
        {
          objc_super v21 = [v31 updateAllowDoorbellNotifications:v4];
          objc_super v15 = v21;
          v22 = &__block_literal_global_93;
        }
        else
        {
          v32 = [v31 allowAnalogChimeNotificationItem];
          int v33 = [v10 isEqual:v32];

          v34 = [(HUItemTableViewController *)self itemManager];
          id v14 = v34;
          if (v33)
          {
            objc_super v21 = [v34 updateAllowChimeAnalogNotifications:v4];
            objc_super v15 = v21;
            v22 = &__block_literal_global_95_0;
          }
          else
          {
            v35 = [v34 allowMotionNotificationsItem];
            int v36 = [v10 isEqual:v35];

            v37 = [(HUItemTableViewController *)self itemManager];
            id v14 = v37;
            if (v36)
            {
              objc_super v21 = [v37 updateAllowMotionNotifications:v4];
              objc_super v15 = v21;
              v22 = &__block_literal_global_97;
            }
            else
            {
              v38 = [v37 chimeOnHomePodSingleItem];
              int v39 = [v10 isEqual:v38];

              v40 = [(HUItemTableViewController *)self itemManager];
              id v14 = v40;
              if (v39)
              {
                objc_super v21 = [v40 updateChimeOnAccessory:v4];
                objc_super v15 = v21;
                v22 = &__block_literal_global_99_0;
              }
              else
              {
                v41 = [v40 allowCameraSnapshotsItem];
                int v42 = [v10 isEqual:v41];

                v43 = [(HUItemTableViewController *)self itemManager];
                id v14 = v43;
                if (v42)
                {
                  objc_super v21 = [v43 updateAllowSnapshotsInNotifications:v4];
                  objc_super v15 = v21;
                  v22 = &__block_literal_global_101_0;
                }
                else
                {
                  v44 = [v43 allowCameraStatusChangesItem];
                  int v45 = [v10 isEqual:v44];

                  v46 = [(HUItemTableViewController *)self itemManager];
                  id v14 = v46;
                  if (v45)
                  {
                    objc_super v21 = [v46 updateAllowCameraStatusChangeNotifications:v4];
                    objc_super v15 = v21;
                    v22 = &__block_literal_global_103_1;
                  }
                  else
                  {
                    v47 = [v46 allowCameraReachabilityChangeNotificationsItem];
                    int v48 = [v10 isEqual:v47];

                    if (!v48) {
                      goto LABEL_25;
                    }
                    id v14 = [(HUItemTableViewController *)self itemManager];
                    objc_super v21 = [v14 updateAllowCameraReachabilityStatusChangeNotifications:v4];
                    objc_super v15 = v21;
                    v22 = &__block_literal_global_105_3;
                  }
                }
              }
            }
          }
        }
      }
    }
    id v49 = (id)[v21 addFailureBlock:v22];
  }

LABEL_25:
  v50 = [v10 latestResults];
  uint64_t v51 = *MEMORY[0x1E4F68AC0];
  v52 = [v50 objectForKey:*MEMORY[0x1E4F68AC0]];

  if (v52)
  {
    v53 = [v10 latestResults];
    v54 = [v53 objectForKeyedSubscript:v51];
  }
  else
  {
    v54 = 0;
  }
  id v55 = v10;
  if ([v55 conformsToProtocol:&unk_1F1A2A7D0]) {
    v56 = v55;
  }
  else {
    v56 = 0;
  }
  id v57 = v56;

  if (![v54 length] && v57)
  {
    uint64_t v58 = [v57 itemTitleLocalizationKey];

    v54 = (void *)v58;
  }
  [MEMORY[0x1E4F68EE0] sendSwitchCellToggleEventForItem:v55 isOn:v4 title:v54 fromSourceViewController:self];
}

void __63__HUStatusAndNotificationsViewController_switchCell_didTurnOn___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v1 = [*(id *)(a1 + 32) item];
  v2 = [v1 services];

  uint64_t v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v11;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void *)(*((void *)&v10 + 1) + 8 * v6);
        BOOL v8 = [MEMORY[0x1E4F691A0] sharedDispatcher];
        v9[0] = MEMORY[0x1E4F143A8];
        v9[1] = 3221225472;
        v9[2] = __63__HUStatusAndNotificationsViewController_switchCell_didTurnOn___block_invoke_2;
        v9[3] = &unk_1E638C990;
        v9[4] = v7;
        [v8 dispatchAccessoryObserverMessage:v9 sender:0];

        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v4);
  }
}

void __63__HUStatusAndNotificationsViewController_switchCell_didTurnOn___block_invoke_2(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (objc_opt_respondsToSelector())
  {
    uint64_t v3 = [*(id *)(a1 + 32) accessory];
    [v4 accessory:v3 didUpdateApplicationDataForService:*(void *)(a1 + 32)];
  }
}

id __63__HUStatusAndNotificationsViewController_switchCell_didTurnOn___block_invoke_3(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) item];
  uint64_t v3 = [v2 homeKitObject];
  if ([v3 conformsToProtocol:&unk_1F1ABACC0]) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }
  id v5 = v4;

  if (v5)
  {
    uint64_t v6 = objc_msgSend(v5, "hf_updateIsVisibleInHomeStatus:", *(unsigned __int8 *)(a1 + 40));
  }
  else
  {
    uint64_t v7 = [*(id *)(a1 + 32) item];
    NSLog(&cfstr_AttemptingToTo.isa, v7);

    BOOL v8 = (void *)MEMORY[0x1E4F7A0D8];
    int64_t v9 = objc_msgSend(MEMORY[0x1E4F28C58], "hf_errorWithCode:", -1);
    uint64_t v6 = [v8 futureWithError:v9];
  }

  return v6;
}

void __63__HUStatusAndNotificationsViewController_switchCell_didTurnOn___block_invoke_4(uint64_t a1, void *a2)
{
  v2 = (void *)MEMORY[0x1E4F69110];
  id v3 = a2;
  id v4 = [v2 sharedHandler];
  [v4 handleError:v3];
}

void __63__HUStatusAndNotificationsViewController_switchCell_didTurnOn___block_invoke_5(uint64_t a1, void *a2)
{
  v2 = (void *)MEMORY[0x1E4F69110];
  id v3 = a2;
  id v4 = [v2 sharedHandler];
  [v4 handleError:v3];
}

void __63__HUStatusAndNotificationsViewController_switchCell_didTurnOn___block_invoke_6(uint64_t a1, void *a2)
{
  v2 = (void *)MEMORY[0x1E4F69110];
  id v3 = a2;
  id v4 = [v2 sharedHandler];
  [v4 handleError:v3];
}

void __63__HUStatusAndNotificationsViewController_switchCell_didTurnOn___block_invoke_7(uint64_t a1, void *a2)
{
  v2 = (void *)MEMORY[0x1E4F69110];
  id v3 = a2;
  id v4 = [v2 sharedHandler];
  [v4 handleError:v3];
}

void __63__HUStatusAndNotificationsViewController_switchCell_didTurnOn___block_invoke_8(uint64_t a1, void *a2)
{
  v2 = (void *)MEMORY[0x1E4F69110];
  id v3 = a2;
  id v4 = [v2 sharedHandler];
  [v4 handleError:v3];
}

void __63__HUStatusAndNotificationsViewController_switchCell_didTurnOn___block_invoke_9(uint64_t a1, void *a2)
{
  v2 = (void *)MEMORY[0x1E4F69110];
  id v3 = a2;
  id v4 = [v2 sharedHandler];
  [v4 handleError:v3];
}

void __63__HUStatusAndNotificationsViewController_switchCell_didTurnOn___block_invoke_10(uint64_t a1, void *a2)
{
  v2 = (void *)MEMORY[0x1E4F69110];
  id v3 = a2;
  id v4 = [v2 sharedHandler];
  [v4 handleError:v3];
}

void __63__HUStatusAndNotificationsViewController_switchCell_didTurnOn___block_invoke_11(uint64_t a1, void *a2)
{
  v2 = (void *)MEMORY[0x1E4F69110];
  id v3 = a2;
  id v4 = [v2 sharedHandler];
  [v4 handleError:v3];
}

void __63__HUStatusAndNotificationsViewController_switchCell_didTurnOn___block_invoke_12(uint64_t a1, void *a2)
{
  v2 = (void *)MEMORY[0x1E4F69110];
  id v3 = a2;
  id v4 = [v2 sharedHandler];
  [v4 handleError:v3];
}

- (void)conditionEditorModuleController:(id)a3 presentDetailViewController:(id)a4
{
  id v4 = [(UIViewController *)self hu_presentPreloadableViewController:a4 animated:1];
}

- (void)conditionEditorModuleController:(id)a3 dismissDetailViewController:(id)a4
{
}

- (void)conditionEditorModuleController:(id)a3 didUpdateConditionCollection:(id)a4
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  uint64_t v6 = [v5 conditions];
  char v7 = objc_msgSend(v6, "na_any:", &__block_literal_global_120_0);

  if (v7)
  {
    id v28 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    BOOL v8 = [v5 conditions];
    uint64_t v9 = [v8 countByEnumeratingWithState:&v29 objects:v33 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v30;
      do
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v30 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = *(void *)(*((void *)&v29 + 1) + 8 * v12);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v14 = [(HUItemTableViewController *)self itemManager];
            [v5 predicate];
            id v16 = v15 = v5;
            objc_super v17 = [v14 updateCameraSmartNotificationCondition:v16];
            id v18 = (id)[v17 addFailureBlock:&__block_literal_global_126_0];

            id v5 = v15;
          }
          else
          {
            [v28 addObject:v13];
          }
          ++v12;
        }
        while (v10 != v12);
        uint64_t v10 = [v8 countByEnumeratingWithState:&v29 objects:v33 count:16];
      }
      while (v10);
    }

    int v19 = (void *)[objc_alloc(MEMORY[0x1E4F69078]) initWithConditions:v28];
    uint64_t v20 = [(HUItemTableViewController *)self itemManager];
    objc_super v21 = [v19 predicate];
    v22 = [v20 updateNotificationCondition:v21];
    id v23 = (id)[v22 addFailureBlock:&__block_literal_global_129];
  }
  else
  {
    int v24 = [(HUItemTableViewController *)self itemManager];
    v25 = [v5 predicate];
    BOOL v26 = [v24 updateNotificationCondition:v25];
    id v27 = (id)[v26 addFailureBlock:&__block_literal_global_123_1];
  }
}

uint64_t __103__HUStatusAndNotificationsViewController_conditionEditorModuleController_didUpdateConditionCollection___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

void __103__HUStatusAndNotificationsViewController_conditionEditorModuleController_didUpdateConditionCollection___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = (void *)MEMORY[0x1E4F69110];
  id v3 = a2;
  id v4 = [v2 sharedHandler];
  [v4 handleError:v3 operationType:*MEMORY[0x1E4F68788] options:0 retryBlock:0 cancelBlock:0];
}

void __103__HUStatusAndNotificationsViewController_conditionEditorModuleController_didUpdateConditionCollection___block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = (void *)MEMORY[0x1E4F69110];
  id v3 = a2;
  id v4 = [v2 sharedHandler];
  [v4 handleError:v3 operationType:*MEMORY[0x1E4F68788] options:0 retryBlock:0 cancelBlock:0];
}

void __103__HUStatusAndNotificationsViewController_conditionEditorModuleController_didUpdateConditionCollection___block_invoke_4(uint64_t a1, void *a2)
{
  id v2 = (void *)MEMORY[0x1E4F69110];
  id v3 = a2;
  id v4 = [v2 sharedHandler];
  [v4 handleError:v3 operationType:*MEMORY[0x1E4F68788] options:0 retryBlock:0 cancelBlock:0];
}

- (void)smartNotificationSettingsModuleController:(id)a3 didUpdateConditionCollection:(id)a4
{
  id v5 = a4;
  id v9 = [(HUItemTableViewController *)self itemManager];
  uint64_t v6 = [v5 predicate];

  char v7 = [v9 updateCameraSmartNotificationCondition:v6];
  id v8 = (id)[v7 addFailureBlock:&__block_literal_global_131_0];
}

void __113__HUStatusAndNotificationsViewController_smartNotificationSettingsModuleController_didUpdateConditionCollection___block_invoke(uint64_t a1, void *a2)
{
  id v2 = (void *)MEMORY[0x1E4F69110];
  id v3 = a2;
  id v4 = [v2 sharedHandler];
  [v4 handleError:v3 operationType:*MEMORY[0x1E4F68788] options:0 retryBlock:0 cancelBlock:0];
}

- (void)_toggleSmartActivityNotificationWithAlertNotificationForCell:(id)a3 didTurnOn:(BOOL)a4
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v24 = a3;
  uint64_t v6 = [(HUStatusAndNotificationsViewController *)self item];
  char v7 = [v6 services];
  id v8 = [v7 allObjects];
  id v9 = [v8 firstObject];
  uint64_t v10 = [v9 accessory];

  objc_initWeak(&location, self);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __113__HUStatusAndNotificationsViewController__toggleSmartActivityNotificationWithAlertNotificationForCell_didTurnOn___block_invoke;
  aBlock[3] = &unk_1E6389668;
  objc_copyWeak(&v32, &location);
  BOOL v33 = a4;
  v25 = (void (**)(void))_Block_copy(aBlock);
  uint64_t v11 = [(HUItemTableViewController *)self itemManager];
  uint64_t v12 = [v11 home];

  uint64_t v13 = [v12 restrictedGuests];
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __113__HUStatusAndNotificationsViewController__toggleSmartActivityNotificationWithAlertNotificationForCell_didTurnOn___block_invoke_3;
  v28[3] = &unk_1E638E5A0;
  id v14 = v12;
  id v29 = v14;
  id v23 = v10;
  id v30 = v23;
  id v15 = objc_msgSend(v13, "na_firstObjectPassingTest:", v28);

  int v16 = 0;
  if (!a4 && v15) {
    int v16 = objc_msgSend(v14, "hf_currentUserIsAdministrator");
  }
  objc_super v17 = HFLogForCategory();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromBooleanValue();
    id v18 = (id)objc_claimAutoreleasedReturnValue();
    NSStringFromBooleanValue();
    id v19 = (id)objc_claimAutoreleasedReturnValue();
    NSStringFromBooleanValue();
    id v20 = (id)objc_claimAutoreleasedReturnValue();
    objc_super v21 = objc_msgSend(v15, "hf_prettyDescription");
    objc_msgSend(v14, "hf_currentUserIsAdministrator");
    v22 = NSStringFromBooleanValue();
    *(_DWORD *)buf = 136316930;
    int v36 = "-[HUStatusAndNotificationsViewController _toggleSmartActivityNotificationWithAlertNotificationForCell:didTurnOn:]";
    __int16 v37 = 2112;
    id v38 = v18;
    __int16 v39 = 2112;
    id v40 = v19;
    __int16 v41 = 2112;
    id v42 = v20;
    __int16 v43 = 2112;
    v44 = v21;
    __int16 v45 = 2112;
    v46 = v22;
    __int16 v47 = 2112;
    id v48 = v23;
    __int16 v49 = 2112;
    id v50 = v14;
    _os_log_impl(&dword_1BE345000, v17, OS_LOG_TYPE_DEFAULT, "(%s) shouldShowNotificationAlert = %@ because isOn = %@, isAccessoryAllowedForRG is '%@' for rg %@, isAdmin = %@, accessory = %@, home = %@", buf, 0x52u);
  }
  if (v16)
  {
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __113__HUStatusAndNotificationsViewController__toggleSmartActivityNotificationWithAlertNotificationForCell_didTurnOn___block_invoke_136;
    v26[3] = &unk_1E6386018;
    id v27 = v24;
    [(UIViewController *)self hu_presentNotificationAlertForNotificationCapableObjects:MEMORY[0x1E4F1CBF0] notificationsEnabled:0 mainActionBlock:v25 notNowActionBlock:v26];
  }
  else
  {
    v25[2]();
  }

  objc_destroyWeak(&v32);
  objc_destroyWeak(&location);
}

void __113__HUStatusAndNotificationsViewController__toggleSmartActivityNotificationWithAlertNotificationForCell_didTurnOn___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = [WeakRetained itemManager];
  id v3 = [v2 updateAllowSmartActivityNotifications:*(unsigned __int8 *)(a1 + 40)];
  id v4 = (id)[v3 addFailureBlock:&__block_literal_global_133];
}

void __113__HUStatusAndNotificationsViewController__toggleSmartActivityNotificationWithAlertNotificationForCell_didTurnOn___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = (void *)MEMORY[0x1E4F69110];
  id v3 = a2;
  id v4 = [v2 sharedHandler];
  [v4 handleError:v3];
}

uint64_t __113__HUStatusAndNotificationsViewController__toggleSmartActivityNotificationWithAlertNotificationForCell_didTurnOn___block_invoke_3(uint64_t a1, uint64_t a2)
{
  id v3 = [*(id *)(a1 + 32) homeAccessControlForUser:a2];
  id v4 = [v3 restrictedGuestAccessSettings];
  id v5 = [v4 accessAllowedToAccessories];
  uint64_t v6 = [v5 containsObject:*(void *)(a1 + 40)];

  return v6;
}

uint64_t __113__HUStatusAndNotificationsViewController__toggleSmartActivityNotificationWithAlertNotificationForCell_didTurnOn___block_invoke_136(uint64_t a1)
{
  return [*(id *)(a1 + 32) setOn:1 animated:1];
}

- (HFServiceLikeItem)item
{
  return self->_item;
}

- (void)setItem:(id)a3
{
}

- (HUTriggerConditionEditorItemModuleController)conditionModuleController
{
  return self->_conditionModuleController;
}

- (HUCameraSmartNotificationSettingsModuleController)cameraSmartSettingsModuleController
{
  return self->_cameraSmartSettingsModuleController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cameraSmartSettingsModuleController, 0);
  objc_storeStrong((id *)&self->_conditionModuleController, 0);

  objc_storeStrong((id *)&self->_item, 0);
}

@end