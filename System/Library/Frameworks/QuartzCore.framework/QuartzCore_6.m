void CFRunLoopPerformBlock(CFRunLoopRef rl, CFTypeRef mode, void *block)
{
  MEMORY[0x1F40D80F8](rl, mode, block);
}

void CFRunLoopRemoveSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
}

void CFRunLoopRemoveTimer(CFRunLoopRef rl, CFRunLoopTimerRef timer, CFRunLoopMode mode)
{
}

void CFRunLoopRun(void)
{
}

void CFRunLoopSourceInvalidate(CFRunLoopSourceRef source)
{
}

void CFRunLoopStop(CFRunLoopRef rl)
{
}

CFRunLoopTimerRef CFRunLoopTimerCreate(CFAllocatorRef allocator, CFAbsoluteTime fireDate, CFTimeInterval interval, CFOptionFlags flags, CFIndex order, CFRunLoopTimerCallBack callout, CFRunLoopTimerContext *context)
{
  return (CFRunLoopTimerRef)MEMORY[0x1F40D8180](allocator, flags, order, callout, context, fireDate, interval);
}

void CFRunLoopTimerInvalidate(CFRunLoopTimerRef timer)
{
}

void CFRunLoopTimerSetNextFireDate(CFRunLoopTimerRef timer, CFAbsoluteTime fireDate)
{
}

void CFRunLoopWakeUp(CFRunLoopRef rl)
{
}

void CFSetAddValue(CFMutableSetRef theSet, const void *value)
{
}

void CFSetApplyFunction(CFSetRef theSet, CFSetApplierFunction applier, void *context)
{
}

Boolean CFSetContainsValue(CFSetRef theSet, const void *value)
{
  return MEMORY[0x1F40D81F8](theSet, value);
}

CFSetRef CFSetCreate(CFAllocatorRef allocator, const void **values, CFIndex numValues, const CFSetCallBacks *callBacks)
{
  return (CFSetRef)MEMORY[0x1F40D8200](allocator, values, numValues, callBacks);
}

CFSetRef CFSetCreateCopy(CFAllocatorRef allocator, CFSetRef theSet)
{
  return (CFSetRef)MEMORY[0x1F40D8208](allocator, theSet);
}

CFMutableSetRef CFSetCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFSetCallBacks *callBacks)
{
  return (CFMutableSetRef)MEMORY[0x1F40D8210](allocator, capacity, callBacks);
}

CFIndex CFSetGetCount(CFSetRef theSet)
{
  return MEMORY[0x1F40D8220](theSet);
}

void CFSetGetValues(CFSetRef theSet, const void **values)
{
}

void CFSetRemoveValue(CFMutableSetRef theSet, const void *value)
{
}

void CFStringAppend(CFMutableStringRef theString, CFStringRef appendedString)
{
}

void CFStringAppendCString(CFMutableStringRef theString, const char *cStr, CFStringEncoding encoding)
{
}

void CFStringAppendFormat(CFMutableStringRef theString, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x1F40D8388](theString1, theString2, compareOptions);
}

CFStringRef CFStringCreateByCombiningStrings(CFAllocatorRef alloc, CFArrayRef theArray, CFStringRef separatorString)
{
  return (CFStringRef)MEMORY[0x1F40D83E0](alloc, theArray, separatorString);
}

CFStringRef CFStringCreateCopy(CFAllocatorRef alloc, CFStringRef theString)
{
  return (CFStringRef)MEMORY[0x1F40D83F0](alloc, theString);
}

CFMutableStringRef CFStringCreateMutable(CFAllocatorRef alloc, CFIndex maxLength)
{
  return (CFMutableStringRef)MEMORY[0x1F40D8408](alloc, maxLength);
}

CFMutableStringRef CFStringCreateMutableCopy(CFAllocatorRef alloc, CFIndex maxLength, CFStringRef theString)
{
  return (CFMutableStringRef)MEMORY[0x1F40D8410](alloc, maxLength, theString);
}

CFStringRef CFStringCreateWithBytes(CFAllocatorRef alloc, const UInt8 *bytes, CFIndex numBytes, CFStringEncoding encoding, Boolean isExternalRepresentation)
{
  return (CFStringRef)MEMORY[0x1F40D8438](alloc, bytes, numBytes, *(void *)&encoding, isExternalRepresentation);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x1F40D8448](alloc, cStr, *(void *)&encoding);
}

CFStringRef CFStringCreateWithCStringNoCopy(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding, CFAllocatorRef contentsDeallocator)
{
  return (CFStringRef)MEMORY[0x1F40D8458](alloc, cStr, *(void *)&encoding, contentsDeallocator);
}

CFStringRef CFStringCreateWithFormat(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  return (CFStringRef)MEMORY[0x1F40D8490](alloc, formatOptions, format);
}

CFStringRef CFStringCreateWithSubstring(CFAllocatorRef alloc, CFStringRef str, CFRange range)
{
  return (CFStringRef)MEMORY[0x1F40D84A8](alloc, str, range.location, range.length);
}

CFRange CFStringFind(CFStringRef theString, CFStringRef stringToFind, CFStringCompareFlags compareOptions)
{
  CFIndex v3 = MEMORY[0x1F40D84C8](theString, stringToFind, compareOptions);
  result.length = v4;
  result.location = v3;
  return result;
}

Boolean CFStringFindCharacterFromSet(CFStringRef theString, CFCharacterSetRef theSet, CFRange rangeToSearch, CFStringCompareFlags searchOptions, CFRange *result)
{
  return MEMORY[0x1F40D84D8](theString, theSet, rangeToSearch.location, rangeToSearch.length, searchOptions, result);
}

CFIndex CFStringGetBytes(CFStringRef theString, CFRange range, CFStringEncoding encoding, UInt8 lossByte, Boolean isExternalRepresentation, UInt8 *buffer, CFIndex maxBufLen, CFIndex *usedBufLen)
{
  return MEMORY[0x1F40D8500](theString, range.location, range.length, *(void *)&encoding, lossByte, isExternalRepresentation, buffer, maxBufLen);
}

Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return MEMORY[0x1F40D8510](theString, buffer, bufferSize, *(void *)&encoding);
}

const char *__cdecl CFStringGetCStringPtr(CFStringRef theString, CFStringEncoding encoding)
{
  return (const char *)MEMORY[0x1F40D8520](theString, *(void *)&encoding);
}

SInt32 CFStringGetIntValue(CFStringRef str)
{
  return MEMORY[0x1F40D8568](str);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x1F40D8578](theString);
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x1F40D85F0]();
}

Boolean CFStringHasPrefix(CFStringRef theString, CFStringRef prefix)
{
  return MEMORY[0x1F40D8600](theString, prefix);
}

void CFStringReplace(CFMutableStringRef theString, CFRange range, CFStringRef replacement)
{
}

CFURLRef CFURLCreateCopyDeletingLastPathComponent(CFAllocatorRef allocator, CFURLRef url)
{
  return (CFURLRef)MEMORY[0x1F40D8808](allocator, url);
}

CFURLRef CFURLCreateFromFileSystemRepresentation(CFAllocatorRef allocator, const UInt8 *buffer, CFIndex bufLen, Boolean isDirectory)
{
  return (CFURLRef)MEMORY[0x1F40D8848](allocator, buffer, bufLen, isDirectory);
}

CFURLRef CFURLCreateWithBytes(CFAllocatorRef allocator, const UInt8 *URLBytes, CFIndex length, CFStringEncoding encoding, CFURLRef baseURL)
{
  return (CFURLRef)MEMORY[0x1F40D8888](allocator, URLBytes, length, *(void *)&encoding, baseURL);
}

CFStringRef CFURLGetString(CFURLRef anURL)
{
  return (CFStringRef)MEMORY[0x1F40D8918](anURL);
}

CFUUIDRef CFUUIDCreate(CFAllocatorRef alloc)
{
  return (CFUUIDRef)MEMORY[0x1F40D8988](alloc);
}

CFUUIDRef CFUUIDCreateFromString(CFAllocatorRef alloc, CFStringRef uuidStr)
{
  return (CFUUIDRef)MEMORY[0x1F40D8998](alloc, uuidStr);
}

CFStringRef CFUUIDCreateString(CFAllocatorRef alloc, CFUUIDRef uuid)
{
  return (CFStringRef)MEMORY[0x1F40D89B0](alloc, uuid);
}

uint64_t CGAccessSessionCreate()
{
  return MEMORY[0x1F40D9760]();
}

uint64_t CGAccessSessionGetBytes()
{
  return MEMORY[0x1F40D9770]();
}

uint64_t CGAccessSessionRelease()
{
  return MEMORY[0x1F40D9778]();
}

uint64_t CGAccessSessionSkipForward()
{
  return MEMORY[0x1F40D9788]();
}

CGAffineTransform *__cdecl CGAffineTransformConcat(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t1, CGAffineTransform *t2)
{
  return (CGAffineTransform *)MEMORY[0x1F40D9790](retstr, t1, t2);
}

BOOL CGAffineTransformEqualToTransform(CGAffineTransform *t1, CGAffineTransform *t2)
{
  return MEMORY[0x1F40D97A0](t1, t2);
}

CGAffineTransform *__cdecl CGAffineTransformInvert(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t)
{
  return (CGAffineTransform *)MEMORY[0x1F40D97A8](retstr, t);
}

BOOL CGAffineTransformIsIdentity(CGAffineTransform *t)
{
  return MEMORY[0x1F40D97B0](t);
}

uint64_t CGAffineTransformIsRectilinear()
{
  return MEMORY[0x1F40D97B8]();
}

CGAffineTransform *__cdecl CGAffineTransformMakeRotation(CGAffineTransform *__return_ptr retstr, CGFloat angle)
{
  return (CGAffineTransform *)MEMORY[0x1F40D97C8](retstr, angle);
}

CGAffineTransform *__cdecl CGAffineTransformMakeScale(CGAffineTransform *__return_ptr retstr, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x1F40D97D0](retstr, sx, sy);
}

CGAffineTransform *__cdecl CGAffineTransformRotate(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat angle)
{
  return (CGAffineTransform *)MEMORY[0x1F40D97E8](retstr, t, angle);
}

CGAffineTransform *__cdecl CGAffineTransformScale(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x1F40D97F0](retstr, t, sx, sy);
}

CGAffineTransform *__cdecl CGAffineTransformTranslate(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat tx, CGFloat ty)
{
  return (CGAffineTransform *)MEMORY[0x1F40D97F8](retstr, t, tx, ty);
}

CGContextRef CGBitmapContextCreate(void *data, size_t width, size_t height, size_t bitsPerComponent, size_t bytesPerRow, CGColorSpaceRef space, uint32_t bitmapInfo)
{
  return (CGContextRef)MEMORY[0x1F40D9808](data, width, height, bitsPerComponent, bytesPerRow, space, *(void *)&bitmapInfo);
}

CGImageRef CGBitmapContextCreateImage(CGContextRef context)
{
  return (CGImageRef)MEMORY[0x1F40D9818](context);
}

uint64_t CGBitmapContextSetData()
{
  return MEMORY[0x1F40D9880]();
}

uint64_t CGBlt_copyBytes()
{
  return MEMORY[0x1F40D98A0]();
}

uint64_t CGBlt_fillBytes()
{
  return MEMORY[0x1F40D98A8]();
}

uint64_t CGClipGetMask()
{
  return MEMORY[0x1F40D98B0]();
}

uint64_t CGClipGetMode()
{
  return MEMORY[0x1F40D98B8]();
}

uint64_t CGClipGetPath()
{
  return MEMORY[0x1F40D98C0]();
}

uint64_t CGClipGetRect()
{
  return MEMORY[0x1F40D98C8]();
}

uint64_t CGClipGetShouldAntialias()
{
  return MEMORY[0x1F40D98D0]();
}

uint64_t CGClipGetStroke()
{
  return MEMORY[0x1F40D98D8]();
}

uint64_t CGClipGetTextClipping()
{
  return MEMORY[0x1F40D98E0]();
}

uint64_t CGClipGetType()
{
  return MEMORY[0x1F40D98E8]();
}

uint64_t CGClipMaskGetImage()
{
  return MEMORY[0x1F40D98F0]();
}

uint64_t CGClipMaskGetMatrix()
{
  return MEMORY[0x1F40D98F8]();
}

uint64_t CGClipMaskGetRect()
{
  return MEMORY[0x1F40D9900]();
}

uint64_t CGClipStackGetBounds()
{
  return MEMORY[0x1F40D9908]();
}

uint64_t CGClipStackGetClipAtIndex()
{
  return MEMORY[0x1F40D9910]();
}

uint64_t CGClipStackGetCount()
{
  return MEMORY[0x1F40D9918]();
}

uint64_t CGClipStackGetIdentifier()
{
  return MEMORY[0x1F40D9920]();
}

uint64_t CGClipStackGetRect()
{
  return MEMORY[0x1F40D9928]();
}

uint64_t CGClipStrokeCreateStrokedPath()
{
  return MEMORY[0x1F40D9930]();
}

uint64_t CGClipStrokeGetLineWidth()
{
  return MEMORY[0x1F40D9938]();
}

CGColorConversionInfoRef CGColorConversionInfoCreateFromList(CFDictionaryRef options, CGColorSpaceRef a2, CGColorConversionInfoTransformType a3, CGColorRenderingIntent a4, ...)
{
  return (CGColorConversionInfoRef)MEMORY[0x1F40D9948](options, a2, *(void *)&a3, *(void *)&a4);
}

uint64_t CGColorConversionInfoIterateFunctionsWithCallbacks()
{
  return MEMORY[0x1F40D9968]();
}

CGColorRef CGColorCreate(CGColorSpaceRef space, const CGFloat *components)
{
  return (CGColorRef)MEMORY[0x1F40D9970](space, components);
}

CGColorRef CGColorCreateCopyWithAlpha(CGColorRef color, CGFloat alpha)
{
  return (CGColorRef)MEMORY[0x1F40D9988](color, alpha);
}

CGColorRef CGColorCreateSRGB(CGFloat red, CGFloat green, CGFloat blue, CGFloat alpha)
{
  return (CGColorRef)MEMORY[0x1F40D99B0](red, green, blue, alpha);
}

CGColorRef CGColorCreateWithPattern(CGColorSpaceRef space, CGPatternRef pattern, const CGFloat *components)
{
  return (CGColorRef)MEMORY[0x1F40D99B8](space, pattern, components);
}

uint64_t CGColorCurveEqualToGammaCurve()
{
  return MEMORY[0x1F40D99C0]();
}

uint64_t CGColorCurveRelease()
{
  return MEMORY[0x1F40D99C8]();
}

BOOL CGColorEqualToColor(CGColorRef color1, CGColorRef color2)
{
  return MEMORY[0x1F40D99D0](color1, color2);
}

uint64_t CGColorFunctionGetOutputRange()
{
  return MEMORY[0x1F40D99E0]();
}

CGFloat CGColorGetAlpha(CGColorRef color)
{
  MEMORY[0x1F40D99F0](color);
  return result;
}

CGColorSpaceRef CGColorGetColorSpace(CGColorRef color)
{
  return (CGColorSpaceRef)MEMORY[0x1F40D99F8](color);
}

const CGFloat *__cdecl CGColorGetComponents(CGColorRef color)
{
  return (const CGFloat *)MEMORY[0x1F40D9A00](color);
}

uint64_t CGColorGetIdentifier()
{
  return MEMORY[0x1F40D9A10]();
}

size_t CGColorGetNumberOfComponents(CGColorRef color)
{
  return MEMORY[0x1F40D9A18](color);
}

CGPatternRef CGColorGetPattern(CGColorRef color)
{
  return (CGPatternRef)MEMORY[0x1F40D9A20](color);
}

uint64_t CGColorGetPatternBaseColor()
{
  return MEMORY[0x1F40D9A28]();
}

CFTypeID CGColorGetTypeID(void)
{
  return MEMORY[0x1F40D9A30]();
}

uint64_t CGColorMatrixGetMatrix()
{
  return MEMORY[0x1F40D9A38]();
}

uint64_t CGColorNxMTransformGetTransform()
{
  return MEMORY[0x1F40D9A48]();
}

void CGColorRelease(CGColorRef color)
{
}

CGColorRef CGColorRetain(CGColorRef color)
{
  return (CGColorRef)MEMORY[0x1F40D9A60](color);
}

uint64_t CGColorSpaceContainsFlexGTCInfo()
{
  return MEMORY[0x1F40D9A68]();
}

CFDataRef CGColorSpaceCopyICCData(CGColorSpaceRef space)
{
  return (CFDataRef)MEMORY[0x1F40D9A98](space);
}

uint64_t CGColorSpaceCopyICCProfileDescription()
{
  return MEMORY[0x1F40D9AB0]();
}

CFStringRef CGColorSpaceCopyName(CGColorSpaceRef space)
{
  return (CFStringRef)MEMORY[0x1F40D9AB8](space);
}

CFPropertyListRef CGColorSpaceCopyPropertyList(CGColorSpaceRef space)
{
  return (CFPropertyListRef)MEMORY[0x1F40D9AC0](space);
}

CGColorSpaceRef CGColorSpaceCreateCalibratedRGB(const CGFloat *whitePoint, const CGFloat *blackPoint, const CGFloat *gamma, const CGFloat *matrix)
{
  return (CGColorSpaceRef)MEMORY[0x1F40D9AD0](whitePoint, blackPoint, gamma, matrix);
}

uint64_t CGColorSpaceCreateConversionCurve()
{
  return MEMORY[0x1F40D9AD8]();
}

CGColorSpaceRef CGColorSpaceCreateExtended(CGColorSpaceRef space)
{
  return (CGColorSpaceRef)MEMORY[0x1F40D9B00](space);
}

CGColorSpaceRef CGColorSpaceCreateLinearized(CGColorSpaceRef space)
{
  return (CGColorSpaceRef)MEMORY[0x1F40D9B30](space);
}

CGColorSpaceRef CGColorSpaceCreatePattern(CGColorSpaceRef baseSpace)
{
  return (CGColorSpaceRef)MEMORY[0x1F40D9B38](baseSpace);
}

CGColorSpaceRef CGColorSpaceCreateWithICCData(CFTypeRef data)
{
  return (CGColorSpaceRef)MEMORY[0x1F40D9B48](data);
}

CGColorSpaceRef CGColorSpaceCreateWithName(CFStringRef name)
{
  return (CGColorSpaceRef)MEMORY[0x1F40D9B60](name);
}

CGColorSpaceRef CGColorSpaceCreateWithPropertyList(CFPropertyListRef plist)
{
  return (CGColorSpaceRef)MEMORY[0x1F40D9B70](plist);
}

uint64_t CGColorSpaceEqualToColorSpace()
{
  return MEMORY[0x1F40D9B78]();
}

