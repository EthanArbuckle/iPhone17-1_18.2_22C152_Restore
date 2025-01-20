id _DBGDictionaryDescribesDebugHierarchyObjectReference(void *a1)
{
  void *v1;
  id v2;

  v1 = [a1 objectForKeyedSubscript:@"propertyLogicalType"];
  v2 = [v1 isEqualToString:@"DebugHierarchyLogicalPropertyTypePointer"];

  return v2;
}

id DebugHierarchySnapshotModelOSLog()
{
  if (DebugHierarchySnapshotModelOSLog___dvt_lazy_init_predicate != -1) {
    dispatch_once(&DebugHierarchySnapshotModelOSLog___dvt_lazy_init_predicate, &__block_literal_global_144);
  }
  v0 = (void *)DebugHierarchySnapshotModelOSLog___dvt_lazy_init_variable;

  return v0;
}

id DBGValueClassForPropertyWith(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  id v5 = [v3 length];
  if (v5)
  {
    if ([v3 isEqualToString:@"DebugHierarchyLogicalPropertyTypeCustom"]
      || [v3 isEqualToString:@"DebugHierarchyLogicalPropertyTypeClass"]
      || [v3 isEqualToString:@"DebugHierarchyLogicalPropertyTypeObjectInfo"]
      || [v3 isEqualToString:@"DebugHierarchyLogicalPropertyTypePointer"]
      || [v3 isEqualToString:@"DebugHierarchyLogicalPropertyTypeEnum"]
      || [v3 isEqualToString:@"DebugHierarchyLogicalPropertyTypeData"]
      || [v3 isEqualToString:@"DebugHierarchyLogicalPropertyTypeBool"])
    {
      goto LABEL_61;
    }
    if ([v3 isEqualToString:@"DebugHierarchyLogicalPropertyTypeNumber"])
    {
      if ([v4 isEqualToString:@"CGf"]
        || [v4 isEqualToString:@"f"]
        || [v4 isEqualToString:@"d"]
        || [v4 isEqualToString:@"integer"]
        || [v4 isEqualToString:@"uinteger"]
        || [v4 isEqualToString:@"i"]
        || [v4 isEqualToString:@"ui"]
        || [v4 isEqualToString:@"l"]
        || [v4 isEqualToString:@"ul"]
        || [v4 isEqualToString:@"ll"]
        || [v4 isEqualToString:@"ull"])
      {
LABEL_61:
        id v5 = (id)objc_opt_class();
        goto LABEL_62;
      }
      NSLog(&cfstr_SErrorUnsuppor.isa, "Class<DBGValue> DBGValueClassForPropertyWith(NSString *__strong, NSString *__strong)", v4);
    }
    else if ([v3 isEqualToString:@"DebugHierarchyLogicalPropertyTypeString"] {
           || [v3 isEqualToString:@"DebugHierarchyLogicalPropertyTypeAttributedString"]|| objc_msgSend(v3, "isEqualToString:", @"DebugHierarchyLogicalPropertyTypeColor")|| objc_msgSend(v3, "isEqualToString:", @"DebugHierarchyLogicalPropertyTypeImage")|| objc_msgSend(v3, "isEqualToString:", @"DebugHierarchyLogicalPropertyTypeFont")|| objc_msgSend(v3, "isEqualToString:", @"DebugHierarchyLogicalPropertyTypePoint")|| objc_msgSend(v3, "isEqualToString:", @"DebugHierarchyLogicalPropertyTypeSize")|| objc_msgSend(v3, "isEqualToString:", @"DebugHierarchyLogicalPropertyTypeRect")|| objc_msgSend(v3, "isEqualToString:", @"DebugHierarchyLogicalPropertyTypeOffset")|| objc_msgSend(v3, "isEqualToString:", @"DebugHierarchyLogicalPropertyTypeInsets")|| objc_msgSend(v3, "isEqualToString:", @"DebugHierarchyLogicalPropertyTypeVector2")|| objc_msgSend(v3, "isEqualToString:", @"DebugHierarchyLogicalPropertyTypeVector3")|| objc_msgSend(v3, "isEqualToString:", @"DebugHierarchyLogicalPropertyTypeVector4")|| objc_msgSend(v3, "isEqualToString:", @"DebugHierarchyLogicalPropertyTypeMatrix2")|| objc_msgSend(v3, "isEqualToString:", @"DebugHierarchyLogicalPropertyTypeMatrix3")|| objc_msgSend(v3, "isEqualToString:", @"DebugHierarchyLogicalPropertyTypeMatrix4"))
    }
    {
      goto LABEL_61;
    }
    id v5 = 0;
  }
LABEL_62:
  id v6 = v5;

  return v6;
}

