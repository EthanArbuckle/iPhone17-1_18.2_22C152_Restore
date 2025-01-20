id sub_43A4(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _hkTypeCountsQueryOperation:a2];
}

void sub_43B0(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  v3 = [v2 _getSectionBy:@"DATA_TYPES_GROUP"];
  [v2 _buildDataTypesSection:v3];

  v4 = *(void **)(a1 + 32);
  id v5 = [v4 _getSectionBy:@"DATA_SOURCES_GROUP"];
  [v4 _buildDataSourceSection:v5];
}

BOOL sub_4448(id a1)
{
  v1 = +[_HKBehavior sharedBehavior];
  char v2 = [v1 healthAppHiddenOrNotInstalled] ^ 1;

  return v2;
}

BOOL sub_4488(id a1)
{
  v1 = +[_HKBehavior sharedBehavior];
  unsigned __int8 v2 = [v1 healthAppHiddenOrNotInstalled];

  return v2;
}

void sub_44C8(uint64_t a1, void *a2)
{
  id v7 = a2;
  uint64_t v3 = [v7 objectForKeyedSubscript:@"include-group"];
  v4 = (void *)v3;
  if (!v3 || (*(unsigned int (**)(uint64_t))(v3 + 16))(v3))
  {
    id v5 = *(void **)(a1 + 32);
    v6 = +[NSMutableDictionary dictionaryWithDictionary:v7];
    [v5 addObject:v6];
  }
}

void sub_4650(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [v3 objectForKeyedSubscript:@"groupSpecifier"];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    v6 = *(void **)(a1 + 32);
    id v7 = [v3 objectForKeyedSubscript:@"groupSpecifier"];
    [v6 addObject:v7];
  }
  v8 = [v3 objectForKeyedSubscript:@"builder"];
  if (v8)
  {
    v9 = [v3 objectForKeyedSubscript:@"next"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v10 = +[NSDate now];
      v11 = (char *)[v10 compare:v9];

      if (v11 == (unsigned char *)&dword_0 + 1)
      {
        uint64_t v12 = [v3 objectForKeyedSubscript:@"interval"];
        v13 = (void *)v12;
        v14 = &off_88C8;
        if (v12) {
          v14 = (_UNKNOWN **)v12;
        }
        v15 = v14;

        [v15 doubleValue];
        v16 = +[NSDate dateWithTimeIntervalSinceNow:](NSDate, "dateWithTimeIntervalSinceNow:");
        [v3 setObject:v16 forKeyedSubscript:@"next"];

        v17 = *(void **)(*(void *)(a1 + 40) + 32);
        v20 = _NSConcreteStackBlock;
        uint64_t v21 = 3221225472;
        v22 = sub_48DC;
        v23 = &unk_8380;
        id v25 = v8;
        id v24 = v3;
        v18 = +[NSBlockOperation blockOperationWithBlock:&v20];
        objc_msgSend(v17, "addOperation:", v18, v20, v21, v22, v23);
      }
    }
  }
  v19 = [v3 objectForKeyedSubscript:@"itemSpecifiers"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && [v19 count]) {
    [*(id *)(a1 + 32) addObjectsFromArray:v19];
  }
}

uint64_t sub_48DC(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

uint64_t sub_49E4(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

uint64_t sub_4AD8(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_4DA0(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_4F18;
  v16[3] = &unk_83F8;
  id v5 = objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithCapacity:", objc_msgSend(v4, "count"));
  id v17 = v5;
  [v4 enumerateKeysAndObjectsUsingBlock:v16];

  v6 = [v5 keysSortedByValueUsingComparator:&stru_8438];
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 40));
  uint64_t v7 = *(void *)(a1 + 32);
  v8 = *(void **)(v7 + 56);
  *(void *)(v7 + 56) = v6;
  id v9 = v6;

  uint64_t v10 = *(void *)(a1 + 32);
  v11 = *(void **)(v10 + 64);
  *(void *)(v10 + 64) = v5;
  id v12 = v5;

  id v13 = objc_alloc_init((Class)NSMutableDictionary);
  uint64_t v14 = *(void *)(a1 + 32);
  v15 = *(void **)(v14 + 72);
  *(void *)(v14 + 72) = v13;

  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 40));
  [*(id *)(a1 + 32) _callBuilderCompletionBlock:*(void *)(a1 + 40)];
}

void sub_4F18(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", (void)[v5 sizeInBytesOfSampleInDB] * (void)objc_msgSend(a3, "longLongValue"));
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  [*(id *)(a1 + 32) setObject:v6 forKeyedSubscript:v5];
}