uint64_t CGColorSpaceEqualToColorSpaceIgnoringRange()
{
  return MEMORY[0x1F40D9B80]();
}

CGColorSpaceRef CGColorSpaceGetBaseColorSpace(CGColorSpaceRef space)
{
  return (CGColorSpaceRef)MEMORY[0x1F40D9B90](space);
}

CGColorSpaceModel CGColorSpaceGetModel(CGColorSpaceRef space)
{
  return MEMORY[0x1F40D9BE0](space);
}

CFStringRef CGColorSpaceGetName(CGColorSpaceRef space)
{
  return (CFStringRef)MEMORY[0x1F40D9BE8](space);
}

size_t CGColorSpaceGetNumberOfComponents(CGColorSpaceRef space)
{
  return MEMORY[0x1F40D9BF0](space);
}

uint64_t CGColorSpaceGetProcessColorModel()
{
  return MEMORY[0x1F40D9BF8]();
}

uint64_t CGColorSpaceGetRenderingIntent()
{
  return MEMORY[0x1F40D9C00]();
}

uint64_t CGColorSpaceGetType()
{
  return MEMORY[0x1F40D9C08]();
}

CFTypeID CGColorSpaceGetTypeID(void)
{
  return MEMORY[0x1F40D9C10]();
}

BOOL CGColorSpaceIsHLGBased(CGColorSpaceRef s)
{
  return MEMORY[0x1F40D9C20](s);
}

BOOL CGColorSpaceIsPQBased(CGColorSpaceRef s)
{
  return MEMORY[0x1F40D9C30](s);
}

uint64_t CGColorSpaceIsUncalibrated()
{
  return MEMORY[0x1F40D9C38]();
}

BOOL CGColorSpaceIsWideGamutRGB(CGColorSpaceRef a1)
{
  return MEMORY[0x1F40D9C40](a1);
}

void CGColorSpaceRelease(CGColorSpaceRef space)
{
}

CGColorSpaceRef CGColorSpaceRetain(CGColorSpaceRef space)
{
  return (CGColorSpaceRef)MEMORY[0x1F40D9C50](space);
}

BOOL CGColorSpaceSupportsOutput(CGColorSpaceRef space)
{
  return MEMORY[0x1F40D9C58](space);
}

BOOL CGColorSpaceUsesExtendedRange(CGColorSpaceRef space)
{
  return MEMORY[0x1F40D9C60](space);
}

BOOL CGColorSpaceUsesITUR_2100TF(CGColorSpaceRef a1)
{
  return MEMORY[0x1F40D9C68](a1);
}

uint64_t CGColorTRCGetFunction()
{
  return MEMORY[0x1F40D9C70]();
}

uint64_t CGColorTRCGetGammaID()
{
  return MEMORY[0x1F40D9C78]();
}

uint64_t CGColorTRCPureGammaOriginal()
{
  return MEMORY[0x1F40D9C88]();
}

uint64_t CGColorTransformConvertColor()
{
  return MEMORY[0x1F40D9C90]();
}

uint64_t CGColorTransformConvertColorComponents()
{
  return MEMORY[0x1F40D9C98]();
}

uint64_t CGColorTransformCreate()
{
  return MEMORY[0x1F40D9CA8]();
}

uint64_t CGColorTransformRelease()
{
  return MEMORY[0x1F40D9CB8]();
}

uint64_t CGColorTransformRetain()
{
  return MEMORY[0x1F40D9CC0]();
}

void CGContextAddArc(CGContextRef c, CGFloat x, CGFloat y, CGFloat radius, CGFloat startAngle, CGFloat endAngle, int clockwise)
{
}

void CGContextAddCurveToPoint(CGContextRef c, CGFloat cp1x, CGFloat cp1y, CGFloat cp2x, CGFloat cp2y, CGFloat x, CGFloat y)
{
}

void CGContextAddLineToPoint(CGContextRef c, CGFloat x, CGFloat y)
{
}

void CGContextAddPath(CGContextRef c, CGPathRef path)
{
}

void CGContextAddRect(CGContextRef c, CGRect rect)
{
}

void CGContextBeginTransparencyLayer(CGContextRef c, CFDictionaryRef auxiliaryInfo)
{
}

uint64_t CGContextClear()
{
  return MEMORY[0x1F40D9D30]();
}

void CGContextClearRect(CGContextRef c, CGRect rect)
{
}

void CGContextClip(CGContextRef c)
{
}

void CGContextClipToMask(CGContextRef c, CGRect rect, CGImageRef mask)
{
}

void CGContextClipToRect(CGContextRef c, CGRect rect)
{
}

void CGContextClosePath(CGContextRef c)
{
}

void CGContextConcatCTM(CGContextRef c, CGAffineTransform *transform)
{
}

uint64_t CGContextCreateWithDelegate()
{
  return MEMORY[0x1F40D9DA8]();
}

uint64_t CGContextDelegateBeginLayer()
{
  return MEMORY[0x1F40D9DB0]();
}

uint64_t CGContextDelegateCreate()
{
  return MEMORY[0x1F40D9DB8]();
}

uint64_t CGContextDelegateDrawImage()
{
  return MEMORY[0x1F40D9DD8]();
}

uint64_t CGContextDelegateEndLayer()
{
  return MEMORY[0x1F40D9E30]();
}

uint64_t CGContextDelegateGetInfo()
{
  return MEMORY[0x1F40D9E48]();
}

uint64_t CGContextDelegateGetOwnerIdentity()
{
  return MEMORY[0x1F40D9E58]();
}

uint64_t CGContextDelegateOperation()
{
  return MEMORY[0x1F40D9E60]();
}

uint64_t CGContextDelegateRelease()
{
  return MEMORY[0x1F40D9E68]();
}

uint64_t CGContextDelegateSetCallback()
{
  return MEMORY[0x1F40D9E70]();
}

uint64_t CGContextDelegateSetCallbacks()
{
  return MEMORY[0x1F40D9E78]();
}

void CGContextDrawConicGradient(CGContextRef c, CGGradientRef gradient, CGPoint center, CGFloat angle)
{
}

void CGContextDrawImage(CGContextRef c, CGRect rect, CGImageRef image)
{
}

uint64_t CGContextDrawImageWithOptions()
{
  return MEMORY[0x1F40D9E98]();
}

void CGContextDrawLinearGradient(CGContextRef c, CGGradientRef gradient, CGPoint startPoint, CGPoint endPoint, CGGradientDrawingOptions options)
{
}

void CGContextDrawPath(CGContextRef c, CGPathDrawingMode mode)
{
}

uint64_t CGContextDrawPatternCell()
{
  return MEMORY[0x1F40D9EE0]();
}

void CGContextDrawRadialGradient(CGContextRef c, CGGradientRef gradient, CGPoint startCenter, CGFloat startRadius, CGPoint endCenter, CGFloat endRadius, CGGradientDrawingOptions options)
{
}

void CGContextDrawShading(CGContextRef c, CGShadingRef shading)
{
}

void CGContextEndTransparencyLayer(CGContextRef c)
{
}

void CGContextFillPath(CGContextRef c)
{
}

void CGContextFillRect(CGContextRef c, CGRect rect)
{
}

void CGContextFlush(CGContextRef c)
{
}

uint64_t CGContextGetBaseCTM()
{
  return MEMORY[0x1F40D9F58]();
}

CGAffineTransform *__cdecl CGContextGetCTM(CGAffineTransform *__return_ptr retstr, CGContextRef c)
{
  return (CGAffineTransform *)MEMORY[0x1F40D9F68](retstr, c);
}

uint64_t CGContextGetDelegate()
{
  return MEMORY[0x1F40D9F88]();
}

uint64_t CGContextGetEDRTargetHeadroom()
{
  return MEMORY[0x1F40D9F90]();
}

uint64_t CGContextGetInterpolationQualityRange()
{
  return MEMORY[0x1F40D9FC0]();
}

void CGContextMoveToPoint(CGContextRef c, CGFloat x, CGFloat y)
{
}

void CGContextRelease(CGContextRef c)
{
}

uint64_t CGContextReplacePathWithShapePath()
{
  return MEMORY[0x1F40DA060]();
}

uint64_t CGContextResetState()
{
  return MEMORY[0x1F40DA080]();
}

void CGContextRestoreGState(CGContextRef c)
{
}

void CGContextSaveGState(CGContextRef c)
{
}

void CGContextScaleCTM(CGContextRef c, CGFloat sx, CGFloat sy)
{
}

void CGContextSetAllowsFontSubpixelQuantization(CGContextRef c, BOOL allowsFontSubpixelQuantization)
{
}

void CGContextSetAlpha(CGContextRef c, CGFloat alpha)
{
}

uint64_t CGContextSetBaseCTM()
{
  return MEMORY[0x1F40DA0D8]();
}

void CGContextSetBlendMode(CGContextRef c, CGBlendMode mode)
{
}

uint64_t CGContextSetCompositeOperation()
{
  return MEMORY[0x1F40DA100]();
}

uint64_t CGContextSetEDRTargetHeadroom()
{
  return MEMORY[0x1F40DA108]();
}

void CGContextSetFillColorWithColor(CGContextRef c, CGColorRef color)
{
}

void CGContextSetInterpolationQuality(CGContextRef c, CGInterpolationQuality quality)
{
}

uint64_t CGContextSetInterpolationQualityRange()
{
  return MEMORY[0x1F40DA178]();
}

void CGContextSetLineCap(CGContextRef c, CGLineCap cap)
{
}

void CGContextSetLineDash(CGContextRef c, CGFloat phase, const CGFloat *lengths, size_t count)
{
}

void CGContextSetLineJoin(CGContextRef c, CGLineJoin join)
{
}

void CGContextSetLineWidth(CGContextRef c, CGFloat width)
{
}

void CGContextSetMiterLimit(CGContextRef c, CGFloat limit)
{
}

void CGContextSetPatternPhase(CGContextRef c, CGSize phase)
{
}

void CGContextSetRGBFillColor(CGContextRef c, CGFloat red, CGFloat green, CGFloat blue, CGFloat alpha)
{
}

void CGContextSetShadowWithColor(CGContextRef c, CGSize offset, CGFloat blur, CGColorRef color)
{
}

void CGContextSetShouldAntialias(CGContextRef c, BOOL shouldAntialias)
{
}

void CGContextSetShouldSmoothFonts(CGContextRef c, BOOL shouldSmoothFonts)
{
}

void CGContextSetStrokeColorWithColor(CGContextRef c, CGColorRef color)
{
}

void CGContextSetTextPosition(CGContextRef c, CGFloat x, CGFloat y)
{
}

void CGContextStrokePath(CGContextRef c)
{
}

void CGContextTranslateCTM(CGContextRef c, CGFloat tx, CGFloat ty)
{
}

uint64_t CGDashGetPattern()
{
  return MEMORY[0x1F40DA2A0]();
}

uint64_t CGDashRelease()
{
  return MEMORY[0x1F40DA2A8]();
}

uint64_t CGDashRetain()
{
  return MEMORY[0x1F40DA2B0]();
}

CGDataProviderRef CGDataProviderCreateDirect(void *info, off_t size, const CGDataProviderDirectCallbacks *callbacks)
{
  return (CGDataProviderRef)MEMORY[0x1F40DA2F0](info, size, callbacks);
}

CGDataProviderRef CGDataProviderCreateWithCFData(CFDataRef data)
{
  return (CGDataProviderRef)MEMORY[0x1F40DA300](data);
}

CGDataProviderRef CGDataProviderCreateWithData(void *info, const void *data, size_t size, CGDataProviderReleaseDataCallback releaseData)
{
  return (CGDataProviderRef)MEMORY[0x1F40DA310](info, data, size, releaseData);
}

uint64_t CGDataProviderGetSizeOfData()
{
  return MEMORY[0x1F40DA338]();
}

void CGDataProviderRelease(CGDataProviderRef provider)
{
}

uint64_t CGDataProviderReleaseBytePtr()
{
  return MEMORY[0x1F40DA350]();
}

CGDataProviderRef CGDataProviderRetain(CGDataProviderRef provider)
{
  return (CGDataProviderRef)MEMORY[0x1F40DA358](provider);
}

uint64_t CGDataProviderRetainBytePtr()
{
  return MEMORY[0x1F40DA360]();
}

uint64_t CGDisplayListContextCreate()
{
  return MEMORY[0x1F40DA370]();
}

uint64_t CGDisplayListCreateWithRect()
{
  return MEMORY[0x1F40DA378]();
}

uint64_t CGDisplayListDrawInContext()
{
  return MEMORY[0x1F40DA380]();
}

uint64_t CGDisplayListRelease()
{
  return MEMORY[0x1F40DA388]();
}

uint64_t CGFloatIsValid()
{
  return MEMORY[0x1F40DA3A0]();
}

uint64_t CGFontCreateGlyphPath()
{
  return MEMORY[0x1F40DA428]();
}

uint64_t CGFontCreateWithName()
{
  return MEMORY[0x1F40DA440]();
}

CGRect CGFontGetFontBBox(CGFontRef font)
{
  MEMORY[0x1F40DA4C0](font);
  result.size.height = v4;
  result.size.width = v3;
  result.origin.y = v2;
  result.origin.x = v1;
  return result;
}

BOOL CGFontGetGlyphBBoxes(CGFontRef font, const CGGlyph *glyphs, size_t count, CGRect *bboxes)
{
  return MEMORY[0x1F40DA4D0](font, glyphs, count, bboxes);
}

uint64_t CGFontGetGlyphIdentifiers()
{
  return MEMORY[0x1F40DA4E0]();
}

CFTypeID CGFontGetTypeID(void)
{
  return MEMORY[0x1F40DA540]();
}

int CGFontGetUnitsPerEm(CGFontRef font)
{
  return MEMORY[0x1F40DA560](font);
}

uint64_t CGFontGetVariationAxes()
{
  return MEMORY[0x1F40DA570]();
}

uint64_t CGFontGetVariations()
{
  return MEMORY[0x1F40DA578]();
}

void CGFontRelease(CGFontRef font)
{
}

uint64_t CGFunctionEvaluate()
{
  return MEMORY[0x1F40DA5E8]();
}

uint64_t CGFunctionGetDomain()
{
  return MEMORY[0x1F40DA5F0]();
}

uint64_t CGFunctionGetRangeDimension()
{
  return MEMORY[0x1F40DA5F8]();
}

uint64_t CGFunctionIsIdentity()
{
  return MEMORY[0x1F40DA600]();
}

uint64_t CGGStateCreate()
{
  return MEMORY[0x1F40DA610]();
}

uint64_t CGGStateCreateCopy()
{
  return MEMORY[0x1F40DA618]();
}

uint64_t CGGStateGetAlpha()
{
  return MEMORY[0x1F40DA620]();
}

uint64_t CGGStateGetCTM()
{
  return MEMORY[0x1F40DA628]();
}

uint64_t CGGStateGetClipStack()
{
  return MEMORY[0x1F40DA630]();
}

uint64_t CGGStateGetCompositeOperation()
{
  return MEMORY[0x1F40DA638]();
}

uint64_t CGGStateGetEDRTargetHeadroom()
{
  return MEMORY[0x1F40DA640]();
}

uint64_t CGGStateGetFillColor()
{
  return MEMORY[0x1F40DA648]();
}

uint64_t CGGStateGetFont()
{
  return MEMORY[0x1F40DA650]();
}

uint64_t CGGStateGetFontRenderingStyle()
{
  return MEMORY[0x1F40DA658]();
}

uint64_t CGGStateGetFontSize()
{
  return MEMORY[0x1F40DA660]();
}

uint64_t CGGStateGetFontSmoothingBackgroundColor()
{
  return MEMORY[0x1F40DA668]();
}

uint64_t CGGStateGetInterpolationQuality()
{
  return MEMORY[0x1F40DA670]();
}

uint64_t CGGStateGetLineCap()
{
  return MEMORY[0x1F40DA678]();
}

uint64_t CGGStateGetLineDash()
{
  return MEMORY[0x1F40DA680]();
}

uint64_t CGGStateGetLineJoin()
{
  return MEMORY[0x1F40DA688]();
}

uint64_t CGGStateGetPatternPhase()
{
  return MEMORY[0x1F40DA690]();
}

uint64_t CGGStateGetShouldAntialias()
{
  return MEMORY[0x1F40DA698]();
}

uint64_t CGGStateGetShouldDrawBitmapRuns()
{
  return MEMORY[0x1F40DA6A0]();
}

uint64_t CGGStateGetSoftMask()
{
  return MEMORY[0x1F40DA6A8]();
}

uint64_t CGGStateGetStrokeColor()
{
  return MEMORY[0x1F40DA6B0]();
}

uint64_t CGGStateGetStrokeParameters()
{
  return MEMORY[0x1F40DA6B8]();
}

uint64_t CGGStateGetStyle()
{
  return MEMORY[0x1F40DA6C0]();
}

uint64_t CGGStateGetTextDrawingMode()
{
  return MEMORY[0x1F40DA6C8]();
}

uint64_t CGGStateRelease()
{
  return MEMORY[0x1F40DA6D0]();
}

uint64_t CGGStateResetClip()
{
  return MEMORY[0x1F40DA6D8]();
}

uint64_t CGGStateRetain()
{
  return MEMORY[0x1F40DA6E0]();
}

uint64_t CGGStateSetAlpha()
{
  return MEMORY[0x1F40DA6E8]();
}

uint64_t CGGStateSetCTM()
{
  return MEMORY[0x1F40DA6F0]();
}

uint64_t CGGStateSetCompositeOperation()
{
  return MEMORY[0x1F40DA6F8]();
}

uint64_t CGGStateSetFillColor()
{
  return MEMORY[0x1F40DA700]();
}

uint64_t CGGStateSetSoftMask()
{
  return MEMORY[0x1F40DA708]();
}

uint64_t CGGStateSetStrokeColor()
{
  return MEMORY[0x1F40DA710]();
}

uint64_t CGGStateSetStyle()
{
  return MEMORY[0x1F40DA718]();
}

uint64_t CGGlyphLockAccess()
{
  return MEMORY[0x1F40DA728]();
}

uint64_t CGGlyphLockCreate()
{
  return MEMORY[0x1F40DA730]();
}

uint64_t CGGlyphLockGetQuantizationLevel()
{
  return MEMORY[0x1F40DA738]();
}

uint64_t CGGlyphLockLockGlyphBitmaps()
{
  return MEMORY[0x1F40DA740]();
}

uint64_t CGGlyphLockRelease()
{
  return MEMORY[0x1F40DA748]();
}

uint64_t CGGlyphLockUnlock()
{
  return MEMORY[0x1F40DA750]();
}

uint64_t CGGradientApply()
{
  return MEMORY[0x1F40DA758]();
}

