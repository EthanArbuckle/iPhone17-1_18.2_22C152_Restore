@interface _WKProcessPoolConfiguration
- ($115C4C562B26FF47E01F9F4EA65B5887)presentingApplicationProcessToken;
- (BOOL)alwaysKeepAndReuseSwappedProcesses;
- (BOOL)alwaysRunsAtBackgroundPriority;
- (BOOL)attrStyleEnabled;
- (BOOL)configureJSCForTesting;
- (BOOL)diskCacheSpeculativeValidationEnabled;
- (BOOL)ignoreSynchronousMessagingTimeoutsForTesting;
- (BOOL)isJITEnabled;
- (BOOL)pageCacheEnabled;
- (BOOL)prewarmsProcessesAutomatically;
- (BOOL)processSwapsOnNavigation;
- (BOOL)processSwapsOnNavigationWithinSameNonHTTPFamilyProtocol;
- (BOOL)shouldCaptureAudioInUIProcess;
- (BOOL)shouldTakeUIBackgroundAssertion;
- (BOOL)shouldThrowExceptionForGlobalConstantRedeclaration;
- (BOOL)usesSingleWebProcess;
- (BOOL)usesWebProcessCache;
- (NSArray)additionalReadAccessAllowedURLs;
- (NSArray)alwaysRevalidatedURLSchemes;
- (NSArray)cachePartitionedURLSchemes;
- (NSArray)memoryFootprintNotificationThresholds;
- (NSSet)customClassesForParameterCoder;
- (NSString)customWebContentServiceBundleIdentifier;
- (NSString)description;
- (NSString)sourceApplicationBundleIdentifier;
- (NSString)sourceApplicationSecondaryIdentifier;
- (NSString)timeZoneOverride;
- (NSURL)injectedBundleURL;
- (Object)_apiObject;
- (_WKProcessPoolConfiguration)init;
- (double)memoryFootprintPollIntervalForTesting;
- (id)copyWithZone:(_NSZone *)a3;
- (int)presentingApplicationPID;
- (int64_t)diskCacheSizeOverride;
- (unint64_t)maximumProcessCount;
- (unint64_t)wirelessContextIdentifier;
- (void)dealloc;
- (void)setAdditionalReadAccessAllowedURLs:(id)a3;
- (void)setAlwaysKeepAndReuseSwappedProcesses:(BOOL)a3;
- (void)setAlwaysRevalidatedURLSchemes:(id)a3;
- (void)setAlwaysRunsAtBackgroundPriority:(BOOL)a3;
- (void)setAttrStyleEnabled:(BOOL)a3;
- (void)setCachePartitionedURLSchemes:(id)a3;
- (void)setConfigureJSCForTesting:(BOOL)a3;
- (void)setIgnoreSynchronousMessagingTimeoutsForTesting:(BOOL)a3;
- (void)setInjectedBundleURL:(id)a3;
- (void)setJITEnabled:(BOOL)a3;
- (void)setMemoryFootprintNotificationThresholds:(id)a3;
- (void)setMemoryFootprintPollIntervalForTesting:(double)a3;
- (void)setPageCacheEnabled:(BOOL)a3;
- (void)setPresentingApplicationPID:(int)a3;
- (void)setPresentingApplicationProcessToken:(id *)a3;
- (void)setPrewarmsProcessesAutomatically:(BOOL)a3;
- (void)setProcessSwapsOnNavigation:(BOOL)a3;
- (void)setProcessSwapsOnNavigationWithinSameNonHTTPFamilyProtocol:(BOOL)a3;
- (void)setShouldCaptureAudioInUIProcess:(BOOL)a3;
- (void)setShouldTakeUIBackgroundAssertion:(BOOL)a3;
- (void)setShouldThrowExceptionForGlobalConstantRedeclaration:(BOOL)a3;
- (void)setTimeZoneOverride:(id)a3;
- (void)setUsesSingleWebProcess:(BOOL)a3;
- (void)setUsesWebProcessCache:(BOOL)a3;
@end

@implementation _WKProcessPoolConfiguration

