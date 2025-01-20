int main(int argc, const char **argv, const char **envp)
{
  void *v3;

  sub_10000269C();
  dispatch_main();
}

void sub_10000269C()
{
  qword_100008048 = (uint64_t)xpc_connection_create_mach_service("com.apple.accessibility.mediaaccessibilityd", (dispatch_queue_t)&_dispatch_main_q, 1uLL);
  xpc_connection_set_event_handler((xpc_connection_t)qword_100008048, &stru_1000042E0);
  v0 = (_xpc_connection_s *)qword_100008048;

  xpc_connection_resume(v0);
}

void sub_1000026F8(id a1, OS_xpc_object *a2)
{
  if (xpc_get_type(a2) == (xpc_type_t)&_xpc_type_connection && &_xpc_type_error != &_xpc_type_connection)
  {
    if (xpc_connection_get_euid(a2))
    {
      handler[0] = _NSConcreteStackBlock;
      handler[1] = 3221225472;
      handler[2] = sub_1000027B8;
      handler[3] = &unk_100004308;
      handler[4] = a2;
      xpc_connection_set_event_handler(a2, handler);
      xpc_connection_resume(a2);
    }
    else
    {
      xpc_connection_cancel(a2);
    }
  }
}

void sub_1000027B8(uint64_t a1, void *a2)
{
  v5 = *(void **)(a1 + 32);
  xpc_type_t type = xpc_get_type(a2);
  if (type == (xpc_type_t)&_xpc_type_error)
  {
    if (a2 == &_xpc_error_connection_invalid || a2 == &_xpc_error_termination_imminent) {
      sub_100002DB0(v5, 0);
    }
    goto LABEL_52;
  }
  if (type != (xpc_type_t)&_xpc_type_dictionary) {
    goto LABEL_52;
  }
  xpc_object_t value = xpc_dictionary_get_value(a2, "reqiestTypePreferences");
  if (value)
  {
    v8 = value;
    if (xpc_get_type(value) == (xpc_type_t)&_xpc_type_dictionary)
    {
      CFNumberRef v9 = sub_100003098(v8);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_34;
      }
      id v10 = [(__CFNumber *)v9 objectForKey:@"preferenceName"];
      id v11 = [(__CFNumber *)v9 objectForKey:@"getOrSet"];
      if (!v10) {
        goto LABEL_34;
      }
      v12 = v11;
      objc_opt_class();
      BOOL v13 = 0;
      CFStringRef v14 = 0;
      if ((objc_opt_isKindOfClass() & 1) == 0 || !v12) {
        goto LABEL_35;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0
        || ([v12 isEqual:@"get"] & 1) == 0
        && ![v12 isEqual:@"set"])
      {
        goto LABEL_34;
      }
      if ([v12 isEqual:@"set"])
      {
        id v15 = [(__CFNumber *)v9 objectForKey:@"preferenceValue"];
        if ([v10 isEqualToString:@"MACaptionPreferredLanguages"])
        {
          if (!v15 || sub_100002EC4(v15))
          {
            CFPreferencesSetAppValue(@"MACaptionPreferredLanguages", v15, @"com.apple.mediaaccessibility.public");
LABEL_73:
            CFPreferencesAppSynchronize(@"com.apple.mediaaccessibility.public");
            CFStringRef v14 = 0;
            BOOL v13 = 1;
LABEL_35:

            xpc_object_t reply = xpc_dictionary_create_reply(a2);
            remote_connection = xpc_dictionary_get_remote_connection(a2);
            if (v14)
            {
              xpc_object_t v23 = sub_1000032C0(v14);
              if (v23)
              {
                v24 = v23;
                xpc_dictionary_set_value(reply, "result", v23);
                CFRelease(v24);
              }
            }
            xpc_dictionary_set_BOOL(reply, "success", v13);
            xpc_connection_send_message(remote_connection, reply);
            CFRelease(reply);
            goto LABEL_39;
          }
        }
        else if ([v10 isEqualToString:@"MACaptionDisplayType"])
        {
          if (v15)
          {
            if (!sub_100003008()) {
              goto LABEL_34;
            }
            v19 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v15 integerValue]);
          }
          else
          {
            v19 = 0;
          }
          CFPreferencesSetAppValue(@"MACaptionDisplayType", v19, @"com.apple.mediaaccessibility.public");
          goto LABEL_73;
        }
LABEL_34:
        CFStringRef v14 = 0;
        BOOL v13 = 0;
        goto LABEL_35;
      }
      if ([v10 isEqualToString:@"MACaptionPreferredLanguages"])
      {
        v16 = (void *)CFPreferencesCopyAppValue(@"MACaptionPreferredLanguages", @"com.apple.mediaaccessibility.public");
        v17 = v16;
        if (v16)
        {
          if (sub_100002EC4(v16))
          {
            v18 = +[NSArray arrayWithArray:v17];
LABEL_33:
            CFStringRef v14 = (const __CFString *)v18;
LABEL_68:
            BOOL v13 = 1;
LABEL_70:

            goto LABEL_35;
          }
          goto LABEL_69;
        }
      }
      else
      {
        if (![v10 isEqualToString:@"MACaptionDisplayType"]) {
          goto LABEL_34;
        }
        v17 = (void *)CFPreferencesCopyAppValue(@"MACaptionDisplayType", @"com.apple.mediaaccessibility.public");
        if (v17)
        {
          if (sub_100003008())
          {
            id v20 = [v17 integerValue];
            if ((unint64_t)v20 <= 3)
            {
              v18 = +[NSNumber numberWithInteger:v20];
              goto LABEL_33;
            }
          }
LABEL_69:
          CFStringRef v14 = 0;
          BOOL v13 = 0;
          goto LABEL_70;
        }
      }
      CFStringRef v14 = 0;
      goto LABEL_68;
    }
  }
