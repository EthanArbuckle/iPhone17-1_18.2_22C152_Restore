@interface SCATCustomizeDeviceMenuController
- (BOOL)_isSiriAvailable;
- (BOOL)_isVoiceControlAvailable;
- (id)itemsFromPreferences;
- (id)originalItemsFromPreference;
- (id)titleForItem:(id)a3;
- (void)updateItemsInPreferences:(id)a3;
@end

@implementation SCATCustomizeDeviceMenuController

- (BOOL)_isSiriAvailable
{
  return _AXDeviceIsSiriAvailable(self, a2);
}

- (BOOL)_isVoiceControlAvailable
{
  return _AXDeviceIsVoiceControlAvailable(self, a2);
}

- (id)itemsFromPreferences
{
  v3 = [(SCATCustomizeDeviceMenuController *)self originalItemsFromPreference];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = __57__SCATCustomizeDeviceMenuController_itemsFromPreferences__block_invoke;
  v6[3] = &unk_20AA98;
  v6[4] = self;
  v4 = [(SCATCustomizeMenuBaseController *)self filterAndTrackMenuItemsMatchingBlock:v6 allItems:v3];

  return v4;
}

uint64_t __57__SCATCustomizeDeviceMenuController_itemsFromPreferences__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (![v3 isEqualToString:AXSSwitchControlMenuItemDeviceSiriVoiceControl])
  {
    if ([v3 isEqualToString:AXSSwitchControlMenuItemDeviceMute])
    {
      unsigned int IsSpeakScreenEnabled = [*(id *)(a1 + 32) _isMuteAvailable];
    }
    else
    {
      if ([v3 isEqualToString:AXSSwitchControlMenuItemDeviceIncreaseDecreaseZoom])
      {
        uint64_t v4 = _AXSZoomTouchEnabled() == 0;
        goto LABEL_20;
      }
      if ([v3 isEqualToString:AXSSwitchControlMenuItemDeviceSpeakScreen])
      {
        unsigned int IsSpeakScreenEnabled = UIAccessibilityIsSpeakScreenEnabled();
      }
      else if ([v3 isEqualToString:AXSSwitchControlMenuItemDeviceToggleDock])
      {
        unsigned int IsSpeakScreenEnabled = AXDeviceSupportsSideApp();
      }
      else if ([v3 isEqualToString:AXSSwitchControlMenuItemDeviceArmApplePay])
      {
        unsigned int IsSpeakScreenEnabled = AXDeviceCanArmApplePay();
      }
      else if (([v3 isEqualToString:AXSSwitchControlMenuItemCameraButton] & 1) != 0 {
             || ([v3 isEqualToString:AXSSwitchControlMenuItemCameraButtonLightPress] & 1) != 0
      }
             || [v3 isEqualToString:AXSSwitchControlMenuItemCameraButtonDoubleLightPress])
      {
        unsigned int IsSpeakScreenEnabled = AXDeviceSupportsCameraButton();
      }
      else
      {
        if (![v3 isEqualToString:AXSSwitchControlMenuItemVisualIntelligence]) {
          goto LABEL_3;
        }
        if (!AXDeviceSupportsCameraButton())
        {
          uint64_t v4 = 1;
          goto LABEL_20;
        }
        unsigned int IsSpeakScreenEnabled = AXDeviceHasGreyMatterEnabled();
      }
    }
LABEL_19:
    uint64_t v4 = IsSpeakScreenEnabled ^ 1;
    goto LABEL_20;
  }
  if (([*(id *)(a1 + 32) _isSiriAvailable] & 1) == 0)
  {
    unsigned int IsSpeakScreenEnabled = [*(id *)(a1 + 32) _isVoiceControlAvailable];
    goto LABEL_19;
  }
LABEL_3:
  uint64_t v4 = 0;
LABEL_20:

  return v4;
}

- (id)titleForItem:(id)a3
{
  id v4 = a3;
  v5 = [v4 objectForKeyedSubscript:AXSSwitchControlMenuItemTypeKey];
  if ([v5 isEqualToString:AXSSwitchControlMenuItemDeviceSiriVoiceControl])
  {
    if (![(SCATCustomizeDeviceMenuController *)self _isSiriAvailable]
      && ![(SCATCustomizeDeviceMenuController *)self _isVoiceControlAvailable])
    {
      _AXAssert();
    }
  }
  else if ([v5 isEqualToString:AXSSwitchControlMenuItemDeviceTypeToSiri])
  {
    if (![(SCATCustomizeDeviceMenuController *)self _isSiriAvailable])
    {
      v6 = 0;
      goto LABEL_18;
    }
  }
  else if (![v5 isEqualToString:AXSSwitchControlMenuItemCameraButton] {
         && ![v5 isEqualToString:AXSSwitchControlMenuItemCameraButtonLightPress]
  }
         && ![v5 isEqualToString:AXSSwitchControlMenuItemCameraButtonDoubleLightPress]
         && ![v5 isEqualToString:AXSSwitchControlMenuItemVisualIntelligence])
  {
    v9.receiver = self;
    v9.super_class = (Class)SCATCustomizeDeviceMenuController;
    uint64_t v7 = [(SCATCustomizeMenuBaseController *)&v9 titleForItem:v4];
    goto LABEL_17;
  }
  uint64_t v7 = AXParameterizedLocalizedString();
LABEL_17:
  v6 = (void *)v7;
LABEL_18:

  return v6;
}

- (void)updateItemsInPreferences:(id)a3
{
  id v4 = [(SCATCustomizeMenuBaseController *)self restorePreviouslyFilteredItemsToItems:a3];
  id v3 = +[AXSettings sharedInstance];
  [v3 setSwitchControlDeviceMenuItems:v4];
}

- (id)originalItemsFromPreference
{
  v2 = +[AXSettings sharedInstance];
  id v3 = [v2 switchControlDeviceMenuItems];

  return v3;
}

@end