uint64_t CGGradientApplyWithBlock()
{
  return MEMORY[0x1F40DA760]();
}

CGGradientRef CGGradientCreateWithColors(CGColorSpaceRef space, CFArrayRef colors, const CGFloat *locations)
{
  return (CGGradientRef)MEMORY[0x1F40DA778](space, colors, locations);
}

uint64_t CGGradientCreateWithColorsAndOptions()
{
  return MEMORY[0x1F40DA780]();
}

uint64_t CGGradientGetColorSpace()
{
  return MEMORY[0x1F40DA788]();
}

uint64_t CGGradientGetFunction()
{
  return MEMORY[0x1F40DA790]();
}

uint64_t CGGradientGetIdentifier()
{
  return MEMORY[0x1F40DA798]();
}

uint64_t CGGradientGetLocationCount()
{
  return MEMORY[0x1F40DA7A0]();
}

void CGGradientRelease(CGGradientRef gradient)
{
}

uint64_t CGGradientUsesPremultipliedInterpolation()
{
  return MEMORY[0x1F40DA7B8]();
}

uint64_t CGImageBlockCreate()
{
  return MEMORY[0x1F40DA7E8]();
}

uint64_t CGImageBlockGetBytesPerRow()
{
  return MEMORY[0x1F40DA7F0]();
}

uint64_t CGImageBlockGetData()
{
  return MEMORY[0x1F40DA7F8]();
}

uint64_t CGImageBlockGetRect()
{
  return MEMORY[0x1F40DA800]();
}

uint64_t CGImageBlockSetCreate()
{
  return MEMORY[0x1F40DA810]();
}

uint64_t CGImageBlockSetGetComponentType()
{
  return MEMORY[0x1F40DA820]();
}

uint64_t CGImageBlockSetGetCount()
{
  return MEMORY[0x1F40DA828]();
}

uint64_t CGImageBlockSetGetImageBlock()
{
  return MEMORY[0x1F40DA830]();
}

uint64_t CGImageBlockSetGetRect()
{
  return MEMORY[0x1F40DA848]();
}

uint64_t CGImageBlockSetRelease()
{
  return MEMORY[0x1F40DA850]();
}

CGImageRef CGImageCreate(size_t width, size_t height, size_t bitsPerComponent, size_t bitsPerPixel, size_t bytesPerRow, CGColorSpaceRef space, CGBitmapInfo bitmapInfo, CGDataProviderRef provider, const CGFloat *decode, BOOL shouldInterpolate, CGColorRenderingIntent intent)
{
  return (CGImageRef)MEMORY[0x1F40DA868](width, height, bitsPerComponent, bitsPerPixel, bytesPerRow, space, *(void *)&bitmapInfo, provider);
}

CGImageRef CGImageCreateCopy(CGImageRef image)
{
  return (CGImageRef)MEMORY[0x1F40DA870](image);
}

uint64_t CGImageCreateFromIOSurface()
{
  return MEMORY[0x1F40E96E0]();
}