LABEL_39:
  xpc_object_t v25 = xpc_dictionary_get_value(a2, "callStatus");
  if (v25)
  {
    v26 = v25;
    if (xpc_get_type(v25) == (xpc_type_t)&_xpc_type_dictionary)
    {
      CFNumberRef v27 = sub_100003098(v26);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        BOOL v31 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
        if (v31) {
          sub_100003734(v31, v32, v33, v34, v35, v36, v37, v38);
        }
        goto LABEL_51;
      }
      id v28 = [(__CFNumber *)v27 objectForKey:@"getOrSet"];
      if (!v28 || (v29 = v28, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      {
        BOOL v39 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
        if (v39) {
          sub_100003644(v39, v40, v41, v42, v43, v44, v45, v46);
        }
        goto LABEL_51;
      }
      if ([v29 isEqual:@"set"])
      {
        id v30 = [(__CFNumber *)v27 objectForKey:@"preferenceValue"];
        if (objc_opt_respondsToSelector())
        {
          sub_100002DB0(v5, (int)[v30 BOOLValue]);
        }
        else
        {
          BOOL v50 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
          if (v50) {
            sub_100003680(v50, v51, v52, v53, v54, v55, v56, v57);
          }
        }
LABEL_51:

        goto LABEL_52;
      }
      if (![v29 isEqual:@"get"])
      {
        BOOL v58 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
        if (v58) {
          sub_1000036F8(v58, v59, v60, v61, v62, v63, v64, v65);
        }
        goto LABEL_51;
      }
      xpc_connection_get_audit_token();
      v47 = (void *)xpc_copy_entitlement_for_token();
      v48 = v47;
      if (v47 && xpc_BOOL_get_value(v47))
      {
        if (qword_100008058)
        {
          BOOL v49 = CFDictionaryGetCount((CFDictionaryRef)qword_100008058) > 0;
          goto LABEL_65;
        }
      }
      else
      {
        BOOL v66 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
        if (v66) {
          sub_1000036BC(v66, v67, v68, v69, v70, v71, v72, v73);
        }
      }
      BOOL v49 = 0;
LABEL_65:
      xpc_object_t v74 = xpc_dictionary_create_reply(a2);
      v75 = xpc_dictionary_get_remote_connection(a2);
      xpc_dictionary_set_BOOL(v74, "result", v49);
      xpc_dictionary_set_BOOL(v74, "success", 1);
      xpc_connection_send_message(v75, v74);
      CFRelease(v74);
      if (v48) {
        CFRelease(v48);
      }
      goto LABEL_51;
    }
  }
LABEL_52:
}

