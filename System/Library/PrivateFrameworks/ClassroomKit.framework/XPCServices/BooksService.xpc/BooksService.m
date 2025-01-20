void sub_100004FE8(id a1)
{
  uint64_t vars8;

  qword_1000121B0 = (uint64_t)os_log_create("com.apple.classroom", "General");

  _objc_release_x1();
}

int main(int argc, const char **argv, const char **envp)
{
  v4 = objc_opt_new();
  v5 = [v4 makePrimitives];

  if ([v5 enter])
  {
    v6 = objc_opt_new();

    int v7 = [v6 run];

    return v7;
  }
  else
  {

    return 1;
  }
}

id sub_100005874()
{
  v0 = objc_opt_new();
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  v1 = +[BLLibrary defaultBookLibrary];
  v2 = [v1 allBookItems];

  id v3 = [v2 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v18;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v18 != v5) {
          objc_enumerationMutation(v2);
        }
        int v7 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        v8 = objc_opt_new();
        v9 = [v7 title];
        [v8 setTitle:v9];

        v10 = [v7 author];
        [v8 setAuthor:v10];

        v11 = [v7 path];
        [v8 setPath:v11];

        v12 = [v7 storeIdentifier];
        [v8 setStoreIdentifier:v12];

        v13 = [v7 identifier];
        [v8 setIdentifier:v13];

        v14 = [v7 legacyUniqueIdentifier];
        [v8 setLegacyUniqueIdentifier:v14];

        if ([v7 type])
        {
          if ([v7 type] == (id)1)
          {
            uint64_t v15 = 1;
          }
          else if ([v7 type] == (id)2)
          {
            uint64_t v15 = 2;
          }
          else
          {
            uint64_t v15 = 3;
          }
        }
        else
        {
          uint64_t v15 = 0;
        }
        [v8 setType:v15];
        [v0 addObject:v8];
      }
      id v4 = [v2 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v4);
  }

  return v0;
}

id sub_100005AD4(uint64_t a1)
{
  return [*(id *)(a1 + 32) finishOperation];
}

void sub_100005C80(id a1)
{
  qword_1000121C0 = (uint64_t)os_log_create("com.apple.classroom", "General");

  _objc_release_x1();
}

void sub_1000075AC(id a1)
{
  qword_1000121D0 = (uint64_t)os_log_create("com.apple.classroom", "General");

  _objc_release_x1();
}

void sub_100007708(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  id v4 = [*(id *)(a1 + 32) resultObject];
  id v3 = [*(id *)(a1 + 32) error];
  (*(void (**)(uint64_t, id, void *))(v2 + 16))(v2, v4, v3);
}

void sub_100007848(uint64_t a1)
{
  uint64_t v2 = [[CBSFetchBooksOperation alloc] initWithRequest:*(void *)(a1 + 32)];
  [*(id *)(a1 + 40) performOperation:v2 completion:*(void *)(a1 + 48)];
}

void sub_100007970(uint64_t a1)
{
  uint64_t v2 = [[CBSFetchChaptersOperation alloc] initWithRequest:*(void *)(a1 + 32)];
  [*(id *)(a1 + 40) performOperation:v2 completion:*(void *)(a1 + 48)];
}

void sub_1000084D0(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = [a2 title];
  uint64_t v5 = [a2 tableOfContentsMediaType];
  int v6 = 138543618;
  int v7 = v4;
  __int16 v8 = 2114;
  v9 = v5;
  _os_log_error_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "%{public}@ has unsupported table of contents format: %{public}@", (uint8_t *)&v6, 0x16u);
}

void sub_1000085A0(void *a1, void *a2)
{
  id v3 = a1;
  v4[0] = 67109378;
  v4[1] = [a2 processIdentifier];
  __int16 v5 = 2114;
  CFStringRef v6 = @"com.apple.ClassroomKit.BooksService-access";
  _os_log_error_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "Denying connection from (%d) as it lacks a valid entitlement (%{public}@).", (uint8_t *)v4, 0x12u);
}

uint64_t CATErrorWithCodeAndUserInfo()
{
  return _CATErrorWithCodeAndUserInfo();
}

void CFRelease(CFTypeRef cf)
{
}

CGImageRef CGBitmapContextCreateImage(CGContextRef context)
{
  return _CGBitmapContextCreateImage(context);
}