CGImageRef CGImageCreateWithImageInRect(CGImageRef image, CGRect rect)
{
  return (CGImageRef)MEMORY[0x1F40DA890](image, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

uint64_t CGImageCreateWithImageProvider()
{
  return MEMORY[0x1F40DA898]();
}

void CGImageDestinationAddImage(CGImageDestinationRef idst, CGImageRef image, CFDictionaryRef properties)
{
}

CGImageDestinationRef CGImageDestinationCreateWithData(CFMutableDataRef data, CFStringRef type, size_t count, CFDictionaryRef options)
{
  return (CGImageDestinationRef)MEMORY[0x1F40E9738](data, type, count, options);
}

CGImageDestinationRef CGImageDestinationCreateWithURL(CFURLRef url, CFStringRef type, size_t count, CFDictionaryRef options)
{
  return (CGImageDestinationRef)MEMORY[0x1F40E9758](url, type, count, options);
}

BOOL CGImageDestinationFinalize(CGImageDestinationRef idst)
{
  return MEMORY[0x1F40E9760](idst);
}

uint64_t CGImageEPSRepGetAlternateImage()
{
  return MEMORY[0x1F40DA8C8]();
}

CGImageAlphaInfo CGImageGetAlphaInfo(CGImageRef image)
{
  return MEMORY[0x1F40DA8D0](image);
}

CGBitmapInfo CGImageGetBitmapInfo(CGImageRef image)
{
  return MEMORY[0x1F40DA8D8](image);
}

size_t CGImageGetBitsPerComponent(CGImageRef image)
{
  return MEMORY[0x1F40DA8E0](image);
}

size_t CGImageGetBitsPerPixel(CGImageRef image)
{
  return MEMORY[0x1F40DA8E8](image);
}

size_t CGImageGetBytesPerRow(CGImageRef image)
{
  return MEMORY[0x1F40DA8F0](image);
}

uint64_t CGImageGetCachingFlags()
{
  return MEMORY[0x1F40DA8F8]();
}

CGColorSpaceRef CGImageGetColorSpace(CGImageRef image)
{
  return (CGColorSpaceRef)MEMORY[0x1F40DA908](image);
}

uint64_t CGImageGetContentHeadroom()
{
  return MEMORY[0x1F40DA910]();
}

CGDataProviderRef CGImageGetDataProvider(CGImageRef image)
{
  return (CGDataProviderRef)MEMORY[0x1F40DA920](image);
}

const CGFloat *__cdecl CGImageGetDecode(CGImageRef image)
{
  return (const CGFloat *)MEMORY[0x1F40DA928](image);
}

uint64_t CGImageGetEPSRep()
{
  return MEMORY[0x1F40DA930]();
}

uint64_t CGImageGetHeadroom()
{
  return MEMORY[0x1F40DA938]();
}

size_t CGImageGetHeight(CGImageRef image)
{
  return MEMORY[0x1F40DA948](image);
}

uint64_t CGImageGetIdentifier()
{
  return MEMORY[0x1F40DA950]();
}

uint64_t CGImageGetImageProvider()
{
  return MEMORY[0x1F40DA958]();
}

uint64_t CGImageGetMask()
{
  return MEMORY[0x1F40DA960]();
}

uint64_t CGImageGetMaskingColors()
{
  return MEMORY[0x1F40DA968]();
}

uint64_t CGImageGetMatte()
{
  return MEMORY[0x1F40DA970]();
}

uint64_t CGImageGetProperty()
{
  return MEMORY[0x1F40DA980]();
}

CFTypeID CGImageGetTypeID(void)
{
  return MEMORY[0x1F40DA9A8]();
}

size_t CGImageGetWidth(CGImageRef image)
{
  return MEMORY[0x1F40DA9B8](image);
}

uint64_t CGImageHasAlpha()
{
  return MEMORY[0x1F40DA9C0]();
}

BOOL CGImageIsMask(CGImageRef image)
{
  return MEMORY[0x1F40DA9D0](image);
}

uint64_t CGImageIsSubimage()
{
  return MEMORY[0x1F40DA9E0]();
}

CGImageRef CGImageMaskCreate(size_t width, size_t height, size_t bitsPerComponent, size_t bitsPerPixel, size_t bytesPerRow, CGDataProviderRef provider, const CGFloat *decode, BOOL shouldInterpolate)
{
  return (CGImageRef)MEMORY[0x1F40DA9E8](width, height, bitsPerComponent, bitsPerPixel, bytesPerRow, provider, decode, shouldInterpolate);
}

uint64_t CGImageNotificationCenter()
{
  return MEMORY[0x1F40DA9F0]();
}

uint64_t CGImageProviderCopyIOSurface()
{
  return MEMORY[0x1F40DA9F8]();
}

uint64_t CGImageProviderCopyImageBlockSetWithOptions()
{
  return MEMORY[0x1F40DAA08]();
}

uint64_t CGImageProviderCopyImageTextureData()
{
  return MEMORY[0x1F40DAA10]();
}

uint64_t CGImageProviderCreate()
{
  return MEMORY[0x1F40DAA18]();
}

uint64_t CGImageProviderGetAlphaInfo()
{
  return MEMORY[0x1F40DAA20]();
}

uint64_t CGImageProviderGetComponentType()
{
  return MEMORY[0x1F40DAA40]();
}

uint64_t CGImageProviderGetInfo()
{
  return MEMORY[0x1F40DAA50]();
}

uint64_t CGImageProviderRelease()
{
  return MEMORY[0x1F40DAA70]();
}

void CGImageRelease(CGImageRef image)
{
}

CGImageRef CGImageRetain(CGImageRef image)
{
  return (CGImageRef)MEMORY[0x1F40DAA98](image);
}

uint64_t CGImageSetCachingFlags()
{
  return MEMORY[0x1F40DAAA0]();
}

uint64_t CGImageSetProperty()
{
  return MEMORY[0x1F40DAAB0]();
}

uint64_t CGImageSourceCopyTypeExtensions()
{
  return MEMORY[0x1F40E9948]();
}

CGImageRef CGImageSourceCreateImageAtIndex(CGImageSourceRef isrc, size_t index, CFDictionaryRef options)
{
  return (CGImageRef)MEMORY[0x1F40E9968](isrc, index, options);
}

CGImageSourceRef CGImageSourceCreateWithData(CFDataRef data, CFDictionaryRef options)
{
  return (CGImageSourceRef)MEMORY[0x1F40E9998](data, options);
}

CGImageSourceRef CGImageSourceCreateWithURL(CFURLRef url, CFDictionaryRef options)
{
  return (CGImageSourceRef)MEMORY[0x1F40E99C8](url, options);
}

CFTypeID CGImageSourceGetTypeID(void)
{
  return MEMORY[0x1F40E9A28]();
}

uint64_t CGImageTextureDataGetColorSpace()
{
  return MEMORY[0x1F40DAAC8]();
}

uint64_t CGImageTextureDataGetNumberOfMipmaps()
{
  return MEMORY[0x1F40DAAD8]();
}

uint64_t CGImageTextureDataGetOffsetWithBlock()
{
  return MEMORY[0x1F40DAAE0]();
}

uint64_t CGImageTextureDataGetPixelFormat()
{
  return MEMORY[0x1F40DAAE8]();
}

uint64_t CGImageTextureDataGetSize()
{
  return MEMORY[0x1F40DAAF0]();
}

uint64_t CGImageTextureDataRelease()
{
  return MEMORY[0x1F40DAB00]();
}

uint64_t CGImageTextureDataRetain()
{
  return MEMORY[0x1F40DAB08]();
}

uint64_t CGImageTextureDataSupportsTiledLayout()
{
  return MEMORY[0x1F40DAB10]();
}

uint64_t CGImageWriteToFile()
{
  return MEMORY[0x1F40DAB18]();
}

uint64_t CGNotificationCenterAddCallback()
{
  return MEMORY[0x1F40DAB40]();
}

CGPDFDocumentRef CGPDFDocumentCreateWithURL(CFURLRef url)
{
  return (CGPDFDocumentRef)MEMORY[0x1F40DAC50](url);
}

CFTypeID CGPDFDocumentGetTypeID(void)
{
  return MEMORY[0x1F40DAC98]();
}

void CGPDFDocumentRelease(CGPDFDocumentRef document)
{
}

void CGPathAddArc(CGMutablePathRef path, const CGAffineTransform *m, CGFloat x, CGFloat y, CGFloat radius, CGFloat startAngle, CGFloat endAngle, BOOL clockwise)
{
}

void CGPathAddCurveToPoint(CGMutablePathRef path, const CGAffineTransform *m, CGFloat cp1x, CGFloat cp1y, CGFloat cp2x, CGFloat cp2y, CGFloat x, CGFloat y)
{
}

void CGPathAddEllipseInRect(CGMutablePathRef path, const CGAffineTransform *m, CGRect rect)
{
}

void CGPathAddLineToPoint(CGMutablePathRef path, const CGAffineTransform *m, CGFloat x, CGFloat y)
{
}

void CGPathAddQuadCurveToPoint(CGMutablePathRef path, const CGAffineTransform *m, CGFloat cpx, CGFloat cpy, CGFloat x, CGFloat y)
{
}

void CGPathAddRect(CGMutablePathRef path, const CGAffineTransform *m, CGRect rect)
{
}

void CGPathAddRoundedRect(CGMutablePathRef path, const CGAffineTransform *transform, CGRect rect, CGFloat cornerWidth, CGFloat cornerHeight)
{
}

void CGPathApply(CGPathRef path, void *info, CGPathApplierFunction function)
{
}

uint64_t CGPathApplyDashedPath()
{
  return MEMORY[0x1F40DAFE0]();
}

uint64_t CGPathApplyStrokedDashedPath()
{
  return MEMORY[0x1F40DAFE8]();
}

void CGPathApplyWithBlock(CGPathRef path, CGPathApplyBlock block)
{
}

uint64_t CGPathApplyWithBlock2()
{
  return MEMORY[0x1F40DAFF8]();
}

void CGPathCloseSubpath(CGMutablePathRef path)
{
}

BOOL CGPathContainsPoint(CGPathRef path, const CGAffineTransform *m, CGPoint point, BOOL eoFill)
{
  return MEMORY[0x1F40DB008](path, m, eoFill, (__n128)point, *(__n128 *)&point.y);
}

CGPathRef CGPathCreateCopy(CGPathRef path)
{
  return (CGPathRef)MEMORY[0x1F40DB010](path);
}

CGPathRef CGPathCreateCopyByTransformingPath(CGPathRef path, const CGAffineTransform *transform)
{
  return (CGPathRef)MEMORY[0x1F40DB048](path, transform);
}

uint64_t CGPathCreateDashedPath()
{
  return MEMORY[0x1F40DB058]();
}

CGMutablePathRef CGPathCreateMutable(void)
{
  return (CGMutablePathRef)MEMORY[0x1F40DB068]();
}

uint64_t CGPathCreateStrokedPath()
{
  return MEMORY[0x1F40DB088]();
}

CGPathRef CGPathCreateWithEllipseInRect(CGRect rect, const CGAffineTransform *transform)
{
  return (CGPathRef)MEMORY[0x1F40DB0A0](transform, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

CGPathRef CGPathCreateWithRect(CGRect rect, const CGAffineTransform *transform)
{
  return (CGPathRef)MEMORY[0x1F40DB0A8](transform, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

CGPathRef CGPathCreateWithRoundedRect(CGRect rect, CGFloat cornerWidth, CGFloat cornerHeight, const CGAffineTransform *transform)
{
  return (CGPathRef)MEMORY[0x1F40DB0B0](transform, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, cornerWidth, cornerHeight);
}

uint64_t CGPathCreateWithUnevenCornersRoundedRect()
{
  return MEMORY[0x1F40DB0C0]();
}

CGRect CGPathGetBoundingBox(CGPathRef path)
{
  MEMORY[0x1F40DB0D0](path);
  result.size.height = v4;
  result.size.width = v3;
  result.origin.y = v2;
  result.origin.x = v1;
  return result;
}

uint64_t CGPathGetNumberOfElements()
{
  return MEMORY[0x1F40DB0E0]();
}

uint64_t CGPathGetNumberOfPoints()
{
  return MEMORY[0x1F40DB0E8]();
}

CFTypeID CGPathGetTypeID(void)
{
  return MEMORY[0x1F40DB0F8]();
}

uint64_t CGPathIsArc()
{
  return MEMORY[0x1F40DB108]();
}

uint64_t CGPathIsEllipse()
{
  return MEMORY[0x1F40DB110]();
}

uint64_t CGPathIsEllipseWithTransform()
{
  return MEMORY[0x1F40DB118]();
}

BOOL CGPathIsEmpty(CGPathRef path)
{
  return MEMORY[0x1F40DB120](path);
}

uint64_t CGPathIsLine()
{
  return MEMORY[0x1F40DB128]();
}

uint64_t CGPathIsPrimitive()
{
  return MEMORY[0x1F40DB130]();
}

BOOL CGPathIsRect(CGPathRef path, CGRect *rect)
{
  return MEMORY[0x1F40DB138](path, rect);
}

uint64_t CGPathIsRectWithTransform()
{
  return MEMORY[0x1F40DB140]();
}

uint64_t CGPathIsRegion()
{
  return MEMORY[0x1F40DB148]();
}

uint64_t CGPathIsRoundedRect()
{
  return MEMORY[0x1F40DB150]();
}

uint64_t CGPathIsRoundedRectWithTransform()
{
  return MEMORY[0x1F40DB158]();
}

uint64_t CGPathIsUnevenCornersRoundedRectWithTransform()
{
  return MEMORY[0x1F40DB160]();
}

void CGPathMoveToPoint(CGMutablePathRef path, const CGAffineTransform *m, CGFloat x, CGFloat y)
{
}

void CGPathRelease(CGPathRef path)
{
}

CGPathRef CGPathRetain(CGPathRef path)
{
  return (CGPathRef)MEMORY[0x1F40DB178](path);
}

CGPatternRef CGPatternCreate(void *info, CGRect bounds, CGAffineTransform *matrix, CGFloat xStep, CGFloat yStep, CGPatternTiling tiling, BOOL isColored, const CGPatternCallbacks *callbacks)
{
  return (CGPatternRef)MEMORY[0x1F40DB180](info, matrix, *(void *)&tiling, isColored, callbacks, (__n128)bounds.origin, *(__n128 *)&bounds.origin.y, (__n128)bounds.size, *(__n128 *)&bounds.size.height, xStep, yStep);
}

uint64_t CGPatternCreateWithImage2()
{
  return MEMORY[0x1F40DB188]();
}

uint64_t CGPatternGetBounds()
{
  return MEMORY[0x1F40DB190]();
}

uint64_t CGPatternGetImage()
{
  return MEMORY[0x1F40DB198]();
}

uint64_t CGPatternGetMatrix()
{
  return MEMORY[0x1F40DB1A0]();
}

uint64_t CGPatternGetShading()
{
  return MEMORY[0x1F40DB1A8]();
}

uint64_t CGPatternGetStep()
{
  return MEMORY[0x1F40DB1B0]();
}

uint64_t CGPatternGetTiling()
{
  return MEMORY[0x1F40DB1B8]();
}

uint64_t CGPatternGetType()
{
  return MEMORY[0x1F40DB1C0]();
}

CFTypeID CGPatternGetTypeID(void)
{
  return MEMORY[0x1F40DB1C8]();
}

uint64_t CGPatternIsColored()
{
  return MEMORY[0x1F40DB1D0]();
}

uint64_t CGPatternIsOpaque()
{
  return MEMORY[0x1F40DB1D8]();
}

uint64_t CGPatternNotificationCenter()
{
  return MEMORY[0x1F40DB1E0]();
}

void CGPatternRelease(CGPatternRef pattern)
{
}

CGPatternRef CGPatternRetain(CGPatternRef pattern)
{
  return (CGPatternRef)MEMORY[0x1F40DB1F0](pattern);
}

uint64_t CGPostError()
{
  return MEMORY[0x1F40DB218]();
}

CGRect CGRectApplyAffineTransform(CGRect rect, CGAffineTransform *t)
{
  MEMORY[0x1F40DB220](t, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

BOOL CGRectContainsPoint(CGRect rect, CGPoint point)
{
  return MEMORY[0x1F40DB228]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, (__n128)point, *(__n128 *)&point.y);
}

BOOL CGRectContainsRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x1F40DB230]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

BOOL CGRectEqualToRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x1F40DB248]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

CGFloat CGRectGetHeight(CGRect rect)
{
  MEMORY[0x1F40DB250]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxX(CGRect rect)
{
  MEMORY[0x1F40DB268]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxY(CGRect rect)
{
  MEMORY[0x1F40DB270]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidY(CGRect rect)
{
  MEMORY[0x1F40DB288]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetWidth(CGRect rect)
{
  MEMORY[0x1F40DB2A8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGRect CGRectInset(CGRect rect, CGFloat dx, CGFloat dy)
{
  MEMORY[0x1F40DB2B8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, dx, dy);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

CGRect CGRectIntersection(CGRect r1, CGRect r2)
{
  MEMORY[0x1F40DB2C8]((__n128)r1.origin, *(__n128 *)&r1.origin.y, (__n128)r1.size, *(__n128 *)&r1.size.height, (__n128)r2.origin, *(__n128 *)&r2.origin.y, (__n128)r2.size, *(__n128 *)&r2.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

BOOL CGRectIntersectsRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x1F40DB2D0]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

BOOL CGRectIsEmpty(CGRect rect)
{
  return MEMORY[0x1F40DB2D8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

BOOL CGRectIsInfinite(CGRect rect)
{
  return MEMORY[0x1F40DB2E0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

BOOL CGRectIsNull(CGRect rect)
{
  return MEMORY[0x1F40DB2E8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

CGRect CGRectStandardize(CGRect rect)
{
  MEMORY[0x1F40DB300]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  result.size.height = v4;
  result.size.width = v3;
  result.origin.y = v2;
  result.origin.x = v1;
  return result;
}

CGRect CGRectUnion(CGRect r1, CGRect r2)
{
  MEMORY[0x1F40DB310]((__n128)r1.origin, *(__n128 *)&r1.origin.y, (__n128)r1.size, *(__n128 *)&r1.size.height, (__n128)r2.origin, *(__n128 *)&r2.origin.y, (__n128)r2.size, *(__n128 *)&r2.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

uint64_t CGRenderingStateCreateCopy()
{
  return MEMORY[0x1F40DB370]();
}

uint64_t CGRenderingStateGetAllowsAntialiasing()
{
  return MEMORY[0x1F40DB378]();
}

uint64_t CGRenderingStateGetBaseCTM()
{
  return MEMORY[0x1F40DB380]();
}

uint64_t CGRenderingStateGetFontRenderingStyle()
{
  return MEMORY[0x1F40DB388]();
}

uint64_t CGRenderingStateGetMaxInterpolationQuality()
{
  return MEMORY[0x1F40DB390]();
}

uint64_t CGRenderingStateGetMinInterpolationQuality()
{
  return MEMORY[0x1F40DB398]();
}

uint64_t CGRenderingStateRelease()
{
  return MEMORY[0x1F40DB3A0]();
}

uint64_t CGRenderingStateRetain()
{
  return MEMORY[0x1F40DB3A8]();
}

uint64_t CGRenderingStateSetBaseCTM()
{
  return MEMORY[0x1F40DB3B0]();
}

uint64_t CGSBoundingShapeAddRect()
{
  return MEMORY[0x1F40DB3B8]();
}

uint64_t CGSBoundingShapeCreate()
{
  return MEMORY[0x1F40DB3C0]();
}

uint64_t CGSBoundingShapeGetRegion()
{
  return MEMORY[0x1F40DB3C8]();
}

uint64_t CGSBoundingShapeRelease()
{
  return MEMORY[0x1F40DB3D0]();
}

uint64_t CGSBoundingShapeReset()
{
  return MEMORY[0x1F40DB3D8]();
}

uint64_t CGSDiffRegion()
{
  return MEMORY[0x1F40DB3E0]();
}

uint64_t CGSGetRegionData()
{
  return MEMORY[0x1F40DB3E8]();
}

uint64_t CGSIntersectRegionWithRect()
{
  return MEMORY[0x1F40DB3F0]();
}

uint64_t CGSNewEmptyRegion()
{
  return MEMORY[0x1F40DB3F8]();
}

uint64_t CGSNewRegionWithData()
{
  return MEMORY[0x1F40DB400]();
}

uint64_t CGSNewRegionWithRect()
{
  return MEMORY[0x1F40DB408]();
}

uint64_t CGSNextRect()
{
  return MEMORY[0x1F40DB418]();
}

uint64_t CGSRectInRegion()
{
  return MEMORY[0x1F40DB420]();
}

uint64_t CGSRegionEnumerator()
{
  return MEMORY[0x1F40DB428]();
}

uint64_t CGSRegionIsEmpty()
{
  return MEMORY[0x1F40DB430]();
}

uint64_t CGSReleaseRegion()
{
  return MEMORY[0x1F40DB440]();
}

uint64_t CGSReleaseRegionEnumerator()
{
  return MEMORY[0x1F40DB448]();
}

uint64_t CGSTransformRegion()
{
  return MEMORY[0x1F40DB450]();
}

uint64_t CGSUnionRegion()
{
  return MEMORY[0x1F40DB458]();
}

CGShadingRef CGShadingCreateAxial(CGColorSpaceRef space, CGPoint start, CGPoint end, CGFunctionRef function, BOOL extendStart, BOOL extendEnd)
{
  return (CGShadingRef)MEMORY[0x1F40DB460](space, function, extendStart, extendEnd, (__n128)start, *(__n128 *)&start.y, (__n128)end, *(__n128 *)&end.y);
}

uint64_t CGShadingCreateConic()
{
  return MEMORY[0x1F40DB468]();
}

CGShadingRef CGShadingCreateRadial(CGColorSpaceRef space, CGPoint start, CGFloat startRadius, CGPoint end, CGFloat endRadius, CGFunctionRef function, BOOL extendStart, BOOL extendEnd)
{
  return (CGShadingRef)MEMORY[0x1F40DB470](space, function, extendStart, extendEnd, (__n128)start, *(__n128 *)&start.y, startRadius, (__n128)end, *(__n128 *)&end.y, endRadius);
}

uint64_t CGShadingDrawInContextDelegate()
{
  return MEMORY[0x1F40DB478]();
}

uint64_t CGShadingGetBackground()
{
  return MEMORY[0x1F40DB480]();
}

uint64_t CGShadingGetBounds()
{
  return MEMORY[0x1F40DB488]();
}

uint64_t CGShadingGetColorSpace()
{
  return MEMORY[0x1F40DB490]();
}

uint64_t CGShadingGetDescriptor()
{
  return MEMORY[0x1F40DB498]();
}

uint64_t CGShadingGetIdentifier()
{
  return MEMORY[0x1F40DB4A0]();
}

uint64_t CGShadingGetType()
{
  return MEMORY[0x1F40DB4A8]();
}

void CGShadingRelease(CGShadingRef shading)
{
}

CGShadingRef CGShadingRetain(CGShadingRef shading)
{
  return (CGShadingRef)MEMORY[0x1F40DB4B8](shading);
}

uint64_t CGSoftMaskDelegateDrawSoftMask()
{
  return MEMORY[0x1F40DB4E8]();
}

uint64_t CGSoftMaskGetBackground()
{
  return MEMORY[0x1F40DB4F0]();
}

uint64_t CGSoftMaskGetBounds()
{
  return MEMORY[0x1F40DB4F8]();
}

uint64_t CGSoftMaskGetMatrix()
{
  return MEMORY[0x1F40DB500]();
}

uint64_t CGSoftMaskGetTransfer()
{
  return MEMORY[0x1F40DB508]();
}

uint64_t CGSoftMaskRelease()
{
  return MEMORY[0x1F40DB510]();
}

uint64_t CGSoftMaskRetain()
{
  return MEMORY[0x1F40DB518]();
}

uint64_t CGStyleGetColor()
{
  return MEMORY[0x1F40DB540]();
}

uint64_t CGStyleGetData()
{
  return MEMORY[0x1F40DB548]();
}

uint64_t CGStyleGetDrawOrdering()
{
  return MEMORY[0x1F40DB550]();
}

uint64_t CGStyleGetIdentifier()
{
  return MEMORY[0x1F40DB558]();
}

uint64_t CGStyleGetType()
{
  return MEMORY[0x1F40DB560]();
}

uint64_t CGStyleRetain()
{
  return MEMORY[0x1F40DB568]();
}

uint64_t CGTextClippingCreatePath()
{
  return MEMORY[0x1F40DB570]();
}

CTFontRef CTFontCreateCopyWithAttributes(CTFontRef font, CGFloat size, const CGAffineTransform *matrix, CTFontDescriptorRef attributes)
{
  return (CTFontRef)MEMORY[0x1F40DF338](font, matrix, attributes, size);
}

CTFontRef CTFontCreateWithGraphicsFont(CGFontRef graphicsFont, CGFloat size, const CGAffineTransform *matrix, CTFontDescriptorRef attributes)
{
  return (CTFontRef)MEMORY[0x1F40DF388](graphicsFont, matrix, attributes, size);
}

CTFontRef CTFontCreateWithName(CFStringRef name, CGFloat size, const CGAffineTransform *matrix)
{
  return (CTFontRef)MEMORY[0x1F40DF390](name, matrix, size);
}

CGFloat CTFontGetSize(CTFontRef font)
{
  MEMORY[0x1F40DF558](font);
  return result;
}

CFTypeID CTFontGetTypeID(void)
{
  return MEMORY[0x1F40DF580]();
}

CTLineRef CTLineCreateJustifiedLine(CTLineRef line, CGFloat justificationFactor, double justificationWidth)
{
  return (CTLineRef)MEMORY[0x1F40DF768](line, justificationFactor, justificationWidth);
}

CTLineRef CTLineCreateTruncatedLine(CTLineRef line, double width, CTLineTruncationType truncationType, CTLineRef truncationToken)
{
  return (CTLineRef)MEMORY[0x1F40DF778](line, *(void *)&truncationType, truncationToken, width);
}

void CTLineDraw(CTLineRef line, CGContextRef context)
{
}

CGRect CTLineGetBoundsWithOptions(CTLineRef line, CTLineBoundsOptions options)
{
  MEMORY[0x1F40DF7C8](line, options);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

uint64_t CTLineGetDefaultBounds()
{
  return MEMORY[0x1F40DF7D0]();
}

double CTLineGetPenOffsetForFlush(CTLineRef line, CGFloat flushFactor, double flushWidth)
{
  MEMORY[0x1F40DF7F8](line, flushFactor, flushWidth);
  return result;
}

double CTLineGetTypographicBounds(CTLineRef line, CGFloat *ascent, CGFloat *descent, CGFloat *leading)
{
  MEMORY[0x1F40DF820](line, ascent, descent, leading);
  return result;
}

CTLineRef CTTypesetterCreateLine(CTTypesetterRef typesetter, CFRange stringRange)
{
  return (CTLineRef)MEMORY[0x1F40DF990](typesetter, stringRange.location, stringRange.length);
}

CTTypesetterRef CTTypesetterCreateWithAttributedString(CFAttributedStringRef string)
{
  return (CTTypesetterRef)MEMORY[0x1F40DF998](string);
}

CFIndex CTTypesetterSuggestLineBreak(CTTypesetterRef typesetter, CFIndex startIndex, double width)
{
  return MEMORY[0x1F40DF9C8](typesetter, startIndex, width);
}

CFDictionaryRef CVBufferCopyAttachments(CVBufferRef buffer, CVAttachmentMode attachmentMode)
{
  return (CFDictionaryRef)MEMORY[0x1F40DFB50](buffer, *(void *)&attachmentMode);
}

CGColorSpaceRef CVImageBufferCreateColorSpaceFromAttachments(CFDictionaryRef attachments)
{
  return (CGColorSpaceRef)MEMORY[0x1F40DFC18](attachments);
}

CGSize CVImageBufferGetEncodedSize(CVImageBufferRef imageBuffer)
{
  MEMORY[0x1F40DFC38](imageBuffer);
  result.height = v2;
  result.width = v1;
  return result;
}

CVReturn CVPixelBufferCreateWithIOSurface(CFAllocatorRef allocator, IOSurfaceRef surface, CFDictionaryRef pixelBufferAttributes, CVPixelBufferRef *pixelBufferOut)
{
  return MEMORY[0x1F40DFD08](allocator, surface, pixelBufferAttributes, pixelBufferOut);
}

void *__cdecl CVPixelBufferGetBaseAddress(CVPixelBufferRef pixelBuffer)
{
  return (void *)MEMORY[0x1F40DFD28](pixelBuffer);
}

size_t CVPixelBufferGetBytesPerRow(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x1F40DFD40](pixelBuffer);
}

size_t CVPixelBufferGetDataSize(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x1F40DFD50](pixelBuffer);
}

IOSurfaceRef CVPixelBufferGetIOSurface(CVPixelBufferRef pixelBuffer)
{
  return (IOSurfaceRef)MEMORY[0x1F40DFD78](pixelBuffer);
}

OSType CVPixelBufferGetPixelFormatType(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x1F40DFD80](pixelBuffer);
}

CFTypeID CVPixelBufferGetTypeID(void)
{
  return MEMORY[0x1F40DFD90]();
}

CVReturn CVPixelBufferLockBaseAddress(CVPixelBufferRef pixelBuffer, CVPixelBufferLockFlags lockFlags)
{
  return MEMORY[0x1F40DFDB8](pixelBuffer, lockFlags);
}

void CVPixelBufferRelease(CVPixelBufferRef texture)
{
}

CVPixelBufferRef CVPixelBufferRetain(CVPixelBufferRef texture)
{
  return (CVPixelBufferRef)MEMORY[0x1F40DFE40](texture);
}

CVReturn CVPixelBufferUnlockBaseAddress(CVPixelBufferRef pixelBuffer, CVPixelBufferLockFlags unlockFlags)
{
  return MEMORY[0x1F40DFE48](pixelBuffer, unlockFlags);
}

uint64_t DRTailspinRequest()
{
  return MEMORY[0x1F4117578]();
}

uint64_t DRTailspinRequestWithLogs()
{
  return MEMORY[0x1F4117580]();
}

uint64_t EDRCreateClientForDisplayWithTimeoutAndCallback()
{
  return MEMORY[0x1F4178148]();
}

uint64_t EDREnable()
{
  return MEMORY[0x1F4178150]();
}

uint64_t EDRGetAmbientIlluminance()
{
  return MEMORY[0x1F4178158]();
}

uint64_t EDRGetDisplayBacklightBrightness()
{
  return MEMORY[0x1F4178160]();
}

uint64_t EDRGetDisplayHeadroom()
{
  return MEMORY[0x1F4178168]();
}

uint64_t EDRGetDisplayMaxLuminance()
{
  return MEMORY[0x1F4178170]();
}

uint64_t EDRRegisterCallbackBlockOnQueue()
{
  return MEMORY[0x1F4178178]();
}

uint64_t EDRReleaseClient()
{
  return MEMORY[0x1F4178180]();
}

uint64_t EDRRequestAccessibilityLimit()
{
  return MEMORY[0x1F4178188]();
}

uint64_t EDRUnregisterCallbackBlock()
{
  return MEMORY[0x1F4178198]();
}

uint64_t FPCAMetalLayerAllocated()
{
  return MEMORY[0x1F4119F08]();
}

uint64_t FPDrawableLifetimeMarkClientDidPresent()
{
  return MEMORY[0x1F4119F30]();
}

uint64_t FPDrawableLifetimeMarkFinished()
{
  return MEMORY[0x1F4119F38]();
}

uint64_t FPDrawableLifetimeMarkStarted()
{
  return MEMORY[0x1F4119F40]();
}

uint64_t FPMetalLayerMarkDealloc()
{
  return MEMORY[0x1F4119F48]();
}

uint64_t FPMetalLayerMarkSetName()
{
  return MEMORY[0x1F4119F50]();
}

uint64_t FPMetalLayerMarkSetPixelFormat()
{
  return MEMORY[0x1F4119F58]();
}

uint64_t FPMetalLayerMarkSetSize()
{
  return MEMORY[0x1F4119F60]();
}

uint64_t IOHIDEventGetFloatValue()
{
  return MEMORY[0x1F40E89F8]();
}

uint64_t IOHIDEventGetIntegerValue()
{
  return MEMORY[0x1F40E8A00]();
}

uint64_t IOHIDEventGetType()
{
  return MEMORY[0x1F40E8A38]();
}

CFArrayRef IOHIDEventSystemClientCopyServices(IOHIDEventSystemClientRef client)
{
  return (CFArrayRef)MEMORY[0x1F40E8AB8](client);
}

uint64_t IOHIDEventSystemClientCreate()
{
  return MEMORY[0x1F40E8AC0]();
}

uint64_t IOHIDEventSystemClientRegisterDeviceMatchingBlock()
{
  return MEMORY[0x1F40E8AD8]();
}

uint64_t IOHIDEventSystemClientRegisterEventBlock()
{
  return MEMORY[0x1F40E8AE8]();
}

uint64_t IOHIDEventSystemClientScheduleWithRunLoop()
{
  return MEMORY[0x1F40E8B20]();
}

uint64_t IOHIDEventSystemClientSetMatchingMultiple()
{
  return MEMORY[0x1F40E8B40]();
}

uint64_t IOHIDEventSystemClientUnregisterDeviceMatchingBlock()
{
  return MEMORY[0x1F40E8B50]();
}

uint64_t IOHIDEventSystemClientUnscheduleWithRunLoop()
{
  return MEMORY[0x1F40E8B90]();
}

BOOLean_t IOHIDServiceClientConformsTo(IOHIDServiceClientRef service, uint32_t usagePage, uint32_t usage)
{
  return MEMORY[0x1F40E8D00](service, *(void *)&usagePage, *(void *)&usage);
}

uint64_t IOHIDServiceClientCopyEvent()
{
  return MEMORY[0x1F40E8D08]();
}

CFTypeRef IOHIDServiceClientCopyProperty(IOHIDServiceClientRef service, CFStringRef key)
{
  return (CFTypeRef)MEMORY[0x1F40E8D20](service, key);
}

io_object_t IOIteratorNext(io_iterator_t iterator)
{
  return MEMORY[0x1F40E8ED8](*(void *)&iterator);
}

uint64_t IOMFBGainEncoderCreate()
{
  return MEMORY[0x1F4124978]();
}

uint64_t IOMFBGainEncoderDestroy()
{
  return MEMORY[0x1F4124980]();
}

uint64_t IOMFBGainEncoderEmitRun()
{
  return MEMORY[0x1F4124988]();
}

uint64_t IOMFBGainEncoderFinishEncoding()
{
  return MEMORY[0x1F4124990]();
}

uint64_t IOMFBGainEncoderStartRow()
{
  return MEMORY[0x1F4124998]();
}

uint64_t IOMFBGainMapRelease()
{
  return MEMORY[0x1F41249A0]();
}

kern_return_t IOMainPort(mach_port_t bootstrapPort, mach_port_t *mainPort)
{
  return MEMORY[0x1F40E8EF0](*(void *)&bootstrapPort, mainPort);
}

uint64_t IOMobileFrameBufferSwapSetContrastEnhancerStrength()
{
  return MEMORY[0x1F41249A8]();
}

uint64_t IOMobileFrameBufferSwapSetUserLuminanceAdjustment()
{
  return MEMORY[0x1F41249B0]();
}

uint64_t IOMobileFramebufferChangeFrameInfo()
{
  return MEMORY[0x1F41249B8]();
}

uint64_t IOMobileFramebufferCopyLayerDisplayedSurface()
{
  return MEMORY[0x1F41249C0]();
}

uint64_t IOMobileFramebufferCopyProperty()
{
  return MEMORY[0x1F41249C8]();
}

uint64_t IOMobileFramebufferCreateDisplayList()
{
  return MEMORY[0x1F41249D0]();
}

uint64_t IOMobileFramebufferDisableHotPlugDetectNotifications()
{
  return MEMORY[0x1F41249D8]();
}

uint64_t IOMobileFramebufferDisableVSyncNotifications()
{
  return MEMORY[0x1F41249E8]();
}

uint64_t IOMobileFramebufferEnableDisableVideoPowerSavings()
{
  return MEMORY[0x1F41249F0]();
}

uint64_t IOMobileFramebufferEnableHotPlugDetectNotifications()
{
  return MEMORY[0x1F41249F8]();
}

uint64_t IOMobileFramebufferEnableVSyncNotifications()
{
  return MEMORY[0x1F4124A08]();
}

uint64_t IOMobileFramebufferFrameInfo()
{
  return MEMORY[0x1F4124A10]();
}

uint64_t IOMobileFramebufferGetBandwidth()
{
  return MEMORY[0x1F4124A18]();
}

uint64_t IOMobileFramebufferGetBlock()
{
  return MEMORY[0x1F4124A20]();
}

uint64_t IOMobileFramebufferGetBrightnessControlCapabilities()
{
  return MEMORY[0x1F4124A28]();
}

uint64_t IOMobileFramebufferGetCanvasSizes()
{
  return MEMORY[0x1F4124A38]();
}

uint64_t IOMobileFramebufferGetColorRemapMode()
{
  return MEMORY[0x1F4124A40]();
}

uint64_t IOMobileFramebufferGetDigitalOutMode()
{
  return MEMORY[0x1F4124A48]();
}

uint64_t IOMobileFramebufferGetDigitalOutState()
{
  return MEMORY[0x1F4124A50]();
}

uint64_t IOMobileFramebufferGetDisplayArea()
{
  return MEMORY[0x1F4124A58]();
}

uint64_t IOMobileFramebufferGetDisplaySize()
{
  return MEMORY[0x1F4124A60]();
}

uint64_t IOMobileFramebufferGetLayerDefaultSurface()
{
  return MEMORY[0x1F4124A80]();
}

uint64_t IOMobileFramebufferGetMatrix()
{
  return MEMORY[0x1F4124A90]();
}

uint64_t IOMobileFramebufferGetProtectionOptions()
{
  return MEMORY[0x1F4124A98]();
}

uint64_t IOMobileFramebufferGetRunLoopSource()
{
  return MEMORY[0x1F4124AA0]();
}

uint64_t IOMobileFramebufferGetServiceObject()
{
  return MEMORY[0x1F4124AB0]();
}

uint64_t IOMobileFramebufferGetSupportedDigitalOutModes()
{
  return MEMORY[0x1F4124AB8]();
}

uint64_t IOMobileFramebufferGetVSyncRunLoopSource()
{
  return MEMORY[0x1F4124AC0]();
}

uint64_t IOMobileFramebufferGetWirelessSurfaceWithOptions()
{
  return MEMORY[0x1F4124AC8]();
}

uint64_t IOMobileFramebufferOpen()
{
  return MEMORY[0x1F4124AD8]();
}

uint64_t IOMobileFramebufferOpenByName()
{
  return MEMORY[0x1F4124AE0]();
}

uint64_t IOMobileFramebufferRequestPowerChange()
{
  return MEMORY[0x1F4124AE8]();
}

uint64_t IOMobileFramebufferSetBrightnessControlCallback()
{
  return MEMORY[0x1F4124AF0]();
}

uint64_t IOMobileFramebufferSetBrightnessCorrection()
{
  return MEMORY[0x1F4124AF8]();
}

uint64_t IOMobileFramebufferSetColorRemapMode()
{
  return MEMORY[0x1F4124B00]();
}

uint64_t IOMobileFramebufferSetContrast()
{
  return MEMORY[0x1F4124B08]();
}

uint64_t IOMobileFramebufferSetDebugFlags()
{
  return MEMORY[0x1F4124B10]();
}

uint64_t IOMobileFramebufferSetDigitalOutMode()
{
  return MEMORY[0x1F4124B18]();
}

uint64_t IOMobileFramebufferSetDisplayDevice()
{
  return MEMORY[0x1F4124B20]();
}

uint64_t IOMobileFramebufferSetIdleBuffer()
{
  return MEMORY[0x1F4124B28]();
}

uint64_t IOMobileFramebufferSetIdleBufferEvent()
{
  return MEMORY[0x1F4124B30]();
}

uint64_t IOMobileFramebufferSetMatrix()
{
  return MEMORY[0x1F4124B38]();
}

uint64_t IOMobileFramebufferSetParameter()
{
  return MEMORY[0x1F4124B40]();
}

uint64_t IOMobileFramebufferSetPreset()
{
  return MEMORY[0x1F4124B48]();
}

uint64_t IOMobileFramebufferSetTwilightStrength()
{
  return MEMORY[0x1F4124B50]();
}

uint64_t IOMobileFramebufferSupportedFrameInfo()
{
  return MEMORY[0x1F4124B58]();
}

uint64_t IOMobileFramebufferSwapActiveRegion()
{
  return MEMORY[0x1F4124B60]();
}

uint64_t IOMobileFramebufferSwapBegin()
{
  return MEMORY[0x1F4124B68]();
}

uint64_t IOMobileFramebufferSwapCancel()
{
  return MEMORY[0x1F4124B70]();
}

uint64_t IOMobileFramebufferSwapCancelAll()
{
  return MEMORY[0x1F4124B78]();
}

uint64_t IOMobileFramebufferSwapDebugInfo()
{
  return MEMORY[0x1F4124B80]();
}

uint64_t IOMobileFramebufferSwapDirtyRegion()
{
  return MEMORY[0x1F4124B88]();
}

uint64_t IOMobileFramebufferSwapEnd()
{
  return MEMORY[0x1F4124B90]();
}

uint64_t IOMobileFramebufferSwapSetAmbientLux()
{
  return MEMORY[0x1F4124B98]();
}

uint64_t IOMobileFramebufferSwapSetBackgroundColor()
{
  return MEMORY[0x1F4124BA0]();
}

uint64_t IOMobileFramebufferSwapSetBlit()
{
  return MEMORY[0x1F4124BA8]();
}

uint64_t IOMobileFramebufferSwapSetBrightness()
{
  return MEMORY[0x1F4124BB0]();
}

uint64_t IOMobileFramebufferSwapSetBrightnessLimit()
{
  return MEMORY[0x1F4124BB8]();
}

uint64_t IOMobileFramebufferSwapSetColorMatrix()
{
  return MEMORY[0x1F4124BC0]();
}

uint64_t IOMobileFramebufferSwapSetColorRemapMode()
{
  return MEMORY[0x1F4124BC8]();
}

uint64_t IOMobileFramebufferSwapSetDisplayEdr()
{
  return MEMORY[0x1F4124BD0]();
}

uint64_t IOMobileFramebufferSwapSetDisplayEdrHeadroom()
{
  return MEMORY[0x1F4124BD8]();
}

uint64_t IOMobileFramebufferSwapSetEventSignal()
{
  return MEMORY[0x1F4124BE0]();
}

uint64_t IOMobileFramebufferSwapSetEventWait()
{
  return MEMORY[0x1F4124BE8]();
}

uint64_t IOMobileFramebufferSwapSetGainMap()
{
  return MEMORY[0x1F4124BF0]();
}

uint64_t IOMobileFramebufferSwapSetICCCurve()
{
  return MEMORY[0x1F4124BF8]();
}

uint64_t IOMobileFramebufferSwapSetICCMatrix()
{
  return MEMORY[0x1F4124C00]();
}

uint64_t IOMobileFramebufferSwapSetIndicatorBrightnessLimit()
{
  return MEMORY[0x1F4124C08]();
}

uint64_t IOMobileFramebufferSwapSetParams()
{
  return MEMORY[0x1F4124C18]();
}

uint64_t IOMobileFramebufferSwapSetSecureAnimation()
{
  return MEMORY[0x1F4124C20]();
}

uint64_t IOMobileFramebufferSwapSetTimestamps()
{
  return MEMORY[0x1F4124C28]();
}

uint64_t IOMobileFramebufferSwapWait()
{
  return MEMORY[0x1F4124C30]();
}

uint64_t IOMobileFramebufferSwapWorkaroundSettings()
{
  return MEMORY[0x1F4124C38]();
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return MEMORY[0x1F40E8F60](*(void *)&object);
}

kern_return_t IOObjectRetain(io_object_t object)
{
  return MEMORY[0x1F40E8F68](*(void *)&object);
}

CFTypeRef IORegistryEntryCreateCFProperty(io_registry_entry_t entry, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return (CFTypeRef)MEMORY[0x1F40E9168](*(void *)&entry, key, allocator, *(void *)&options);
}

CFTypeRef IORegistryEntrySearchCFProperty(io_registry_entry_t entry, const io_name_t plane, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return (CFTypeRef)MEMORY[0x1F40E9208](*(void *)&entry, plane, key, allocator, *(void *)&options);
}

kern_return_t IORegistryEntrySetCFProperty(io_registry_entry_t entry, CFStringRef propertyName, CFTypeRef property)
{
  return MEMORY[0x1F40E9220](*(void *)&entry, propertyName, property);
}

io_service_t IOServiceGetMatchingService(mach_port_t mainPort, CFDictionaryRef matching)
{
  return MEMORY[0x1F40E9250](*(void *)&mainPort, matching);
}

kern_return_t IOServiceGetMatchingServices(mach_port_t mainPort, CFDictionaryRef matching, io_iterator_t *existing)
{
  return MEMORY[0x1F40E9258](*(void *)&mainPort, matching, existing);
}

CFMutableDictionaryRef IOServiceMatching(const char *name)
{
  return (CFMutableDictionaryRef)MEMORY[0x1F40E9268](name);
}

CFMutableDictionaryRef IOServiceNameMatching(const char *name)
{
  return (CFMutableDictionaryRef)MEMORY[0x1F40E9278](name);
}

uint64_t IOSurfaceAcceleratorBlitSurface()
{
  return MEMORY[0x1F4124C40]();
}

uint64_t IOSurfaceAcceleratorCreate()
{
  return MEMORY[0x1F4124C48]();
}

uint64_t IOSurfaceAcceleratorGetRunLoopSource()
{
  return MEMORY[0x1F4124C58]();
}

uint64_t IOSurfaceAcceleratorGetTransformEstimation()
{
  return MEMORY[0x1F4124C60]();
}

uint64_t IOSurfaceAcceleratorTransformSurface()
{
  return MEMORY[0x1F4124C78]();
}

size_t IOSurfaceAlignProperty(CFStringRef property, size_t value)
{
  return MEMORY[0x1F40E92D8](property, value);
}

Boolean IOSurfaceAllowsPixelSizeCasting(IOSurfaceRef buffer)
{
  return MEMORY[0x1F40E92E0](buffer);
}

CFDictionaryRef IOSurfaceCopyAllValues(IOSurfaceRef buffer)
{
  return (CFDictionaryRef)MEMORY[0x1F40E92F8](buffer);
}

CFTypeRef IOSurfaceCopyValue(IOSurfaceRef buffer, CFStringRef key)
{
  return (CFTypeRef)MEMORY[0x1F40E9300](buffer, key);
}

IOSurfaceRef IOSurfaceCreate(CFDictionaryRef properties)
{
  return (IOSurfaceRef)MEMORY[0x1F40E9308](properties);
}

mach_port_t IOSurfaceCreateMachPort(IOSurfaceRef buffer)
{
  return MEMORY[0x1F40E9318](buffer);
}

void IOSurfaceDecrementUseCount(IOSurfaceRef buffer)
{
}

size_t IOSurfaceGetAllocSize(IOSurfaceRef buffer)
{
  return MEMORY[0x1F40E9350](buffer);
}

void *__cdecl IOSurfaceGetBaseAddress(IOSurfaceRef buffer)
{
  return (void *)MEMORY[0x1F40E9358](buffer);
}

void *__cdecl IOSurfaceGetBaseAddressOfPlane(IOSurfaceRef buffer, size_t planeIndex)
{
  return (void *)MEMORY[0x1F40E9380](buffer, planeIndex);
}

uint64_t IOSurfaceGetBulkAttachments()
{
  return MEMORY[0x1F40E9388]();
}

size_t IOSurfaceGetBytesPerElement(IOSurfaceRef buffer)
{
  return MEMORY[0x1F40E9398](buffer);
}

size_t IOSurfaceGetBytesPerRow(IOSurfaceRef buffer)
{
  return MEMORY[0x1F40E93A8](buffer);
}

size_t IOSurfaceGetBytesPerRowOfPlane(IOSurfaceRef buffer, size_t planeIndex)
{
  return MEMORY[0x1F40E93B8](buffer, planeIndex);
}

uint64_t IOSurfaceGetCacheMode()
{
  return MEMORY[0x1F40E93D0]();
}

uint64_t IOSurfaceGetCompressionTypeOfPlane()
{
  return MEMORY[0x1F40E93F0]();
}

uint64_t IOSurfaceGetDataProperty()
{
  return MEMORY[0x1F40E93F8]();
}

uint64_t IOSurfaceGetDetachModeCode()
{
  return MEMORY[0x1F40E9400]();
}

size_t IOSurfaceGetHeight(IOSurfaceRef buffer)
{
  return MEMORY[0x1F40E9440](buffer);
}

size_t IOSurfaceGetHeightOfPlane(IOSurfaceRef buffer, size_t planeIndex)
{
  return MEMORY[0x1F40E9450](buffer, planeIndex);
}

IOSurfaceID IOSurfaceGetID(IOSurfaceRef buffer)
{
  return MEMORY[0x1F40E9460](buffer);
}

uint64_t IOSurfaceGetIndexedTimestamp()
{
  return MEMORY[0x1F40E9468]();
}

OSType IOSurfaceGetPixelFormat(IOSurfaceRef buffer)
{
  return MEMORY[0x1F40E9480](buffer);
}

size_t IOSurfaceGetPlaneCount(IOSurfaceRef buffer)
{
  return MEMORY[0x1F40E9488](buffer);
}

size_t IOSurfaceGetPropertyMaximum(CFStringRef property)
{
  return MEMORY[0x1F40E94A0](property);
}

uint64_t IOSurfaceGetProtectionOptions()
{
  return MEMORY[0x1F40E94A8]();
}

CFTypeID IOSurfaceGetTypeID(void)
{
  return MEMORY[0x1F40E94E0]();
}

size_t IOSurfaceGetWidth(IOSurfaceRef buffer)
{
  return MEMORY[0x1F40E94F8](buffer);
}

size_t IOSurfaceGetWidthOfPlane(IOSurfaceRef buffer, size_t planeIndex)
{
  return MEMORY[0x1F40E9508](buffer, planeIndex);
}

uint64_t IOSurfaceGetYCbCrMatrix()
{
  return MEMORY[0x1F40E9510]();
}

void IOSurfaceIncrementUseCount(IOSurfaceRef buffer)
{
}

uint64_t IOSurfaceInitDetachModeCode()
{
  return MEMORY[0x1F40E9528]();
}

Boolean IOSurfaceIsInUse(IOSurfaceRef buffer)
{
  return MEMORY[0x1F40E9530](buffer);
}

uint64_t IOSurfaceIsTiled()
{
  return MEMORY[0x1F40E9538]();
}

kern_return_t IOSurfaceLock(IOSurfaceRef buffer, IOSurfaceLockOptions options, uint32_t *seed)
{
  return MEMORY[0x1F40E9540](buffer, *(void *)&options, seed);
}

IOSurfaceRef IOSurfaceLookup(IOSurfaceID csid)
{
  return (IOSurfaceRef)MEMORY[0x1F40E9550](*(void *)&csid);
}

IOSurfaceRef IOSurfaceLookupFromMachPort(mach_port_t port)
{
  return (IOSurfaceRef)MEMORY[0x1F40E9558](*(void *)&port);
}

void IOSurfaceRemoveValue(IOSurfaceRef buffer, CFStringRef key)
{
}

uint64_t IOSurfaceSetBulkAttachments2()
{
  return MEMORY[0x1F40E95A0]();
}

uint64_t IOSurfaceSetDetachModeCode()
{
  return MEMORY[0x1F40E95B8]();
}

uint64_t IOSurfaceSetIndexedTimestamp()
{
  return MEMORY[0x1F40E95C0]();
}

uint64_t IOSurfaceSetOwnershipIdentity()
{
  return MEMORY[0x1F40E95D0]();
}

kern_return_t IOSurfaceSetPurgeable(IOSurfaceRef buffer, uint32_t newState, uint32_t *oldState)
{
  return MEMORY[0x1F40E95D8](buffer, *(void *)&newState, oldState);
}

void IOSurfaceSetValue(IOSurfaceRef buffer, CFStringRef key, CFTypeRef value)
{
}

void IOSurfaceSetValues(IOSurfaceRef buffer, CFDictionaryRef keysAndValues)
{
}

uint64_t IOSurfaceSetYCbCrMatrix()
{
  return MEMORY[0x1F40E95F8]();
}

uint64_t IOSurfaceSignalEvent()
{
  return MEMORY[0x1F40E9620]();
}

uint64_t IOSurfaceSupportsProtectionOptions()
{
  return MEMORY[0x1F40E9628]();
}

kern_return_t IOSurfaceUnlock(IOSurfaceRef buffer, IOSurfaceLockOptions options, uint32_t *seed)
{
  return MEMORY[0x1F40E9630](buffer, *(void *)&options, seed);
}

uint64_t IOSurfaceWrapClientImage()
{
  return MEMORY[0x1F40E9640]();
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x1F417CDE0]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x1F417CE00]();
}

uint64_t MGGetFloat32Answer()
{
  return MEMORY[0x1F417CE10]();
}

uint64_t MGGetProductType()
{
  return MEMORY[0x1F417CE18]();
}

uint64_t MGGetSInt32Answer()
{
  return MEMORY[0x1F417CE28]();
}

uint64_t MGGetSInt64Answer()
{
  return MEMORY[0x1F417CE30]();
}

uint64_t MGIsDeviceOneOfType()
{
  return MEMORY[0x1F417CE48]();
}

id MTLCreateSystemDefaultDevice(void)
{
  return (id)MEMORY[0x1F40EDE00]();
}

uint64_t MTLGetTextureLevelInfoForDeviceWithOptions()
{
  return MEMORY[0x1F40EDE28]();
}

uint64_t MTLPixelFormatGetInfoForDevice()
{
  return MEMORY[0x1F40EDE38]();
}

uint64_t MTLPixelFormatGetName()
{
  return MEMORY[0x1F40EDE48]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x1F40E7010](aClassName);
}

const char *__cdecl NSGetSizeAndAlignment(const char *typePtr, NSUInteger *sizep, NSUInteger *alignp)
{
  return (const char *)MEMORY[0x1F40D8B10](typePtr, sizep, alignp);
}

void NSLog(NSString *format, ...)
{
}

uint64_t NSRecordAllocationEvent()
{
  return MEMORY[0x1F40E7218]();
}

SEL NSSelectorFromString(NSString *aSelectorName)
{
  return (SEL)MEMORY[0x1F40E7258](aSelectorName);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1F40E7280](aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x1F40E72B0](aSelector);
}

NSString *NSTemporaryDirectory(void)
{
  return (NSString *)MEMORY[0x1F40E72C8]();
}

uint64_t PLLogTimeSensitiveRegisteredEvent()
{
  return MEMORY[0x1F4145D98]();
}

uint64_t SILManagerCreate()
{
  return MEMORY[0x1F414A038]();
}

uint64_t SILManagerFrameNumberFromBounds()
{
  return MEMORY[0x1F414A040]();
}

uint64_t SILManagerIndicatorExtent()
{
  return MEMORY[0x1F414A048]();
}

uint64_t SILManagerIndicatorNameFromType()
{
  return MEMORY[0x1F414A050]();
}

uint64_t SILManagerIndicatorTypeIDFromName()
{
  return MEMORY[0x1F414A058]();
}

uint64_t SILManagerIndicatorValidPositions()
{
  return MEMORY[0x1F414A060]();
}

uint64_t SILManagerSetLogLevel()
{
  return MEMORY[0x1F414A068]();
}

uint64_t SILManagerSetPower()
{
  return MEMORY[0x1F414A070]();
}

uint64_t SILManagerSwap()
{
  return MEMORY[0x1F414A078]();
}

uint64_t SILManagerSwapEnd()
{
  return MEMORY[0x1F414A080]();
}

uint64_t SILManagerTrySetPower()
{
  return MEMORY[0x1F414A088]();
}

uint64_t SILManagerTurnOffRegions()
{
  return MEMORY[0x1F414A090]();
}

uint64_t SILStateMachineCreate()
{
  return MEMORY[0x1F414A098]();
}

uint64_t SILStateMachineForceTransitionToState()
{
  return MEMORY[0x1F414A0A0]();
}

uint64_t SILStateMachineRelease()
{
  return MEMORY[0x1F414A0A8]();
}

uint64_t SILStateMachineStateList()
{
  return MEMORY[0x1F414A0B0]();
}

uint64_t SILStateMachineTick()
{
  return MEMORY[0x1F414A0B8]();
}

uint64_t SILStateMachineTransitionSupported()
{
  return MEMORY[0x1F414A0C0]();
}

uint64_t SILStateMachineTransitionToState()
{
  return MEMORY[0x1F414A0C8]();
}

CFTypeRef SecTaskCopyValueForEntitlement(SecTaskRef task, CFStringRef entitlement, CFErrorRef *error)
{
  return (CFTypeRef)MEMORY[0x1F40F7138](task, entitlement, error);
}

SecTaskRef SecTaskCreateWithAuditToken(CFAllocatorRef allocator, audit_token_t *token)
{
  return (SecTaskRef)MEMORY[0x1F40F7168](allocator, token);
}

uint64_t VMUGetFlagsForAllVMRegionStatistics()
{
  return MEMORY[0x1F415C9B8]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x1F40C9A70](aBlock);
}

void _Block_object_assign(void *a1, const void *a2, const int a3)
{
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Block_release(const void *aBlock)
{
}

uint64_t _CFRunLoop01()
{
  return MEMORY[0x1F40D9088]();
}

uint64_t _CFRunLoopCurrentIsMain()
{
  return MEMORY[0x1F40D9090]();
}

uint64_t _CFRuntimeCreateInstance()
{
  return MEMORY[0x1F40D90D0]();
}

uint64_t _CFRuntimeRegisterClass()
{
  return MEMORY[0x1F40D90E8]();
}

void *_MXSignpostMetricsSnapshot(void)
{
  return (void *)MEMORY[0x1F4150340]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

int std::string::compare(const std::string *this, const std::string::value_type *__s)
{
  return MEMORY[0x1F417E390](this, __s);
}

std::exception_ptr *__cdecl std::exception_ptr::exception_ptr(std::exception_ptr *this, const std::exception_ptr *a2)
{
  return (std::exception_ptr *)MEMORY[0x1F417E4A0](this, a2);
}

void std::exception_ptr::~exception_ptr(std::exception_ptr *this)
{
}

size_t std::__next_prime(size_t __n)
{
  return MEMORY[0x1F417E588](__n);
}

void std::string::resize(std::string *this, std::string::size_type __n, std::string::value_type __c)
{
}

void std::string::push_back(std::string *this, std::string::value_type __c)
{
}

std::string *__cdecl std::string::basic_string(std::string *this, const std::string *__str, std::string::size_type __pos, std::string::size_type __n, std::allocator<char> *__a)
{
  return (std::string *)MEMORY[0x1F417E660](this, __str, __pos, __n, __a);
}

std::string *__cdecl std::string::operator=(std::string *this, const std::string *__str)
{
  return (std::string *)MEMORY[0x1F417E670](this, __str);
}

uint64_t std::istream::sentry::sentry()
{
  return MEMORY[0x1F417E7A0]();
}

void std::__shared_count::~__shared_count(std::__shared_count *this)
{
}

uint64_t std::iostream::~basic_iostream()
{
  return MEMORY[0x1F417E940]();
}

std::__thread_struct *__cdecl std::__thread_struct::__thread_struct(std::__thread_struct *this)
{
  return (std::__thread_struct *)MEMORY[0x1F417E968](this);
}

void std::__thread_struct::~__thread_struct(std::__thread_struct *this)
{
}

uint64_t std::streambuf::basic_streambuf()
{
  return MEMORY[0x1F417E978]();
}

uint64_t std::streambuf::~streambuf()
{
  return MEMORY[0x1F417E980]();
}

void std::__assoc_sub_state::__sub_wait(std::__assoc_sub_state *this, std::unique_lock<std::mutex> *__lk)
{
}

void std::__assoc_sub_state::wait(std::__assoc_sub_state *this)
{
}

void std::condition_variable::notify_all(std::condition_variable *this)
{
}

void std::condition_variable::__do_timed_wait(std::condition_variable *this, std::unique_lock<std::mutex> *__lk, std::chrono::time_point<std::chrono::system_clock, std::chrono::duration<long long, std::ratio<1, 1000000000>>> a3)
{
}

void std::condition_variable::~condition_variable(std::condition_variable *this)
{
}

std::__thread_specific_ptr<std::__thread_struct> *std::__thread_local_data(void)
{
  return (std::__thread_specific_ptr<std::__thread_struct> *)MEMORY[0x1F417EAA0]();
}

void std::__throw_system_error(int __ev, const char *__what_arg)
{
}

void std::__libcpp_verbose_abort(const char *__format, ...)
{
}

int std::stoi(const std::string *__str, size_t *__idx, int __base)
{
  return MEMORY[0x1F417EBE0](__str, __idx, *(void *)&__base);
}

void std::mutex::lock(std::mutex *this)
{
}

void std::mutex::unlock(std::mutex *this)
{
}

void std::mutex::~mutex(std::mutex *this)
{
}

std::chrono::steady_clock::time_point std::chrono::steady_clock::now(void)
{
  return (std::chrono::steady_clock::time_point)MEMORY[0x1F417EC90]();
}

std::chrono::system_clock::time_point std::chrono::system_clock::now(void)
{
  return (std::chrono::system_clock::time_point)MEMORY[0x1F417ECA0]();
}

void std::thread::detach(std::thread *this)
{
}

void std::thread::~thread(std::thread *this)
{
}

void std::ios_base::init(std::ios_base *this, void *__sb)
{
}

void std::ios_base::clear(std::ios_base *this, std::ios_base::iostate __state)
{
}

uint64_t std::ios::~ios()
{
  return MEMORY[0x1F417EE40]();
}

void std::rethrow_exception(std::exception_ptr a1)
{
}

void std::terminate(void)
{
}

void operator delete[]()
{
  while (1)
    ;
}

void operator delete(void *__p)
{
  while (1)
    ;
}

void operator delete()
{
  while (1)
    ;
}

void operator new[]()
{
  while (1)
    ;
}

void *__cdecl operator new(size_t __sz)
{
  while (1)
    ;
}

void operator new()
{
  while (1)
    ;
}

uint64_t __CFSetLastAllocationEventName()
{
  return MEMORY[0x1F40D95A0]();
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

void *__cxa_begin_catch(void *a1)
{
  return (void *)MEMORY[0x1F417EF48](a1);
}

void __cxa_guard_abort(__guard *a1)
{
}

int __cxa_guard_acquire(__guard *a1)
{
  return MEMORY[0x1F417EF80](a1);
}

void __cxa_guard_release(__guard *a1)
{
}

int *__error(void)
{
  return (int *)MEMORY[0x1F40C9B88]();
}

uint64_t __invert_d3()
{
  return MEMORY[0x1F40C9BE0]();
}

simd_float3x3 __invert_f3(simd_float3x3 a1)
{
  MEMORY[0x1F40C9BF8]((__n128)a1.columns[0], (__n128)a1.columns[1], (__n128)a1.columns[2]);
  result.columns[2].i64[1] = v6;
  result.columns[2].i64[0] = v5;
  result.columns[1].i64[1] = v4;
  result.columns[1].i64[0] = v3;
  result.columns[0].i64[1] = v2;
  result.columns[0].i64[0] = v1;
  return result;
}

int __maskrune(__darwin_ct_rune_t a1, unint64_t a2)
{
  return MEMORY[0x1F40C9C18](*(void *)&a1, a2);
}

uint64_t __powidf2()
{
  return MEMORY[0x1F40C9C58]();
}

__double2 __sincos_stret(double a1)
{
  MEMORY[0x1F40C9C80](a1);
  result.__cosval = v2;
  result.__sinval = v1;
  return result;
}

__float2 __sincosf_stret(float a1)
{
  MEMORY[0x1F40C9C88](a1);
  result.__cosval = v2;
  result.__sinval = v1;
  return result;
}

__darwin_ct_rune_t __toupper(__darwin_ct_rune_t a1)
{
  return MEMORY[0x1F40C9D00](*(void *)&a1);
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x1F40C9FB0]();
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _os_signpost_emit_unreliably_with_name_impl()
{
  return MEMORY[0x1F40CA058]();
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x1F415B160]();
}

void abort(void)
{
}

uint64_t abort_report_np()
{
  return MEMORY[0x1F40CA1E8]();
}

uint64_t abort_with_payload()
{
  return MEMORY[0x1F40CA1F0]();
}

long double acos(long double __x)
{
  MEMORY[0x1F40CA330](__x);
  return result;
}

float acosf(float a1)
{
  MEMORY[0x1F40CA340](a1);
  return result;
}

uint64_t analytics_send_event_lazy()
{
  return MEMORY[0x1F41138E0]();
}

uint32_t arc4random(void)
{
  return MEMORY[0x1F40CA3A8]();
}

void arc4random_buf(void *__buf, size_t __nbytes)
{
}

uint32_t arc4random_uniform(uint32_t __upper_bound)
{
  return MEMORY[0x1F40CA3C0](*(void *)&__upper_bound);
}

long double asin(long double __x)
{
  MEMORY[0x1F40CA3D0](__x);
  return result;
}

int asprintf(char **a1, const char *a2, ...)
{
  return MEMORY[0x1F40CA440](a1, a2);
}

long double atan2(long double __y, long double __x)
{
  MEMORY[0x1F40CA460](__y, __x);
  return result;
}

float atan2f(float a1, float a2)
{
  MEMORY[0x1F40CA468](a1, a2);
  return result;
}

int atexit(void (*a1)(void))
{
  return MEMORY[0x1F40CA488](a1);
}

double atof(const char *a1)
{
  MEMORY[0x1F40CA498](a1);
  return result;
}

int atoi(const char *a1)
{
  return MEMORY[0x1F40CA4A8](a1);
}

int backtrace(void **a1, int a2)
{
  return MEMORY[0x1F40CA4F8](a1, *(void *)&a2);
}

char **__cdecl backtrace_symbols(void *const *a1, int a2)
{
  return (char **)MEMORY[0x1F40CA508](a1, *(void *)&a2);
}

kern_return_t bootstrap_check_in(mach_port_t bp, const name_t service_name, mach_port_t *sp)
{
  return MEMORY[0x1F40CA538](*(void *)&bp, service_name, sp);
}

kern_return_t bootstrap_look_up(mach_port_t bp, const name_t service_name, mach_port_t *sp)
{
  return MEMORY[0x1F40CA548](*(void *)&bp, service_name, sp);
}

uint64_t bootstrap_look_up_per_user()
{
  return MEMORY[0x1F40CA558]();
}

const char *__cdecl bootstrap_strerror(kern_return_t r)
{
  return (const char *)MEMORY[0x1F40CA568](*(void *)&r);
}

void *__cdecl bsearch(const void *__key, const void *__base, size_t __nel, size_t __width, int (__cdecl *__compar)(const void *, const void *))
{
  return (void *)MEMORY[0x1F40CA570](__key, __base, __nel, __width, __compar);
}

void bzero(void *a1, size_t a2)
{
}

long double cbrt(long double __x)
{
  MEMORY[0x1F40CA688](__x);
  return result;
}

BOOL class_addMethod(Class cls, SEL name, IMP imp, const char *types)
{
  return MEMORY[0x1F41814C8](cls, name, imp, types);
}

Method *__cdecl class_copyMethodList(Class cls, unsigned int *outCount)
{
  return (Method *)MEMORY[0x1F41814F8](cls, outCount);
}

objc_property_t *__cdecl class_copyPropertyList(Class cls, unsigned int *outCount)
{
  return (objc_property_t *)MEMORY[0x1F4181500](cls, outCount);
}

id class_createInstance(Class cls, size_t extraBytes)
{
  return (id)MEMORY[0x1F4181510](cls, extraBytes);
}

Method class_getInstanceMethod(Class cls, SEL name)
{
  return (Method)MEMORY[0x1F4181528](cls, name);
}

IMP class_getMethodImplementation(Class cls, SEL name)
{
  return (IMP)MEMORY[0x1F4181540](cls, name);
}

const char *__cdecl class_getName(Class cls)
{
  return (const char *)MEMORY[0x1F4181548](cls);
}

Class class_getSuperclass(Class cls)
{
  return (Class)MEMORY[0x1F4181558](cls);
}

int close(int a1)
{
  return MEMORY[0x1F40CB3F8](*(void *)&a1);
}

size_t compression_decode_buffer(uint8_t *dst_buffer, size_t dst_size, const uint8_t *src_buffer, size_t src_size, void *scratch_buffer, compression_algorithm algorithm)
{
  return MEMORY[0x1F417F0A0](dst_buffer, dst_size, src_buffer, src_size, scratch_buffer, *(void *)&algorithm);
}

size_t confstr(int a1, char *a2, size_t a3)
{
  return MEMORY[0x1F40CB438](*(void *)&a1, a2, a3);
}

long double cos(long double __x)
{
  MEMORY[0x1F40CB8A8](__x);
  return result;
}

float cosf(float a1)
{
  MEMORY[0x1F40CB8B0](a1);
  return result;
}

void dispatch_activate(dispatch_object_t object)
{
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_apply(size_t iterations, dispatch_queue_t queue, void *block)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_async_f(dispatch_queue_t queue, void *context, dispatch_function_t work)
{
}

void dispatch_barrier_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_block_t dispatch_block_create(dispatch_block_flags_t flags, dispatch_block_t block)
{
  return (dispatch_block_t)MEMORY[0x1F40CB9C0](flags, block);
}

intptr_t dispatch_block_wait(dispatch_block_t block, dispatch_time_t timeout)
{
  return MEMORY[0x1F40CB9F8](block, timeout);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1F40CBA60](identifier, flags);
}

void dispatch_group_async_f(dispatch_group_t group, dispatch_queue_t queue, void *context, dispatch_function_t work)
{
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x1F40CBA88]();
}

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return MEMORY[0x1F40CBAC0](group, timeout);
}

uint64_t dispatch_mach_cancel()
{
  return MEMORY[0x1F40CBB38]();
}

uint64_t dispatch_mach_connect()
{
  return MEMORY[0x1F40CBB40]();
}

uint64_t dispatch_mach_create()
{
  return MEMORY[0x1F40CBB48]();
}

uint64_t dispatch_mach_msg_get_msg()
{
  return MEMORY[0x1F40CBB68]();
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

void dispatch_once_f(dispatch_once_t *predicate, void *context, dispatch_function_t function)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x1F40CBBB8](attr, *(void *)&qos_class, *(void *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1F40CBBC0](label, attr);
}

dispatch_queue_t dispatch_queue_create_with_target_V2(const char *label, dispatch_queue_attr_t attr, dispatch_queue_t target)
{
  return (dispatch_queue_t)MEMORY[0x1F40CBBD0](label, attr, target);
}

void dispatch_release(dispatch_object_t object)
{
}

void dispatch_resume(dispatch_object_t object)
{
}

void dispatch_retain(dispatch_object_t object)
{
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x1F40CBC30](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x1F40CBC40](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x1F40CBC50](dsema, timeout);
}

uint64_t dispatch_set_qos_class_fallback()
{
  return MEMORY[0x1F40CBC70]();
}

void dispatch_set_qos_class_floor(dispatch_object_t object, dispatch_qos_class_t qos_class, int relative_priority)
{
}

void dispatch_source_cancel(dispatch_source_t source)
{
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x1F40CBC98](type, handle, mask, queue);
}

void dispatch_source_set_cancel_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_source_set_event_handler_f(dispatch_source_t source, dispatch_function_t handler)
{
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_sync_f(dispatch_queue_t queue, void *context, dispatch_function_t work)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1F40CBD30](when, delta);
}

dispatch_workloop_t dispatch_workloop_create_inactive(const char *label)
{
  return (dispatch_workloop_t)MEMORY[0x1F40CBD58](label);
}

uint64_t dispatch_workloop_set_scheduler_priority()
{
  return MEMORY[0x1F40CBD88]();
}

char *dlerror(void)
{
  return (char *)MEMORY[0x1F40CBDB0]();
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x1F40CBDB8](__path, *(void *)&__mode);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x1F40CBDC8](__handle, __symbol);
}

uint64_t dyld_program_sdk_at_least()
{
  return MEMORY[0x1F40CBEC8]();
}

uint64_t dyld_shared_cache_some_image_overridden()
{
  return MEMORY[0x1F40CBF10]();
}

long double exp(long double __x)
{
  MEMORY[0x1F40CBFE0](__x);
  return result;
}

long double exp2(long double __x)
{
  MEMORY[0x1F40CBFE8](__x);
  return result;
}

float exp2f(float a1)
{
  MEMORY[0x1F40CBFF0](a1);
  return result;
}

float expf(float a1)
{
  MEMORY[0x1F40CBFF8](a1);
  return result;
}

int fchmod(int a1, mode_t a2)
{
  return MEMORY[0x1F40CC028](*(void *)&a1, a2);
}

int fclose(FILE *a1)
{
  return MEMORY[0x1F40CC050](a1);
}

long double fmod(long double __x, long double __y)
{
  MEMORY[0x1F40CC1A0](__x, __y);
  return result;
}

float fmodf(float a1, float a2)
{
  MEMORY[0x1F40CC1A8](a1, a2);
  return result;
}

FILE *__cdecl fopen(const char *__filename, const char *__mode)
{
  return (FILE *)MEMORY[0x1F40CC1C0](__filename, __mode);
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x1F40CC1D8](a1, a2);
}

void free(void *a1)
{
}

long double frexp(long double __x, int *__e)
{
  MEMORY[0x1F40CC248](__e, __x);
  return result;
}

int fseeko(FILE *__stream, off_t a2, int __whence)
{
  return MEMORY[0x1F40CC298](__stream, a2, *(void *)&__whence);
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x1F40CC338](__ptr, __size, __nitems, __stream);
}

char *__cdecl getenv(const char *a1)
{
  return (char *)MEMORY[0x1F40CC3B0](a1);
}

pid_t getpid(void)
{
  return MEMORY[0x1F40CC4A0]();
}

uid_t getuid(void)
{
  return MEMORY[0x1F40CC570]();
}

uint64_t ht_fence_start()
{
  return MEMORY[0x1F411CC80]();
}

uint64_t ht_fence_timeout()
{
  return MEMORY[0x1F411CC88]();
}

IMP imp_implementationWithBlock(id block)
{
  return (IMP)MEMORY[0x1F4181598](block);
}

uint64_t kdebug_trace()
{
  return MEMORY[0x1F40CC700]();
}

tm *__cdecl localtime_r(const time_t *a1, tm *a2)
{
  return (tm *)MEMORY[0x1F40CC870](a1, a2);
}

long double log(long double __x)
{
  MEMORY[0x1F40CC878](__x);
  return result;
}

long double log2(long double __x)
{
  MEMORY[0x1F40CC8A8](__x);
  return result;
}

float log2f(float a1)
{
  MEMORY[0x1F40CC8B0](a1);
  return result;
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x1F40CC910]();
}

uint64_t mach_continuous_time(void)
{
  return MEMORY[0x1F40CC930]();
}

char *__cdecl mach_error_string(mach_error_t error_value)
{
  return (char *)MEMORY[0x1F40CC940](*(void *)&error_value);
}

uint64_t mach_get_times()
{
  return MEMORY[0x1F40CC948]();
}

kern_return_t mach_make_memory_entry_64(vm_map_t target_task, memory_object_size_t *size, memory_object_offset_t offset, vm_prot_t permission, mach_port_t *object_handle, mem_entry_name_port_t parent_entry)
{
  return MEMORY[0x1F40CC958](*(void *)&target_task, size, offset, *(void *)&permission, object_handle, *(void *)&parent_entry);
}

mach_msg_return_t mach_msg(mach_msg_header_t *msg, mach_msg_option_t option, mach_msg_size_t send_size, mach_msg_size_t rcv_size, mach_port_name_t rcv_name, mach_msg_timeout_t timeout, mach_port_name_t notify)
{
  return MEMORY[0x1F40CC970](msg, *(void *)&option, *(void *)&send_size, *(void *)&rcv_size, *(void *)&rcv_name, *(void *)&timeout, *(void *)&notify);
}

void mach_msg_destroy(mach_msg_header_t *a1)
{
}

kern_return_t mach_port_allocate(ipc_space_t task, mach_port_right_t right, mach_port_name_t *name)
{
  return MEMORY[0x1F40CC9A0](*(void *)&task, *(void *)&right, name);
}

kern_return_t mach_port_construct(ipc_space_t task, mach_port_options_ptr_t options, mach_port_context_t context, mach_port_name_t *name)
{
  return MEMORY[0x1F40CC9A8](*(void *)&task, options, context, name);
}

kern_return_t mach_port_deallocate(ipc_space_t task, mach_port_name_t name)
{
  return MEMORY[0x1F40CC9B8](*(void *)&task, *(void *)&name);
}

kern_return_t mach_port_destruct(ipc_space_t task, mach_port_name_t name, mach_port_delta_t srdelta, mach_port_context_t guard)
{
  return MEMORY[0x1F40CC9C8](*(void *)&task, *(void *)&name, *(void *)&srdelta, guard);
}

kern_return_t mach_port_extract_right(ipc_space_t task, mach_port_name_t name, mach_msg_type_name_t msgt_name, mach_port_t *poly, mach_msg_type_name_t *polyPoly)
{
  return MEMORY[0x1F40CC9D8](*(void *)&task, *(void *)&name, *(void *)&msgt_name, poly, polyPoly);
}

kern_return_t mach_port_get_attributes(ipc_space_read_t task, mach_port_name_t name, mach_port_flavor_t flavor, mach_port_info_t port_info_out, mach_msg_type_number_t *port_info_outCnt)
{
  return MEMORY[0x1F40CC9E0](*(void *)&task, *(void *)&name, *(void *)&flavor, port_info_out, port_info_outCnt);
}

kern_return_t mach_port_insert_right(ipc_space_t task, mach_port_name_t name, mach_port_t poly, mach_msg_type_name_t polyPoly)
{
  return MEMORY[0x1F40CCA08](*(void *)&task, *(void *)&name, *(void *)&poly, *(void *)&polyPoly);
}

kern_return_t mach_port_mod_refs(ipc_space_t task, mach_port_name_t name, mach_port_right_t right, mach_port_delta_t delta)
{
  return MEMORY[0x1F40CCA10](*(void *)&task, *(void *)&name, *(void *)&right, *(void *)&delta);
}

kern_return_t mach_port_move_member(ipc_space_t task, mach_port_name_t member, mach_port_name_t after)
{
  return MEMORY[0x1F40CCA18](*(void *)&task, *(void *)&member, *(void *)&after);
}

kern_return_t mach_port_request_notification(ipc_space_t task, mach_port_name_t name, mach_msg_id_t msgid, mach_port_mscount_t sync, mach_port_t notify, mach_msg_type_name_t notifyPoly, mach_port_t *previous)
{
  return MEMORY[0x1F40CCA28](*(void *)&task, *(void *)&name, *(void *)&msgid, *(void *)&sync, *(void *)&notify, *(void *)&notifyPoly, previous);
}

kern_return_t mach_port_set_attributes(ipc_space_t task, mach_port_name_t name, mach_port_flavor_t flavor, mach_port_info_t port_info, mach_msg_type_number_t port_infoCnt)
{
  return MEMORY[0x1F40CCA30](*(void *)&task, *(void *)&name, *(void *)&flavor, port_info, *(void *)&port_infoCnt);
}

kern_return_t mach_port_type(ipc_space_t task, mach_port_name_t name, mach_port_type_t *ptype)
{
  return MEMORY[0x1F40CCA40](*(void *)&task, *(void *)&name, ptype);
}

mach_port_t mach_thread_self(void)
{
  return MEMORY[0x1F40CCA58]();
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x1F40CCA60](info);
}

kern_return_t mach_vm_deallocate(vm_map_t target, mach_vm_address_t address, mach_vm_size_t size)
{
  return MEMORY[0x1F40CCA78](*(void *)&target, address, size);
}

kern_return_t mach_vm_map(vm_map_t target_task, mach_vm_address_t *address, mach_vm_size_t size, mach_vm_offset_t mask, int flags, mem_entry_name_port_t object, memory_object_offset_t offset, BOOLean_t copy, vm_prot_t cur_protection, vm_prot_t max_protection, vm_inherit_t inheritance)
{
  return MEMORY[0x1F40CCA80](*(void *)&target_task, address, size, mask, *(void *)&flags, *(void *)&object, offset, *(void *)&copy);
}

kern_return_t mach_vm_region(vm_map_read_t target_task, mach_vm_address_t *address, mach_vm_size_t *size, vm_region_flavor_t flavor, vm_region_info_t info, mach_msg_type_number_t *infoCnt, mach_port_t *object_name)
{
  return MEMORY[0x1F40CCAA8](*(void *)&target_task, address, size, *(void *)&flavor, info, infoCnt, object_name);
}

malloc_zone_t *__cdecl malloc_create_zone(vm_size_t start_size, unsigned int flags)
{
  return (malloc_zone_t *)MEMORY[0x1F40CCB20](start_size, *(void *)&flags);
}

size_t malloc_good_size(size_t size)
{
  return MEMORY[0x1F40CCB58](size);
}

void malloc_set_zone_name(malloc_zone_t *zone, const char *name)
{
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1F40CCB90](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1F40CCB98](size, type_id);
}

void *__cdecl malloc_type_realloc(void *ptr, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1F40CCBA8](ptr, size, type_id);
}

void *__cdecl malloc_type_valloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1F40CCBB0](size, type_id);
}

void *__cdecl malloc_type_zone_calloc(malloc_zone_t *zone, size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1F40CCBB8](zone, count, size, type_id);
}

