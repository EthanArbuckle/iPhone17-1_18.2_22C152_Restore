void sub_4270(id a1)
{
  id v1;
  void *v2;
  void *v3;
  uint64_t vars8;

  v1 = objc_alloc_init((Class)NSDateFormatter);
  v2 = (void *)qword_10BC8;
  qword_10BC8 = (uint64_t)v1;

  [(id)qword_10BC8 setDateStyle:2];
  v3 = (void *)qword_10BC8;

  [v3 setTimeStyle:0];
}

void sub_466C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t sub_4698(uint64_t a1, void *a2, uint64_t a3)
{
  if (!a3)
  {
    id v4 = a2;
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    [WeakRetained setCachedCurrentUser:v4];
  }
  v6 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);

  return v6();
}

void sub_56B4(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    CLSInitLog();
    v7 = CLSLogDefault;
    if (os_log_type_enabled(CLSLogDefault, OS_LOG_TYPE_ERROR))
    {
      int v8 = 138412290;
      id v9 = v6;
      _os_log_error_impl(&dword_0, v7, OS_LOG_TYPE_ERROR, "CLSClassKitSettingsController failed to load user progress activities. Error: %@", (uint8_t *)&v8, 0xCu);
    }
  }
  [*(id *)(a1 + 32) setUserProgressActivities:v5];
}

void sub_5794(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    CLSInitLog();
    v7 = CLSLogDefault;
    if (os_log_type_enabled(CLSLogDefault, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v22 = v6;
      _os_log_error_impl(&dword_0, v7, OS_LOG_TYPE_ERROR, "CLSClassKitSettingsController failed to fetch associated contexts. Error: %@", buf, 0xCu);
    }
  }
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v8 = v5;
  id v9 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v17;
    do
    {
      v12 = 0;
      do
      {
        if (*(void *)v17 != v11) {
          objc_enumerationMutation(v8);
        }
        v13 = *(void **)(*((void *)&v16 + 1) + 8 * (void)v12);
        v14 = objc_msgSend(*(id *)(a1 + 32), "objectIDToContextMap", (void)v16);
        v15 = [v13 objectID];
        [v14 setObject:v13 forKeyedSubscript:v15];

        v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      id v10 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v10);
  }
}

void sub_593C(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    CLSInitLog();
    v7 = CLSLogDefault;
    if (os_log_type_enabled(CLSLogDefault, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v24 = v6;
      _os_log_error_impl(&dword_0, v7, OS_LOG_TYPE_ERROR, "CLSClassKitSettingsController failed to fetch associated assigned items. Error: %@", buf, 0xCu);
    }
  }
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v8 = v5;
  id v9 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v19;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v19 != v11) {
          objc_enumerationMutation(v8);
        }
        v13 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        v14 = *(void **)(a1 + 32);
        v15 = objc_msgSend(v13, "parentObjectID", (void)v18);
        [v14 addObject:v15];

        long long v16 = [*(id *)(a1 + 40) objectIDToAssignedItemMap];
        long long v17 = [v13 objectID];
        [v16 setObject:v13 forKeyedSubscript:v17];
      }
      id v10 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v10);
  }
}

void sub_5B08(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    CLSInitLog();
    v7 = CLSLogDefault;
    if (os_log_type_enabled(CLSLogDefault, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v22 = v6;
      _os_log_error_impl(&dword_0, v7, OS_LOG_TYPE_ERROR, "CLSClassKitSettingsController failed to fetch associated attachments. Error: %@", buf, 0xCu);
    }
  }
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v8 = v5;
  id v9 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v17;
    do
    {
      v12 = 0;
      do
      {
        if (*(void *)v17 != v11) {
          objc_enumerationMutation(v8);
        }
        v13 = *(void **)(*((void *)&v16 + 1) + 8 * (void)v12);
        v14 = objc_msgSend(*(id *)(a1 + 32), "objectIDToAttachmentMap", (void)v16);
        v15 = [v13 objectID];
        [v14 setObject:v13 forKeyedSubscript:v15];

        v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      id v10 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v10);
  }
}

void sub_6934(void *a1, uint64_t a2)
{
  if (a2)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_69E0;
    block[3] = &unk_C4B0;
    block[4] = a1[4];
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
  else
  {
    uint64_t v2 = a1[6];
    uint64_t v3 = PSValueKey;
    id v4 = (void *)a1[5];
    [v4 setProperty:v2 forKey:v3];
  }
}

void sub_69E0(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  id v2 = [v1 allowBrowseToggleSpecifier];
  [v1 reloadSpecifier:v2];
}

void sub_6B8C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_6BA8(uint64_t a1, void *a2, uint64_t a3)
{
  if (!a3)
  {
    id v4 = a2;
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [v4 BOOLValue];
    [*(id *)(a1 + 32) setProperty:v4 forKey:PSValueKey];
  }
  id v5 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v5();
}