- (void)setUsesWebProcessCache:(BOOL)a3
{
  self->_anon_38[43] = a3;
}

- (void)setShouldCaptureAudioInUIProcess:(BOOL)a3
{
  self->_shouldCaptureAudioInUIProcess = a3;
}

- (void)setJITEnabled:(BOOL)a3
{
  self->_anon_38[47] = a3;
}

- (void)setPrewarmsProcessesAutomatically:(BOOL)a3
{
  *(_WORD *)&self->_anon_38[41] = a3 | 0x100;
}

- (void)setInjectedBundleURL:(id)a3
{
  if (a3 && ([a3 isFileURL] & 1) == 0) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"Injected Bundle URL must be a file URL"];
  }
  MEMORY[0x19972EAD0](&v7, [a3 path]);
  WTF::String::operator=((uint64_t *)&self->_processPoolConfiguration.data.__lx[16], &v7);
  v6 = v7;
  v7 = 0;
  if (v6)
  {
    if (*(_DWORD *)v6 == 2) {
      WTF::StringImpl::destroy(v6, v5);
    }
    else {
      *(_DWORD *)v6 -= 2;
    }
  }
}

- (void)setCachePartitionedURLSchemes:(id)a3
{
  WTF::makeVector<WTF::String>(a3, (uint64_t)&v8);
  uint64_t v5 = *(unsigned int *)&self->_processPoolConfiguration.data.__lx[36];
  if (v5) {
    WTF::VectorDestructor<true,WTF::String>::destruct(*(WTF::StringImpl **)&self->_processPoolConfiguration.data.__lx[24], (WTF::StringImpl *)(*(void *)&self->_processPoolConfiguration.data.__lx[24] + 8 * v5));
  }
  v6 = *(WTF **)&self->_processPoolConfiguration.data.__lx[24];
  if (v6)
  {
    *(void *)&self->_processPoolConfiguration.data.__lx[24] = 0;
    *(_DWORD *)&self->_processPoolConfiguration.data.__lx[32] = 0;
    WTF::fastFree(v6, v4);
  }
  *(void *)&self->_processPoolConfiguration.data.__lx[24] = v8;
  uint64_t v7 = v9;
  uint64_t v8 = 0;
  uint64_t v9 = 0;
  *(void *)&self->_processPoolConfiguration.data.__lx[32] = v7;
  WTF::Vector<WTF::String,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)&v8, v4);
}

- (void)dealloc
{
  v3 = (objc_class *)objc_opt_class();
  if ((WebCoreObjCScheduleDeallocateOnMainRunLoop(v3, (objc_object *)self) & 1) == 0)
  {
    API::ProcessPoolConfiguration::~ProcessPoolConfiguration((API::ProcessPoolConfiguration *)&self->_processPoolConfiguration, v4);
    v5.receiver = self;
    v5.super_class = (Class)_WKProcessPoolConfiguration;
    [(_WKProcessPoolConfiguration *)&v5 dealloc];
  }
}

- (_WKProcessPoolConfiguration)init
{
  v5.receiver = self;
  v5.super_class = (Class)_WKProcessPoolConfiguration;
  v2 = [(_WKProcessPoolConfiguration *)&v5 init];
  v3 = v2;
  if (v2) {
    *((void *)API::ProcessPoolConfiguration::ProcessPoolConfiguration((API::ProcessPoolConfiguration *)[(_WKProcessPoolConfiguration *)v2 _apiObject])
  }
    + 1) = v2;
  return v3;
}

- (Object)_apiObject
{
  return (Object *)&self->_processPoolConfiguration;
}

- (NSURL)injectedBundleURL
{
  v2 = (void *)MEMORY[0x1E4F1CB10];
  if (*(void *)&self->_processPoolConfiguration.data.__lx[16]) {
    v3 = (__CFString *)WTF::StringImpl::operator NSString *();
  }
  else {
    v3 = &stru_1EEA10550;
  }

  return (NSURL *)[v2 fileURLWithPath:v3];
}

- (NSSet)customClassesForParameterCoder
{
  return (NSSet *)[MEMORY[0x1E4F1CAD0] set];
}