void *__cdecl malloc_type_zone_malloc(malloc_zone_t *zone, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1F40CCBC0](zone, size, type_id);
}

void malloc_zone_free(malloc_zone_t *zone, void *ptr)
{
}

void *__cdecl memchr(void *__s, int __c, size_t __n)
{
  return (void *)MEMORY[0x1F40CCCD8](__s, *(void *)&__c, __n);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x1F40CCCE8](__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1F40CCCF0](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1F40CCD10](__dst, __src, __len);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x1F40CCD20](__b, *(void *)&__c, __len);
}

void memset_pattern16(void *__b, const void *__pattern16, size_t __len)
{
}

void memset_pattern4(void *__b, const void *__pattern4, size_t __len)
{
}

errno_t memset_s(void *__s, rsize_t __smax, int __c, rsize_t __n)
{
  return MEMORY[0x1F40CCD40](__s, __smax, *(void *)&__c, __n);
}

int mergesort(void *__base, size_t __nel, size_t __width, int (__cdecl *__compar)(const void *, const void *))
{
  return MEMORY[0x1F40CCD48](__base, __nel, __width, __compar);
}

SEL method_getName(Method m)
{
  return (SEL)MEMORY[0x1F4181600](m);
}

void mig_dealloc_reply_port(mach_port_t reply_port)
{
}