void sub_100002DB0(void *key, int a2)
{
  if (qword_100008050 != -1) {
    dispatch_once(&qword_100008050, &stru_100004348);
  }
  int v4 = CFDictionaryContainsKey((CFDictionaryRef)qword_100008058, key);
  if (a2)
  {
    if (!v4)
    {
      v5 = (const void *)os_transaction_create();
      CFDictionarySetValue((CFMutableDictionaryRef)qword_100008058, key, v5);
      CFRelease(v5);
    }
  }
  else if (v4)
  {
    v6 = (__CFDictionary *)qword_100008058;
    CFDictionaryRemoveValue(v6, key);
  }
}

void sub_100002E8C(id a1)
{
  qword_100008058 = (uint64_t)CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
}

uint64_t sub_100002EC4(void *a1)
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  id v2 = [a1 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v2)
  {
    id v3 = v2;
    uint64_t v4 = *(void *)v9;
LABEL_4:
    uint64_t v5 = 0;
    while (1)
    {
      if (*(void *)v9 != v4) {
        objc_enumerationMutation(a1);
      }
      v6 = *(void **)(*((void *)&v8 + 1) + 8 * v5);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0 && (unint64_t)[v6 length] < 0x800) {
        return 0;
      }
      if (v3 == (id)++v5)
      {
        id v3 = [a1 countByEnumeratingWithState:&v8 objects:v12 count:16];
        uint64_t result = 1;
        if (v3) {
          goto LABEL_4;
        }
        return result;
      }
    }
  }
  return 1;
}

BOOL sub_100003008()
{
  BOOL result = 0;
  if (objc_opt_respondsToSelector())
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      return 1;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      return 1;
    }
  }
  return result;
}