void CGContextConcatCTM(CGContextRef c, CGAffineTransform *transform)
{
}

void CGContextDrawPDFPage(CGContextRef c, CGPDFPageRef page)
{
}

void CGContextFillRect(CGContextRef c, CGRect rect)
{
}

void CGContextRelease(CGContextRef c)
{
}

void CGContextScaleCTM(CGContextRef c, CGFloat sx, CGFloat sy)
{
}

void CGContextSetRGBFillColor(CGContextRef c, CGFloat red, CGFloat green, CGFloat blue, CGFloat alpha)
{
}

void CGContextTranslateCTM(CGContextRef c, CGFloat tx, CGFloat ty)
{
}

void CGImageRelease(CGImageRef image)
{
}

BOOL CGPDFDictionaryGetString(CGPDFDictionaryRef dict, const char *key, CGPDFStringRef *value)
{
  return _CGPDFDictionaryGetString(dict, key, value);
}

CGPDFDocumentRef CGPDFDocumentCreateWithURL(CFURLRef url)
{
  return _CGPDFDocumentCreateWithURL(url);
}

CGPDFDictionaryRef CGPDFDocumentGetInfo(CGPDFDocumentRef document)
{
  return _CGPDFDocumentGetInfo(document);
}

CGPDFPageRef CGPDFDocumentGetPage(CGPDFDocumentRef document, size_t pageNumber)
{
  return _CGPDFDocumentGetPage(document, pageNumber);
}

CGRect CGPDFPageGetBoxRect(CGPDFPageRef page, CGPDFBox box)
{
  return _CGPDFPageGetBoxRect(page, box);
}

CGAffineTransform *__cdecl CGPDFPageGetDrawingTransform(CGAffineTransform *__return_ptr retstr, CGPDFPageRef page, CGPDFBox box, CGRect rect, int rotate, BOOL preserveAspectRatio)
{
  return _CGPDFPageGetDrawingTransform(retstr, page, box, rect, rotate, preserveAspectRatio);
}

CFStringRef CGPDFStringCopyTextString(CGPDFStringRef string)
{
  return _CGPDFStringCopyTextString(string);
}

uint64_t CRKBooksServiceXPCInterface()
{
  return _CRKBooksServiceXPCInterface();
}

uint64_t CRKErrorWithCodeAndUserInfo()
{
  return _CRKErrorWithCodeAndUserInfo();
}

