id _voicemailCheckQueue()
{
  void *v0;
  uint64_t vars8;

  if (qword_CE50 != -1) {
    dispatch_once(&qword_CE50, &stru_82F8);
  }
  v0 = (void *)qword_CE48;

  return v0;
}

void sub_293C(id a1)
{
  v3 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
  dispatch_queue_t v1 = dispatch_queue_create("com.apple.mobilephone.PHVoicemailUtilities.voicemailCheck", v3);
  v2 = (void *)qword_CE48;
  qword_CE48 = (uint64_t)v1;
}

uint64_t PHHasEnhancedVoicemail()
{
  return 0;
}

uint64_t PHHasEnhancedVoicemailAsync(uint64_t result)
{
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

uint64_t _voicemailShouldBeHidden()
{
  return 1;
}

uint64_t PHShouldHideVoicemailUI()
{
  return 1;
}

uint64_t PHShouldOptimisticallyHideVoicemailUI()
{
  return 1;
}

id PHDefaultLog()
{
  if (qword_CE60 != -1) {
    dispatch_once(&qword_CE60, &stru_8318);
  }
  v0 = (void *)qword_CE58;

  return v0;
}

void sub_2A34(id a1)
{
  qword_CE58 = (uint64_t)os_log_create("com.apple.calls.mobilephone", "Default");

  _objc_release_x1();
}

id PHOversizedLog()
{
  if (qword_CE70 != -1) {
    dispatch_once(&qword_CE70, &stru_8338);
  }
  v0 = (void *)qword_CE68;

  return v0;
}

void sub_2ACC(id a1)
{
  qword_CE68 = (uint64_t)os_log_create("com.apple.calls.mobilephone", "Oversized");

  _objc_release_x1();
}

id PHOversizedLogQueue()
{
  if (qword_CE80 != -1) {
    dispatch_once(&qword_CE80, &stru_8358);
  }
  v0 = (void *)qword_CE78;

  return v0;
}

void sub_2B64(id a1)
{
  v3 = dispatch_queue_attr_make_with_qos_class(0, (dispatch_qos_class_t)0xFFFFFFFE, 0);
  dispatch_queue_t v1 = dispatch_queue_create("com.apple.calls.mobilephone.logging", v3);
  v2 = (void *)qword_CE78;
  qword_CE78 = (uint64_t)v1;
}

void sub_3ABC(uint64_t a1, void *a2)
{
  id v3 = a2;
  unsigned int v4 = [v3 type];
  if (!v4)
  {
    v19 = [v3 phoneNumber];
    v20 = [v19 unformattedInternationalRepresentation];
    v21 = v20;
    if (v20)
    {
      id v5 = v20;
    }
    else
    {
      v26 = [v3 phoneNumber];
      id v5 = [v26 digits];
    }
    uint64_t v6 = 2;
    if (v5) {
      goto LABEL_5;
    }
    goto LABEL_22;
  }
  if (v4 == 2)
  {
    id v5 = [v3 businessID];
    uint64_t v6 = 1;
    if (v5) {
      goto LABEL_5;
    }
LABEL_22:
    v18 = 0;
    goto LABEL_23;
  }
  if (v4 != 1)
  {
    v18 = 0;
    id v5 = 0;
    goto LABEL_23;
  }
  id v5 = [v3 email];
  uint64_t v6 = 3;
  if (!v5) {
    goto LABEL_22;
  }
LABEL_5:
  id v7 = objc_alloc((Class)TUContactsDataProviderFetchRequest);
  id v8 = [objc_alloc((Class)TUHandle) initWithType:v6 value:v5];
  id v9 = [v7 initWithHandle:v8];

  v10 = [*(id *)(a1 + 32) contactsDataProvider];
  v11 = [v10 executeFetchRequest:v9];

  v12 = [v11 contacts];
  v13 = [v12 firstObject];

  if (v13)
  {
    v14 = [v11 contactLabel];

    uint64_t v15 = [v11 localizedName];
    v16 = (void *)v15;
    if (v14)
    {
      v17 = [v11 contactLabel];
      v18 = +[NSString stringWithFormat:@"%@ (%@)", v16, v17];
    }
    else
    {
      v18 = +[NSString stringWithFormat:@"%@ (%@)", v15, v5];
    }
  }
  else
  {
    v18 = [v11 localizedName];
  }

  if (v18)
  {
    v22 = +[PSSpecifier preferenceSpecifierNamed:v18 target:*(void *)(a1 + 32) set:0 get:0 detail:0 cell:1 edit:0];
    [v22 setButtonAction:"_ruleTapped:"];
    [v22 setUserInfo:v3];
    v23 = +[NSNumber numberWithBool:1];
    [v22 setProperty:v23 forKey:PSEnabledKey];

    [*(id *)(a1 + 40) addObject:v22];
    if ([v3 type] == 2)
    {
      objc_initWeak(&location, *(id *)(a1 + 32));
      v24 = [*(id *)(a1 + 32) brandManager];
      v25 = [v3 businessID];
      v27[0] = _NSConcreteStackBlock;
      v27[1] = 3221225472;
      v27[2] = sub_3E80;
      v27[3] = &unk_83A8;
      id v28 = v22;
      objc_copyWeak(&v29, &location);
      [v24 brandWithURI:v25 completion:v27];

      objc_destroyWeak(&v29);
      objc_destroyWeak(&location);
    }
  }
LABEL_23:
}

void sub_3E5C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_3E80(uint64_t a1, void *a2)
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_3F54;
  block[3] = &unk_8380;
  id v5 = a2;
  id v6 = *(id *)(a1 + 32);
  id v3 = v5;
  objc_copyWeak(&v7, (id *)(a1 + 40));
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  objc_destroyWeak(&v7);
}

