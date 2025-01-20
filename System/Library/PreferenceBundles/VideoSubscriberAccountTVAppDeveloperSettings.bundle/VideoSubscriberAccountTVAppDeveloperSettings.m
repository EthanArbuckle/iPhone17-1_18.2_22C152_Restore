void sub_2BF4(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;
  uint64_t vars8;

  v7 = a2;
  v5 = a3;
  if (v7 && [v7 count])
  {
    v6 = [*(id *)(a1 + 32) groupedDeveloperAccounts:v7];
  }
  else
  {
    v6 = 0;
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void sub_3544(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_3560(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained setLoading:0];
    [v5 setGroupedDeveloperAccounts:v3];
    VSPerformBlockOnMainThread();
  }
}

id sub_3610(uint64_t a1)
{
  return [*(id *)(a1 + 32) reloadSpecifiers];
}

void sub_482C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_4854(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained setAccount:v3];
    VSPerformBlockOnMainThread();
  }
}

id sub_48F8(uint64_t a1)
{
  return [*(id *)(a1 + 32) reloadSpecifiers];
}

uint64_t VSPerformBlockOnMainThread()
{
  return _VSPerformBlockOnMainThread();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
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

id objc_msgSend__synchedToThisDeviceIndicator(void *a1, const char *a2, ...)
{
  return [a1 _synchedToThisDeviceIndicator];
}

id objc_msgSend_absoluteString(void *a1, const char *a2, ...)
{
  return [a1 absoluteString];
}

id objc_msgSend_account(void *a1, const char *a2, ...)
{
  return [a1 account];
}

id objc_msgSend_accountProviderIdentifier(void *a1, const char *a2, ...)
{
  return [a1 accountProviderIdentifier];
}

id objc_msgSend_accountType(void *a1, const char *a2, ...)
{
  return [a1 accountType];
}

id objc_msgSend_authenticationData(void *a1, const char *a2, ...)
{
  return [a1 authenticationData];
}

id objc_msgSend_authenticationDataString(void *a1, const char *a2, ...)
{
  return [a1 authenticationDataString];
}

id objc_msgSend_billingCycleEndDate(void *a1, const char *a2, ...)
{
  return [a1 billingCycleEndDate];
}

id objc_msgSend_billingGroupSpecifiers(void *a1, const char *a2, ...)
{
  return [a1 billingGroupSpecifiers];
}

id objc_msgSend_billingIdentifier(void *a1, const char *a2, ...)
{
  return [a1 billingIdentifier];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_created(void *a1, const char *a2, ...)
{
  return [a1 created];
}

id objc_msgSend_dateGroupSpecifiers(void *a1, const char *a2, ...)
{
  return [a1 dateGroupSpecifiers];
}

id objc_msgSend_deviceCategory(void *a1, const char *a2, ...)
{
  return [a1 deviceCategory];
}

id objc_msgSend_deviceGroupSpecifiers(void *a1, const char *a2, ...)
{
  return [a1 deviceGroupSpecifiers];
}

id objc_msgSend_deviceIdentifier(void *a1, const char *a2, ...)
{
  return [a1 deviceIdentifier];
}

id objc_msgSend_deviceName(void *a1, const char *a2, ...)
{
  return [a1 deviceName];
}

id objc_msgSend_displayName(void *a1, const char *a2, ...)
{
  return [a1 displayName];
}

id objc_msgSend_displayNameWithSynchedToThisDeviceIndicator(void *a1, const char *a2, ...)
{
  return [a1 displayNameWithSynchedToThisDeviceIndicator];
}

id objc_msgSend_facade(void *a1, const char *a2, ...)
{
  return [a1 facade];
}

id objc_msgSend_fetchAccounts(void *a1, const char *a2, ...)
{
  return [a1 fetchAccounts];
}

id objc_msgSend_fromThisDevice(void *a1, const char *a2, ...)
{
  return [a1 fromThisDevice];
}

id objc_msgSend_grayColor(void *a1, const char *a2, ...)
{
  return [a1 grayColor];
}

id objc_msgSend_groupedDeveloperAccounts(void *a1, const char *a2, ...)
{
  return [a1 groupedDeveloperAccounts];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return [a1 identifier];
}

id objc_msgSend_infoGroupSpecifiers(void *a1, const char *a2, ...)
{
  return [a1 infoGroupSpecifiers];
}

id objc_msgSend_isDeveloperCreated(void *a1, const char *a2, ...)
{
  return [a1 isDeveloperCreated];
}

id objc_msgSend_isFromCurrentDevice(void *a1, const char *a2, ...)
{
  return [a1 isFromCurrentDevice];
}

id objc_msgSend_isSignedOut(void *a1, const char *a2, ...)
{
  return [a1 isSignedOut];
}

id objc_msgSend_lastModified(void *a1, const char *a2, ...)
{
  return [a1 lastModified];
}

id objc_msgSend_lastModifiedLong(void *a1, const char *a2, ...)
{
  return [a1 lastModifiedLong];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_listItems(void *a1, const char *a2, ...)
{
  return [a1 listItems];
}

id objc_msgSend_loading(void *a1, const char *a2, ...)
{
  return [a1 loading];
}

id objc_msgSend_modified(void *a1, const char *a2, ...)
{
  return [a1 modified];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return [a1 mutableCopy];
}

id objc_msgSend_refreshGroupSpecifiers(void *a1, const char *a2, ...)
{
  return [a1 refreshGroupSpecifiers];
}

id objc_msgSend_reloadSpecifiers(void *a1, const char *a2, ...)
{
  return [a1 reloadSpecifiers];
}

id objc_msgSend_requiresSystemTrust(void *a1, const char *a2, ...)
{
  return [a1 requiresSystemTrust];
}

id objc_msgSend_secondaryTextProperties(void *a1, const char *a2, ...)
{
  return [a1 secondaryTextProperties];
}

id objc_msgSend_setNeedsUpdateConfiguration(void *a1, const char *a2, ...)
{
  return [a1 setNeedsUpdateConfiguration];
}

id objc_msgSend_sharedUserAccountManager(void *a1, const char *a2, ...)
{
  return [a1 sharedUserAccountManager];
}

id objc_msgSend_sourceIdentifier(void *a1, const char *a2, ...)
{
  return [a1 sourceIdentifier];
}

id objc_msgSend_sourceIdentifierGroupSpecifiers(void *a1, const char *a2, ...)
{
  return [a1 sourceIdentifierGroupSpecifiers];
}

id objc_msgSend_sourceType(void *a1, const char *a2, ...)
{
  return [a1 sourceType];
}

id objc_msgSend_specifier(void *a1, const char *a2, ...)
{
  return [a1 specifier];
}

id objc_msgSend_subscriptionBillingCycleEndDate(void *a1, const char *a2, ...)
{
  return [a1 subscriptionBillingCycleEndDate];
}

id objc_msgSend_subtitleCellConfiguration(void *a1, const char *a2, ...)
{
  return [a1 subtitleCellConfiguration];
}

id objc_msgSend_tierIdentifiers(void *a1, const char *a2, ...)
{
  return [a1 tierIdentifiers];
}

id objc_msgSend_tvProviderIdentifier(void *a1, const char *a2, ...)
{
  return [a1 tvProviderIdentifier];
}

id objc_msgSend_updateURL(void *a1, const char *a2, ...)
{
  return [a1 updateURL];
}

id objc_msgSend_updateURLString(void *a1, const char *a2, ...)
{
  return [a1 updateURLString];
}

id objc_msgSend_vs_localizedStringFromBool_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "vs_localizedStringFromBool:");
}