void sub_7814(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_7830(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_7840(uint64_t a1)
{
}

uint64_t sub_7848(uint64_t result, void *a2, uint64_t a3)
{
  if (!a3)
  {
    uint64_t v4 = result;
    *(void *)(*(void *)(*(void *)(v4 + 32) + 8) + 40) = [a2 firstObject];
    return _objc_release_x1();
  }
  return result;
}

void sub_7C94(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28)
{
}

void *sub_7CC4(void *result, uint64_t a2, uint64_t a3)
{
  if (!a3) {
    return [*(id *)(*(void *)(result[4] + 8) + 40) addObjectsFromArray:a2];
  }
  return result;
}

void *sub_7CE0(void *result, uint64_t a2, uint64_t a3)
{
  if (!a3) {
    return [*(id *)(*(void *)(result[4] + 8) + 40) addObjectsFromArray:a2];
  }
  return result;
}

void *sub_7CFC(void *result, uint64_t a2, uint64_t a3)
{
  if (!a3) {
    return [*(id *)(*(void *)(result[4] + 8) + 40) addObjectsFromArray:a2];
  }
  return result;
}

void sub_7DF0(id a1)
{
  id v1 = objc_alloc_init((Class)NSNumberFormatter);
  id v2 = (void *)qword_10BD8;
  qword_10BD8 = (uint64_t)v1;

  uint64_t v3 = (void *)qword_10BD8;

  [v3 setNumberStyle:3];
}

void sub_7E94(id a1)
{
  id v1 = objc_alloc_init((Class)NSDateComponentsFormatter);
  id v2 = (void *)qword_10BE8;
  qword_10BE8 = (uint64_t)v1;

  [(id)qword_10BE8 setUnitsStyle:3];
  uint64_t v3 = (void *)qword_10BE8;

  [v3 setAllowedUnits:224];
}

uint64_t CLSInitLog()
{
  return _CLSInitLog();
}

uint64_t CLSLocalizedNameFromContextType()
{
  return _CLSLocalizedNameFromContextType();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return _NSStringFromClass(aClass);
}

NSString *__cdecl NSStringFromRange(NSRange range)
{
  return _NSStringFromRange(range);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return _NSStringFromSelector(aSelector);
}

void _Block_object_dispose(const void *a1, const int a2)
{
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

dispatch_block_t dispatch_block_create(dispatch_block_flags_t flags, dispatch_block_t block)
{
  return _dispatch_block_create(flags, block);
}

intptr_t dispatch_block_wait(dispatch_block_t block, dispatch_time_t timeout)
{
  return _dispatch_block_wait(block, timeout);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return _dispatch_time(when, delta);
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

id objc_msgSend_activityItemsByID(void *a1, const char *a2, ...)
{
  return [a1 activityItemsByID];
}

id objc_msgSend_additionalActivityItems(void *a1, const char *a2, ...)
{
  return [a1 additionalActivityItems];
}

id objc_msgSend_allowBrowseToggleSpecifier(void *a1, const char *a2, ...)
{
  return [a1 allowBrowseToggleSpecifier];
}

id objc_msgSend_appIdentifier(void *a1, const char *a2, ...)
{
  return [a1 appIdentifier];
}

id objc_msgSend_appleID(void *a1, const char *a2, ...)
{
  return [a1 appleID];
}

id objc_msgSend_appleIDSpecifier(void *a1, const char *a2, ...)
{
  return [a1 appleIDSpecifier];
}

id objc_msgSend_applyConstraints(void *a1, const char *a2, ...)
{
  return [a1 applyConstraints];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_bottomAnchor(void *a1, const char *a2, ...)
{
  return [a1 bottomAnchor];
}

id objc_msgSend_bundleIdentifier(void *a1, const char *a2, ...)
{
  return [a1 bundleIdentifier];
}

id objc_msgSend_bundleRecord(void *a1, const char *a2, ...)
{
  return [a1 bundleRecord];
}

id objc_msgSend_bundleURL(void *a1, const char *a2, ...)
{
  return [a1 bundleURL];
}

id objc_msgSend_cachedCurrentUser(void *a1, const char *a2, ...)
{
  return [a1 cachedCurrentUser];
}

id objc_msgSend_centerYAnchor(void *a1, const char *a2, ...)
{
  return [a1 centerYAnchor];
}

id objc_msgSend_contentView(void *a1, const char *a2, ...)
{
  return [a1 contentView];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_createStudentSpecifiers(void *a1, const char *a2, ...)
{
  return [a1 createStudentSpecifiers];
}

id objc_msgSend_createTeacherSpecifiers(void *a1, const char *a2, ...)
{
  return [a1 createTeacherSpecifiers];
}

id objc_msgSend_currentLocale(void *a1, const char *a2, ...)
{
  return [a1 currentLocale];
}

id objc_msgSend_currentUser(void *a1, const char *a2, ...)
{
  return [a1 currentUser];
}

id objc_msgSend_customTypeName(void *a1, const char *a2, ...)
{
  return [a1 customTypeName];
}

id objc_msgSend_dateLastModified(void *a1, const char *a2, ...)
{
  return [a1 dateLastModified];
}

id objc_msgSend_detailTextLabel(void *a1, const char *a2, ...)
{
  return [a1 detailTextLabel];
}

id objc_msgSend_duration(void *a1, const char *a2, ...)
{
  return [a1 duration];
}

id objc_msgSend_fetchAllActivities(void *a1, const char *a2, ...)
{
  return [a1 fetchAllActivities];
}

id objc_msgSend_fileUTType(void *a1, const char *a2, ...)
{
  return [a1 fileUTType];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return [a1 firstObject];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return [a1 identifier];
}

id objc_msgSend_isInstructor(void *a1, const char *a2, ...)
{
  return [a1 isInstructor];
}

id objc_msgSend_isProgressTrackingAllowed(void *a1, const char *a2, ...)
{
  return [a1 isProgressTrackingAllowed];
}

id objc_msgSend_isStudent(void *a1, const char *a2, ...)
{
  return [a1 isStudent];
}

id objc_msgSend_leadingAnchor(void *a1, const char *a2, ...)
{
  return [a1 leadingAnchor];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_loadUserProgressActivities(void *a1, const char *a2, ...)
{
  return [a1 loadUserProgressActivities];
}

id objc_msgSend_localizedDescription(void *a1, const char *a2, ...)
{
  return [a1 localizedDescription];
}

id objc_msgSend_maxScore(void *a1, const char *a2, ...)
{
  return [a1 maxScore];
}

id objc_msgSend_objectID(void *a1, const char *a2, ...)
{
  return [a1 objectID];
}

id objc_msgSend_objectIDToAssignedItemMap(void *a1, const char *a2, ...)
{
  return [a1 objectIDToAssignedItemMap];
}

id objc_msgSend_objectIDToAttachmentMap(void *a1, const char *a2, ...)
{
  return [a1 objectIDToAttachmentMap];
}

id objc_msgSend_objectIDToContextMap(void *a1, const char *a2, ...)
{
  return [a1 objectIDToContextMap];
}

id objc_msgSend_organizationProgressTrackingAllowed(void *a1, const char *a2, ...)
{
  return [a1 organizationProgressTrackingAllowed];
}

id objc_msgSend_parentObjectID(void *a1, const char *a2, ...)
{
  return [a1 parentObjectID];
}

id objc_msgSend_percentageNumberFormatter(void *a1, const char *a2, ...)
{
  return [a1 percentageNumberFormatter];
}

id objc_msgSend_person(void *a1, const char *a2, ...)
{
  return [a1 person];
}

id objc_msgSend_present(void *a1, const char *a2, ...)
{
  return [a1 present];
}

id objc_msgSend_primaryActivityItemIdentifier(void *a1, const char *a2, ...)
{
  return [a1 primaryActivityItemIdentifier];
}

id objc_msgSend_progress(void *a1, const char *a2, ...)
{
  return [a1 progress];
}

id objc_msgSend_quantity(void *a1, const char *a2, ...)
{
  return [a1 quantity];
}

id objc_msgSend_removeAllObjects(void *a1, const char *a2, ...)
{
  return [a1 removeAllObjects];
}

id objc_msgSend_score(void *a1, const char *a2, ...)
{
  return [a1 score];
}

id objc_msgSend_shared(void *a1, const char *a2, ...)
{
  return [a1 shared];
}

id objc_msgSend_sizeToFit(void *a1, const char *a2, ...)
{
  return [a1 sizeToFit];
}

id objc_msgSend_specifier(void *a1, const char *a2, ...)
{
  return [a1 specifier];
}

id objc_msgSend_stringValue(void *a1, const char *a2, ...)
{
  return [a1 stringValue];
}

id objc_msgSend_subtitleDateFormatter(void *a1, const char *a2, ...)
{
  return [a1 subtitleDateFormatter];
}

id objc_msgSend_textLabel(void *a1, const char *a2, ...)
{
  return [a1 textLabel];
}

id objc_msgSend_timeSpentFormatter(void *a1, const char *a2, ...)
{
  return [a1 timeSpentFormatter];
}

id objc_msgSend_title(void *a1, const char *a2, ...)
{
  return [a1 title];
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

id objc_msgSend_type(void *a1, const char *a2, ...)
{
  return [a1 type];
}

id objc_msgSend_userActivity(void *a1, const char *a2, ...)
{
  return [a1 userActivity];
}

id objc_msgSend_userProgressActivities(void *a1, const char *a2, ...)
{
  return [a1 userProgressActivities];
}

id objc_msgSend_value(void *a1, const char *a2, ...)
{
  return [a1 value];
}

id objc_msgSend_valueLabel(void *a1, const char *a2, ...)
{
  return [a1 valueLabel];
}

id objc_msgSend_valueType(void *a1, const char *a2, ...)
{
  return [a1 valueType];
}

id objc_msgSend_whitespaceCharacterSet(void *a1, const char *a2, ...)
{
  return [a1 whitespaceCharacterSet];
}