int64_t sub_4FAC(id a1, NSNumber *a2, NSNumber *a3)
{
  return [(NSNumber *)a3 compare:a2];
}

void sub_5180(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = a2;
  uint64_t v7 = [*(id *)(*(void *)(a1 + 32) + 64) objectForKeyedSubscript:v6];
  id v8 = [*(id *)(a1 + 40) count];
  if (v8 == (id)(int)[*(id *)(a1 + 48) intValue] || !objc_msgSend(v7, "intValue"))
  {
    *a4 = 1;
  }
  else
  {
    id v9 = [v6 identifier];
    uint64_t v10 = +[HKQuantityType quantityTypeForIdentifier:v9];

    v11 = +[HKDisplayTypeController sharedInstanceForHealthStore:*(void *)(*(void *)(a1 + 32) + 16)];
    id v12 = [v11 displayTypeForObjectType:v10];
    id v13 = [v12 localization];
    uint64_t v14 = [v13 displayName];

    if (v14)
    {
      v15 = +[PSSpecifier _hkPreferenceNamed:v14 value:v7];
      v16 = [v6 identifier];
      [v15 setUserInfo:v16];

      [*(id *)(a1 + 40) addObject:v15];
    }
    else
    {
      _HKInitializeLogging();
      id v17 = (void *)HKLogDefault;
      if (os_log_type_enabled(HKLogDefault, OS_LOG_TYPE_FAULT)) {
        sub_6538(v17, v6);
      }
    }
  }
}

int64_t sub_54B4(id a1, NSNumber *a2, NSNumber *a3)
{
  return [(NSNumber *)a3 compare:a2];
}

void sub_54C0(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v12 = a2;
  uint64_t v7 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 72), "objectForKeyedSubscript:");
  if ([v7 intValue] && (int)objc_msgSend(*(id *)(a1 + 40), "intValue") != a3)
  {
    id v8 = +[NSBundle bundleForClass:objc_opt_class()];
    id v9 = [v12 name];
    uint64_t v10 = [v8 localizedStringForKey:v9 value:&stru_8780 table:@"Localizable"];
    v11 = +[PSSpecifier _hkPreferenceNamed:v10 value:v7];

    [v11 setUserInfo:v12];
    [*(id *)(a1 + 48) addObject:v11];
  }
  else
  {
    *a4 = 1;
  }
}

void sub_57C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_57E4(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(void **)(v4 + 32);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_58B4;
  v9[3] = &unk_8598;
  id v10 = v3;
  uint64_t v11 = v4;
  long long v8 = *(_OWORD *)(a1 + 40);
  id v6 = (id)v8;
  long long v12 = v8;
  id v7 = v3;
  [v5 addOperationWithBlock:v9];
}

void sub_58B4(uint64_t a1)
{
  id v2 = objc_alloc((Class)HKSourceQuery);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_59B0;
  v6[3] = &unk_8570;
  uint64_t v9 = *(void *)(a1 + 56);
  int8x16_t v5 = *(int8x16_t *)(a1 + 32);
  id v3 = (id)v5.i64[0];
  int8x16_t v7 = vextq_s8(v5, v5, 8uLL);
  id v8 = *(id *)(a1 + 48);
  id v4 = [v2 initWithSampleType:v3 samplePredicate:0 completionHandler:v6];
  [*(id *)(*(void *)(a1 + 40) + 16) executeQuery:v4];
}

void sub_59B0(uint64_t a1, uint64_t a2, void *a3)
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_5A60;
  v7[3] = &unk_8548;
  uint64_t v5 = *(void *)(a1 + 56);
  id v6 = *(void **)(a1 + 40);
  v7[4] = *(void *)(a1 + 32);
  uint64_t v10 = v5;
  id v8 = v6;
  id v9 = *(id *)(a1 + 48);
  [a3 enumerateObjectsUsingBlock:v7];
}

void sub_5A60(uint64_t a1, void *a2)
{
  id v3 = a2;
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 40));
  ++*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 40));
  id v4 = *(void **)(*(void *)(a1 + 32) + 32);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_5B7C;
  v8[3] = &unk_8520;
  id v9 = *(id *)(a1 + 40);
  id v10 = v3;
  uint64_t v11 = *(void *)(a1 + 32);
  long long v7 = *(_OWORD *)(a1 + 48);
  id v5 = (id)v7;
  long long v12 = v7;
  id v6 = v3;
  [v4 addOperationWithBlock:v8];
}