void sub_10000307C(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

CFNumberRef sub_100003098(void *a1)
{
  if (!a1) {
    return 0;
  }
  xpc_type_t type = xpc_get_type(a1);
  if (type == (xpc_type_t)&_xpc_type_int64)
  {
    valuePtr[0] = xpc_int64_get_value(a1);
    return CFNumberCreate(0, kCFNumberSInt64Type, valuePtr);
  }
  if (type == (xpc_type_t)&_xpc_type_string)
  {
    string_ptr = xpc_string_get_string_ptr(a1);
    return (CFNumberRef)CFStringCreateWithCString(0, string_ptr, 0x8000100u);
  }
  else
  {
    if (type == (xpc_type_t)&_xpc_type_array)
    {
      Mutable = CFArrayCreateMutable(0, 0, &kCFTypeArrayCallBacks);
      size_t count = xpc_array_get_count(a1);
      if (count)
      {
        size_t v7 = count;
        for (size_t i = 0; i != v7; ++i)
        {
          xpc_object_t value = xpc_array_get_value(a1, i);
          long long v10 = (const void *)sub_100003098(value);
          if (v10)
          {
            long long v11 = v10;
            CFArrayAppendValue(Mutable, v10);
            CFRelease(v11);
          }
        }
      }
      return Mutable;
    }
    if (type == (xpc_type_t)&_xpc_type_dictionary)
    {
      Mutable = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
      valuePtr[0] = _NSConcreteStackBlock;
      valuePtr[1] = 0x40000000;
      valuePtr[2] = sub_1000035C0;
      valuePtr[3] = &unk_100004368;
      valuePtr[4] = Mutable;
      xpc_dictionary_apply(a1, valuePtr);
      return Mutable;
    }
    if (type != (xpc_type_t)&_xpc_type_BOOL) {
      return 0;
    }
    BOOL v12 = xpc_BOOL_get_value(a1);
    BOOL v13 = &kCFBooleanTrue;
    if (!v12) {
      BOOL v13 = &kCFBooleanFalse;
    }
    CFBooleanRef v14 = *v13;
    return (CFNumberRef)CFRetain(v14);
  }
}

xpc_object_t sub_1000032C0(const __CFString *a1)
{
  if (!a1) {
    return 0;
  }
  CFTypeID v2 = CFGetTypeID(a1);
  if (v2 == CFNumberGetTypeID())
  {
    valuePtr[0] = 0;
    CFNumberGetValue((CFNumberRef)a1, kCFNumberSInt64Type, valuePtr);
    return xpc_int64_create(valuePtr[0]);
  }
  if (v2 == CFStringGetTypeID())
  {
    LOBYTE(valuePtr[0]) = 0;
    CFStringGetCString(a1, (char *)valuePtr, 2048, 0x8000100u);
    return xpc_string_create((const char *)valuePtr);
  }
  if (v2 == CFArrayGetTypeID())
  {
    xpc_object_t v4 = xpc_array_create(0, 0);
    CFIndex Count = CFArrayGetCount((CFArrayRef)a1);
    if (Count >= 1)
    {
      CFIndex v6 = Count;
      for (CFIndex i = 0; i != v6; ++i)
      {
        ValueAtIndex = CFArrayGetValueAtIndex((CFArrayRef)a1, i);
        uint64_t v9 = (void *)sub_1000032C0(ValueAtIndex);
        if (v9)
        {
          long long v10 = v9;
          xpc_array_append_value(v4, v9);
          CFRelease(v10);
        }
      }
    }
    return v4;
  }
  if (v2 != CFDictionaryGetTypeID()) {
    return 0;
  }

  return sub_10000345C((const __CFDictionary *)a1);
}

xpc_object_t sub_10000345C(const __CFDictionary *a1)
{
  xpc_object_t v2 = xpc_dictionary_create(0, 0, 0);
  int64_t Count = CFDictionaryGetCount(a1);
  xpc_object_t v4 = (const void **)malloc_type_calloc(Count, 8uLL, 0xC0040B8AA526DuLL);
  uint64_t v5 = (const void **)malloc_type_calloc(Count, 8uLL, 0xC0040B8AA526DuLL);
  CFDictionaryGetKeysAndValues(a1, v4, v5);
  if (Count >= 1)
  {
    do
    {
      CFStringRef v6 = (const __CFString *)*v4;
      if (*v4)
      {
        CFTypeID v7 = CFGetTypeID(*v4);
        if (v7 == CFStringGetTypeID())
        {
          buffer[0] = 0;
          if (CFStringGetCString(v6, buffer, 2048, 0x8000100u))
          {
            long long v8 = (void *)sub_1000032C0(*v5);
            if (v8)
            {
              uint64_t v9 = v8;
              xpc_dictionary_set_value(v2, buffer, v8);
              CFRelease(v9);
            }
          }
        }
      }
      --Count;
    }
    while (Count);
  }
  free(v4);
  free(v5);
  return v2;
}

uint64_t sub_1000035C0(uint64_t a1, const char *a2, uint64_t a3)
{
  if (a2)
  {
    if (a3)
    {
      CFStringRef v5 = CFStringCreateWithCString(0, a2, 0x8000100u);
      if (v5)
      {
        CFStringRef v6 = v5;
        CFTypeID v7 = (const void *)sub_100003098(a3);
        if (v7)
        {
          long long v8 = v7;
          CFDictionarySetValue(*(CFMutableDictionaryRef *)(a1 + 32), v6, v7);
          CFRelease(v8);
        }
        CFRelease(v6);
      }
    }
  }
  return 1;
}

void sub_100003644(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100003680(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000036BC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000036F8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100003734(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return _CFArrayCreateMutable(allocator, capacity, callBacks);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return _CFArrayGetCount(theArray);
}

CFTypeID CFArrayGetTypeID(void)
{
  return _CFArrayGetTypeID();
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return _CFArrayGetValueAtIndex(theArray, idx);
}

Boolean CFDictionaryContainsKey(CFDictionaryRef theDict, const void *key)
{
  return _CFDictionaryContainsKey(theDict, key);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return _CFDictionaryCreateMutable(allocator, capacity, keyCallBacks, valueCallBacks);
}

CFIndex CFDictionaryGetCount(CFDictionaryRef theDict)
{
  return _CFDictionaryGetCount(theDict);
}

void CFDictionaryGetKeysAndValues(CFDictionaryRef theDict, const void **keys, const void **values)
{
}

CFTypeID CFDictionaryGetTypeID(void)
{
  return _CFDictionaryGetTypeID();
}

void CFDictionaryRemoveValue(CFMutableDictionaryRef theDict, const void *key)
{
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return _CFGetTypeID(cf);
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return _CFNumberCreate(allocator, theType, valuePtr);
}

CFTypeID CFNumberGetTypeID(void)
{
  return _CFNumberGetTypeID();
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return _CFNumberGetValue(number, theType, valuePtr);
}

Boolean CFPreferencesAppSynchronize(CFStringRef applicationID)
{
  return _CFPreferencesAppSynchronize(applicationID);
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return _CFPreferencesCopyAppValue(key, applicationID);
}

void CFPreferencesSetAppValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID)
{
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return _CFRetain(cf);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return _CFStringCreateWithCString(alloc, cStr, encoding);
}

Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return _CFStringGetCString(theString, buffer, bufferSize, encoding);
}

CFTypeID CFStringGetTypeID(void)
{
  return _CFStringGetTypeID();
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_main(void)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

void free(void *a1)
{
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_calloc(count, size, type_id);
}

{
}

{
}

void objc_enumerationMutation(id obj)
{
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

uint64_t objc_opt_isKindOfClass()
{
  return _objc_opt_isKindOfClass();
}

uint64_t objc_opt_respondsToSelector()
{
  return _objc_opt_respondsToSelector();
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

uint64_t os_transaction_create()
{
  return _os_transaction_create();
}

void xpc_array_append_value(xpc_object_t xarray, xpc_object_t value)
{
}

xpc_object_t xpc_array_create(xpc_object_t *objects, size_t count)
{
  return _xpc_array_create(objects, count);
}

size_t xpc_array_get_count(xpc_object_t xarray)
{
  return _xpc_array_get_count(xarray);
}

xpc_object_t xpc_array_get_value(xpc_object_t xarray, size_t index)
{
  return _xpc_array_get_value(xarray, index);
}

BOOL xpc_BOOL_get_value(xpc_object_t xBOOL)
{
  return _xpc_BOOL_get_value(xBOOL);
}

void xpc_connection_cancel(xpc_connection_t connection)
{
}

xpc_connection_t xpc_connection_create_mach_service(const char *name, dispatch_queue_t targetq, uint64_t flags)
{
  return _xpc_connection_create_mach_service(name, targetq, flags);
}

uint64_t xpc_connection_get_audit_token()
{
  return _xpc_connection_get_audit_token();
}

uid_t xpc_connection_get_euid(xpc_connection_t connection)
{
  return _xpc_connection_get_euid(connection);
}

void xpc_connection_resume(xpc_connection_t connection)
{
}

void xpc_connection_send_message(xpc_connection_t connection, xpc_object_t message)
{
}

void xpc_connection_set_event_handler(xpc_connection_t connection, xpc_handler_t handler)
{
}

uint64_t xpc_copy_entitlement_for_token()
{
  return _xpc_copy_entitlement_for_token();
}

BOOL xpc_dictionary_apply(xpc_object_t xdict, xpc_dictionary_applier_t applier)
{
  return _xpc_dictionary_apply(xdict, applier);
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return _xpc_dictionary_create(keys, values, count);
}

xpc_object_t xpc_dictionary_create_reply(xpc_object_t original)
{
  return _xpc_dictionary_create_reply(original);
}

xpc_connection_t xpc_dictionary_get_remote_connection(xpc_object_t xdict)
{
  return _xpc_dictionary_get_remote_connection(xdict);
}

xpc_object_t xpc_dictionary_get_value(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_value(xdict, key);
}

void xpc_dictionary_set_BOOL(xpc_object_t xdict, const char *key, BOOL value)
{
}

void xpc_dictionary_set_value(xpc_object_t xdict, const char *key, xpc_object_t value)
{
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return _xpc_get_type(object);
}

xpc_object_t xpc_int64_create(int64_t value)
{
  return _xpc_int64_create(value);
}

int64_t xpc_int64_get_value(xpc_object_t xint)
{
  return _xpc_int64_get_value(xint);
}

xpc_object_t xpc_string_create(const char *string)
{
  return _xpc_string_create(string);
}

const char *__cdecl xpc_string_get_string_ptr(xpc_object_t xstring)
{
  return _xpc_string_get_string_ptr(xstring);
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return [a1 integerValue];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_objectForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectForKey:");
}