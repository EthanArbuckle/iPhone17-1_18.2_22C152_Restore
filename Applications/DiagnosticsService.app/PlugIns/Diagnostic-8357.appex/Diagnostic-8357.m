BOOL sub_100001E1C(id a1, id a2)
{
  id v2;
  BOOL v3;

  v2 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v3 = (unint64_t)[v2 length] < 0x33;
  }
  else
  {
    objc_opt_class();
    v3 = (objc_opt_isKindOfClass() & 1) == 0 || (uint64_t)[v2 integerValue] > 0;
  }

  return v3;
}

BOOL sub_100001F8C(id a1, id a2)
{
  id v2 = a2;
  objc_opt_class();
  BOOL v3 = (objc_opt_isKindOfClass() & 1) == 0 || (unint64_t)[v2 length] < 0x101;

  return v3;
}

void sub_1000020CC(id a1)
{
  v1 = +[NSMutableDictionary dictionary];
  v8[0] = &off_100004448;
  v8[1] = &off_100004460;
  v9[0] = @"eventDate";
  v9[1] = @"eventType";
  id v2 = +[NSDictionary dictionaryWithObjects:v9 forKeys:v8 count:2];
  [v1 setObject:v2 forKeyedSubscript:@"AnyLogLine"];

  v6 = &off_100004478;
  CFStringRef v7 = @"uuidReference";
  BOOL v3 = +[NSDictionary dictionaryWithObjects:&v7 forKeys:&v6 count:1];
  [v1 setObject:v3 forKeyedSubscript:@"210"];

  id v4 = [v1 copy];
  v5 = (void *)qword_100008938;
  qword_100008938 = (uint64_t)v4;
}

void sub_1000025F0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id sub_100002618(id *a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(a1 + 7);
  id v5 = [WeakRetained isCancelled];

  if ((v5 & 1) == 0)
  {
    v6 = [v3 fields];
    CFStringRef v7 = [v6 componentsJoinedByString:@" "];

    if (([a1[4] containsObject:v7] & 1) == 0)
    {
      v8 = [a1[5] inputs];
      v9 = [v8 logIds];
      v10 = [v3 type];
      unsigned int v11 = [v9 containsObject:v10];

      if (v11)
      {
        v12 = [v3 bundleID];
        if (!v12 || [a1[5] passesFilter:v12])
        {
          uint64_t v13 = [a1[5] processLine:v3];
          [a1[6] addObject:v13];
          [a1[4] addObject:v7];

          v12 = (void *)v13;
        }
      }
    }
  }
  return v5;
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
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

id objc_msgSend_allObjects(void *a1, const char *a2, ...)
{
  return [a1 allObjects];
}

id objc_msgSend_applicationFilters(void *a1, const char *a2, ...)
{
  return [a1 applicationFilters];
}

id objc_msgSend_applicationPredicates(void *a1, const char *a2, ...)
{
  return [a1 applicationPredicates];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_bundleID(void *a1, const char *a2, ...)
{
  return [a1 bundleID];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_defaultLogLineLabelMap(void *a1, const char *a2, ...)
{
  return [a1 defaultLogLineLabelMap];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return [a1 dictionary];
}

id objc_msgSend_fields(void *a1, const char *a2, ...)
{
  return [a1 fields];
}

id objc_msgSend_inputs(void *a1, const char *a2, ...)
{
  return [a1 inputs];
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return [a1 intValue];
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return [a1 integerValue];
}

id objc_msgSend_isCancelled(void *a1, const char *a2, ...)
{
  return [a1 isCancelled];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_logIds(void *a1, const char *a2, ...)
{
  return [a1 logIds];
}

id objc_msgSend_result(void *a1, const char *a2, ...)
{
  return [a1 result];
}

id objc_msgSend_resultLabelFilters(void *a1, const char *a2, ...)
{
  return [a1 resultLabelFilters];
}

id objc_msgSend_set(void *a1, const char *a2, ...)
{
  return [a1 set];
}

id objc_msgSend_stringValue(void *a1, const char *a2, ...)
{
  return [a1 stringValue];
}

id objc_msgSend_type(void *a1, const char *a2, ...)
{
  return [a1 type];
}

id objc_msgSend_unsignedIntValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedIntValue];
}