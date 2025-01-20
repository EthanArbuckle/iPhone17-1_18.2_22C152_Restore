BOOL accessibilitySetupOptionIsActive(uint64_t a1)
{
  int v1;
  BOOL v2;
  void *v3;
  id v4;

  switch(a1)
  {
    case 0:
      v1 = _AXSVoiceOverTouchEnabled();
      goto LABEL_10;
    case 1:
      v1 = _AXSZoomTouchEnabled();
      goto LABEL_10;
    case 2:
      v3 = accessibilityGetActiveDevice();
      v4 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"D7B1DB8F-6F20-44A7-B454-95B8A418D208"];
      if ([v3 supportsCapability:v4]) {
        v2 = _AXSAssistiveTouchEnabled() != 0;
      }
      else {
        v2 = 0;
      }

      return v2;
    case 3:
      v1 = _AXSEnhanceBackgroundContrastEnabled();
      goto LABEL_10;
    case 4:
      v1 = _AXSReduceMotionEnabled();
      goto LABEL_10;
    case 5:
      v1 = _AXDarkenSystemColorsGlobal();
LABEL_10:
      v2 = v1 != 0;
      break;
    default:
      v2 = 0;
      break;
  }
  return v2;
}

id accessibilityGetActiveDevice()
{
  v0 = +[NRPairedDeviceRegistry sharedInstance];
  v1 = +[NRPairedDeviceRegistry activeDeviceSelectorBlock];
  v2 = [v0 getAllDevicesWithArchivedAltAccountDevicesMatching:v1];
  v3 = [v2 firstObject];

  v4 = [v3 valueForProperty:NRDevicePropertyIsArchived];
  if ([v4 BOOLValue]) {
    v5 = 0;
  }
  else {
    v5 = v3;
  }
  id v6 = v5;

  return v6;
}

__CFString *accessibilityDomainKeyForSetupOption(uint64_t a1)
{
  switch(a1)
  {
    case 0:
      v2 = @"VoiceOverTouchEnabled";
      break;
    case 1:
      v2 = @"ZoomTouchEnabled";
      break;
    case 2:
      v2 = (__CFString *)kAXSWatchControlEnabledPreference;
      break;
    case 3:
      v2 = @"EnhancedBackgroundContrastEnabled";
      break;
    case 4:
      v2 = @"ReduceMotionEnabled";
      break;
    case 5:
      v2 = @"DarkenSystemColors";
      break;
    default:
      v2 = 0;
      break;
  }
  return v2;
}

id accessibilityActiveAccessibilityFeaturesOnCompanion()
{
  v0 = +[NSMutableArray arrayWithCapacity:6];
  for (uint64_t i = 0; i != 6; ++i)
  {
    if (accessibilitySetupOptionIsActive(i))
    {
      v2 = +[NSNumber numberWithUnsignedInteger:i];
      [v0 addObject:v2];
    }
  }

  return v0;
}

