uint64_t TPSWiFiCallingLog()
{
  if (qword_D418 != -1) {
    dispatch_once(&qword_D418, &stru_81F8);
  }
  return qword_D410;
}

void sub_18DC(id a1)
{
  qword_D410 = (uint64_t)os_log_create("com.apple.TelephonySettings", "WiFiCalling");
}

void sub_4400(uint64_t a1)
{
  v2 = TPSWiFiCallingLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_0, v2, OS_LOG_TYPE_DEFAULT, "Not consenting to location/privacy alert.", v5, 2u);
  }

  v3 = *(void **)(a1 + 32);
  v4 = [v3 mainSwitchSpecifier];
  [v3 reloadSpecifier:v4 animated:1];
}

void sub_4494(uint64_t a1)
{
  v2 = TPSWiFiCallingLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_0, v2, OS_LOG_TYPE_DEFAULT, "Consenting to location/privacy alert.", buf, 2u);
  }

  v3 = [*(id *)(a1 + 32) emergencyAddressURLController];
  unsigned int v4 = [v3 shouldEnableCapability];

  v5 = TPSWiFiCallingLog();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (v6)
    {
      *(_WORD *)v13 = 0;
      _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "WiFi Calling service is provisioned; enabling Wi-Fi Calling.",
        v13,
        2u);
    }

    v7 = [*(id *)(a1 + 32) emergencyAddressURLController];
    [v7 enableCapability];
  }
  else
  {
    if (v6)
    {
      *(_WORD *)v12 = 0;
      _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "WiFi Calling service is not provisioned; presenting provisioning.",
        v12,
        2u);
    }

    v8 = [*(id *)(a1 + 32) callingController];
    v9 = [v8 subscriptionCapabilities];
    [v9 invalidateAndRefreshWiFiCallingProvisioningURL];

    v10 = *(void **)(a1 + 32);
    v7 = [v10 emergencyAddressURLController];
    v11 = [v7 provisionCapabilityController];
    [v10 presentOrUpdateViewController:v11];
  }
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return _NSStringFromClass(aClass);
}

