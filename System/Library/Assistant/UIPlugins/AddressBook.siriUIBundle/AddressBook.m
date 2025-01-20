id sub_4C58(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v3 = [a2 label];
  v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

void sub_69D8(id a1, BOOL a2)
{
  if (!a2) {
    NSLog(@"Failed to open the contact");
  }
}

void sub_7064(void *a1)
{
  v1 = [a1 object];
  int v3 = 138412290;
  id v4 = (id)objc_opt_class();
  id v2 = v4;
  _os_log_error_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Cannot disambiguate %@", (uint8_t *)&v3, 0xCu);
}

void sub_710C(uint64_t a1)
{
  int v1 = 138412290;
  uint64_t v2 = a1;
  _os_log_error_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Failed to fetch unified me card, error = %@", (uint8_t *)&v1, 0xCu);
}

void sub_718C(uint64_t a1, uint64_t a2)
{
  int v2 = 138412546;
  uint64_t v3 = a1;
  __int16 v4 = 2112;
  uint64_t v5 = a2;
  _os_log_error_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Failed to fetch unified contact with identifier = %@, error = %@", (uint8_t *)&v2, 0x16u);
}

void sub_7218()
{
  *(_WORD *)v0 = 0;
  _os_log_error_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "SAABPersonSnippet's first person doesn't have an identifier", v0, 2u);
}

void sub_7260()
{
  *(_WORD *)v0 = 0;
  _os_log_error_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "SAABPersonSnippet doesn't contain any persons", v0, 2u);
}

void sub_72A8()
{
  *(_WORD *)v0 = 0;
  _os_log_error_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "SAUISnippet is not an SAABPersonSnippet object", v0, 2u);
}

void CFRelease(CFTypeRef cf)
{
}

uint64_t CNUISetUseSiriLocalization()
{
  return _CNUISetUseSiriLocalization();
}

uint64_t MGCopyAnswer()
{
  return _MGCopyAnswer();
}

uint64_t MGGetSInt32Answer()
{
  return _MGGetSInt32Answer();
}

void NSLog(NSString *format, ...)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
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

