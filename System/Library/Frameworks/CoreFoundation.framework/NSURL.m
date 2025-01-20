@interface NSURL
+ (BOOL)supportsSecureCoding;
+ (BOOL)writeBookmarkData:(NSData *)bookmarkData toURL:(NSURL *)bookmarkFileURL options:(NSURLBookmarkFileCreationOptions)options error:(NSError *)error;
+ (NSData)bookmarkDataWithContentsOfURL:(NSURL *)bookmarkFileURL error:(NSError *)error;
+ (NSDictionary)resourceValuesForKeys:(NSArray *)keys fromBookmarkData:(NSData *)bookmarkData;
+ (id)__unurl;
- (BOOL)getResourceValue:(id *)value forKey:(NSURLResourceKey)key error:(NSError *)error;
- (BOOL)isFileReferenceURL;
- (BOOL)setResourceValue:(id)value forKey:(NSURLResourceKey)key error:(NSError *)error;
- (BOOL)setResourceValues:(NSDictionary *)keyedValues error:(NSError *)error;
- (BOOL)startAccessingSecurityScopedResource;
- (NSData)bookmarkDataWithOptions:(NSURLBookmarkCreationOptions)options includingResourceValuesForKeys:(NSArray *)keys relativeToURL:(NSURL *)relativeURL error:(NSError *)error;
- (NSDictionary)resourceValuesForKeys:(NSArray *)keys error:(NSError *)error;
- (NSURL)filePathURL;
- (NSURL)fileReferenceURL;
- (id)_URLByInsertingResolveFlags:(unsigned int)a3;
- (id)_URLByRemovingResolveFlags;
- (unsigned)_resolveFlags;
- (void)filePathURL;
- (void)fileReferenceURL;
- (void)isFileReferenceURL;
- (void)removeAllCachedResourceValues;
- (void)removeCachedResourceValueForKey:(NSURLResourceKey)key;
- (void)setTemporaryResourceValue:(id)value forKey:(NSURLResourceKey)key;
- (void)startAccessingSecurityScopedResource;
- (void)stopAccessingSecurityScopedResource;
@end

@implementation NSURL

- (BOOL)isFileReferenceURL
{
  CFURLRef v2 = (const __CFURL *)[(NSURL *)self _cfurl];
  if (v2 == +[NSURL __unurl]) {
    -[NSURL isFileReferenceURL]();
  }
  return v2 && CFURLIsFileReferenceURL(v2) != 0;
}

+ (id)__unurl
{
  if (__unurl_static_init != -1) {
    dispatch_once(&__unurl_static_init, &__block_literal_global_33);
  }
  return (id)__unurl_immutablePlaceholderNSURL;
}

CFURLRef __16__NSURL___unurl__block_invoke()
{
  CFURLRef result = CFURLCreateWithString(0, @"__immutablePlaceholderNSURL", 0);
  __unurl_immutablePlaceholderNSURL = (uint64_t)result;
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSData)bookmarkDataWithOptions:(NSURLBookmarkCreationOptions)options includingResourceValuesForKeys:(NSArray *)keys relativeToURL:(NSURL *)relativeURL error:(NSError *)error
{
  v10 = (void *)[(NSURL *)self _cfurl];
  if (v10 == +[NSURL __unurl]) {
    -[NSURL bookmarkDataWithOptions:includingResourceValuesForKeys:relativeToURL:error:]();
  }
  if (!v10) {
    return 0;
  }
  __CFURLBeginResourcePropertyCacheAccess((unint64_t)v10);
  CFAllocatorRef v11 = CFGetAllocator(v10);
  CFDataRef v12 = CFURLCreateBookmarkData(v11, (CFURLRef)v10, options, (CFArrayRef)keys, (CFURLRef)[(NSURL *)relativeURL _cfurl], (CFErrorRef *)error);
  __CFURLEndResourcePropertyCacheAccess((unint64_t)v10);
  if (!v12)
  {
    if (error && *error) {
      *error = *error;
    }
    return 0;
  }

  return (NSData *)v12;
}

- (BOOL)setResourceValues:(NSDictionary *)keyedValues error:(NSError *)error
{
  CFURLRef v6 = (const __CFURL *)[(NSURL *)self _cfurl];
  if (v6 == +[NSURL __unurl]) {
    -[NSURL setResourceValues:error:]();
  }
  if (!v6) {
    return 0;
  }
  __CFURLBeginResourcePropertyCacheAccess((unint64_t)v6);
  int v7 = CFURLSetResourcePropertiesForKeys(v6, (CFDictionaryRef)keyedValues, (CFErrorRef *)error);
  BOOL v8 = v7 != 0;
  __CFURLEndResourcePropertyCacheAccess((unint64_t)v6);
  if (error && !v7)
  {
    BOOL v8 = 0;
    *error = *error;
  }
  return v8;
}