void sub_3F54(id *a1)
{
  v2 = [a1[4] name];
  id v3 = [v2 length];

  if (v3)
  {
    unsigned int v4 = [a1[4] name];
    [a1[5] setName:v4];

    id WeakRetained = objc_loadWeakRetained(a1 + 6);
    [WeakRetained reloadSpecifier:a1[5]];
  }
}

void sub_451C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_4548(uint64_t a1, void *a2)
{
  id v3 = a2;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_4604;
  v5[3] = &unk_83F8;
  objc_copyWeak(&v7, (id *)(a1 + 32));
  id v6 = v3;
  id v4 = v3;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v5);

  objc_destroyWeak(&v7);
}

void sub_4604(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained && *(void *)(a1 + 32))
  {
    id v5 = WeakRetained;
    id v3 = +[BSBrand makeBrandPlacecardForBrand:](BSBrand, "makeBrandPlacecardForBrand:");
    id v4 = [v5 navigationController];
    [v4 pushViewController:v3 animated:1];

    id WeakRetained = v5;
  }
}

void sub_5378(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_0, a2, OS_LOG_TYPE_ERROR, "Could not create a CNPhoneNumber for the specified telephone number (%@).", (uint8_t *)&v2, 0xCu);
}

uint64_t TUAddLocalNSObserver()
{
  return _TUAddLocalNSObserver();
}