id objc_autorelease(id a1)
{
  return _objc_autorelease(a1);
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

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return _objc_storeWeak(location, obj);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

id objc_msgSend__deviceIsLockedWithPassword(void *a1, const char *a2, ...)
{
  return [a1 _deviceIsLockedWithPassword];
}

id objc_msgSend__displayIdentifier(void *a1, const char *a2, ...)
{
  return [a1 _displayIdentifier];
}

id objc_msgSend__preventMoreSelections(void *a1, const char *a2, ...)
{
  return [a1 _preventMoreSelections];
}

id objc_msgSend_avatarView(void *a1, const char *a2, ...)
{
  return [a1 avatarView];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_bounds(void *a1, const char *a2, ...)
{
  return [a1 bounds];
}

id objc_msgSend_city(void *a1, const char *a2, ...)
{
  return [a1 city];
}

id objc_msgSend_clearColor(void *a1, const char *a2, ...)
{
  return [a1 clearColor];
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return [a1 code];
}

id objc_msgSend_company(void *a1, const char *a2, ...)
{
  return [a1 company];
}

id objc_msgSend_configureForExpanded(void *a1, const char *a2, ...)
{
  return [a1 configureForExpanded];
}

id objc_msgSend_contact(void *a1, const char *a2, ...)
{
  return [a1 contact];
}

id objc_msgSend_contactFormatter(void *a1, const char *a2, ...)
{
  return [a1 contactFormatter];
}

id objc_msgSend_contactIdentifier(void *a1, const char *a2, ...)
{
  return [a1 contactIdentifier];
}

id objc_msgSend_contactPropertiesByKey(void *a1, const char *a2, ...)
{
  return [a1 contactPropertiesByKey];
}

id objc_msgSend_contactStore(void *a1, const char *a2, ...)
{
  return [a1 contactStore];
}

id objc_msgSend_contactView(void *a1, const char *a2, ...)
{
  return [a1 contactView];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_countryCode(void *a1, const char *a2, ...)
{
  return [a1 countryCode];
}

id objc_msgSend_currentDevice(void *a1, const char *a2, ...)
{
  return [a1 currentDevice];
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return [a1 delegate];
}

id objc_msgSend_descriptorForRequiredKeys(void *a1, const char *a2, ...)
{
  return [a1 descriptorForRequiredKeys];
}

id objc_msgSend_disablePhotoTapGesture(void *a1, const char *a2, ...)
{
  return [a1 disablePhotoTapGesture];
}

id objc_msgSend_disambiguationItem(void *a1, const char *a2, ...)
{
  return [a1 disambiguationItem];
}

id objc_msgSend_displayHeaderView(void *a1, const char *a2, ...)
{
  return [a1 displayHeaderView];
}

id objc_msgSend_displayProperties(void *a1, const char *a2, ...)
{
  return [a1 displayProperties];
}

id objc_msgSend_displayedProperties(void *a1, const char *a2, ...)
{
  return [a1 displayedProperties];
}

id objc_msgSend_emailAddress(void *a1, const char *a2, ...)
{
  return [a1 emailAddress];
}

id objc_msgSend_emails(void *a1, const char *a2, ...)
{
  return [a1 emails];
}

id objc_msgSend_enableDragAndDrop(void *a1, const char *a2, ...)
{
  return [a1 enableDragAndDrop];
}

id objc_msgSend_favoriteFacetime(void *a1, const char *a2, ...)
{
  return [a1 favoriteFacetime];
}

id objc_msgSend_favoriteFacetimeAudio(void *a1, const char *a2, ...)
{
  return [a1 favoriteFacetimeAudio];
}

id objc_msgSend_favoriteVoice(void *a1, const char *a2, ...)
{
  return [a1 favoriteVoice];
}

id objc_msgSend_favorites(void *a1, const char *a2, ...)
{
  return [a1 favorites];
}

id objc_msgSend_firstName(void *a1, const char *a2, ...)
{
  return [a1 firstName];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return [a1 firstObject];
}

id objc_msgSend_formattedStringValue(void *a1, const char *a2, ...)
{
  return [a1 formattedStringValue];
}

id objc_msgSend_iOSLegacyIdentifier(void *a1, const char *a2, ...)
{
  return [a1 iOSLegacyIdentifier];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return [a1 identifier];
}

id objc_msgSend_label(void *a1, const char *a2, ...)
{
  return [a1 label];
}

id objc_msgSend_labeledValues(void *a1, const char *a2, ...)
{
  return [a1 labeledValues];
}

id objc_msgSend_lastName(void *a1, const char *a2, ...)
{
  return [a1 lastName];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_lowercaseString(void *a1, const char *a2, ...)
{
  return [a1 lowercaseString];
}

id objc_msgSend_me(void *a1, const char *a2, ...)
{
  return [a1 me];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return [a1 mutableCopy];
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return [a1 name];
}

id objc_msgSend_nickName(void *a1, const char *a2, ...)
{
  return [a1 nickName];
}

id objc_msgSend_note(void *a1, const char *a2, ...)
{
  return [a1 note];
}

id objc_msgSend_number(void *a1, const char *a2, ...)
{
  return [a1 number];
}

id objc_msgSend_object(void *a1, const char *a2, ...)
{
  return [a1 object];
}

id objc_msgSend_persons(void *a1, const char *a2, ...)
{
  return [a1 persons];
}

id objc_msgSend_phones(void *a1, const char *a2, ...)
{
  return [a1 phones];
}

id objc_msgSend_photoView(void *a1, const char *a2, ...)
{
  return [a1 photoView];
}

id objc_msgSend_propertyKey(void *a1, const char *a2, ...)
{
  return [a1 propertyKey];
}

id objc_msgSend_removeFromSuperview(void *a1, const char *a2, ...)
{
  return [a1 removeFromSuperview];
}

id objc_msgSend_sharedPreferences(void *a1, const char *a2, ...)
{
  return [a1 sharedPreferences];
}

id objc_msgSend_siriStyle(void *a1, const char *a2, ...)
{
  return [a1 siriStyle];
}

id objc_msgSend_siriTintColor(void *a1, const char *a2, ...)
{
  return [a1 siriTintColor];
}

id objc_msgSend_snippetView(void *a1, const char *a2, ...)
{
  return [a1 snippetView];
}

id objc_msgSend_stateCode(void *a1, const char *a2, ...)
{
  return [a1 stateCode];
}

id objc_msgSend_street(void *a1, const char *a2, ...)
{
  return [a1 street];
}

id objc_msgSend_subAdministrativeArea(void *a1, const char *a2, ...)
{
  return [a1 subAdministrativeArea];
}

id objc_msgSend_subLocality(void *a1, const char *a2, ...)
{
  return [a1 subLocality];
}

id objc_msgSend_subviews(void *a1, const char *a2, ...)
{
  return [a1 subviews];
}

id objc_msgSend_userInterfaceIdiom(void *a1, const char *a2, ...)
{
  return [a1 userInterfaceIdiom];
}

id objc_msgSend_value(void *a1, const char *a2, ...)
{
  return [a1 value];
}

id objc_msgSend_valueTextAttributes(void *a1, const char *a2, ...)
{
  return [a1 valueTextAttributes];
}

id objc_msgSend_view(void *a1, const char *a2, ...)
{
  return [a1 view];
}

id objc_msgSend_viewsForCardSections_feedbackListener_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "viewsForCardSections:feedbackListener:");
}