void sub_AC7C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

CFArrayRef CFArrayCreate(CFAllocatorRef allocator, const void **values, CFIndex numValues, const CFArrayCallBacks *callBacks)
{
  return _CFArrayCreate(allocator, values, numValues, callBacks);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return _CFArrayGetCount(theArray);
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return _CFArrayGetValueAtIndex(theArray, idx);
}

void CFDictionaryAddValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return _CFDictionaryCreateMutable(allocator, capacity, keyCallBacks, valueCallBacks);
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return _CFDictionaryGetValue(theDict, key);
}

Boolean CFDictionaryGetValueIfPresent(CFDictionaryRef theDict, const void *key, const void **value)
{
  return _CFDictionaryGetValueIfPresent(theDict, key, value);
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return _CFNumberCreate(allocator, theType, valuePtr);
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return _CFNumberGetValue(number, theType, valuePtr);
}

void CFRelease(CFTypeRef cf)
{
}

void CFStringAppend(CFMutableStringRef theString, CFStringRef appendedString)
{
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return _CFStringCompare(theString1, theString2, compareOptions);
}

CFMutableStringRef CFStringCreateMutable(CFAllocatorRef alloc, CFIndex maxLength)
{
  return _CFStringCreateMutable(alloc, maxLength);
}

CGColorRef CGColorCreate(CGColorSpaceRef space, const CGFloat *components)
{
  return _CGColorCreate(space, components);
}

CGColorSpaceRef CGColorGetColorSpace(CGColorRef color)
{
  return _CGColorGetColorSpace(color);
}

const CGFloat *__cdecl CGColorGetComponents(CGColorRef color)
{
  return _CGColorGetComponents(color);
}

size_t CGColorGetNumberOfComponents(CGColorRef color)
{
  return _CGColorGetNumberOfComponents(color);
}

void CGColorRelease(CGColorRef color)
{
}

CGColorRef CGColorRetain(CGColorRef color)
{
  return _CGColorRetain(color);
}

CFStringRef CGColorSpaceCopyName(CGColorSpaceRef space)
{
  return _CGColorSpaceCopyName(space);
}

CGColorSpaceRef CGColorSpaceCreateWithName(CFStringRef name)
{
  return _CGColorSpaceCreateWithName(name);
}

CGColorSpaceModel CGColorSpaceGetModel(CGColorSpaceRef space)
{
  return _CGColorSpaceGetModel(space);
}

void CGColorSpaceRelease(CGColorSpaceRef space)
{
}

uint64_t DBGDecodeValueFromJSONCompatibleValue()
{
  return _DBGDecodeValueFromJSONCompatibleValue();
}

uint64_t DBGEncodeValueAsJSONCompatibleValue()
{
  return _DBGEncodeValueAsJSONCompatibleValue();
}

void NSLog(NSString *format, ...)
{
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return _NSStringFromClass(aClass);
}

NSString *__cdecl NSStringFromProtocol(Protocol *proto)
{
  return _NSStringFromProtocol(proto);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
}

void free(void *a1)
{
}