- (unint64_t)maximumProcessCount
{
  return -1;
}

- (int64_t)diskCacheSizeOverride
{
  return 0;
}

- (BOOL)diskCacheSpeculativeValidationEnabled
{
  return 0;
}

- (BOOL)ignoreSynchronousMessagingTimeoutsForTesting
{
  return self->_anon_38[25];
}

- (void)setIgnoreSynchronousMessagingTimeoutsForTesting:(BOOL)a3
{
  self->_anon_38[25] = a3;
}

- (BOOL)attrStyleEnabled
{
  return self->_anon_38[26];
}

- (void)setAttrStyleEnabled:(BOOL)a3
{
  self->_anon_38[26] = a3;
}

- (BOOL)shouldThrowExceptionForGlobalConstantRedeclaration
{
  return self->_anon_38[27];
}

- (void)setShouldThrowExceptionForGlobalConstantRedeclaration:(BOOL)a3
{
  self->_anon_38[27] = a3;
}

- (NSArray)additionalReadAccessAllowedURLs
{
  WTF::Vector<WTF::String,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::Vector((uint64_t)&v14, (uint64_t)&self->_anon_38[8]);
  if (v15)
  {
    id v3 = objc_alloc(MEMORY[0x1E4F1CA48]);
    v4 = (void *)[v3 initWithCapacity:v15];
    if (v15)
    {
      uint64_t v5 = v14;
      uint64_t v6 = 8 * v15;
      while (1)
      {
        uint64_t v7 = (void *)MEMORY[0x1E4F1CB10];
        WTF::String::utf8();
        if (v16) {
          uint64_t v8 = (char *)v16 + 16;
        }
        else {
          uint64_t v8 = 0;
        }
        uint64_t v10 = [v7 fileURLWithFileSystemRepresentation:v8 isDirectory:0 relativeToURL:0];
        v11 = v16;
        v16 = 0;
        if (!v11) {
          goto LABEL_10;
        }
        if (*(_DWORD *)v11 != 1) {
          break;
        }
        WTF::fastFree(v11, v9);
        if (v10) {
          goto LABEL_13;
        }
LABEL_14:
        v5 += 8;
        v6 -= 8;
        if (!v6) {
          goto LABEL_15;
        }
      }
      --*(_DWORD *)v11;
LABEL_10:
      if (!v10) {
        goto LABEL_14;
      }
LABEL_13:
      [v4 addObject:v10];
      goto LABEL_14;
    }
LABEL_15:
    v12 = (id)CFMakeCollectable(v4);
  }
  else
  {
    v12 = (NSArray *)MEMORY[0x1E4F1CBF0];
  }
  WTF::Vector<WTF::String,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)&v14, v2);
  return v12;
}

- (void)setAdditionalReadAccessAllowedURLs:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  uint64_t v27 = 0;
  uint64_t v28 = 0;
  unint64_t v5 = [a3 count];
  if (v5)
  {
    if (v5 >> 29)
    {
      __break(0xC471u);
      return;
    }
    LODWORD(v28) = v5;
    uint64_t v27 = WTF::fastMalloc((WTF *)(8 * v5));
  }
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  uint64_t v6 = [a3 countByEnumeratingWithState:&v23 objects:v29 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v24;
    uint64_t v8 = *MEMORY[0x1E4F1C3C8];
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v24 != v7) {
          objc_enumerationMutation(a3);
        }
        uint64_t v10 = *(void **)(*((void *)&v23 + 1) + 8 * v9);
        if (([v10 isFileURL] & 1) == 0) {
          [MEMORY[0x1E4F1CA00] raise:v8, @"%@ is not a file URL", v10 format];
        }
        v11 = (WTF::String *)[v10 fileSystemRepresentation];
        WTF::String::fromUTF8((uint64_t *)&v22, v11, v12);
        LODWORD(v14) = HIDWORD(v28);
        if (HIDWORD(v28) == v28)
        {
          v17 = (uint64_t *)WTF::Vector<WTF::String,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::expandCapacity<(WTF::FailureAction)0>((uint64_t)&v27, HIDWORD(v28) + 1, (unint64_t)&v22);
          uint64_t v14 = HIDWORD(v28);
          uint64_t v18 = v27;
          uint64_t v19 = *v17;
          uint64_t *v17 = 0;
          *(void *)(v18 + 8 * v14) = v19;
        }
        else
        {
          unsigned int v15 = v22;
          v22 = 0;
          *(void *)(v27 + 8 * HIDWORD(v28)) = v15;
        }
        HIDWORD(v28) = v14 + 1;
        v16 = v22;
        v22 = 0;
        if (v16)
        {
          if (*(_DWORD *)v16 == 2) {
            WTF::StringImpl::destroy(v16, v13);
          }
          else {
            *(_DWORD *)v16 -= 2;
          }
        }
        ++v9;
      }
      while (v6 != v9);
      uint64_t v20 = [a3 countByEnumeratingWithState:&v23 objects:v29 count:16];
      uint64_t v6 = v20;
    }
    while (v20);
  }
  WTF::Vector<WTF::String,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::operator=((unsigned int *)&self->_anon_38[8], (uint64_t)&v27);
  WTF::Vector<WTF::String,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)&v27, v21);
}

