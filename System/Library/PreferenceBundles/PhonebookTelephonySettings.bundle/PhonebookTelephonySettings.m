void sub_3394(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  void v6[4];
  id v7;
  id v8;

  v3 = a2;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_3440;
  v6[3] = &unk_81D0;
  v4 = *(id *)(a1 + 32);
  v7 = v3;
  v8 = v4;
  v5 = v3;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v6);
}

uint64_t sub_3440(uint64_t a1)
{
  return (*(uint64_t (**)(void, BOOL))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32) == 0);
}

uint64_t TPSPhonebookLog()
{
  if (qword_DD80 != -1) {
    dispatch_once(&qword_DD80, &stru_8238);
  }
  return qword_DD78;
}

void sub_3948(id a1)
{
  qword_DD78 = (uint64_t)os_log_create("com.apple.TelephonySettings", "Phonebook");
}

void sub_3D84(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  v6 = v5;
  if (!a2)
  {
    v12 = [v5 domain];

    if (v12)
    {
      v14 = TPSPhonebookLog();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v15 = *(void *)(a1 + 32);
        *(_DWORD *)buf = 138412546;
        uint64_t v18 = v15;
        __int16 v19 = 2112;
        v20 = v6;
        _os_log_impl(&dword_0, v14, OS_LOG_TYPE_DEFAULT, "Failed to update subscription telephone number to %@ due to error %@.", buf, 0x16u);
      }

      if (CPIsInternalDevice())
      {
        v12 = +[NSString stringWithFormat:@"Apple Internal Error: %@", v6];
      }
      else
      {
        v12 = 0;
      }
    }
    v16 = [*(id *)(a1 + 40) errorAlertControllerWithMessage:v12];
    [*(id *)(a1 + 40) presentViewController:v16 animated:1 completion:0];

    goto LABEL_13;
  }
  v7 = TPSPhonebookLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    uint64_t v18 = v8;
    _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "Successfully updated subscription telephone number to %@.", buf, 0xCu);
  }

  v9 = *(void **)(a1 + 40);
  v10 = [v9 navigationController];
  v11 = [v10 topViewController];

  if (v9 == v11)
  {
    v12 = [*(id *)(a1 + 40) navigationController];
    id v13 = [v12 popViewControllerAnimated:1];
LABEL_13:
  }
}

uint64_t CPIsInternalDevice()
{
  return _CPIsInternalDevice();
}

uint64_t CPPhoneNumberCopyActiveCountryCode()
{
  return _CPPhoneNumberCopyActiveCountryCode();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return _NSStringFromClass(aClass);
}

uint64_t TPSLocalizedPhoneNumberString()
{
  return _TPSLocalizedPhoneNumberString();
}

uint64_t TPSNormalizedPhoneNumberString()
{
  return _TPSNormalizedPhoneNumberString();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
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

void objc_destroyWeak(id *location)
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

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return _objc_unsafeClaimAutoreleasedReturnValue(a1);
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

id objc_msgSend_classBundle(void *a1, const char *a2, ...)
{
  return [a1 classBundle];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return [a1 defaultCenter];
}

id objc_msgSend_defaultSize(void *a1, const char *a2, ...)
{
  return [a1 defaultSize];
}

id objc_msgSend_displayPhoneNumber(void *a1, const char *a2, ...)
{
  return [a1 displayPhoneNumber];
}

id objc_msgSend_domain(void *a1, const char *a2, ...)
{
  return [a1 domain];
}

id objc_msgSend_frame(void *a1, const char *a2, ...)
{
  return [a1 frame];
}

id objc_msgSend_isEditable(void *a1, const char *a2, ...)
{
  return [a1 isEditable];
}

id objc_msgSend_isSubscriptionEditable(void *a1, const char *a2, ...)
{
  return [a1 isSubscriptionEditable];
}

id objc_msgSend_loadPane(void *a1, const char *a2, ...)
{
  return [a1 loadPane];
}

id objc_msgSend_localizationTableName(void *a1, const char *a2, ...)
{
  return [a1 localizationTableName];
}

id objc_msgSend_localizedSubscriptionTelephoneNumber(void *a1, const char *a2, ...)
{
  return [a1 localizedSubscriptionTelephoneNumber];
}

id objc_msgSend_navigationController(void *a1, const char *a2, ...)
{
  return [a1 navigationController];
}

id objc_msgSend_navigationItem(void *a1, const char *a2, ...)
{
  return [a1 navigationItem];
}

id objc_msgSend_number(void *a1, const char *a2, ...)
{
  return [a1 number];
}

id objc_msgSend_pane(void *a1, const char *a2, ...)
{
  return [a1 pane];
}

id objc_msgSend_parentListController(void *a1, const char *a2, ...)
{
  return [a1 parentListController];
}

id objc_msgSend_phoneNumberInfo(void *a1, const char *a2, ...)
{
  return [a1 phoneNumberInfo];
}

id objc_msgSend_phonebookController(void *a1, const char *a2, ...)
{
  return [a1 phonebookController];
}

id objc_msgSend_preferenceValue(void *a1, const char *a2, ...)
{
  return [a1 preferenceValue];
}

id objc_msgSend_reloadData(void *a1, const char *a2, ...)
{
  return [a1 reloadData];
}

id objc_msgSend_saveBarButtonItem(void *a1, const char *a2, ...)
{
  return [a1 saveBarButtonItem];
}

id objc_msgSend_specifier(void *a1, const char *a2, ...)
{
  return [a1 specifier];
}

id objc_msgSend_subscriptionContext(void *a1, const char *a2, ...)
{
  return [a1 subscriptionContext];
}

id objc_msgSend_subscriptionISOCountryCode(void *a1, const char *a2, ...)
{
  return [a1 subscriptionISOCountryCode];
}

id objc_msgSend_tableView(void *a1, const char *a2, ...)
{
  return [a1 tableView];
}

id objc_msgSend_tableViewCell(void *a1, const char *a2, ...)
{
  return [a1 tableViewCell];
}

id objc_msgSend_telephoneNumberSpecifier(void *a1, const char *a2, ...)
{
  return [a1 telephoneNumberSpecifier];
}

id objc_msgSend_telephonyClient(void *a1, const char *a2, ...)
{
  return [a1 telephonyClient];
}

id objc_msgSend_text(void *a1, const char *a2, ...)
{
  return [a1 text];
}

id objc_msgSend_textLabel(void *a1, const char *a2, ...)
{
  return [a1 textLabel];
}

id objc_msgSend_topViewController(void *a1, const char *a2, ...)
{
  return [a1 topViewController];
}

id objc_msgSend_updateSubscriptionTelephoneNumber_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateSubscriptionTelephoneNumber:completion:");
}