pid_t getpid(void)
{
  return _getpid();
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_malloc(size, type_id);
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

void objc_copyStruct(void *dest, const void *src, ptrdiff_t size, BOOL atomic, BOOL hasStrong)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_enumerationMutation(id obj)
{
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return _objc_getProperty(self, _cmd, offset, atomic);
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

uint64_t objc_opt_new()
{
  return _objc_opt_new();
}

uint64_t objc_opt_respondsToSelector()
{
  return _objc_opt_respondsToSelector();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

id objc_retainAutorelease(id a1)
{
  return _a1;
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
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

BOOL os_signpost_enabled(os_log_t log)
{
  return _os_signpost_enabled(log);
}

os_signpost_id_t os_signpost_id_make_with_pointer(os_log_t log, const void *ptr)
{
  return _os_signpost_id_make_with_pointer(log, ptr);
}

void xpc_connection_activate(xpc_connection_t connection)
{
}

void xpc_connection_cancel(xpc_connection_t connection)
{
}

xpc_connection_t xpc_connection_create_mach_service(const char *name, dispatch_queue_t targetq, uint64_t flags)
{
  return _xpc_connection_create_mach_service(name, targetq, flags);
}

void xpc_connection_send_message_with_reply(xpc_connection_t connection, xpc_object_t message, dispatch_queue_t replyq, xpc_handler_t handler)
{
}

void xpc_connection_set_event_handler(xpc_connection_t connection, xpc_handler_t handler)
{
}

xpc_object_t xpc_dictionary_create_empty(void)
{
  return _xpc_dictionary_create_empty();
}

void xpc_dictionary_set_fd(xpc_object_t xdict, const char *key, int fd)
{
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
}

void xpc_dictionary_set_uint64(xpc_object_t xdict, const char *key, uint64_t value)
{
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return _xpc_get_type(object);
}

id objc_msgSend_CGColor(void *a1, const char *a2, ...)
{
  return [a1 CGColor];
}

id objc_msgSend_CGFloatValue(void *a1, const char *a2, ...)
{
  return [a1 CGFloatValue];
}

id objc_msgSend_JSONCompatibleRepresentation(void *a1, const char *a2, ...)
{
  return [a1 JSONCompatibleRepresentation];
}

id objc_msgSend_UUID(void *a1, const char *a2, ...)
{
  return [a1 UUID];
}

id objc_msgSend_UUIDString(void *a1, const char *a2, ...)
{
  return [a1 UUIDString];
}

id objc_msgSend__crossPlatformPropertyActions(void *a1, const char *a2, ...)
{
  return [a1 _crossPlatformPropertyActions];
}

id objc_msgSend__effectViewClassNames(void *a1, const char *a2, ...)
{
  return [a1 _effectViewClassNames];
}

id objc_msgSend__enqueueAdditionalRequests(void *a1, const char *a2, ...)
{
  return [a1 _enqueueAdditionalRequests];
}

id objc_msgSend__enqueueInitialRequest(void *a1, const char *a2, ...)
{
  return [a1 _enqueueInitialRequest];
}

id objc_msgSend__enqueueRemainingUnfetchedPropertyValuesRequest(void *a1, const char *a2, ...)
{
  return [a1 _enqueueRemainingUnfetchedPropertyValuesRequest];
}

id objc_msgSend__metadata(void *a1, const char *a2, ...)
{
  return [a1 _metadata];
}

id objc_msgSend__performNextRequest(void *a1, const char *a2, ...)
{
  return [a1 _performNextRequest];
}

id objc_msgSend__propertyActionsForMac(void *a1, const char *a2, ...)
{
  return [a1 _propertyActionsForMac];
}

id objc_msgSend__propertyActionsForMacCatalyst(void *a1, const char *a2, ...)
{
  return [a1 _propertyActionsForMacCatalyst];
}

id objc_msgSend__propertyActionsForTvOS(void *a1, const char *a2, ...)
{
  return [a1 _propertyActionsForTvOS];
}

id objc_msgSend__propertyActionsForWatchOS(void *a1, const char *a2, ...)
{
  return [a1 _propertyActionsForWatchOS];
}

id objc_msgSend__propertyActionsForiOS(void *a1, const char *a2, ...)
{
  return [a1 _propertyActionsForiOS];
}

id objc_msgSend__saveCompletedRequests(void *a1, const char *a2, ...)
{
  return [a1 _saveCompletedRequests];
}

id objc_msgSend_additionalGroups(void *a1, const char *a2, ...)
{
  return [a1 additionalGroups];
}

id objc_msgSend_allObjects(void *a1, const char *a2, ...)
{
  return [a1 allObjects];
}

id objc_msgSend_allProperties(void *a1, const char *a2, ...)
{
  return [a1 allProperties];
}

id objc_msgSend_allSubproperties(void *a1, const char *a2, ...)
{
  return [a1 allSubproperties];
}

id objc_msgSend_allValues(void *a1, const char *a2, ...)
{
  return [a1 allValues];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_attributedString(void *a1, const char *a2, ...)
{
  return [a1 attributedString];
}

id objc_msgSend_backingRuntimeTypeProperty(void *a1, const char *a2, ...)
{
  return [a1 backingRuntimeTypeProperty];
}

id objc_msgSend_backingTypeIsDouble(void *a1, const char *a2, ...)
{
  return [a1 backingTypeIsDouble];
}

id objc_msgSend_base64Encoded(void *a1, const char *a2, ...)
{
  return [a1 base64Encoded];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_cancel(void *a1, const char *a2, ...)
{
  return [a1 cancel];
}

id objc_msgSend_cancelAllRequests(void *a1, const char *a2, ...)
{
  return [a1 cancelAllRequests];
}

id objc_msgSend_captureQueue(void *a1, const char *a2, ...)
{
  return [a1 captureQueue];
}

id objc_msgSend_childGroup(void *a1, const char *a2, ...)
{
  return [a1 childGroup];
}

id objc_msgSend_className(void *a1, const char *a2, ...)
{
  return [a1 className];
}

id objc_msgSend_clearData(void *a1, const char *a2, ...)
{
  return [a1 clearData];
}

id objc_msgSend_closeConnection(void *a1, const char *a2, ...)
{
  return [a1 closeConnection];
}

id objc_msgSend_closeFile(void *a1, const char *a2, ...)
{
  return [a1 closeFile];
}

id objc_msgSend_completedRequests(void *a1, const char *a2, ...)
{
  return [a1 completedRequests];
}

id objc_msgSend_completion(void *a1, const char *a2, ...)
{
  return [a1 completion];
}

id objc_msgSend_completionBlock(void *a1, const char *a2, ...)
{
  return [a1 completionBlock];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_customValue(void *a1, const char *a2, ...)
{
  return [a1 customValue];
}

id objc_msgSend_data(void *a1, const char *a2, ...)
{
  return [a1 data];
}

id objc_msgSend_dataSourceConnection(void *a1, const char *a2, ...)
{
  return [a1 dataSourceConnection];
}

id objc_msgSend_dataValue(void *a1, const char *a2, ...)
{
  return [a1 dataValue];
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return [a1 date];
}

id objc_msgSend_dateOrderedDirectoryContents(void *a1, const char *a2, ...)
{
  return [a1 dateOrderedDirectoryContents];
}

id objc_msgSend_dbgBoolValue(void *a1, const char *a2, ...)
{
  return [a1 dbgBoolValue];
}

id objc_msgSend_dbgCGFloatValue(void *a1, const char *a2, ...)
{
  return [a1 dbgCGFloatValue];
}

id objc_msgSend_dbgDataValue(void *a1, const char *a2, ...)
{
  return [a1 dbgDataValue];
}

id objc_msgSend_dbgDoubleValue(void *a1, const char *a2, ...)
{
  return [a1 dbgDoubleValue];
}

id objc_msgSend_dbgFloatValue(void *a1, const char *a2, ...)
{
  return [a1 dbgFloatValue];
}

id objc_msgSend_dbgIntValue(void *a1, const char *a2, ...)
{
  return [a1 dbgIntValue];
}

id objc_msgSend_dbgIntegerValue(void *a1, const char *a2, ...)
{
  return [a1 dbgIntegerValue];
}

id objc_msgSend_dbgLongLongValue(void *a1, const char *a2, ...)
{
  return [a1 dbgLongLongValue];
}

id objc_msgSend_dbgLongValue(void *a1, const char *a2, ...)
{
  return [a1 dbgLongValue];
}

id objc_msgSend_dbgUnsignedIntValue(void *a1, const char *a2, ...)
{
  return [a1 dbgUnsignedIntValue];
}

id objc_msgSend_dbgUnsignedIntegerValue(void *a1, const char *a2, ...)
{
  return [a1 dbgUnsignedIntegerValue];
}

id objc_msgSend_dbgUnsignedLongLongValue(void *a1, const char *a2, ...)
{
  return [a1 dbgUnsignedLongLongValue];
}

id objc_msgSend_dbgUnsignedLongValue(void *a1, const char *a2, ...)
{
  return [a1 dbgUnsignedLongValue];
}

id objc_msgSend_debugDescription(void *a1, const char *a2, ...)
{
  return [a1 debugDescription];
}

id objc_msgSend_debugHierarchyVersion(void *a1, const char *a2, ...)
{
  return [a1 debugHierarchyVersion];
}

id objc_msgSend_defaultDisplayName(void *a1, const char *a2, ...)
{
  return [a1 defaultDisplayName];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return [a1 defaultManager];
}

id objc_msgSend_defaultPlatform(void *a1, const char *a2, ...)
{
  return [a1 defaultPlatform];
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return [a1 delegate];
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return [a1 description];
}

id objc_msgSend_destination(void *a1, const char *a2, ...)
{
  return [a1 destination];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return [a1 dictionary];
}

id objc_msgSend_dictionaryRepresentation(void *a1, const char *a2, ...)
{
  return [a1 dictionaryRepresentation];
}

id objc_msgSend_directoryURL(void *a1, const char *a2, ...)
{
  return [a1 directoryURL];
}

id objc_msgSend_displayString(void *a1, const char *a2, ...)
{
  return [a1 displayString];
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return [a1 doubleValue];
}

id objc_msgSend_edgeInsets(void *a1, const char *a2, ...)
{
  return [a1 edgeInsets];
}

id objc_msgSend_enqueuedRequests(void *a1, const char *a2, ...)
{
  return [a1 enqueuedRequests];
}

id objc_msgSend_enumValue(void *a1, const char *a2, ...)
{
  return [a1 enumValue];
}

id objc_msgSend_executingRequest(void *a1, const char *a2, ...)
{
  return [a1 executingRequest];
}

id objc_msgSend_executionEndDate(void *a1, const char *a2, ...)
{
  return [a1 executionEndDate];
}

id objc_msgSend_executionStartDate(void *a1, const char *a2, ...)
{
  return [a1 executionStartDate];
}

id objc_msgSend_fileDescriptor(void *a1, const char *a2, ...)
{
  return [a1 fileDescriptor];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return [a1 firstObject];
}

id objc_msgSend_floatValue(void *a1, const char *a2, ...)
{
  return [a1 floatValue];
}

id objc_msgSend_fontDescription(void *a1, const char *a2, ...)
{
  return [a1 fontDescription];
}

id objc_msgSend_format(void *a1, const char *a2, ...)
{
  return [a1 format];
}

id objc_msgSend_groupingIdentifier(void *a1, const char *a2, ...)
{
  return [a1 groupingIdentifier];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return [a1 identifier];
}

id objc_msgSend_identifierToNodeMap(void *a1, const char *a2, ...)
{
  return [a1 identifierToNodeMap];
}

id objc_msgSend_instanceProperties(void *a1, const char *a2, ...)
{
  return [a1 instanceProperties];
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return [a1 intValue];
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return [a1 integerValue];
}

id objc_msgSend_keyEnumerator(void *a1, const char *a2, ...)
{
  return [a1 keyEnumerator];
}

id objc_msgSend_lastObject(void *a1, const char *a2, ...)
{
  return [a1 lastObject];
}

id objc_msgSend_lastPathComponent(void *a1, const char *a2, ...)
{
  return [a1 lastPathComponent];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_localTimeZone(void *a1, const char *a2, ...)
{
  return [a1 localTimeZone];
}

id objc_msgSend_localizedDescription(void *a1, const char *a2, ...)
{
  return [a1 localizedDescription];
}

id objc_msgSend_logicalType(void *a1, const char *a2, ...)
{
  return [a1 logicalType];
}

id objc_msgSend_logs(void *a1, const char *a2, ...)
{
  return [a1 logs];
}

id objc_msgSend_longLongValue(void *a1, const char *a2, ...)
{
  return [a1 longLongValue];
}

id objc_msgSend_longValue(void *a1, const char *a2, ...)
{
  return [a1 longValue];
}

id objc_msgSend_matrix2(void *a1, const char *a2, ...)
{
  return [a1 matrix2];
}

id objc_msgSend_matrix3(void *a1, const char *a2, ...)
{
  return [a1 matrix3];
}

id objc_msgSend_matrix4(void *a1, const char *a2, ...)
{
  return [a1 matrix4];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return [a1 mutableCopy];
}

id objc_msgSend_mutableProperties(void *a1, const char *a2, ...)
{
  return [a1 mutableProperties];
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return [a1 name];
}

id objc_msgSend_objectClassName(void *a1, const char *a2, ...)
{
  return [a1 objectClassName];
}

id objc_msgSend_objectEnumerator(void *a1, const char *a2, ...)
{
  return [a1 objectEnumerator];
}

id objc_msgSend_objectInfo(void *a1, const char *a2, ...)
{
  return [a1 objectInfo];
}

id objc_msgSend_objectPointer(void *a1, const char *a2, ...)
{
  return [a1 objectPointer];
}

id objc_msgSend_objectValue(void *a1, const char *a2, ...)
{
  return [a1 objectValue];
}

id objc_msgSend_objects(void *a1, const char *a2, ...)
{
  return [a1 objects];
}

id objc_msgSend_offset(void *a1, const char *a2, ...)
{
  return [a1 offset];
}

id objc_msgSend_options(void *a1, const char *a2, ...)
{
  return [a1 options];
}

id objc_msgSend_parentNode(void *a1, const char *a2, ...)
{
  return [a1 parentNode];
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return [a1 path];
}

id objc_msgSend_pathExtension(void *a1, const char *a2, ...)
{
  return [a1 pathExtension];
}

id objc_msgSend_pendingChildNodes(void *a1, const char *a2, ...)
{
  return [a1 pendingChildNodes];
}

id objc_msgSend_platform(void *a1, const char *a2, ...)
{
  return [a1 platform];
}

id objc_msgSend_point(void *a1, const char *a2, ...)
{
  return [a1 point];
}

id objc_msgSend_primaryDataCoordinator(void *a1, const char *a2, ...)
{
  return [a1 primaryDataCoordinator];
}

id objc_msgSend_priority(void *a1, const char *a2, ...)
{
  return [a1 priority];
}

id objc_msgSend_propertyObservers(void *a1, const char *a2, ...)
{
  return [a1 propertyObservers];
}

id objc_msgSend_rawResponseData(void *a1, const char *a2, ...)
{
  return [a1 rawResponseData];
}

id objc_msgSend_readDataToEndOfFile(void *a1, const char *a2, ...)
{
  return [a1 readDataToEndOfFile];
}

id objc_msgSend_rect(void *a1, const char *a2, ...)
{
  return [a1 rect];
}

id objc_msgSend_removeAllObjects(void *a1, const char *a2, ...)
{
  return [a1 removeAllObjects];
}

id objc_msgSend_rootLevelGroup(void *a1, const char *a2, ...)
{
  return [a1 rootLevelGroup];
}

id objc_msgSend_rootLevelGroups(void *a1, const char *a2, ...)
{
  return [a1 rootLevelGroups];
}

id objc_msgSend_rootLevelSnapshotGroups(void *a1, const char *a2, ...)
{
  return [a1 rootLevelSnapshotGroups];
}

id objc_msgSend_runnablePid(void *a1, const char *a2, ...)
{
  return [a1 runnablePid];
}

id objc_msgSend_runtimeInfo(void *a1, const char *a2, ...)
{
  return [a1 runtimeInfo];
}

id objc_msgSend_runtimeType(void *a1, const char *a2, ...)
{
  return [a1 runtimeType];
}

id objc_msgSend_runtimeTypeName(void *a1, const char *a2, ...)
{
  return [a1 runtimeTypeName];
}

id objc_msgSend_serializedCompatibilitySupportRepresentation(void *a1, const char *a2, ...)
{
  return [a1 serializedCompatibilitySupportRepresentation];
}

id objc_msgSend_shouldStoreCompletedRequests(void *a1, const char *a2, ...)
{
  return [a1 shouldStoreCompletedRequests];
}

id objc_msgSend_size(void *a1, const char *a2, ...)
{
  return [a1 size];
}

id objc_msgSend_snapshot(void *a1, const char *a2, ...)
{
  return [a1 snapshot];
}

id objc_msgSend_snapshotManager(void *a1, const char *a2, ...)
{
  return [a1 snapshotManager];
}

id objc_msgSend_snapshotNode(void *a1, const char *a2, ...)
{
  return [a1 snapshotNode];
}

id objc_msgSend_snapshotTransformerStore(void *a1, const char *a2, ...)
{
  return [a1 snapshotTransformerStore];
}

id objc_msgSend_snapshotTransformers(void *a1, const char *a2, ...)
{
  return [a1 snapshotTransformers];
}

id objc_msgSend_standardUserDefaults(void *a1, const char *a2, ...)
{
  return [a1 standardUserDefaults];
}

id objc_msgSend_status(void *a1, const char *a2, ...)
{
  return [a1 status];
}

id objc_msgSend_string(void *a1, const char *a2, ...)
{
  return [a1 string];
}

id objc_msgSend_stringByExpandingTildeInPath(void *a1, const char *a2, ...)
{
  return [a1 stringByExpandingTildeInPath];
}

id objc_msgSend_strongObjectsPointerArray(void *a1, const char *a2, ...)
{
  return [a1 strongObjectsPointerArray];
}

id objc_msgSend_strongToWeakObjectsMapTable(void *a1, const char *a2, ...)
{
  return [a1 strongToWeakObjectsMapTable];
}

id objc_msgSend_subpropertiesMap(void *a1, const char *a2, ...)
{
  return [a1 subpropertiesMap];
}

id objc_msgSend_temporaryDirectory(void *a1, const char *a2, ...)
{
  return [a1 temporaryDirectory];
}

id objc_msgSend_unsignedIntValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedIntValue];
}

id objc_msgSend_unsignedIntegerValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedIntegerValue];
}

id objc_msgSend_unsignedLongLongValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedLongLongValue];
}

id objc_msgSend_unsignedLongValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedLongValue];
}

id objc_msgSend_value(void *a1, const char *a2, ...)
{
  return [a1 value];
}

id objc_msgSend_vector2(void *a1, const char *a2, ...)
{
  return [a1 vector2];
}

id objc_msgSend_vector3(void *a1, const char *a2, ...)
{
  return [a1 vector3];
}

id objc_msgSend_vector4(void *a1, const char *a2, ...)
{
  return [a1 vector4];
}

id objc_msgSend_visibility(void *a1, const char *a2, ...)
{
  return [a1 visibility];
}

id objc_msgSend_weakObjectsPointerArray(void *a1, const char *a2, ...)
{
  return [a1 weakObjectsPointerArray];
}

id objc_msgSend_writeToURL_options_originalContentsURL_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writeToURL:options:originalContentsURL:error:");
}