void sub_5B7C(uint64_t a1)
{
  id v2 = objc_alloc((Class)HKSampleCountQuery);
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = +[HKQuery predicateForObjectsFromSource:*(void *)(a1 + 40)];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_5CA8;
  v10[3] = &unk_84F8;
  id v11 = *(id *)(a1 + 32);
  int8x16_t v8 = *(int8x16_t *)(a1 + 40);
  id v5 = (id)v8.i64[0];
  int8x16_t v12 = vextq_s8(v8, v8, 8uLL);
  long long v9 = *(_OWORD *)(a1 + 56);
  id v6 = (id)v9;
  long long v13 = v9;
  id v7 = [v2 initWithSampleType:v3 predicate:v4 resultsHandler:v10];

  [*(id *)(*(void *)(a1 + 48) + 16) executeQuery:v7];
}

void sub_5CA8(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4 = [a3 objectForKeyedSubscript:*(void *)(a1 + 32)];
  id v5 = (void *)v4;
  if (v4) {
    id v6 = (_UNKNOWN **)v4;
  }
  else {
    id v6 = &off_88F0;
  }
  v16 = v6;

  id v7 = +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", (void)[*(id *)(a1 + 32) sizeInBytesOfSampleInDB] * (void)objc_msgSend(v16, "longLongValue"));
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 40) + 40));
  uint64_t v8 = [*(id *)(*(void *)(a1 + 40) + 72) objectForKeyedSubscript:*(void *)(a1 + 48)];
  long long v9 = (void *)v8;
  if (v8) {
    id v10 = (_UNKNOWN **)v8;
  }
  else {
    id v10 = &off_88F0;
  }
  id v11 = v10;

  int8x16_t v12 = (char *)[v11 longLongValue];
  long long v13 = +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", &v12[(void)[v7 longLongValue]]);
  [*(id *)(*(void *)(a1 + 40) + 72) setObject:v13 forKeyedSubscript:*(void *)(a1 + 48)];

  uint64_t v14 = *(void *)(*(void *)(a1 + 64) + 8);
  uint64_t v15 = *(void *)(v14 + 24) - 1;
  *(void *)(v14 + 24) = v15;
  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 40) + 40));
  if (!v15) {
    [*(id *)(a1 + 40) _assembleBySourceSection:*(void *)(a1 + 56)];
  }
}

void sub_6538(void *a1, void *a2)
{
  uint64_t v3 = a1;
  uint64_t v4 = [a2 identifier];
  int v5 = 138412290;
  id v6 = v4;
  _os_log_fault_impl(&dword_0, v3, OS_LOG_TYPE_FAULT, "HealthStoragePlugin: missing displayName for %@", (uint8_t *)&v5, 0xCu);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return _NSStringFromClass(aClass);
}

NSString *__cdecl NSStringFromRange(NSRange range)
{
  return _NSStringFromRange(range);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _HKInitializeLogging()
{
  return __HKInitializeLogging();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
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

id objc_retainBlock(id a1)
{
  return _objc_retainBlock(a1);
}

void objc_storeStrong(id *location, id obj)
{
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

id objc_msgSend__buildConfiguration(void *a1, const char *a2, ...)
{
  return [a1 _buildConfiguration];
}

id objc_msgSend__hkPreferenceSpinner(void *a1, const char *a2, ...)
{
  return [a1 _hkPreferenceSpinner];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_displayName(void *a1, const char *a2, ...)
{
  return [a1 displayName];
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return [a1 doubleValue];
}

id objc_msgSend_healthAppHiddenOrNotInstalled(void *a1, const char *a2, ...)
{
  return [a1 healthAppHiddenOrNotInstalled];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return [a1 identifier];
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return [a1 intValue];
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return [a1 integerValue];
}

id objc_msgSend_localization(void *a1, const char *a2, ...)
{
  return [a1 localization];
}

id objc_msgSend_longLongValue(void *a1, const char *a2, ...)
{
  return [a1 longLongValue];
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return [a1 name];
}

id objc_msgSend_now(void *a1, const char *a2, ...)
{
  return [a1 now];
}

id objc_msgSend_reloadSpecifiers(void *a1, const char *a2, ...)
{
  return [a1 reloadSpecifiers];
}

id objc_msgSend_sharedBehavior(void *a1, const char *a2, ...)
{
  return [a1 sharedBehavior];
}

id objc_msgSend_sizeInBytesOfSampleInDB(void *a1, const char *a2, ...)
{
  return [a1 sizeInBytesOfSampleInDB];
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithFormat:");
}