uint64_t TUHomeCountryCode()
{
  return _TUHomeCountryCode();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
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

id objc_msgSend__updateEditDoneButton(void *a1, const char *a2, ...)
{
  return [a1 _updateEditDoneButton];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_brandManager(void *a1, const char *a2, ...)
{
  return [a1 brandManager];
}

id objc_msgSend_bundleURL(void *a1, const char *a2, ...)
{
  return [a1 bundleURL];
}

id objc_msgSend_businessID(void *a1, const char *a2, ...)
{
  return [a1 businessID];
}

id objc_msgSend_classBundle(void *a1, const char *a2, ...)
{
  return [a1 classBundle];
}

id objc_msgSend_contactLabel(void *a1, const char *a2, ...)
{
  return [a1 contactLabel];
}

id objc_msgSend_contactPickerViewController(void *a1, const char *a2, ...)
{
  return [a1 contactPickerViewController];
}

id objc_msgSend_contactRelations(void *a1, const char *a2, ...)
{
  return [a1 contactRelations];
}

id objc_msgSend_contactStore(void *a1, const char *a2, ...)
{
  return [a1 contactStore];
}

id objc_msgSend_contacts(void *a1, const char *a2, ...)
{
  return [a1 contacts];
}

id objc_msgSend_contactsDataProvider(void *a1, const char *a2, ...)
{
  return [a1 contactsDataProvider];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_currentLocale(void *a1, const char *a2, ...)
{
  return [a1 currentLocale];
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return [a1 defaultCenter];
}

id objc_msgSend_descriptorForRequiredKeys(void *a1, const char *a2, ...)
{
  return [a1 descriptorForRequiredKeys];
}

id objc_msgSend_digits(void *a1, const char *a2, ...)
{
  return [a1 digits];
}

id objc_msgSend_email(void *a1, const char *a2, ...)
{
  return [a1 email];
}

id objc_msgSend_emailAddresses(void *a1, const char *a2, ...)
{
  return [a1 emailAddresses];
}

id objc_msgSend_emitNavigationEvent(void *a1, const char *a2, ...)
{
  return [a1 emitNavigationEvent];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return [a1 firstObject];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return [a1 identifier];
}

id objc_msgSend_instantMessageAddresses(void *a1, const char *a2, ...)
{
  return [a1 instantMessageAddresses];
}

id objc_msgSend_isSuggested(void *a1, const char *a2, ...)
{
  return [a1 isSuggested];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_localizationTableName(void *a1, const char *a2, ...)
{
  return [a1 localizationTableName];
}

id objc_msgSend_localizedName(void *a1, const char *a2, ...)
{
  return [a1 localizedName];
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return [a1 name];
}

id objc_msgSend_navigationController(void *a1, const char *a2, ...)
{
  return [a1 navigationController];
}

id objc_msgSend_navigationItem(void *a1, const char *a2, ...)
{
  return [a1 navigationItem];
}

id objc_msgSend_parentListController(void *a1, const char *a2, ...)
{
  return [a1 parentListController];
}

id objc_msgSend_phoneNumber(void *a1, const char *a2, ...)
{
  return [a1 phoneNumber];
}

id objc_msgSend_phoneNumbers(void *a1, const char *a2, ...)
{
  return [a1 phoneNumbers];
}

id objc_msgSend_postalAddresses(void *a1, const char *a2, ...)
{
  return [a1 postalAddresses];
}

id objc_msgSend_privacyRules(void *a1, const char *a2, ...)
{
  return [a1 privacyRules];
}

id objc_msgSend_reloadSpecifiers(void *a1, const char *a2, ...)
{
  return [a1 reloadSpecifiers];
}

id objc_msgSend_row(void *a1, const char *a2, ...)
{
  return [a1 row];
}

id objc_msgSend_sharedPrivacyManager(void *a1, const char *a2, ...)
{
  return [a1 sharedPrivacyManager];
}

id objc_msgSend_socialProfiles(void *a1, const char *a2, ...)
{
  return [a1 socialProfiles];
}

id objc_msgSend_specifier(void *a1, const char *a2, ...)
{
  return [a1 specifier];
}

id objc_msgSend_specifierID(void *a1, const char *a2, ...)
{
  return [a1 specifierID];
}

id objc_msgSend_specifiersArray(void *a1, const char *a2, ...)
{
  return [a1 specifiersArray];
}

id objc_msgSend_table(void *a1, const char *a2, ...)
{
  return [a1 table];
}

id objc_msgSend_target(void *a1, const char *a2, ...)
{
  return [a1 target];
}

id objc_msgSend_type(void *a1, const char *a2, ...)
{
  return [a1 type];
}

id objc_msgSend_unformattedInternationalRepresentation(void *a1, const char *a2, ...)
{
  return [a1 unformattedInternationalRepresentation];
}

id objc_msgSend_urlAddresses(void *a1, const char *a2, ...)
{
  return [a1 urlAddresses];
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return [a1 userInfo];
}

id objc_msgSend_username(void *a1, const char *a2, ...)
{
  return [a1 username];
}

id objc_msgSend_value(void *a1, const char *a2, ...)
{
  return [a1 value];
}

id objc_msgSend_viewControllerForUnknownContact_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "viewControllerForUnknownContact:");
}