- (void)removeAllCachedResourceValues
{
  v0 = __CFLookUpClass("NSURL");
  uint64_t v1 = OUTLINED_FUNCTION_0_18(v0);
  _CFThrowFormattedException(@"NSGenericException", @"%@: object was not initialized", v1);
}

- (NSURL)fileReferenceURL
{
  v3 = (NSURL *)[(NSURL *)self _cfurl];
  if (v3 == +[NSURL __unurl]) {
    -[NSURL fileReferenceURL]();
  }
  if (!v3) {
    return v3;
  }
  __CFURLBeginResourcePropertyCacheAccess((unint64_t)v3);
  CFAllocatorRef v4 = CFGetAllocator(v3);
  CFURLRef v5 = CFURLCreateFileReferenceURL(v4, (CFURLRef)[(NSURL *)self _cfurl], 0);
  __CFURLEndResourcePropertyCacheAccess((unint64_t)v3);
  if (!v5) {
    return 0;
  }
  v3 = v5;
  uint64_t v6 = [(NSURL *)self _resolveFlags];
  if (!v6) {
    return v3;
  }

  return (NSURL *)[(NSURL *)v3 _URLByInsertingResolveFlags:v6];
}

- (void)removeCachedResourceValueForKey:(NSURLResourceKey)key
{
  CFURLRef v4 = (const __CFURL *)[(NSURL *)self _cfurl];
  if (v4 == +[NSURL __unurl]) {
    -[NSURL removeCachedResourceValueForKey:]();
  }
  if (v4)
  {
    __CFURLBeginResourcePropertyCacheAccess((unint64_t)v4);
    CFURLClearResourcePropertyCacheForKey(v4, (CFStringRef)key);
    __CFURLEndResourcePropertyCacheAccess((unint64_t)v4);
  }
}

- (NSURL)filePathURL
{
  v3 = (NSURL *)[(NSURL *)self _cfurl];
  if (v3 == +[NSURL __unurl]) {
    -[NSURL filePathURL]();
  }
  if (!v3) {
    return v3;
  }
  __CFURLBeginResourcePropertyCacheAccess((unint64_t)v3);
  CFAllocatorRef v4 = CFGetAllocator(v3);
  CFURLRef v5 = CFURLCreateFilePathURL(v4, (CFURLRef)[(NSURL *)self _cfurl], 0);
  __CFURLEndResourcePropertyCacheAccess((unint64_t)v3);
  if (!v5) {
    return 0;
  }
  v3 = v5;
  uint64_t v6 = [(NSURL *)self _resolveFlags];
  if (!v6) {
    return v3;
  }

  return (NSURL *)[(NSURL *)v3 _URLByInsertingResolveFlags:v6];
}

- (void)setTemporaryResourceValue:(id)value forKey:(NSURLResourceKey)key
{
  CFURLRef v6 = (const __CFURL *)[(NSURL *)self _cfurl];
  if (v6 == +[NSURL __unurl]) {
    -[NSURL setTemporaryResourceValue:forKey:]();
  }
  if (v6)
  {
    __CFURLBeginResourcePropertyCacheAccess((unint64_t)v6);
    CFURLSetTemporaryResourcePropertyForKey(v6, (CFStringRef)key, value);
    __CFURLEndResourcePropertyCacheAccess((unint64_t)v6);
  }
}

- (BOOL)setResourceValue:(id)value forKey:(NSURLResourceKey)key error:(NSError *)error
{
  CFURLRef v8 = (const __CFURL *)[(NSURL *)self _cfurl];
  if (v8 == +[NSURL __unurl]) {
    -[NSURL setResourceValue:forKey:error:]();
  }
  if (!v8) {
    return 0;
  }
  __CFURLBeginResourcePropertyCacheAccess((unint64_t)v8);
  int v9 = CFURLSetResourcePropertyForKey(v8, (CFStringRef)key, value, (CFErrorRef *)error);
  BOOL v10 = v9 != 0;
  __CFURLEndResourcePropertyCacheAccess((unint64_t)v8);
  if (error && !v9)
  {
    BOOL v10 = 0;
    *error = *error;
  }
  return v10;
}

