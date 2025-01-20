CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return _CFNotificationCenterGetDarwinNotifyCenter();
}

void CFNotificationCenterPostNotification(CFNotificationCenterRef center, CFNotificationName name, const void *object, CFDictionaryRef userInfo, Boolean deliverImmediately)
{
}

void CFPreferencesSetAppValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID)
{
}

Boolean CFPreferencesSynchronize(CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return _CFPreferencesSynchronize(applicationID, userName, hostName);
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
}

uint64_t UIRoundToScreenScale()
{
  return _UIRoundToScreenScale();
}

uint64_t _AKLogSystem()
{
  return __AKLogSystem();
}

NSDictionary *_NSDictionaryOfVariableBindings(NSString *commaSeparatedKeysString, id firstValue, ...)
{
  return __NSDictionaryOfVariableBindings(commaSeparatedKeysString, firstValue);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
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

void objc_enumerationMutation(id obj)
{
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return _objc_msgSendSuper2(a1, a2);
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

void objc_release(id a1)
{
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

void objc_storeStrong(id *location, id obj)
{
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

id objc_msgSend__configureCodeGenView(void *a1, const char *a2, ...)
{
  return [a1 _configureCodeGenView];
}

id objc_msgSend__configureMessageLabel(void *a1, const char *a2, ...)
{
  return [a1 _configureMessageLabel];
}

id objc_msgSend__configureTitleHeaderView(void *a1, const char *a2, ...)
{
  return [a1 _configureTitleHeaderView];
}

id objc_msgSend__defaultTraitCollection(void *a1, const char *a2, ...)
{
  return [a1 _defaultTraitCollection];
}

id objc_msgSend__invalidatePreferredContentSize(void *a1, const char *a2, ...)
{
  return [a1 _invalidatePreferredContentSize];
}

id objc_msgSend__message(void *a1, const char *a2, ...)
{
  return [a1 _message];
}

id objc_msgSend__remoteViewControllerProxy(void *a1, const char *a2, ...)
{
  return [a1 _remoteViewControllerProxy];
}

id objc_msgSend__syncStringValueToLabels(void *a1, const char *a2, ...)
{
  return [a1 _syncStringValueToLabels];
}

id objc_msgSend_activeKeyboard(void *a1, const char *a2, ...)
{
  return [a1 activeKeyboard];
}

id objc_msgSend_animation(void *a1, const char *a2, ...)
{
  return [a1 animation];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_authenticationContext(void *a1, const char *a2, ...)
{
  return [a1 authenticationContext];
}

id objc_msgSend_baselineOffset(void *a1, const char *a2, ...)
{
  return [a1 baselineOffset];
}

id objc_msgSend_becomeFirstResponder(void *a1, const char *a2, ...)
{
  return [a1 becomeFirstResponder];
}

id objc_msgSend_canBecomeFirstResponder(void *a1, const char *a2, ...)
{
  return [a1 canBecomeFirstResponder];
}

id objc_msgSend_contentContainerView(void *a1, const char *a2, ...)
{
  return [a1 contentContainerView];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_decimalDigitCharacterSet(void *a1, const char *a2, ...)
{
  return [a1 decimalDigitCharacterSet];
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return [a1 defaultCenter];
}

id objc_msgSend_descender(void *a1, const char *a2, ...)
{
  return [a1 descender];
}

id objc_msgSend_disableUpdateMask(void *a1, const char *a2, ...)
{
  return [a1 disableUpdateMask];
}

id objc_msgSend_extensionContext(void *a1, const char *a2, ...)
{
  return [a1 extensionContext];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return [a1 firstObject];
}

id objc_msgSend_generatedCode(void *a1, const char *a2, ...)
{
  return [a1 generatedCode];
}

id objc_msgSend_generatorFieldFont(void *a1, const char *a2, ...)
{
  return [a1 generatorFieldFont];
}

id objc_msgSend_inputItems(void *a1, const char *a2, ...)
{
  return [a1 inputItems];
}

id objc_msgSend_invertedSet(void *a1, const char *a2, ...)
{
  return [a1 invertedSet];
}

id objc_msgSend_isAABrandingEnabled(void *a1, const char *a2, ...)
{
  return [a1 isAABrandingEnabled];
}

id objc_msgSend_layer(void *a1, const char *a2, ...)
{
  return [a1 layer];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_mainScreen(void *a1, const char *a2, ...)
{
  return [a1 mainScreen];
}

id objc_msgSend_messageText(void *a1, const char *a2, ...)
{
  return [a1 messageText];
}

id objc_msgSend_piggybackingForTrustedDevice(void *a1, const char *a2, ...)
{
  return [a1 piggybackingForTrustedDevice];
}

id objc_msgSend_preferredContentSize(void *a1, const char *a2, ...)
{
  return [a1 preferredContentSize];
}

id objc_msgSend_removeFromSuperview(void *a1, const char *a2, ...)
{
  return [a1 removeFromSuperview];
}

id objc_msgSend_setNeedsUpdateConstraints(void *a1, const char *a2, ...)
{
  return [a1 setNeedsUpdateConstraints];
}

id objc_msgSend_sharedManager(void *a1, const char *a2, ...)
{
  return [a1 sharedManager];
}

id objc_msgSend_stringValue(void *a1, const char *a2, ...)
{
  return [a1 stringValue];
}

id objc_msgSend_titleText(void *a1, const char *a2, ...)
{
  return [a1 titleText];
}

id objc_msgSend_view(void *a1, const char *a2, ...)
{
  return [a1 view];
}