uint64_t TUStringKeyForNetwork()
{
  return _TUStringKeyForNetwork();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
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

uint64_t objc_opt_isKindOfClass()
{
  return _objc_opt_isKindOfClass();
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

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return _os_log_create(subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_callingController(void *a1, const char *a2, ...)
{
  return [a1 callingController];
}

id objc_msgSend_carrierBundleController(void *a1, const char *a2, ...)
{
  return [a1 carrierBundleController];
}

id objc_msgSend_classBundle(void *a1, const char *a2, ...)
{
  return [a1 classBundle];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return [a1 defaultCenter];
}

id objc_msgSend_emergencyAddressButtonSpecifier(void *a1, const char *a2, ...)
{
  return [a1 emergencyAddressButtonSpecifier];
}

id objc_msgSend_emergencyAddressGroupSpecifier(void *a1, const char *a2, ...)
{
  return [a1 emergencyAddressGroupSpecifier];
}

id objc_msgSend_emergencyAddressURLController(void *a1, const char *a2, ...)
{
  return [a1 emergencyAddressURLController];
}

id objc_msgSend_enableCapability(void *a1, const char *a2, ...)
{
  return [a1 enableCapability];
}

id objc_msgSend_encryptedIdentityClient(void *a1, const char *a2, ...)
{
  return [a1 encryptedIdentityClient];
}

id objc_msgSend_encryptedIdentityInfo(void *a1, const char *a2, ...)
{
  return [a1 encryptedIdentityInfo];
}

id objc_msgSend_invalidateAndRefreshThumperCallingProvisioningURL(void *a1, const char *a2, ...)
{
  return [a1 invalidateAndRefreshThumperCallingProvisioningURL];
}

id objc_msgSend_invalidateAndRefreshWiFiCallingProvisioningURL(void *a1, const char *a2, ...)
{
  return [a1 invalidateAndRefreshWiFiCallingProvisioningURL];
}

id objc_msgSend_isEmergencyAddressSpecifierVisible(void *a1, const char *a2, ...)
{
  return [a1 isEmergencyAddressSpecifierVisible];
}

id objc_msgSend_isEmergencyCallingSpecifierVisible(void *a1, const char *a2, ...)
{
  return [a1 isEmergencyCallingSpecifierVisible];
}

id objc_msgSend_isRelayCallingEnabled(void *a1, const char *a2, ...)
{
  return [a1 isRelayCallingEnabled];
}

id objc_msgSend_isRunningInStoreDemoMode(void *a1, const char *a2, ...)
{
  return [a1 isRunningInStoreDemoMode];
}

id objc_msgSend_isSimHidden(void *a1, const char *a2, ...)
{
  return [a1 isSimHidden];
}

id objc_msgSend_isThumperCallingEnabled(void *a1, const char *a2, ...)
{
  return [a1 isThumperCallingEnabled];
}

id objc_msgSend_isThumperSpecifierVisible(void *a1, const char *a2, ...)
{
  return [a1 isThumperSpecifierVisible];
}

id objc_msgSend_isWiFiCallingCertified(void *a1, const char *a2, ...)
{
  return [a1 isWiFiCallingCertified];
}

id objc_msgSend_isWiFiCallingEnabled(void *a1, const char *a2, ...)
{
  return [a1 isWiFiCallingEnabled];
}

id objc_msgSend_isWiFiCallingProvisioningURLInvalid(void *a1, const char *a2, ...)
{
  return [a1 isWiFiCallingProvisioningURLInvalid];
}

id objc_msgSend_isWiFiCallingRoamingEnabled(void *a1, const char *a2, ...)
{
  return [a1 isWiFiCallingRoamingEnabled];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_localizationTableName(void *a1, const char *a2, ...)
{
  return [a1 localizationTableName];
}

id objc_msgSend_localizedCarrierName(void *a1, const char *a2, ...)
{
  return [a1 localizedCarrierName];
}

id objc_msgSend_mainGroupSpecifier(void *a1, const char *a2, ...)
{
  return [a1 mainGroupSpecifier];
}

id objc_msgSend_mainSwitchSpecifier(void *a1, const char *a2, ...)
{
  return [a1 mainSwitchSpecifier];
}

id objc_msgSend_parentListController(void *a1, const char *a2, ...)
{
  return [a1 parentListController];
}

id objc_msgSend_presentedViewController(void *a1, const char *a2, ...)
{
  return [a1 presentedViewController];
}

id objc_msgSend_privacyAlertController(void *a1, const char *a2, ...)
{
  return [a1 privacyAlertController];
}

id objc_msgSend_provisionCapabilityController(void *a1, const char *a2, ...)
{
  return [a1 provisionCapabilityController];
}

id objc_msgSend_reloadSpecifiers(void *a1, const char *a2, ...)
{
  return [a1 reloadSpecifiers];
}

id objc_msgSend_roamingGroupSpecifier(void *a1, const char *a2, ...)
{
  return [a1 roamingGroupSpecifier];
}

id objc_msgSend_roamingSwitchSpecifier(void *a1, const char *a2, ...)
{
  return [a1 roamingSwitchSpecifier];
}

id objc_msgSend_senderIdentityCapabilities(void *a1, const char *a2, ...)
{
  return [a1 senderIdentityCapabilities];
}

id objc_msgSend_senderIdentityUUID(void *a1, const char *a2, ...)
{
  return [a1 senderIdentityUUID];
}

id objc_msgSend_shouldEnableCapability(void *a1, const char *a2, ...)
{
  return [a1 shouldEnableCapability];
}

id objc_msgSend_specifier(void *a1, const char *a2, ...)
{
  return [a1 specifier];
}

id objc_msgSend_subscriptionCapabilities(void *a1, const char *a2, ...)
{
  return [a1 subscriptionCapabilities];
}

id objc_msgSend_subscriptionContext(void *a1, const char *a2, ...)
{
  return [a1 subscriptionContext];
}

id objc_msgSend_supportsEmergencyWiFiCalling(void *a1, const char *a2, ...)
{
  return [a1 supportsEmergencyWiFiCalling];
}

id objc_msgSend_supportsEncryptedIdentity(void *a1, const char *a2, ...)
{
  return [a1 supportsEncryptedIdentity];
}

id objc_msgSend_supportsThumperCalling(void *a1, const char *a2, ...)
{
  return [a1 supportsThumperCalling];
}

id objc_msgSend_supportsWiFiCalling(void *a1, const char *a2, ...)
{
  return [a1 supportsWiFiCalling];
}

id objc_msgSend_supportsWiFiCallingRoaming(void *a1, const char *a2, ...)
{
  return [a1 supportsWiFiCallingRoaming];
}

id objc_msgSend_supportsWiFiEmergencyCalling(void *a1, const char *a2, ...)
{
  return [a1 supportsWiFiEmergencyCalling];
}

id objc_msgSend_thumperCallingProvisioningStatus(void *a1, const char *a2, ...)
{
  return [a1 thumperCallingProvisioningStatus];
}

id objc_msgSend_thumperGroupSpecifier(void *a1, const char *a2, ...)
{
  return [a1 thumperGroupSpecifier];
}

id objc_msgSend_thumperProvisioningURLController(void *a1, const char *a2, ...)
{
  return [a1 thumperProvisioningURLController];
}

id objc_msgSend_thumperSwitchSpecifier(void *a1, const char *a2, ...)
{
  return [a1 thumperSwitchSpecifier];
}

id objc_msgSend_updateEmergencyAddressController(void *a1, const char *a2, ...)
{
  return [a1 updateEmergencyAddressController];
}

id objc_msgSend_uuid(void *a1, const char *a2, ...)
{
  return [a1 uuid];
}

id objc_msgSend_wiFiCallingProvisioningStatus(void *a1, const char *a2, ...)
{
  return [a1 wiFiCallingProvisioningStatus];
}

id objc_msgSend_wiFiCallingProvisioningURL(void *a1, const char *a2, ...)
{
  return [a1 wiFiCallingProvisioningURL];
}