uint64_t NSStringFromCRKBookType()
{
  return _NSStringFromCRKBookType();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

id objc_autorelease(id a1)
{
  return _objc_autorelease(a1);
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

uint64_t objc_opt_new()
{
  return _objc_opt_new();
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

id objc_msgSend_URLPathAllowedCharacterSet(void *a1, const char *a2, ...)
{
  return [a1 URLPathAllowedCharacterSet];
}

id objc_msgSend_abortParsing(void *a1, const char *a2, ...)
{
  return [a1 abortParsing];
}

id objc_msgSend_allBookItems(void *a1, const char *a2, ...)
{
  return [a1 allBookItems];
}

id objc_msgSend_author(void *a1, const char *a2, ...)
{
  return [a1 author];
}

id objc_msgSend_book(void *a1, const char *a2, ...)
{
  return [a1 book];
}

id objc_msgSend_bookIdentifier(void *a1, const char *a2, ...)
{
  return [a1 bookIdentifier];
}

id objc_msgSend_bookIdentifierType(void *a1, const char *a2, ...)
{
  return [a1 bookIdentifierType];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_cleanUp(void *a1, const char *a2, ...)
{
  return [a1 cleanUp];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_coverImagePath(void *a1, const char *a2, ...)
{
  return [a1 coverImagePath];
}

id objc_msgSend_defaultBookLibrary(void *a1, const char *a2, ...)
{
  return [a1 defaultBookLibrary];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return [a1 defaultManager];
}

id objc_msgSend_enter(void *a1, const char *a2, ...)
{
  return [a1 enter];
}

id objc_msgSend_error(void *a1, const char *a2, ...)
{
  return [a1 error];
}

id objc_msgSend_fileName(void *a1, const char *a2, ...)
{
  return [a1 fileName];
}

id objc_msgSend_filePath(void *a1, const char *a2, ...)
{
  return [a1 filePath];
}

id objc_msgSend_finishOperation(void *a1, const char *a2, ...)
{
  return [a1 finishOperation];
}

id objc_msgSend_fragment(void *a1, const char *a2, ...)
{
  return [a1 fragment];
}

id objc_msgSend_host(void *a1, const char *a2, ...)
{
  return [a1 host];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return [a1 identifier];
}

id objc_msgSend_identifierType(void *a1, const char *a2, ...)
{
  return [a1 identifierType];
}

id objc_msgSend_image(void *a1, const char *a2, ...)
{
  return [a1 image];
}

id objc_msgSend_includeImages(void *a1, const char *a2, ...)
{
  return [a1 includeImages];
}

id objc_msgSend_isCanceled(void *a1, const char *a2, ...)
{
  return [a1 isCanceled];
}

id objc_msgSend_isExecuting(void *a1, const char *a2, ...)
{
  return [a1 isExecuting];
}

id objc_msgSend_isRenderPDFThumbnailsEnabled(void *a1, const char *a2, ...)
{
  return [a1 isRenderPDFThumbnailsEnabled];
}

id objc_msgSend_itemPathsByIdentifier(void *a1, const char *a2, ...)
{
  return [a1 itemPathsByIdentifier];
}

id objc_msgSend_lastObject(void *a1, const char *a2, ...)
{
  return [a1 lastObject];
}

id objc_msgSend_lastPathComponent(void *a1, const char *a2, ...)
{
  return [a1 lastPathComponent];
}

id objc_msgSend_legacyUniqueIdentifier(void *a1, const char *a2, ...)
{
  return [a1 legacyUniqueIdentifier];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_mainQueue(void *a1, const char *a2, ...)
{
  return [a1 mainQueue];
}

id objc_msgSend_makeFeatureFlags(void *a1, const char *a2, ...)
{
  return [a1 makeFeatureFlags];
}

id objc_msgSend_makePrimitives(void *a1, const char *a2, ...)
{
  return [a1 makePrimitives];
}

id objc_msgSend_parse(void *a1, const char *a2, ...)
{
  return [a1 parse];
}

id objc_msgSend_parseImage(void *a1, const char *a2, ...)
{
  return [a1 parseImage];
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return [a1 path];
}

id objc_msgSend_processIdentifier(void *a1, const char *a2, ...)
{
  return [a1 processIdentifier];
}

id objc_msgSend_removeLastObject(void *a1, const char *a2, ...)
{
  return [a1 removeLastObject];
}

id objc_msgSend_resultObject(void *a1, const char *a2, ...)
{
  return [a1 resultObject];
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return [a1 resume];
}

id objc_msgSend_run(void *a1, const char *a2, ...)
{
  return [a1 run];
}

id objc_msgSend_serviceListener(void *a1, const char *a2, ...)
{
  return [a1 serviceListener];
}

id objc_msgSend_spineItemIdentifiers(void *a1, const char *a2, ...)
{
  return [a1 spineItemIdentifiers];
}

id objc_msgSend_storeIdentifier(void *a1, const char *a2, ...)
{
  return [a1 storeIdentifier];
}

id objc_msgSend_stringByDeletingLastPathComponent(void *a1, const char *a2, ...)
{
  return [a1 stringByDeletingLastPathComponent];
}

id objc_msgSend_stringByDeletingPathExtension(void *a1, const char *a2, ...)
{
  return [a1 stringByDeletingPathExtension];
}

id objc_msgSend_subchapters(void *a1, const char *a2, ...)
{
  return [a1 subchapters];
}

id objc_msgSend_tableOfContentsFilePath(void *a1, const char *a2, ...)
{
  return [a1 tableOfContentsFilePath];
}

id objc_msgSend_tableOfContentsMediaType(void *a1, const char *a2, ...)
{
  return [a1 tableOfContentsMediaType];
}

id objc_msgSend_title(void *a1, const char *a2, ...)
{
  return [a1 title];
}

id objc_msgSend_type(void *a1, const char *a2, ...)
{
  return [a1 type];
}

id objc_msgSend_webURL(void *a1, const char *a2, ...)
{
  return [a1 webURL];
}

id objc_msgSend_whitespaceAndNewlineCharacterSet(void *a1, const char *a2, ...)
{
  return [a1 whitespaceAndNewlineCharacterSet];
}