mach_port_t mig_get_reply_port(void)
{
  return MEMORY[0x1F40CCD70]();
}

void mig_put_reply_port(mach_port_t reply_port)
{
}

int mig_strncpy(char *dest, const char *src, int len)
{
  return MEMORY[0x1F40CCD90](dest, src, *(void *)&len);
}

int mig_strncpy_zerofill(char *dest, const char *src, int len)
{
  return MEMORY[0x1F40CCD98](dest, src, *(void *)&len);
}

uint64_t mk_timer_arm_leeway()
{
  return MEMORY[0x1F40CCDB0]();
}

uint64_t mk_timer_cancel()
{
  return MEMORY[0x1F40CCDB8]();
}

uint64_t mk_timer_create()
{
  return MEMORY[0x1F40CCDC0]();
}

uint64_t mk_timer_destroy()
{
  return MEMORY[0x1F40CCDC8]();
}

int mkstemps(char *a1, int a2)
{
  return MEMORY[0x1F40CCE18](a1, *(void *)&a2);
}

void *__cdecl mmap(void *a1, size_t a2, int a3, int a4, int a5, off_t a6)
{
  return (void *)MEMORY[0x1F40CCE40](a1, a2, *(void *)&a3, *(void *)&a4, *(void *)&a5, a6);
}

