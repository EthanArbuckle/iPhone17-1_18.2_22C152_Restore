uint64_t TPSCellularNetworkLog()
{
  if (qword_D110 != -1) {
    dispatch_once(&qword_D110, &stru_81B8);
  }
  return qword_D108;
}

void sub_43C4(id a1)
{
  qword_D108 = (uint64_t)os_log_create("com.apple.TelephonySettings", "CellularNetwork");
}

void sub_5A18(uint64_t a1, NSObject *a2)
{
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_0, a2, OS_LOG_TYPE_ERROR, "Could not find network item at index %ld", (uint8_t *)&v2, 0xCu);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
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

id objc_msgSend_automaticallySelectNetwork(void *a1, const char *a2, ...)
{
  return [a1 automaticallySelectNetwork];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_cellularNetworkController(void *a1, const char *a2, ...)
{
  return [a1 cellularNetworkController];
}

id objc_msgSend_classBundle(void *a1, const char *a2, ...)
{
  return [a1 classBundle];
}

id objc_msgSend_control(void *a1, const char *a2, ...)
{
  return [a1 control];
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

id objc_msgSend_emptyGroupSpecifier(void *a1, const char *a2, ...)
{
  return [a1 emptyGroupSpecifier];
}

id objc_msgSend_fetchNetworkList(void *a1, const char *a2, ...)
{
  return [a1 fetchNetworkList];
}

id objc_msgSend_hash(void *a1, const char *a2, ...)
{
  return [a1 hash];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return [a1 identifier];
}

id objc_msgSend_isNetworkSelectionEnabled(void *a1, const char *a2, ...)
{
  return [a1 isNetworkSelectionEnabled];
}

id objc_msgSend_isRunningInStoreDemoMode(void *a1, const char *a2, ...)
{
  return [a1 isRunningInStoreDemoMode];
}

id objc_msgSend_isSimHidden(void *a1, const char *a2, ...)
{
  return [a1 isSimHidden];
}

id objc_msgSend_localizationTableName(void *a1, const char *a2, ...)
{
  return [a1 localizationTableName];
}

id objc_msgSend_localizedName(void *a1, const char *a2, ...)
{
  return [a1 localizedName];
}

id objc_msgSend_mainSwitchSpecifier(void *a1, const char *a2, ...)
{
  return [a1 mainSwitchSpecifier];
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return [a1 name];
}

id objc_msgSend_networkItems(void *a1, const char *a2, ...)
{
  return [a1 networkItems];
}

id objc_msgSend_networkSelectionInfo(void *a1, const char *a2, ...)
{
  return [a1 networkSelectionInfo];
}

id objc_msgSend_networkSelectionMode(void *a1, const char *a2, ...)
{
  return [a1 networkSelectionMode];
}

id objc_msgSend_networkSpecifiers(void *a1, const char *a2, ...)
{
  return [a1 networkSpecifiers];
}

id objc_msgSend_networks(void *a1, const char *a2, ...)
{
  return [a1 networks];
}

id objc_msgSend_plmn(void *a1, const char *a2, ...)
{
  return [a1 plmn];
}

id objc_msgSend_registrationController(void *a1, const char *a2, ...)
{
  return [a1 registrationController];
}

id objc_msgSend_reloadSpecifiers(void *a1, const char *a2, ...)
{
  return [a1 reloadSpecifiers];
}

id objc_msgSend_row(void *a1, const char *a2, ...)
{
  return [a1 row];
}

id objc_msgSend_section(void *a1, const char *a2, ...)
{
  return [a1 section];
}

id objc_msgSend_selectedNetworkItem(void *a1, const char *a2, ...)
{
  return [a1 selectedNetworkItem];
}

id objc_msgSend_selection(void *a1, const char *a2, ...)
{
  return [a1 selection];
}

id objc_msgSend_selectionMode(void *a1, const char *a2, ...)
{
  return [a1 selectionMode];
}

id objc_msgSend_specifier(void *a1, const char *a2, ...)
{
  return [a1 specifier];
}

id objc_msgSend_subscriptionContext(void *a1, const char *a2, ...)
{
  return [a1 subscriptionContext];
}

id objc_msgSend_telephonyController(void *a1, const char *a2, ...)
{
  return [a1 telephonyController];
}

id objc_msgSend_updateSelectedNetworkForNetworkSelectionInfo_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateSelectedNetworkForNetworkSelectionInfo:");
}