- (NSDictionary)resourceValuesForKeys:(NSArray *)keys error:(NSError *)error
{
  CFURLRef v6 = (const __CFURL *)[(NSURL *)self _cfurl];
  if (v6 == +[NSURL __unurl]) {
    -[NSURL resourceValuesForKeys:error:]();
  }
  if (!v6) {
    return 0;
  }
  __CFURLBeginResourcePropertyCacheAccess((unint64_t)v6);
  CFDictionaryRef v7 = CFURLCopyResourcePropertiesForKeys(v6, (CFArrayRef)keys, (CFErrorRef *)error);
  __CFURLEndResourcePropertyCacheAccess((unint64_t)v6);
  if (!v7)
  {
    if (error) {
      *error = *error;
    }
    return 0;
  }

  return (NSDictionary *)v7;
}

- (BOOL)getResourceValue:(id *)value forKey:(NSURLResourceKey)key error:(NSError *)error
{
  CFURLRef v8 = (const __CFURL *)[(NSURL *)self _cfurl];
  if (v8 == +[NSURL __unurl]) {
    -[NSURL getResourceValue:forKey:error:]();
  }
  if (!v8) {
    return 0;
  }
  __CFURLBeginResourcePropertyCacheAccess((unint64_t)v8);
  int v9 = CFURLCopyResourcePropertyForKey(v8, (CFStringRef)key, value, (CFErrorRef *)error);
  __CFURLEndResourcePropertyCacheAccess((unint64_t)v8);
  if (!v9)
  {
    if (error)
    {
      CFAllocatorRef v11 = *error;
      BOOL result = 0;
      *error = v11;
      return result;
    }
    return 0;
  }
  if (*value) {
    *value = *value;
  }
  return 1;
}

- (BOOL)startAccessingSecurityScopedResource
{
  CFURLRef v2 = (const __CFURL *)[(NSURL *)self _cfurl];
  if (v2 == +[NSURL __unurl]) {
    -[NSURL startAccessingSecurityScopedResource]();
  }
  return v2 && CFURLStartAccessingSecurityScopedResource(v2) != 0;
}

- (void)stopAccessingSecurityScopedResource
{
  v0 = __CFLookUpClass("NSURL");
  uint64_t v1 = OUTLINED_FUNCTION_0_18(v0);
  _CFThrowFormattedException(@"NSGenericException", @"%@: object was not initialized", v1);
}

- (unsigned)_resolveFlags
{
  if (![(NSURL *)self isFileURL]) {
    return 0;
  }
  if ([(NSURL *)self isFileReferenceURL])
  {
    if ([(NSURL *)self query])
    {
      v3 = [(NSURL *)self query];
      return [(NSString *)v3 _queryResolveFlags];
    }
    return 0;
  }
  CFURLRef v5 = CFURLCopyAbsoluteURL((CFURLRef)[(NSURL *)self _cfurl]);
  if (!v5) {
    return 0;
  }
  CFURLRef v6 = v5;
  CFDictionaryRef v7 = (id)CFURLCopyPath(v5);
  CFRelease(v6);
  if (!v7) {
    return 0;
  }

  return [(__CFString *)v7 _pathResolveFlags];
}

- (id)_URLByInsertingResolveFlags:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  BOOL v5 = [(NSURL *)self isFileURL];
  if (v3
    && v5
    && ((BOOL v6 = [(NSURL *)self isFileReferenceURL],
         CFDictionaryRef v7 = [(NSURL *)self absoluteString],
         !v6)
      ? (CFStringRef v8 = (const __CFString *)[(NSString *)v7 _urlStringByInsertingPathResolveFlags:v3]): (CFStringRef v8 = (const __CFString *)[(NSString *)v7 _urlStringByInsertingQueryResolveFlags:v3]), v8))
  {
    int v9 = (NSURL *)CFURLCreateWithString(0, v8, 0);
  }
  else
  {
    int v9 = self;
  }

  return v9;
}

- (id)_URLByRemovingResolveFlags
{
  if ([(NSURL *)self isFileURL]
    && (CFStringRef v3 = (const __CFString *)[(NSString *)[(NSURL *)self absoluteString] _urlStringByRemovingResolveFlags]) != 0)
  {
    CFAllocatorRef v4 = (NSURL *)CFURLCreateWithString(0, v3, 0);
  }
  else
  {
    CFAllocatorRef v4 = self;
  }

  return v4;
}