- (unint64_t)wirelessContextIdentifier
{
  return 0;
}

- (NSArray)cachePartitionedURLSchemes
{
  WTF::createNSArray<WTF::Vector<WTF::String,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc> const&>((uint64_t)&self->_processPoolConfiguration.data.__lx[24], (uint64_t *)&cf);
  CFTypeRef v2 = cf;
  CFTypeRef cf = 0;
  id v3 = (id)CFMakeCollectable(v2);
  CFTypeRef v4 = cf;
  CFTypeRef cf = 0;
  if (v4) {
    CFRelease(v4);
  }
  return v3;
}

- (NSArray)alwaysRevalidatedURLSchemes
{
  WTF::createNSArray<WTF::Vector<WTF::String,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc> const&>((uint64_t)&self->_processPoolConfiguration.data.__lx[40], (uint64_t *)&cf);
  CFTypeRef v2 = cf;
  CFTypeRef cf = 0;
  id v3 = (id)CFMakeCollectable(v2);
  CFTypeRef v4 = cf;
  CFTypeRef cf = 0;
  if (v4) {
    CFRelease(v4);
  }
  return v3;
}

- (void)setAlwaysRevalidatedURLSchemes:(id)a3
{
  WTF::makeVector<WTF::String>(a3, (uint64_t)&v8);
  uint64_t v5 = *(unsigned int *)&self->_anon_38[4];
  if (v5) {
    WTF::VectorDestructor<true,WTF::String>::destruct(*(WTF::StringImpl **)&self->_processPoolConfiguration.data.__lx[40], (WTF::StringImpl *)(*(void *)&self->_processPoolConfiguration.data.__lx[40] + 8 * v5));
  }
  uint64_t v6 = *(WTF **)&self->_processPoolConfiguration.data.__lx[40];
  if (v6)
  {
    *(void *)&self->_processPoolConfiguration.data.__lx[40] = 0;
    *(_DWORD *)self->_anon_38 = 0;
    WTF::fastFree(v6, v4);
  }
  *(void *)&self->_processPoolConfiguration.data.__lx[40] = v8;
  uint64_t v7 = v9;
  uint64_t v8 = 0;
  uint64_t v9 = 0;
  *(void *)self->_anon_38 = v7;
  WTF::Vector<WTF::String,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)&v8, v4);
}

- (NSString)sourceApplicationBundleIdentifier
{
  return 0;
}

- (NSString)sourceApplicationSecondaryIdentifier
{
  return 0;
}

- (void)setPresentingApplicationPID:(int)a3
{
  *(_DWORD *)&self->_anon_38[32] = a3;
}

- (int)presentingApplicationPID
{
  return *(_DWORD *)&self->_anon_38[32];
}

