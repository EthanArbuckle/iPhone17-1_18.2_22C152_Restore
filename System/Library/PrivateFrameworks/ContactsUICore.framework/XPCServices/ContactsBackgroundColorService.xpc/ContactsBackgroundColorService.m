uint64_t sub_1000037A4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_1000037BC(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

id sub_100003B74()
{
  if (qword_10000CF20 != -1) {
    dispatch_once(&qword_10000CF20, &stru_100008490);
  }
  v0 = (void *)qword_10000CF28;
  return v0;
}

void sub_100003C1C(id a1)
{
  qword_10000CF18 = +[CNScheduler serialDispatchQueueSchedulerWithName:@"com.apple.contacts.colorExtraction"];
  _objc_release_x1();
}

void sub_100003D64(uint64_t a1)
{
  v2 = (char *)[*(id *)(a1 + 32) hash];
  v3 = sub_100003B74();
  v4 = v3;
  unint64_t v57 = (unint64_t)(v2 - 1);
  if ((unint64_t)(v2 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v3))
  {
    LOWORD(buf.a) = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v4, OS_SIGNPOST_INTERVAL_BEGIN, (os_signpost_id_t)v2, "CNImageDerivedColorFetchColors", (const char *)&unk_100007DAD, (uint8_t *)&buf, 2u);
  }
  os_signpost_id_t spid = (os_signpost_id_t)v2;

  id v5 = [objc_alloc((Class)CIImage) initWithImage:*(void *)(a1 + 32)];
  [v5 extent];
  double v7 = v6;
  double v9 = v8;
  id v10 = [objc_alloc((Class)VNImageRequestHandler) initWithCIImage:v5 options:&__NSDictionary0__struct];
  v11 = objc_opt_new();
  [v11 setRevision:2];
  v69 = v11;
  v13 = +[NSArray arrayWithObjects:&v69 count:1];
  id v66 = 0;
  v59 = v10;
  unsigned __int8 v14 = [v10 performRequests:v13 error:&v66];
  id v15 = v66;

  if (v15 || (v14 & 1) == 0)
  {
    v16 = sub_100003B74();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      sub_100005A90((uint64_t)v15, v16);
    }
  }
  v58 = v11;
  v17 = [v11 results];
  v18 = [v17 firstObject];

  v56 = v18;
  v19 = +[CIImage imageWithCVPixelBuffer:](CIImage, "imageWithCVPixelBuffer:", [v18 pixelBuffer]);
  [v19 extent];
  memset(&buf, 0, sizeof(buf));
  CGAffineTransformMakeScale(&buf, v7 / v20, v9 / v21);
  CGAffineTransform v64 = buf;
  v53 = v19;
  uint64_t v22 = [v19 imageByApplyingTransform:&v64];
  v23 = +[CIFilter colorThresholdFilter];
  v55 = (void *)v22;
  [v23 setInputImage:v22];
  LODWORD(v24) = 0.5;
  [v23 setThreshold:v24];
  uint64_t v25 = [v23 outputImage];
  v26 = +[CIFilter maskToAlphaFilter];
  v54 = (void *)v25;
  [v26 setInputImage:v25];
  uint64_t v27 = [v26 outputImage];
  v28 = +[CIFilter sourceOutCompositingFilter];
  v60 = v5;
  [v28 setInputImage:v5];
  v52 = (void *)v27;
  [v28 setBackgroundImage:v27];
  v29 = [v28 outputImage];
  v67[0] = @"inputWidth";
  v31 = +[NSNumber numberWithDouble:v7];
  v67[1] = @"inputHeight";
  v68[0] = v31;
  v32 = +[NSNumber numberWithDouble:v9];
  v68[1] = v32;
  v33 = +[NSDictionary dictionaryWithObjects:v68 forKeys:v67 count:2];
  v34 = [v29 imageByApplyingFilter:@"CISmartGradient" withInputParameters:v33];

  [v34 extent];
  double v36 = v35;
  double v38 = v37;
  double v40 = v39;
  v41 = *(void **)(a1 + 40);
  if (v41)
  {
    id v42 = v41;
  }
  else
  {
    id v42 = [*(id *)(a1 + 56) ciContextWithHighPriority:1];
  }
  v43 = v42;
  id v44 = objc_msgSend(v42, "createCGImage:fromRect:", v34, v36, v38, 8.0, v40);
  v45 = [(id)objc_opt_class() colorsForImageRef:v44];
  if (v44) {
    CFRelease(v44);
  }
  v46 = sub_100003B74();
  v47 = v46;
  if (v57 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v46))
  {
    LOWORD(v64.a) = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v47, OS_SIGNPOST_INTERVAL_END, spid, "CNImageDerivedColorFetchColors", (const char *)&unk_100007DAD, (uint8_t *)&v64, 2u);
  }

  v48 = +[CNScheduler mainThreadScheduler];
  v61[0] = _NSConcreteStackBlock;
  v61[1] = 3221225472;
  v61[2] = sub_1000042E0;
  v61[3] = &unk_100008420;
  id v49 = *(id *)(a1 + 48);
  id v62 = v45;
  id v63 = v49;
  id v50 = v45;
  [v48 performBlock:v61];
}