int munmap(void *a1, size_t a2)
{
  return MEMORY[0x1F40CCE88](a1, a2);
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x1F40CD028](*(void *)&token);
}

uint32_t notify_get_state(int token, uint64_t *state64)
{
  return MEMORY[0x1F40CD040](*(void *)&token, state64);
}

uint32_t notify_post(const char *name)
{
  return MEMORY[0x1F40CD050](name);
}

uint32_t notify_register_check(const char *name, int *out_token)
{
  return MEMORY[0x1F40CD058](name, out_token);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x1F40CD060](name, out_token, queue, handler);
}

uint32_t notify_set_state(int token, uint64_t state64)
{
  return MEMORY[0x1F40CD088](*(void *)&token, state64);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1F4181638](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1F4181648]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x1F4181660](a1);
}

{
  MEMORY[0x1F4181668](context);
}

{
  return (void *)MEMORY[0x1F4181670]();
}

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x1F4181680](exc_buf);
}

void objc_copyStruct(void *dest, const void *src, ptrdiff_t size, BOOL atomic, BOOL hasStrong)
{
}

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_end_catch(void)
{
}

void objc_enumerationMutation(id obj)
{
}

void objc_exception_rethrow(void)
{
}

void objc_exception_throw(id exception)
{
}

id objc_getAssociatedObject(id object, const void *key)
{
  return (id)MEMORY[0x1F4181718](object, key);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x1F4181748](self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x1F4181758](location, val);
}

id objc_loadWeak(id *location)
{
  return (id)MEMORY[0x1F4181778](location);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x1F4181780](location);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x1F4181798](a1, a2);
}

id objc_msgSendSuper(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1F41817A0](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1F41817A8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x1F41817B0]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x1F41817B8]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x1F41817C0]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x1F41817C8]();
}

uint64_t self
{
  return MEMORY[0x1F41817D0]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1F41818B0](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x1F41818B8](a1);
}

void objc_setAssociatedObject(id object, const void *key, id value, void *policy)
{
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_nonatomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x1F4181A18](location, obj);
}

id objc_storeWeakOrNil(id *location, id obj)
{
  return (id)MEMORY[0x1F4181A20](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x1F4181A28](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x1F4181A30](obj);
}

Class object_getClass(id a1)
{
  return (Class)MEMORY[0x1F4181A58](a1);
}

void *__cdecl object_getIndexedIvars(id a1)
{
  return (void *)MEMORY[0x1F4181A68](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1F40CD360](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1F40CD3B8](oslog, type);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x1F40CD550](log);
}