- (void)setPresentingApplicationProcessToken:(id *)a3
{
  long long v3 = *(_OWORD *)a3->var0;
  *(_OWORD *)&self->_anon_38[68] = *(_OWORD *)&a3->var0[4];
  *(_OWORD *)&self->_anon_38[52] = v3;
  self->_anon_38[84] = 1;
}

- ($115C4C562B26FF47E01F9F4EA65B5887)presentingApplicationProcessToken
{
  if (LOBYTE(self[4].var0[3]))
  {
    long long v3 = *(_OWORD *)&self[3].var0[7];
    *(_OWORD *)retstr->var0 = *(_OWORD *)&self[3].var0[3];
    *(_OWORD *)&retstr->var0[4] = v3;
  }
  else
  {
    *(_OWORD *)retstr->var0 = 0u;
    *(_OWORD *)&retstr->var0[4] = 0u;
  }
  return self;
}

- (void)setProcessSwapsOnNavigation:(BOOL)a3
{
  *(_WORD *)&self->_anon_38[36] = a3 | 0x100;
}

- (BOOL)processSwapsOnNavigation
{
  uint64_t v2 = 92;
  if (!self->_anon_38[37]) {
    uint64_t v2 = 94;
  }
  return *((unsigned char *)&self->super.isa + v2);
}

- (BOOL)prewarmsProcessesAutomatically
{
  uint64_t v2 = 97;
  if (!self->_anon_38[42]) {
    uint64_t v2 = 101;
  }
  return *((unsigned char *)&self->super.isa + v2);
}

- (BOOL)usesWebProcessCache
{
  return self->_anon_38[43];
}

- (void)setAlwaysKeepAndReuseSwappedProcesses:(BOOL)a3
{
  self->_anon_38[39] = a3;
}

- (BOOL)alwaysKeepAndReuseSwappedProcesses
{
  return self->_anon_38[39];
}

- (void)setProcessSwapsOnNavigationWithinSameNonHTTPFamilyProtocol:(BOOL)a3
{
  self->_anon_38[40] = a3;
}

- (BOOL)processSwapsOnNavigationWithinSameNonHTTPFamilyProtocol
{
  return self->_anon_38[40];
}

- (BOOL)pageCacheEnabled
{
  return self->_anon_38[44];
}

- (void)setPageCacheEnabled:(BOOL)a3
{
  self->_anon_38[44] = a3;
}

- (BOOL)usesSingleWebProcess
{
  return self->_anon_38[48];
}

- (void)setUsesSingleWebProcess:(BOOL)a3
{
  self->_anon_38[48] = a3;
}

- (BOOL)isJITEnabled
{
  return self->_anon_38[47];
}

- (BOOL)alwaysRunsAtBackgroundPriority
{
  return self->_anon_38[28];
}

- (void)setAlwaysRunsAtBackgroundPriority:(BOOL)a3
{
  self->_anon_38[28] = a3;
}

- (BOOL)shouldTakeUIBackgroundAssertion
{
  return self->_anon_38[29];
}

- (void)setShouldTakeUIBackgroundAssertion:(BOOL)a3
{
  self->_anon_38[29] = a3;
}