uint64_t sub_1000042E0(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void sub_100004834(uint64_t a1, void *a2)
{
  double v10 = 0.0;
  double v11 = 0.0;
  double v8 = 0.0;
  uint64_t v9 = 0;
  double v6 = 0.0;
  double v7 = 0.0;
  [a2 getRed:&v8 green:&v7 blue:&v6 alpha:0];
  double v3 = 0.0;
  if (*(unsigned char *)(a1 + 40)) {
    double v3 = 0.65;
  }
  double v7 = v3 + v7 * 0.35;
  double v8 = v3 + v8 * 0.35;
  double v6 = v3 + v6 * 0.35;
  v4 = +[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", *(void *)&v6, *(void *)&v7, *(void *)&v8);
  [v4 getHue:&v11 saturation:&v10 brightness:&v9 alpha:0];
  double v10 = v10 * 1.6 / (v10 + 0.6);
  id v5 = +[UIColor colorWithHue:saturation:brightness:alpha:](UIColor, "colorWithHue:saturation:brightness:alpha:", v11);
  [*(id *)(a1 + 32) addObject:v5];
}

void sub_100004944(id a1)
{
  qword_10000CF28 = (uint64_t)os_log_create("com.apple.contacts.ui", "backgroundColor");
  _objc_release_x1();
}

id contactsBackgroundColorServiceInterface()
{
  v0 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___CNUIImageBackgroundColorAnalyzing];
  v1 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", objc_opt_class(), 0);
  [v0 setClasses:v1 forSelector:"getBackgroundColorOnImageData:bitmapFormat:withReply:" argumentIndex:1 ofReply:0];

  uint64_t v2 = objc_opt_class();
  double v3 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v2, objc_opt_class(), 0);
  [v0 setClasses:v3 forSelector:"getBackgroundColorOnImageData:bitmapFormat:withReply:" argumentIndex:0 ofReply:1];

  return v0;
}

int main(int argc, const char **argv, const char **envp)
{
  double v3 = objc_opt_new();
  v4 = +[NSXPCListener serviceListener];
  [v4 setDelegate:v3];
  [v4 resume];

  return 0;
}

id sub_100004CB4(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) dictionaryForColor:a2];
}

id sub_100004D48(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) colorFromDictionary:a2];
}

void sub_100005374(_Unwind_Exception *exception_object, int a2)
{
  if (a2)
  {
    objc_begin_catch(exception_object);
    JUMPOUT(0x1000052F0);
  }
  _Unwind_Resume(exception_object);
}

void sub_1000053C4(uint64_t a1)
{
}

void sub_1000053CC(uint64_t a1)
{
}

void sub_1000053D4(id a1, id a2)
{
}

uint64_t sub_100005744(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_1000057A8(id a1)
{
  qword_10000CF38 = (uint64_t)os_log_create("com.apple.contacts.ui", "actions");
  _objc_release_x1();
}

void sub_100005840(id a1)
{
  qword_10000CF48 = (uint64_t)os_log_create("com.apple.contacts.ui", "likenesses");
  _objc_release_x1();
}

void sub_1000058D8(id a1)
{
  qword_10000CF58 = (uint64_t)os_log_create("com.apple.contacts.ui", "core-recents");
  _objc_release_x1();
}

void sub_100005970(id a1)
{
  qword_10000CF68 = (uint64_t)os_log_create("com.apple.contacts.ui", "staticid");
  _objc_release_x1();
}

void sub_100005A08(id a1)
{
  qword_10000CF78 = (uint64_t)os_log_create("com.apple.contacts.ui", "color");
  _objc_release_x1();
}

void sub_100005A4C(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "ImageRef for colors had size 0", v1, 2u);
}

void sub_100005A90(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Error performing VNGenerateObjectnessBasedSaliencyImageRequest in fetchColorsForImage: %@", (uint8_t *)&v2, 0xCu);
}

void sub_100005B08(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Could not create colorSpace from name '%@'; will fall back to using sRGB",
    (uint8_t *)&v2,
    0xCu);
}

void CFRelease(CFTypeRef cf)
{
}

CGAffineTransform *__cdecl CGAffineTransformMakeScale(CGAffineTransform *__return_ptr retstr, CGFloat sx, CGFloat sy)
{
  return _CGAffineTransformMakeScale(retstr, sx, sy);
}

