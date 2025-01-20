id textSettingsLocalizedStringForKeyAndTable(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t vars8;

  v3 = a1;
  v4 = a2;
  v5 = +[NSBundle bundleForClass:objc_opt_class()];
  v6 = v5;
  if (v5)
  {
    v7 = [v5 localizedStringForKey:v3 value:&stru_C4E0 table:v4];
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

id textSettingsLocalizedString(void *a1)
{
  return textSettingsLocalizedStringForKeyAndTable(a1, @"TextSettings");
}

id textSettingsLocalizedTinkerString(void *a1)
{
  return textSettingsLocalizedStringForKeyAndTable(a1, @"TextSettings-tinker");
}

id getActiveDevice()
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

id boldTextIsEnabledOnDevice(void *a1)
{
  id v2 = kAXSAccessibilityPreferenceDomain;
  id v3 = a1;
  id v4 = [objc_alloc((Class)NPSDomainAccessor) initWithDomain:v2 pairedDevice:v3];

  id v5 = [v4 synchronize];
  id v6 = [v4 BOOLForKey:@"EnhancedTextLegibilityEnabled"];

  return v6;
}

BOOL boldTextKeyExistsOnDevice(void *a1)
{
  id v2 = kAXSAccessibilityPreferenceDomain;
  id v3 = a1;
  id v4 = [objc_alloc((Class)NPSDomainAccessor) initWithDomain:v2 pairedDevice:v3];

  id v5 = [v4 synchronize];
  id v6 = [v4 objectForKey:@"EnhancedTextLegibilityEnabled"];
  BOOL v7 = v6 != 0;

  return v7;
}

void boldTextSetEnabledOnDevice(uint64_t a1, void *a2)
{
  id v4 = kAXSAccessibilityPreferenceDomain;
  id v5 = a2;
  id v6 = [objc_alloc((Class)NPSDomainAccessor) initWithDomain:v4 pairedDevice:v5];

  [v6 setBool:a1 forKey:@"EnhancedTextLegibilityEnabled"];
  id v7 = [v6 synchronize];
  v8 = objc_opt_new();
  CFStringRef v11 = @"EnhancedTextLegibilityEnabled";
  v9 = +[NSArray arrayWithObjects:&v11 count:1];
  v10 = +[NSSet setWithArray:v9];
  [v8 synchronizeNanoDomain:v4 keys:v10];
}

id contentSizeCategoriesOnDevice(void *a1)
{
  v8[0] = UIContentSizeCategoryExtraSmall;
  v8[1] = UIContentSizeCategorySmall;
  v8[2] = UIContentSizeCategoryLarge;
  v8[3] = UIContentSizeCategoryExtraLarge;
  v8[4] = UIContentSizeCategoryExtraExtraLarge;
  v8[5] = UIContentSizeCategoryExtraExtraExtraLarge;
  v8[6] = UIContentSizeCategoryAccessibilityMedium;
  id v1 = a1;
  id v2 = +[NSArray arrayWithObjects:v8 count:7];
  unint64_t v3 = (unint64_t)+[PBBridgeWatchAttributeController sizeFromDevice:v1];

  if (v3 <= 0x15 && ((1 << v3) & 0x386080) != 0)
  {
    v7[0] = UIContentSizeCategoryAccessibilityLarge;
    v7[1] = UIContentSizeCategoryAccessibilityExtraLarge;
    id v4 = +[NSArray arrayWithObjects:v7 count:2];
    uint64_t v5 = [v2 arrayByAddingObjectsFromArray:v4];

    id v2 = (void *)v5;
  }

  return v2;
}

NSString *_mapCompanionTextSizeToGizmoSize(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  v13[0] = UIContentSizeCategorySmall;
  v13[1] = UIContentSizeCategoryMedium;
  v13[2] = UIContentSizeCategoryLarge;
  uint64_t v5 = +[NSArray arrayWithObjects:v13 count:3];
  v12[0] = UIContentSizeCategoryAccessibilityExtraLarge;
  v12[1] = UIContentSizeCategoryAccessibilityExtraExtraLarge;
  v12[2] = UIContentSizeCategoryAccessibilityExtraExtraExtraLarge;
  id v6 = +[NSArray arrayWithObjects:v12 count:3];
  if ([v5 containsObject:v3])
  {
    id v7 = UIContentSizeCategoryLarge;
    unint64_t v8 = __ROR8__((char *)+[PBBridgeWatchAttributeController sizeFromDevice:v4]- 7, 1);
    if (v8 <= 7 && ((1 << v8) & 0xC9) != 0)
    {
      v9 = UIContentSizeCategoryExtraLarge;

      id v7 = v9;
    }
  }
  else
  {
    if ([v6 containsObject:v3]) {
      v10 = UIContentSizeCategoryAccessibilityExtraLarge;
    }
    else {
      v10 = (NSString *)v3;
    }
    id v7 = v10;
  }

  return v7;
}

id _defaultTextSize(uint64_t a1)
{
  id v1 = (char *)+[PBBridgeWatchAttributeController sizeFromDevice:a1];
  if ((unint64_t)(v1 - 1) > 0x14) {
    id v2 = (id *)&UIContentSizeCategoryLarge;
  }
  else {
    id v2 = (id *)*(&off_C358 + (void)(v1 - 1));
  }
  id v3 = *v2;

  return v3;
}

id getWatchContentSize(void *a1)
{
  id v1 = a1;
  id v2 = [objc_alloc((Class)NPSDomainAccessor) initWithDomain:@"com.apple.UIKit" pairedDevice:v1];

  id v3 = [v2 synchronize];
  id v4 = [v2 objectForKey:@"UIPreferredContentSizeCategoryName"];

  return v4;
}

id contentSizeCategoryOnDevice(void *a1)
{
  char v3 = 0;
  id v1 = contentSizeCategoryOnDeviceOrCompanion(a1, &v3);

  return v1;
}

id contentSizeCategoryOnDeviceOrCompanion(void *a1, unsigned char *a2)
{
  id v3 = a1;
  id v4 = (void *)_AXSCopyPreferredContentSizeCategoryNameGlobal();
  uint64_t v5 = v4;
  if (!v4)
  {
LABEL_5:
    v9 = getWatchContentSize(v3);
    v10 = contentSizeCategoriesOnDevice(v3);
    id v11 = [v10 indexOfObject:v9];

    v12 = _defaultTextSize((uint64_t)v3);
    v13 = contentSizeCategoriesOnDevice(v3);
    id v14 = [v13 indexOfObject:v12];

    if ((uint64_t)v11 < (uint64_t)v14 || v9 == 0) {
      v16 = v12;
    }
    else {
      v16 = v9;
    }
    id v6 = v16;

    goto LABEL_12;
  }
  _mapCompanionTextSizeToGizmoSize(v4, v3);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  id v7 = contentSizeCategoriesOnDevice(v3);
  unsigned int v8 = [v7 containsObject:v6];

  if (!v8)
  {

    goto LABEL_5;
  }
  *a2 = 1;
LABEL_12:

  return v6;
}

id contentSizeCategoryOnDeviceForValue(void *a1, uint64_t a2)
{
  id v3 = contentSizeCategoriesOnDevice(a1);
  id v4 = [v3 objectAtIndex:a2];

  return v4;
}

id contentSizeValueOnDevice(void *a1)
{
  id v1 = a1;
  id v2 = contentSizeCategoryOnDevice(v1);
  id v3 = contentSizeCategoriesOnDevice(v1);

  id v4 = [v3 indexOfObject:v2];
  return v4;
}

void contentSizeSetValueOnDevice(uint64_t a1, void *a2)
{
  id v3 = a2;
  contentSizeCategoryOnDeviceForValue(v3, a1);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  id v4 = [objc_alloc((Class)NPSDomainAccessor) initWithDomain:@"com.apple.UIKit" pairedDevice:v3];

  [v4 setObject:v8 forKey:@"UIPreferredContentSizeCategoryName"];
  id v5 = [v4 synchronize];
  id v6 = objc_opt_new();
  id v7 = +[NSSet setWithObject:@"UIPreferredContentSizeCategoryName"];
  [v6 synchronizeNanoDomain:@"com.apple.UIKit" keys:v7];
}

id cachedTextPreviewImage(void *a1, uint64_t a2)
{
  id v3 = a1;
  id v4 = [(id)__cachedTextPreviewImages objectForKeyedSubscript:v3];
  id v5 = +[NSNumber numberWithBool:a2];
  id v6 = [v4 objectForKeyedSubscript:v5];

  v13[0] = UIContentSizeCategoryAccessibilityMedium;
  v13[1] = UIContentSizeCategoryAccessibilityLarge;
  v13[2] = UIContentSizeCategoryAccessibilityExtraLarge;
  id v7 = +[NSArray arrayWithObjects:v13 count:3];
  id v8 = v7;
  if (v6 || ![v7 containsObject:v3])
  {
    id v11 = v6;
  }
  else
  {
    v9 = [(id)__cachedTextPreviewImages objectForKeyedSubscript:UIContentSizeCategoryExtraExtraExtraLarge];
    v10 = +[NSNumber numberWithBool:a2];
    id v11 = [v9 objectForKeyedSubscript:v10];
  }

  return v11;
}

void cacheTextPreviewImage(void *a1, void *a2, uint64_t a3)
{
  id v13 = a1;
  id v5 = a2;
  id v6 = (void *)__cachedTextPreviewImages;
  if (!__cachedTextPreviewImages)
  {
    uint64_t v7 = +[NSMutableDictionary dictionary];
    id v8 = (void *)__cachedTextPreviewImages;
    __cachedTextPreviewImages = v7;

    id v6 = (void *)__cachedTextPreviewImages;
  }
  v9 = [v6 objectForKeyedSubscript:v5];

  if (!v9)
  {
    v10 = +[NSMutableDictionary dictionary];
    [(id)__cachedTextPreviewImages setObject:v10 forKeyedSubscript:v5];
  }
  id v11 = [(id)__cachedTextPreviewImages objectForKeyedSubscript:v5];
  v12 = +[NSNumber numberWithBool:a3];
  [v11 setObject:v13 forKeyedSubscript:v12];
}

void sub_64DC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t AXPerformBlockOnMainThread()
{
  return _AXPerformBlockOnMainThread();
}

uint64_t BPSFontWithSize()
{
  return _BPSFontWithSize();
}

uint64_t BPSSeparatorColor()
{
  return _BPSSeparatorColor();
}

uint64_t BPSTextColor()
{
  return _BPSTextColor();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return _NSStringFromClass(aClass);
}

uint64_t _AXSCopyPreferredContentSizeCategoryNameGlobal()
{
  return __AXSCopyPreferredContentSizeCategoryNameGlobal();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint64_t _os_feature_enabled_impl()
{
  return __os_feature_enabled_impl();
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return _dispatch_queue_attr_make_with_qos_class(attr, qos_class, relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
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

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_enumerationMutation(id obj)
{
}

id objc_initWeak(id *location, id val)
{
  return _objc_initWeak(location, val);
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

uint64_t objc_opt_isKindOfClass()
{
  return _objc_opt_isKindOfClass();
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

id objc_msgSend_cancel(void *a1, const char *a2, ...)
{
  return [a1 cancel];
}

id objc_msgSend_cellReuseIdentifier(void *a1, const char *a2, ...)
{
  return [a1 cellReuseIdentifier];
}

id objc_msgSend_clearColor(void *a1, const char *a2, ...)
{
  return [a1 clearColor];
}

id objc_msgSend_contentSize(void *a1, const char *a2, ...)
{
  return [a1 contentSize];
}

id objc_msgSend_contentView(void *a1, const char *a2, ...)
{
  return [a1 contentView];
}

id objc_msgSend_controllerHoldTimeoutTimer(void *a1, const char *a2, ...)
{
  return [a1 controllerHoldTimeoutTimer];
}

id objc_msgSend_controllerIsOnHold(void *a1, const char *a2, ...)
{
  return [a1 controllerIsOnHold];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_defaultContentSizeValue(void *a1, const char *a2, ...)
{
  return [a1 defaultContentSizeValue];
}

id objc_msgSend_defaultTextSizeLabel(void *a1, const char *a2, ...)
{
  return [a1 defaultTextSizeLabel];
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

id objc_msgSend_idsServicesQueue(void *a1, const char *a2, ...)
{
  return [a1 idsServicesQueue];
}

id objc_msgSend_invalidateIntrinsicContentSize(void *a1, const char *a2, ...)
{
  return [a1 invalidateIntrinsicContentSize];
}

id objc_msgSend_isOn(void *a1, const char *a2, ...)
{
  return [a1 isOn];
}

id objc_msgSend_isViewLoaded(void *a1, const char *a2, ...)
{
  return [a1 isViewLoaded];
}

id objc_msgSend_layoutIfNeeded(void *a1, const char *a2, ...)
{
  return [a1 layoutIfNeeded];
}

id objc_msgSend_leadingAnchor(void *a1, const char *a2, ...)
{
  return [a1 leadingAnchor];
}

id objc_msgSend_mainScreen(void *a1, const char *a2, ...)
{
  return [a1 mainScreen];
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

id objc_msgSend_observer(void *a1, const char *a2, ...)
{
  return [a1 observer];
}

id objc_msgSend_readableContentGuide(void *a1, const char *a2, ...)
{
  return [a1 readableContentGuide];
}

id objc_msgSend_receivedCachedScreenshots(void *a1, const char *a2, ...)
{
  return [a1 receivedCachedScreenshots];
}

id objc_msgSend_reloadData(void *a1, const char *a2, ...)
{
  return [a1 reloadData];
}

id objc_msgSend_row(void *a1, const char *a2, ...)
{
  return [a1 row];
}

id objc_msgSend_scale(void *a1, const char *a2, ...)
{
  return [a1 scale];
}

id objc_msgSend_selectedBoldTextEnabled(void *a1, const char *a2, ...)
{
  return [a1 selectedBoldTextEnabled];
}

id objc_msgSend_selectedContentSizeValue(void *a1, const char *a2, ...)
{
  return [a1 selectedContentSizeValue];
}

id objc_msgSend_setNeedsDisplay(void *a1, const char *a2, ...)
{
  return [a1 setNeedsDisplay];
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

id objc_msgSend_textLabel(void *a1, const char *a2, ...)
{
  return [a1 textLabel];
}

id objc_msgSend_textPreviewIllustratedWatchView(void *a1, const char *a2, ...)
{
  return [a1 textPreviewIllustratedWatchView];
}

id objc_msgSend_textPreviewWatchView(void *a1, const char *a2, ...)
{
  return [a1 textPreviewWatchView];
}

id objc_msgSend_textSettingsViewController(void *a1, const char *a2, ...)
{
  return [a1 textSettingsViewController];
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

id objc_msgSend_value(void *a1, const char *a2, ...)
{
  return [a1 value];
}

id objc_msgSend_watchScreenImageView(void *a1, const char *a2, ...)
{
  return [a1 watchScreenImageView];
}

id objc_msgSend_watchScreenInsetGuide(void *a1, const char *a2, ...)
{
  return [a1 watchScreenInsetGuide];
}

id objc_msgSend_watchScreenSizeForDeviceSize_screenScale_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "watchScreenSizeForDeviceSize:screenScale:");
}