- (NSString)description
{
  long long v3 = NSString;
  CFTypeRef v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = (void *)[v3 stringWithFormat:@"<%@: %p", NSStringFromClass(v4), self];
  uint64_t v6 = *(void *)&self->_processPoolConfiguration.data.__lx[16];
  if (v6 && *(_DWORD *)(v6 + 4)) {
    return (NSString *)objc_msgSend(v5, "stringByAppendingFormat:", @"; injectedBundleURL: \"%@\">",
  }
                         [(_WKProcessPoolConfiguration *)self injectedBundleURL]);

  return (NSString *)[v5 stringByAppendingString:@">"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  API::ProcessPoolConfiguration::copy((API::ProcessPoolConfiguration *)&self->_processPoolConfiguration, &v7);
  long long v3 = (void *)*((void *)v7 + 1);
  if (v3) {
    CFRetain(*((CFTypeRef *)v7 + 1));
  }
  id v4 = v3;
  if (v3) {
    CFRelease(v3);
  }
  uint64_t v5 = v7;
  uint64_t v7 = 0;
  if (v5) {
    CFRelease(*((CFTypeRef *)v5 + 1));
  }
  return v4;
}

- (NSString)customWebContentServiceBundleIdentifier
{
  return 0;
}

- (BOOL)configureJSCForTesting
{
  return self->_anon_38[46];
}

- (void)setConfigureJSCForTesting:(BOOL)a3
{
  self->_anon_38[46] = a3;
}

- (NSString)timeZoneOverride
{
  if (*(void *)&self->_anon_38[88]) {
    return (NSString *)WTF::StringImpl::operator NSString *();
  }
  else {
    return (NSString *)&stru_1EEA10550;
  }
}

- (void)setTimeZoneOverride:(id)a3
{
  MEMORY[0x19972EAD0](&v6, a3);
  WTF::String::operator=((uint64_t *)&self->_anon_38[88], &v6);
  uint64_t v5 = v6;
  uint64_t v6 = 0;
  if (v5)
  {
    if (*(_DWORD *)v5 == 2) {
      WTF::StringImpl::destroy(v5, v4);
    }
    else {
      *(_DWORD *)v5 -= 2;
    }
  }
}

- (void)setMemoryFootprintPollIntervalForTesting:(double)a3
{
  *(double *)&self->_anon_38[96] = a3;
}

- (double)memoryFootprintPollIntervalForTesting
{
  return *(double *)&self->_anon_38[96];
}

- (NSArray)memoryFootprintNotificationThresholds
{
  long long v3 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:*(unsigned int *)&self->_anon_38[116]];
  uint64_t v4 = *(unsigned int *)&self->_anon_38[116];
  if (v4)
  {
    uint64_t v5 = *(void **)&self->_anon_38[104];
    uint64_t v6 = 8 * v4;
    do
    {
      objc_msgSend(v3, "addObject:", objc_msgSend(NSNumber, "numberWithUnsignedLong:", *v5++));
      v6 -= 8;
    }
    while (v6);
  }
  uint64_t v7 = (void *)CFMakeCollectable(v3);

  return (NSArray *)v7;
}

- (void)setMemoryFootprintNotificationThresholds:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  uint64_t v18 = 0;
  uint64_t v19 = 0;
  WTF::Vector<WTF::String,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::reserveCapacity<(WTF::FailureAction)0>((uint64_t)&v18, [a3 count]);
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v6 = [a3 countByEnumeratingWithState:&v14 objects:v20 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v15;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(a3);
        }
        uint64_t v9 = [*(id *)(*((void *)&v14 + 1) + 8 * v8) unsignedLongLongValue];
        uint64_t v13 = v9;
        int v10 = HIDWORD(v19);
        if (HIDWORD(v19) == v19)
        {
          v11 = (void *)WTF::Vector<WTF::Ref<WebCore::SecurityOrigin,WTF::RawPtrTraits<WebCore::SecurityOrigin>,WTF::DefaultRefDerefTraits<WebCore::SecurityOrigin>>,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::expandCapacity<(WTF::FailureAction)0>((uint64_t)&v18, HIDWORD(v19) + 1, (unint64_t)&v13);
          int v10 = HIDWORD(v19);
          *(void *)(v18 + 8 * HIDWORD(v19)) = *v11;
        }
        else
        {
          *(void *)(v18 + 8 * HIDWORD(v19)) = v9;
        }
        HIDWORD(v19) = v10 + 1;
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [a3 countByEnumeratingWithState:&v14 objects:v20 count:16];
    }
    while (v6);
  }
  v12 = *(WTF **)&self->_anon_38[104];
  if (v12)
  {
    *(void *)&self->_anon_38[104] = 0;
    *(_DWORD *)&self->_anon_38[112] = 0;
    WTF::fastFree(v12, v5);
  }
  *(void *)&self->_anon_38[104] = v18;
  *(void *)&self->_anon_38[112] = v19;
}

- (BOOL)shouldCaptureAudioInUIProcess
{
  return self->_shouldCaptureAudioInUIProcess;
}

@end