+ (NSDictionary)resourceValuesForKeys:(NSArray *)keys fromBookmarkData:(NSData *)bookmarkData
{
  BOOL result = (NSDictionary *)CFURLCreateResourcePropertiesForKeysFromBookmarkData(0, (CFArrayRef)keys, (CFDataRef)bookmarkData);
  if (result)
  {
    return result;
  }
  return result;
}

+ (BOOL)writeBookmarkData:(NSData *)bookmarkData toURL:(NSURL *)bookmarkFileURL options:(NSURLBookmarkFileCreationOptions)options error:(NSError *)error
{
  int v7 = CFURLWriteBookmarkDataToFile((CFDataRef)bookmarkData, (CFURLRef)bookmarkFileURL, options, (CFErrorRef *)error);
  int v8 = v7;
  if (error && !v7 && *error) {
    *error = *error;
  }
  return v8 != 0;
}

+ (NSData)bookmarkDataWithContentsOfURL:(NSURL *)bookmarkFileURL error:(NSError *)error
{
  CFDataRef v5 = CFURLCreateBookmarkDataFromFile(0, (CFURLRef)bookmarkFileURL, (CFErrorRef *)error);
  if (v5)
  {
    return (NSData *)v5;
  }
  else
  {
    if (error && *error) {
      *error = *error;
    }
    return 0;
  }
}

- (void)getResourceValue:forKey:error:.cold.1()
{
  v0 = __CFLookUpClass("NSURL");
  uint64_t v1 = OUTLINED_FUNCTION_0_18(v0);
  _CFThrowFormattedException(@"NSGenericException", @"%@: object was not initialized", v1);
}

- (void)resourceValuesForKeys:error:.cold.1()
{
  v0 = __CFLookUpClass("NSURL");
  uint64_t v1 = OUTLINED_FUNCTION_0_18(v0);
  _CFThrowFormattedException(@"NSGenericException", @"%@: object was not initialized", v1);
}

- (void)setResourceValue:forKey:error:.cold.1()
{
  v0 = __CFLookUpClass("NSURL");
  uint64_t v1 = OUTLINED_FUNCTION_0_18(v0);
  _CFThrowFormattedException(@"NSGenericException", @"%@: object was not initialized", v1);
}

- (void)setResourceValues:error:.cold.1()
{
  v0 = __CFLookUpClass("NSURL");
  uint64_t v1 = OUTLINED_FUNCTION_0_18(v0);
  _CFThrowFormattedException(@"NSGenericException", @"%@: object was not initialized", v1);
}

- (void)removeCachedResourceValueForKey:.cold.1()
{
  v0 = __CFLookUpClass("NSURL");
  uint64_t v1 = OUTLINED_FUNCTION_0_18(v0);
  _CFThrowFormattedException(@"NSGenericException", @"%@: object was not initialized", v1);
}

- (void)setTemporaryResourceValue:forKey:.cold.1()
{
  v0 = __CFLookUpClass("NSURL");
  uint64_t v1 = OUTLINED_FUNCTION_0_18(v0);
  _CFThrowFormattedException(@"NSGenericException", @"%@: object was not initialized", v1);
}

- (void)isFileReferenceURL
{
  v0 = __CFLookUpClass("NSURL");
  uint64_t v1 = OUTLINED_FUNCTION_0_18(v0);
  _CFThrowFormattedException(@"NSGenericException", @"%@: object was not initialized", v1);
}

- (void)fileReferenceURL
{
  v0 = __CFLookUpClass("NSURL");
  uint64_t v1 = OUTLINED_FUNCTION_0_18(v0);
  _CFThrowFormattedException(@"NSGenericException", @"%@: object was not initialized", v1);
}

- (void)filePathURL
{
  v0 = __CFLookUpClass("NSURL");
  uint64_t v1 = OUTLINED_FUNCTION_0_18(v0);
  _CFThrowFormattedException(@"NSGenericException", @"%@: object was not initialized", v1);
}

- (void)bookmarkDataWithOptions:includingResourceValuesForKeys:relativeToURL:error:.cold.1()
{
  v0 = __CFLookUpClass("NSURL");
  uint64_t v1 = OUTLINED_FUNCTION_0_18(v0);
  _CFThrowFormattedException(@"NSGenericException", @"%@: object was not initialized", v1);
}

- (void)startAccessingSecurityScopedResource
{
  v0 = __CFLookUpClass("NSURL");
  uint64_t v1 = OUTLINED_FUNCTION_0_18(v0);
  _CFThrowFormattedException(@"NSGenericException", @"%@: object was not initialized", v1);
}

@end