id accessibilityLocalizedString(void *a1)
{
  id v1 = a1;
  v2 = +[NSBundle bundleForClass:objc_opt_class()];
  v3 = v2;
  if (v2)
  {
    v4 = [v2 localizedStringForKey:v1 value:&stru_82A0 table:@"Accessibility"];
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

id accessibilityLocalizedStringForSetupOption(unint64_t a1)
{
  if (a1 > 5)
  {
    v2 = 0;
  }
  else
  {
    v2 = accessibilityLocalizedString(*(&off_8220 + a1));
  }
  return v2;
}

id accessibilityLocalizedDescriptionForSetupOption(unint64_t a1)
{
  if (a1 > 5)
  {
    v2 = 0;
  }
  else
  {
    v2 = accessibilityLocalizedString(*(&off_8250 + a1));
  }
  return v2;
}

void accessibilitySetAccessibilityOptionsOnDevice(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  id v5 = [v3 count];
  if (v4 && v5)
  {
    id v19 = kAXSAccessibilityPreferenceDomain;
    id v6 = [objc_alloc((Class)NPSDomainAccessor) initWithDomain:v19 pairedDevice:v4];
    v7 = +[NSMutableSet set];
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v20 = v3;
    id v8 = v3;
    id v9 = [v8 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v22;
      do
      {
        for (uint64_t i = 0; i != v10; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v22 != v11) {
            objc_enumerationMutation(v8);
          }
          v13 = *(void **)(*((void *)&v21 + 1) + 8 * i);
          v14 = accessibilityDomainKeyForSetupOption((uint64_t)[v13 unsignedIntegerValue]);
          if (v14)
          {
            v15 = [v8 objectForKeyedSubscript:v13];
            id v16 = [v15 BOOLValue];

            [v6 setBool:v16 forKey:v14];
            [v7 addObject:v14];
          }
        }
        id v10 = [v8 countByEnumeratingWithState:&v21 objects:v25 count:16];
      }
      while (v10);
    }

    id v17 = [v6 synchronize];
    v18 = objc_opt_new();
    [v18 synchronizeNanoDomain:v19 keys:v7];

    id v3 = v20;
  }
}

uint64_t BPSSeparatorColor()
{
  return _BPSSeparatorColor();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return _NSStringFromClass(aClass);
}

uint64_t _AXDarkenSystemColorsGlobal()
{
  return __AXDarkenSystemColorsGlobal();
}

uint64_t _AXSAssistiveTouchEnabled()
{
  return __AXSAssistiveTouchEnabled();
}

uint64_t _AXSEnhanceBackgroundContrastEnabled()
{
  return __AXSEnhanceBackgroundContrastEnabled();
}

uint64_t _AXSReduceMotionEnabled()
{
  return __AXSReduceMotionEnabled();
}

uint64_t _AXSVoiceOverTouchEnabled()
{
  return __AXSVoiceOverTouchEnabled();
}

uint64_t _AXSZoomTouchEnabled()
{
  return __AXSZoomTouchEnabled();
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

void objc_destroyWeak(id *location)
{
}

void objc_enumerationMutation(id obj)
{
}

id objc_loadWeakRetained(id *location)
{
  return _objc_loadWeakRetained(location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return _objc_msgSendSuper2(a1, a2);
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

uint64_t objc_opt_new()
{
  return _objc_opt_new();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return _objc_storeWeak(location, obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return _objc_unsafeClaimAutoreleasedReturnValue(a1);
}

id objc_msgSend_accessibilityOptions(void *a1, const char *a2, ...)
{
  return [a1 accessibilityOptions];
}

id objc_msgSend_accessibilitySettingsViewController(void *a1, const char *a2, ...)
{
  return [a1 accessibilitySettingsViewController];
}

id objc_msgSend_activeDeviceSelectorBlock(void *a1, const char *a2, ...)
{
  return [a1 activeDeviceSelectorBlock];
}

id objc_msgSend_activePairingDevice(void *a1, const char *a2, ...)
{
  return [a1 activePairingDevice];
}

id objc_msgSend_alternateChoiceButton(void *a1, const char *a2, ...)
{
  return [a1 alternateChoiceButton];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_bottomAnchor(void *a1, const char *a2, ...)
{
  return [a1 bottomAnchor];
}

id objc_msgSend_bounds(void *a1, const char *a2, ...)
{
  return [a1 bounds];
}

id objc_msgSend_contentSize(void *a1, const char *a2, ...)
{
  return [a1 contentSize];
}

id objc_msgSend_contentView(void *a1, const char *a2, ...)
{
  return [a1 contentView];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_customizedAccessibilityOptions(void *a1, const char *a2, ...)
{
  return [a1 customizedAccessibilityOptions];
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return [a1 delegate];
}

id objc_msgSend_device(void *a1, const char *a2, ...)
{
  return [a1 device];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return [a1 dictionary];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return [a1 firstObject];
}

id objc_msgSend_headerView(void *a1, const char *a2, ...)
{
  return [a1 headerView];
}

id objc_msgSend_indexPathForSelectedRow(void *a1, const char *a2, ...)
{
  return [a1 indexPathForSelectedRow];
}

id objc_msgSend_invalidateIntrinsicContentSize(void *a1, const char *a2, ...)
{
  return [a1 invalidateIntrinsicContentSize];
}

id objc_msgSend_isOn(void *a1, const char *a2, ...)
{
  return [a1 isOn];
}

id objc_msgSend_layoutIfNeeded(void *a1, const char *a2, ...)
{
  return [a1 layoutIfNeeded];
}

id objc_msgSend_leadingAnchor(void *a1, const char *a2, ...)
{
  return [a1 leadingAnchor];
}

id objc_msgSend_maximumValue(void *a1, const char *a2, ...)
{
  return [a1 maximumValue];
}

id objc_msgSend_maximumValueImage(void *a1, const char *a2, ...)
{
  return [a1 maximumValueImage];
}

id objc_msgSend_miniFlowDelegate(void *a1, const char *a2, ...)
{
  return [a1 miniFlowDelegate];
}

id objc_msgSend_minimumValue(void *a1, const char *a2, ...)
{
  return [a1 minimumValue];
}

id objc_msgSend_minimumValueImage(void *a1, const char *a2, ...)
{
  return [a1 minimumValueImage];
}

id objc_msgSend_readableContentGuide(void *a1, const char *a2, ...)
{
  return [a1 readableContentGuide];
}

id objc_msgSend_reloadData(void *a1, const char *a2, ...)
{
  return [a1 reloadData];
}

id objc_msgSend_section(void *a1, const char *a2, ...)
{
  return [a1 section];
}

id objc_msgSend_set(void *a1, const char *a2, ...)
{
  return [a1 set];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_slider(void *a1, const char *a2, ...)
{
  return [a1 slider];
}

id objc_msgSend_synchronize(void *a1, const char *a2, ...)
{
  return [a1 synchronize];
}

id objc_msgSend_tableView(void *a1, const char *a2, ...)
{
  return [a1 tableView];
}

id objc_msgSend_tag(void *a1, const char *a2, ...)
{
  return [a1 tag];
}

id objc_msgSend_textLabel(void *a1, const char *a2, ...)
{
  return [a1 textLabel];
}

id objc_msgSend_titleLabel(void *a1, const char *a2, ...)
{
  return [a1 titleLabel];
}

id objc_msgSend_topAnchor(void *a1, const char *a2, ...)
{
  return [a1 topAnchor];
}

id objc_msgSend_trailingAnchor(void *a1, const char *a2, ...)
{
  return [a1 trailingAnchor];
}

id objc_msgSend_unsignedIntegerValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedIntegerValue];
}

id objc_msgSend_value(void *a1, const char *a2, ...)
{
  return [a1 value];
}

id objc_msgSend_valueForProperty_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "valueForProperty:");
}