os_signpost_id_t os_signpost_id_generate(os_log_t log)
{
  return MEMORY[0x1F40CD558](log);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

BOOL os_unfair_lock_trylock(os_unfair_lock_t lock)
{
  return MEMORY[0x1F40CD5F0](lock);
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

uint64_t os_variant_has_factory_content()
{
  return MEMORY[0x1F40CD640]();
}

uint64_t os_variant_has_internal_diagnostics()
{
  return MEMORY[0x1F40CD650]();
}

uint64_t os_variant_has_internal_ui()
{
  return MEMORY[0x1F40CD658]();
}

uint64_t os_variant_uses_ephemeral_storage()
{
  return MEMORY[0x1F40CD670]();
}

long double pow(long double __x, long double __y)
{
  MEMORY[0x1F40CD818](__x, __y);
  return result;
}

float powf(float a1, float a2)
{
  MEMORY[0x1F40CD828](a1, a2);
  return result;
}

uint64_t pps_create_telemetry_identifier()
{
  return MEMORY[0x1F4145DE0]();
}

uint64_t pps_send_telemetry()
{
  return MEMORY[0x1F4145DE8]();
}

int proc_name(int pid, void *buffer, uint32_t buffersize)
{
  return MEMORY[0x1F40CD888](*(void *)&pid, buffer, *(void *)&buffersize);
}

int proc_pidpath(int pid, void *buffer, uint32_t buffersize)
{
  return MEMORY[0x1F40CD8B8](*(void *)&pid, buffer, *(void *)&buffersize);
}

uint64_t proc_setthread_cpupercent()
{
  return MEMORY[0x1F40CD8F0]();
}

const char *__cdecl property_getAttributes(objc_property_t property)
{
  return (const char *)MEMORY[0x1F4181AC8](property);
}

const char *__cdecl property_getName(objc_property_t property)
{
  return (const char *)MEMORY[0x1F4181AD0](property);
}

int pthread_attr_destroy(pthread_attr_t *a1)
{
  return MEMORY[0x1F40CD918](a1);
}

int pthread_attr_getstacksize(const pthread_attr_t *a1, size_t *a2)
{
  return MEMORY[0x1F40CD928](a1, a2);
}

int pthread_attr_init(pthread_attr_t *a1)
{
  return MEMORY[0x1F40CD930](a1);
}

int pthread_attr_setdetachstate(pthread_attr_t *a1, int a2)
{
  return MEMORY[0x1F40CD940](a1, *(void *)&a2);
}

int pthread_attr_setscope(pthread_attr_t *a1, int a2)
{
  return MEMORY[0x1F40CD960](a1, *(void *)&a2);
}

int pthread_attr_setstacksize(pthread_attr_t *a1, size_t a2)
{
  return MEMORY[0x1F40CD968](a1, a2);
}

int pthread_cond_broadcast(pthread_cond_t *a1)
{
  return MEMORY[0x1F40CD978](a1);
}

int pthread_cond_destroy(pthread_cond_t *a1)
{
  return MEMORY[0x1F40CD980](a1);
}

int pthread_cond_init(pthread_cond_t *a1, const pthread_condattr_t *a2)
{
  return MEMORY[0x1F40CD988](a1, a2);
}

int pthread_cond_signal(pthread_cond_t *a1)
{
  return MEMORY[0x1F40CD990](a1);
}

int pthread_cond_timedwait_relative_np(pthread_cond_t *a1, pthread_mutex_t *a2, const timespec *a3)
{
  return MEMORY[0x1F40CD9A0](a1, a2, a3);
}

int pthread_cond_wait(pthread_cond_t *a1, pthread_mutex_t *a2)
{
  return MEMORY[0x1F40CD9A8](a1, a2);
}

int pthread_create(pthread_t *a1, const pthread_attr_t *a2, void *(__cdecl *a3)(void *), void *a4)
{
  return MEMORY[0x1F40CD9B8](a1, a2, a3, a4);
}

int pthread_getschedparam(pthread_t a1, int *a2, sched_param *a3)
{
  return MEMORY[0x1F40CDA18](a1, a2, a3);
}

void *__cdecl pthread_getspecific(pthread_key_t a1)
{
  return (void *)MEMORY[0x1F40CDA20](a1);
}

int pthread_key_create(pthread_key_t *a1, void (__cdecl *a2)(void *))
{
  return MEMORY[0x1F40CDA40](a1, a2);
}

uint64_t pthread_key_init_np()
{
  return MEMORY[0x1F40CDA50]();
}

int pthread_main_np(void)
{
  return MEMORY[0x1F40CDA68]();
}

int pthread_mutex_destroy(pthread_mutex_t *a1)
{
  return MEMORY[0x1F40CDA78](a1);
}

int pthread_mutex_init(pthread_mutex_t *a1, const pthread_mutexattr_t *a2)
{
  return MEMORY[0x1F40CDA80](a1, a2);
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return MEMORY[0x1F40CDA88](a1);
}

int pthread_mutex_trylock(pthread_mutex_t *a1)
{
  return MEMORY[0x1F40CDA90](a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return MEMORY[0x1F40CDA98](a1);
}

int pthread_mutexattr_destroy(pthread_mutexattr_t *a1)
{
  return MEMORY[0x1F40CDAA0](a1);
}

int pthread_mutexattr_init(pthread_mutexattr_t *a1)
{
  return MEMORY[0x1F40CDAA8](a1);
}

int pthread_mutexattr_settype(pthread_mutexattr_t *a1, int a2)
{
  return MEMORY[0x1F40CDAC0](a1, *(void *)&a2);
}

pthread_t pthread_self(void)
{
  return (pthread_t)MEMORY[0x1F40CDB30]();
}

int pthread_setname_np(const char *a1)
{
  return MEMORY[0x1F40CDB60](a1);
}

int pthread_setschedparam(pthread_t a1, int a2, const sched_param *a3)
{
  return MEMORY[0x1F40CDB68](a1, *(void *)&a2, a3);
}

int pthread_setspecific(pthread_key_t a1, const void *a2)
{
  return MEMORY[0x1F40CDB70](a1, a2);
}

int pthread_threadid_np(pthread_t a1, __uint64_t *a2)
{
  return MEMORY[0x1F40CDB90](a1, a2);
}

void qsort(void *__base, size_t __nel, size_t __width, int (__cdecl *__compar)(const void *, const void *))
{
}

const char *__cdecl sel_getName(SEL sel)
{
  return (const char *)MEMORY[0x1F4181B28](sel);
}

SEL sel_registerName(const char *str)
{
  return (SEL)MEMORY[0x1F4181B48](str);
}

int setlinebuf(FILE *a1)
{
  return MEMORY[0x1F40CDF88](a1);
}

long double sin(long double __x)
{
  MEMORY[0x1F40CE058](__x);
  return result;
}

unsigned int sleep(unsigned int a1)
{
  return MEMORY[0x1F40CE078](*(void *)&a1);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x1F40CE080](__str, __size, __format);
}

int snprintf_l(char *a1, size_t a2, locale_t a3, const char *a4, ...)
{
  return MEMORY[0x1F40CE088](a1, a2, a3, a4);
}

int sscanf(const char *a1, const char *a2, ...)
{
  return MEMORY[0x1F40CE0D0](a1, a2);
}

char *__cdecl stpcpy(char *__dst, const char *__src)
{
  return (char *)MEMORY[0x1F40CE128](__dst, __src);
}

int strcasecmp(const char *a1, const char *a2)
{
  return MEMORY[0x1F40CE138](a1, a2);
}

char *__cdecl strchr(char *__s, int __c)
{
  return (char *)MEMORY[0x1F40CE150](__s, *(void *)&__c);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x1F40CE158](__s1, __s2);
}

char *__cdecl strcpy(char *__dst, const char *__src)
{
  return (char *)MEMORY[0x1F40CE168](__dst, __src);
}

char *__cdecl strdup(const char *__s1)
{
  return (char *)MEMORY[0x1F40CE178](__s1);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x1F40CE188](*(void *)&__errnum);
}

size_t strftime(char *a1, size_t a2, const char *a3, const tm *a4)
{
  return MEMORY[0x1F40CE198](a1, a2, a3, a4);
}

size_t strlcpy(char *__dst, const char *__source, size_t __size)
{
  return MEMORY[0x1F40CE1B0](__dst, __source, __size);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1F40CE1C8](__s);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return MEMORY[0x1F40CE1F0](__s1, __s2, __n);
}

char *__cdecl strncpy(char *__dst, const char *__src, size_t __n)
{
  return (char *)MEMORY[0x1F40CE1F8](__dst, __src, __n);
}

char *__cdecl strndup(const char *__s1, size_t __n)
{
  return (char *)MEMORY[0x1F40CE200](__s1, __n);
}

size_t strnlen(const char *__s1, size_t __n)
{
  return MEMORY[0x1F40CE208](__s1, __n);
}

char *__cdecl strstr(char *__s1, const char *__s2)
{
  return (char *)MEMORY[0x1F40CE258](__s1, __s2);
}

float strtof(const char *a1, char **a2)
{
  MEMORY[0x1F40CE270](a1, a2);
  return result;
}

uint64_t strtol(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x1F40CE2A0](__str, __endptr, *(void *)&__base);
}

int sysctl(int *a1, u_int a2, void *a3, size_t *a4, void *a5, size_t a6)
{
  return MEMORY[0x1F40CE3C0](a1, *(void *)&a2, a3, a4, a5, a6);
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return MEMORY[0x1F40CE3D0](a1, a2, a3, a4, a5);
}

long double tan(long double __x)
{
  MEMORY[0x1F40CE420](__x);
  return result;
}

float tanf(float a1)
{
  MEMORY[0x1F40CE428](a1);
  return result;
}

kern_return_t task_create_identity_token(task_t task, task_id_token_t *token)
{
  return MEMORY[0x1F40CE440](*(void *)&task, token);
}

kern_return_t task_info(task_name_t target_task, task_flavor_t flavor, task_info_t task_info_out, mach_msg_type_number_t *task_info_outCnt)
{
  return MEMORY[0x1F40CE470](*(void *)&target_task, *(void *)&flavor, task_info_out, task_info_outCnt);
}

kern_return_t task_name_for_pid(mach_port_name_t target_tport, int pid, mach_port_name_t *tn)
{
  return MEMORY[0x1F40CE480](*(void *)&target_tport, *(void *)&pid, tn);
}

kern_return_t thread_policy_set(thread_act_t thread, thread_policy_flavor_t flavor, thread_policy_t policy_info, mach_msg_type_number_t policy_infoCnt)
{
  return MEMORY[0x1F40CE540](*(void *)&thread, *(void *)&flavor, policy_info, *(void *)&policy_infoCnt);
}

time_t time(time_t *a1)
{
  return MEMORY[0x1F40CE588](a1);
}

int usleep(useconds_t a1)
{
  return MEMORY[0x1F40CE608](*(void *)&a1);
}

vImage_Error vImageAffineWarp_ARGB16U(const vImage_Buffer *src, const vImage_Buffer *dest, void *tempBuffer, const vImage_AffineTransform *transform, const Pixel_ARGB_16U backColor, vImage_Flags flags)
{
  return MEMORY[0x1F40D2210](src, dest, tempBuffer, transform, backColor, *(void *)&flags);
}

vImage_Error vImageAffineWarp_ARGB8888(const vImage_Buffer *src, const vImage_Buffer *dest, void *tempBuffer, const vImage_AffineTransform *transform, const Pixel_8888 backColor, vImage_Flags flags)
{
  return MEMORY[0x1F40D2220](src, dest, tempBuffer, transform, backColor, *(void *)&flags);
}

vImage_Error vImageAffineWarp_Planar8(const vImage_Buffer *src, const vImage_Buffer *dest, void *tempBuffer, const vImage_AffineTransform *transform, Pixel_8 backColor, vImage_Flags flags)
{
  return MEMORY[0x1F40D2228](src, dest, tempBuffer, transform, backColor, *(void *)&flags);
}

vImage_Error vImageBoxConvolve_Planar8(const vImage_Buffer *src, const vImage_Buffer *dest, void *tempBuffer, vImagePixelCount srcOffsetToROI_X, vImagePixelCount srcOffsetToROI_Y, uint32_t kernel_height, uint32_t kernel_width, Pixel_8 backgroundColor, vImage_Flags flags)
{
  return MEMORY[0x1F40D2260](src, dest, tempBuffer, srcOffsetToROI_X, srcOffsetToROI_Y, *(void *)&kernel_height, *(void *)&kernel_width, backgroundColor);
}

vImage_Error vImageClipToAlpha_ARGB8888(const vImage_Buffer *src, const vImage_Buffer *dest, vImage_Flags flags)
{
  return MEMORY[0x1F40D2388](src, dest, *(void *)&flags);
}

vImage_Error vImageClipToAlpha_RGBA8888(const vImage_Buffer *src, const vImage_Buffer *dest, vImage_Flags flags)
{
  return MEMORY[0x1F40D2390](src, dest, *(void *)&flags);
}

vImage_Error vImageConvert_420Yp8_CbCr8ToARGB8888(const vImage_Buffer *srcYp, const vImage_Buffer *srcCbCr, const vImage_Buffer *dest, const vImage_YpCbCrToARGB *info, const uint8_t permuteMap[4], const uint8_t alpha, vImage_Flags flags)
{
  return MEMORY[0x1F40D23E0](srcYp, srcCbCr, dest, info, permuteMap, alpha, *(void *)&flags);
}

vImage_Error vImageConvert_XRGB2101010ToARGB16F(const vImage_Buffer *src, Pixel_F alpha, const vImage_Buffer *dest, int32_t RGB101010RangeMin, int32_t RGB101010RangeMax, const uint8_t permuteMap[4], vImage_Flags flags)
{
  return MEMORY[0x1F40D2728](src, dest, *(void *)&RGB101010RangeMin, *(void *)&RGB101010RangeMax, permuteMap, *(void *)&flags, alpha);
}

vImage_Error vImageConvert_XRGB2101010ToARGB8888(const vImage_Buffer *src, Pixel_8 alpha, const vImage_Buffer *dest, int32_t RGB101010RangeMin, int32_t RGB101010RangeMax, const uint8_t permuteMap[4], vImage_Flags flags)
{
  return MEMORY[0x1F40D2738](src, alpha, dest, *(void *)&RGB101010RangeMin, *(void *)&RGB101010RangeMax, permuteMap, *(void *)&flags);
}

uint64_t vImageConvert_XRGB2101010_A8ToARGB16F()
{
  return MEMORY[0x1F40D2768]();
}

uint64_t vImageConvert_XRGB2101010_A8ToARGB8888()
{
  return MEMORY[0x1F40D2770]();
}

vImage_Error vImageConvert_YpCbCrToARGB_GenerateConversion(const vImage_YpCbCrToARGBMatrix *matrix, const vImage_YpCbCrPixelRange *pixelRange, vImage_YpCbCrToARGB *outInfo, vImageYpCbCrType inYpCbCrType, vImageARGBType outARGBType, vImage_Flags flags)
{
  return MEMORY[0x1F40D2788](matrix, pixelRange, outInfo, *(void *)&inYpCbCrType, *(void *)&outARGBType, *(void *)&flags);
}

vImage_Error vImageConvolve_Planar8(const vImage_Buffer *src, const vImage_Buffer *dest, void *tempBuffer, vImagePixelCount srcOffsetToROI_X, vImagePixelCount srcOffsetToROI_Y, const int16_t *kernel, uint32_t kernel_height, uint32_t kernel_width, int32_t divisor, Pixel_8 backgroundColor, vImage_Flags flags)
{
  return MEMORY[0x1F40D2840](src, dest, tempBuffer, srcOffsetToROI_X, srcOffsetToROI_Y, kernel, *(void *)&kernel_height, *(void *)&kernel_width);
}

vImage_Error vImagePermuteChannels_ARGB8888(const vImage_Buffer *src, const vImage_Buffer *dest, const uint8_t permuteMap[4], vImage_Flags flags)
{
  return MEMORY[0x1F40D2B58](src, dest, permuteMap, *(void *)&flags);
}

vImage_Error vImagePremultipliedAlphaBlend_BGRA8888(const vImage_Buffer *srcTop, const vImage_Buffer *srcBottom, const vImage_Buffer *dest, vImage_Flags flags)
{
  return MEMORY[0x1F40D2BE0](srcTop, srcBottom, dest, *(void *)&flags);
}

int vasprintf(char **a1, const char *a2, va_list a3)
{
  return MEMORY[0x1F40CE680](a1, a2, a3);
}

int vfprintf(FILE *a1, const char *a2, va_list a3)
{
  return MEMORY[0x1F40CE690](a1, a2, a3);
}

kern_return_t vm_allocate(vm_map_t target_task, vm_address_t *address, vm_size_t size, int flags)
{
  return MEMORY[0x1F40CE6A8](*(void *)&target_task, address, size, *(void *)&flags);
}

kern_return_t vm_deallocate(vm_map_t target_task, vm_address_t address, vm_size_t size)
{
  return MEMORY[0x1F40CE6C0](*(void *)&target_task, address, size);
}

kern_return_t vm_protect(vm_map_t target_task, vm_address_t address, vm_size_t size, BOOLean_t set_maximum, vm_prot_t new_protection)
{
  return MEMORY[0x1F40CE6D8](*(void *)&target_task, address, size, *(void *)&set_maximum, *(void *)&new_protection);
}

kern_return_t vm_purgable_control(vm_map_t target_task, vm_address_t address, vm_purgable_t control, int *state)
{
  return MEMORY[0x1F40CE6E0](*(void *)&target_task, address, *(void *)&control, state);
}

voucher_mach_msg_state_t voucher_mach_msg_adopt(mach_msg_header_t *msg)
{
  return (voucher_mach_msg_state_t)MEMORY[0x1F40CE740](msg);
}

void voucher_mach_msg_clear(mach_msg_header_t *msg)
{
}

void voucher_mach_msg_revert(voucher_mach_msg_state_t state)
{
}

BOOLean_t voucher_mach_msg_set(mach_msg_header_t *msg)
{
  return MEMORY[0x1F40CE758](msg);
}

int vsnprintf(char *__str, size_t __size, const char *__format, va_list a4)
{
  return MEMORY[0x1F40CE790](__str, __size, __format, a4);
}

__int32 *__cdecl wmemchr(__int32 *__s, __int32 __c, size_t __n)
{
  return (__int32 *)MEMORY[0x1F40CE8B0](__s, *(void *)&__c, __n);
}

uint64_t work_interval_create()
{
  return MEMORY[0x1F40CE8C8]();
}

uint64_t work_interval_destroy()
{
  return MEMORY[0x1F40CE8D0]();
}

uint64_t work_interval_instance_alloc()
{
  return MEMORY[0x1F40CE8D8]();
}

uint64_t work_interval_instance_clear()
{
  return MEMORY[0x1F40CE8E0]();
}

uint64_t work_interval_instance_finish()
{
  return MEMORY[0x1F40CE8E8]();
}

uint64_t work_interval_instance_free()
{
  return MEMORY[0x1F40CE8F0]();
}

uint64_t work_interval_instance_set_complexity()
{
  return MEMORY[0x1F40CE8F8]();
}

uint64_t work_interval_instance_set_deadline()
{
  return MEMORY[0x1F40CE900]();
}

uint64_t work_interval_instance_set_finish()
{
  return MEMORY[0x1F40CE908]();
}

uint64_t work_interval_instance_set_start()
{
  return MEMORY[0x1F40CE910]();
}

uint64_t work_interval_instance_start()
{
  return MEMORY[0x1F40CE918]();
}

ssize_t write(int __fd, const void *__buf, size_t __nbyte)
{
  return MEMORY[0x1F40CE928](*(void *)&__fd, __buf, __nbyte);
}

xmlParserCtxtPtr xmlCreatePushParserCtxt(xmlSAXHandlerPtr sax, void *user_data, const char *chunk, int size, const char *filename)
{
  return (xmlParserCtxtPtr)MEMORY[0x1F4182620](sax, user_data, chunk, *(void *)&size, filename);
}

int xmlCtxtUseOptions(xmlParserCtxtPtr ctxt, int options)
{
  return MEMORY[0x1F4182640](ctxt, *(void *)&options);
}

void xmlFreeParserCtxt(xmlParserCtxtPtr ctxt)
{
}

xmlEntityPtr xmlGetPredefinedEntity(const xmlChar *name)
{
  return (xmlEntityPtr)MEMORY[0x1F41826F8](name);
}

int xmlParseChunk(xmlParserCtxtPtr ctxt, const char *chunk, int size, int terminate)
{
  return MEMORY[0x1F41827E0](ctxt, chunk, *(void *)&size, *(void *)&terminate);
}

uint64_t xpc_dictionary_copy_mach_send()
{
  return MEMORY[0x1F40CEE18]();
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x1F40CEE20](keys, values, count);
}

uint64_t xpc_dictionary_get_uint64(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x1F40CEEF8](xdict, key);
}

xpc_object_t xpc_dictionary_get_value(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x1F40CEF10](xdict, key);
}

void xpc_dictionary_set_BOOL(xpc_object_t xdict, const char *key, BOOL value)
{
}

uint64_t xpc_dictionary_set_mach_send()
{
  return MEMORY[0x1F40CEF98]();
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
}

void xpc_dictionary_set_uint64(xpc_object_t xdict, const char *key, uint64_t value)
{
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x1F40CF148](object);
}

void xpc_release(xpc_object_t object)
{
}

uint64_t xpc_strerror()
{
  return MEMORY[0x1F40CF288]();
}

uint64_t xpc_uint64_get_value(xpc_object_t xuint)
{
  return MEMORY[0x1F40CF330](xuint);
}

uint64_t xpc_user_sessions_enabled()
{
  return MEMORY[0x1F40CF340]();
}

uint64_t xpc_user_sessions_get_foreground_uid()
{
  return MEMORY[0x1F40CF348]();
}