CGContextRef CGBitmapContextCreate(void *data, size_t width, size_t height, size_t bitsPerComponent, size_t bytesPerRow, CGColorSpaceRef space, uint32_t bitmapInfo)
{
  return _CGBitmapContextCreate(data, width, height, bitsPerComponent, bytesPerRow, space, bitmapInfo);
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

CGColorSpaceRef CGColorSpaceCreateDeviceRGB(void)
{
  return _CGColorSpaceCreateDeviceRGB();
}

CGColorSpaceRef CGColorSpaceCreateWithName(CFStringRef name)
{
  return _CGColorSpaceCreateWithName(name);
}

CFStringRef CGColorSpaceGetName(CGColorSpaceRef space)
{
  return _CGColorSpaceGetName(space);
}

void CGColorSpaceRelease(CGColorSpaceRef space)
{
}

void CGContextDrawImage(CGContextRef c, CGRect rect, CGImageRef image)
{
}

void CGContextRelease(CGContextRef c)
{
}

CGDataProviderRef CGDataProviderCreateWithCFData(CFDataRef data)
{
  return _CGDataProviderCreateWithCFData(data);
}

CGImageRef CGImageCreate(size_t width, size_t height, size_t bitsPerComponent, size_t bitsPerPixel, size_t bytesPerRow, CGColorSpaceRef space, CGBitmapInfo bitmapInfo, CGDataProviderRef provider, const CGFloat *decode, BOOL shouldInterpolate, CGColorRenderingIntent intent)
{
  return _CGImageCreate(width, height, bitsPerComponent, bitsPerPixel, bytesPerRow, space, bitmapInfo, provider, decode, shouldInterpolate, intent);
}

size_t CGImageGetHeight(CGImageRef image)
{
  return _CGImageGetHeight(image);
}

size_t CGImageGetWidth(CGImageRef image)
{
  return _CGImageGetWidth(image);
}

void CGImageRelease(CGImageRef image)
{
}

uint64_t UICreateCGImageFromIOSurface()
{
  return _UICreateCGImageFromIOSurface();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
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

{
}

{
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

id objc_begin_catch(void *exc_buf)
{
  return _objc_begin_catch(exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

void objc_end_catch(void)
{
}

void objc_exception_rethrow(void)
{
}

void objc_exception_throw(id exception)
{
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return _objc_getProperty(self, _cmd, offset, atomic);
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

uint64_t self
{
  return _self;
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

id objc_retainBlock(id a1)
{
  return _objc_retainBlock(a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
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

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return _os_log_create(subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return _os_signpost_enabled(log);
}

id objc_msgSend_CGColor(void *a1, const char *a2, ...)
{
  return [a1 CGColor];
}

id objc_msgSend_CGImage(void *a1, const char *a2, ...)
{
  return [a1 CGImage];
}

id objc_msgSend__closeConnection(void *a1, const char *a2, ...)
{
  return [a1 _closeConnection];
}

id objc_msgSend__openConnectionIfNeeded(void *a1, const char *a2, ...)
{
  return [a1 _openConnectionIfNeeded];
}

id objc_msgSend_bitmapInfo(void *a1, const char *a2, ...)
{
  return [a1 bitmapInfo];
}

id objc_msgSend_bitsPerComponent(void *a1, const char *a2, ...)
{
  return [a1 bitsPerComponent];
}

id objc_msgSend_bitsPerPixel(void *a1, const char *a2, ...)
{
  return [a1 bitsPerPixel];
}

id objc_msgSend_bytesPerRow(void *a1, const char *a2, ...)
{
  return [a1 bytesPerRow];
}

id objc_msgSend_colorSpace(void *a1, const char *a2, ...)
{
  return [a1 colorSpace];
}

id objc_msgSend_colorThresholdFilter(void *a1, const char *a2, ...)
{
  return [a1 colorThresholdFilter];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_defaultGrayColors(void *a1, const char *a2, ...)
{
  return [a1 defaultGrayColors];
}

id objc_msgSend_extent(void *a1, const char *a2, ...)
{
  return [a1 extent];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return [a1 firstObject];
}

id objc_msgSend_hash(void *a1, const char *a2, ...)
{
  return [a1 hash];
}

id objc_msgSend_height(void *a1, const char *a2, ...)
{
  return [a1 height];
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return [a1 integerValue];
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return [a1 invalidate];
}

id objc_msgSend_ioSurface(void *a1, const char *a2, ...)
{
  return [a1 ioSurface];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_mainThreadScheduler(void *a1, const char *a2, ...)
{
  return [a1 mainThreadScheduler];
}

id objc_msgSend_maskToAlphaFilter(void *a1, const char *a2, ...)
{
  return [a1 maskToAlphaFilter];
}

id objc_msgSend_outputImage(void *a1, const char *a2, ...)
{
  return [a1 outputImage];
}

id objc_msgSend_pixelBuffer(void *a1, const char *a2, ...)
{
  return [a1 pixelBuffer];
}

id objc_msgSend_results(void *a1, const char *a2, ...)
{
  return [a1 results];
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return [a1 resume];
}

id objc_msgSend_scheduler(void *a1, const char *a2, ...)
{
  return [a1 scheduler];
}

id objc_msgSend_serviceConnection(void *a1, const char *a2, ...)
{
  return [a1 serviceConnection];
}

id objc_msgSend_serviceListener(void *a1, const char *a2, ...)
{
  return [a1 serviceListener];
}

id objc_msgSend_sourceOutCompositingFilter(void *a1, const char *a2, ...)
{
  return [a1 sourceOutCompositingFilter];
}

id objc_msgSend_uppercaseString(void *a1, const char *a2, ...)
{
  return [a1 uppercaseString];
}

id objc_msgSend_width(void *a1, const char *a2, ...)
{
  return [a1 width];
}