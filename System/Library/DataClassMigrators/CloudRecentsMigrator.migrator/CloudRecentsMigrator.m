void sub_1418(id a1)
{
  uint64_t vars8;

  qword_8550 = [(id)CPSharedResourcesDirectory() stringByAppendingPathComponent:@"Library/Mail/ABRecents.csv"];

  _objc_release_x1();
}

void sub_1514(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_16D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14)
{
  v19 = v17;

  _Unwind_Resume(a1);
}

void sub_1734(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  if ([v4 count] == &dword_4)
  {
    v5 = [v4 objectAtIndex:2];
    if ([*(id *)(a1 + 32) containsObject:v5])
    {
      v6 = [v4 objectAtIndex:0];
      [v6 doubleValue];
      double v8 = v7;

      v9 = +[NSDate dateWithTimeIntervalSinceReferenceDate:v8];
      v10 = [v4 objectAtIndex:1];
      v11 = [v4 objectAtIndex:3];
      v12 = [v11 emailAddressValue];
      v13 = v12;
      if (v12)
      {
        v14 = [v12 simpleAddress];
        v15 = +[CRRecentContactsLibrary recentEventForAddress:v14 displayName:v10 kind:CRAddressKindEmail date:v9 weight:0 metadata:0 options:0];

        if (v15)
        {
          v16 = *(void **)(a1 + 40);
          v18 = v15;
          v17 = +[NSArray arrayWithObjects:&v18 count:1];
          [v16 recordContactEvents:v17 recentsDomain:@"com.apple.mobilemail" sendingAddress:0 source:@"com.apple.mobilemail" userInitiated:0];
        }
      }
    }
  }
}

void sub_1910(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A74(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AD4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  v10 = v9;
  a9.receiver = v10;
  a9.super_class = (Class)CRCSVParser;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void sub_1B80(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1CB0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E9C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1F44(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2074(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21CC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2420(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2568(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_26D4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2818(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_28BC(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_0, a2, OS_LOG_TYPE_ERROR, "error during csv parsing: %@", (uint8_t *)&v2, 0xCu);
}

void sub_2934()
{
  __assert_rtn("-[CRCSVParser parse]", "CRCSVParser.m", 375, "nil != _stream");
}

uint64_t CPSharedResourcesDirectory()
{
  return _CPSharedResourcesDirectory();
}

uint64_t MFLogGeneral()
{
  return _MFLogGeneral();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

void free(void *a1)
{
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_malloc(size, type_id);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return _memset(__b, __c, __len);
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

{
}

{
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return _objc_msgSendSuper2(a1, a2);
}

void objc_release(id a1)
{
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

void objc_terminate(void)
{
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return _objc_unsafeClaimAutoreleasedReturnValue(a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

id objc_msgSend__availableBytes(void *a1, const char *a2, ...)
{
  return [a1 _availableBytes];
}

id objc_msgSend__parseDoubleQuote(void *a1, const char *a2, ...)
{
  return [a1 _parseDoubleQuote];
}

id objc_msgSend__parseEscapedText(void *a1, const char *a2, ...)
{
  return [a1 _parseEscapedText];
}

id objc_msgSend__parseField(void *a1, const char *a2, ...)
{
  return [a1 _parseField];
}

id objc_msgSend__parseLineSeparator(void *a1, const char *a2, ...)
{
  return [a1 _parseLineSeparator];
}

id objc_msgSend__parseRecord(void *a1, const char *a2, ...)
{
  return [a1 _parseRecord];
}

id objc_msgSend__parseSeparator(void *a1, const char *a2, ...)
{
  return [a1 _parseSeparator];
}

id objc_msgSend__parseText(void *a1, const char *a2, ...)
{
  return [a1 _parseText];
}

id objc_msgSend__parseTwoDoubleQuotes(void *a1, const char *a2, ...)
{
  return [a1 _parseTwoDoubleQuotes];
}

id objc_msgSend_bytes(void *a1, const char *a2, ...)
{
  return [a1 bytes];
}

id objc_msgSend_close(void *a1, const char *a2, ...)
{
  return [a1 close];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_defaultInstance(void *a1, const char *a2, ...)
{
  return [a1 defaultInstance];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return [a1 defaultManager];
}

id objc_msgSend_didFinishParsing(void *a1, const char *a2, ...)
{
  return [a1 didFinishParsing];
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return [a1 doubleValue];
}

id objc_msgSend_emailAddressValue(void *a1, const char *a2, ...)
{
  return [a1 emailAddressValue];
}

id objc_msgSend_fileSize(void *a1, const char *a2, ...)
{
  return [a1 fileSize];
}

id objc_msgSend_hasBytesAvailable(void *a1, const char *a2, ...)
{
  return [a1 hasBytesAvailable];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_open(void *a1, const char *a2, ...)
{
  return [a1 open];
}

id objc_msgSend_parse(void *a1, const char *a2, ...)
{
  return [a1 parse];
}

id objc_msgSend_parseableDataAvailable(void *a1, const char *a2, ...)
{
  return [a1 parseableDataAvailable];
}

id objc_msgSend_recentsExportDataSize(void *a1, const char *a2, ...)
{
  return [a1 recentsExportDataSize];
}

id objc_msgSend_recentsExportPath(void *a1, const char *a2, ...)
{
  return [a1 recentsExportPath];
}

id objc_msgSend_shouldProceedParsing(void *a1, const char *a2, ...)
{
  return [a1 shouldProceedParsing];
}

id objc_msgSend_simpleAddress(void *a1, const char *a2, ...)
{
  return [a1 simpleAddress];
}

id objc_msgSend_string(void *a1, const char *a2, ...)
{
  return [a1 string];
}

id objc_msgSend_stringByAppendingPathComponent_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringByAppendingPathComponent:");
}