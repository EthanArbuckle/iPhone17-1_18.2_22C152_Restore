@interface NSURLRequest
+ (BOOL)allowsAnyHTTPSCertificateForHost:(id)a3;
+ (BOOL)supportsSecureCoding;
+ (NSURLRequest)requestWithURL:(NSURL *)URL;
+ (NSURLRequest)requestWithURL:(NSURL *)URL cachePolicy:(NSURLRequestCachePolicy)cachePolicy timeoutInterval:(NSTimeInterval)timeoutInterval;
+ (__CFArray)newCFContentDispositionEncodingFallbackArray:(uint64_t)a1;
+ (__CFString)getObjectKeyWithIndex:(uint64_t)a1;
+ (double)defaultTimeoutInterval;
+ (id)allowsSpecificHTTPSCertificateForHost:(id)a3;
+ (void)setAllowsAnyHTTPSCertificate:(BOOL)a3 forHost:(id)a4;
+ (void)setAllowsSpecificHTTPSCertificate:(id)a3 forHost:(id)a4;
+ (void)setDefaultTimeoutInterval:(double)a3;
- (BOOL)HTTPShouldHandleCookies;
- (BOOL)HTTPShouldUsePipelining;
- (BOOL)_URLHasScheme:(id)a3;
- (BOOL)_allowOnlyPartitionedCookies;
- (BOOL)_allowPrivateAccessTokensForThirdParty;
- (BOOL)_allowsUCA;
- (BOOL)_failInsecureLoadWithHTTPSDNSRecord;
- (BOOL)_ignoreHSTS;
- (BOOL)_isIdempotent;
- (BOOL)_isKnownTracker;
- (BOOL)_isNonAppInitiated;
- (BOOL)_isSafeRequestForBackgroundDownload;
- (BOOL)_isWebSearchContent;
- (BOOL)_preventHSTSStorage;
- (BOOL)_privacyProxyFailClosed;
- (BOOL)_privacyProxyFailClosedForUnreachableHosts;
- (BOOL)_privacyProxyFailClosedForUnreachableNonMainHosts;
- (BOOL)_prohibitPrivacyProxy;
- (BOOL)_requiresShortConnectionTimeout;
- (BOOL)_schemeWasUpgradedDueToDynamicHSTS;
- (BOOL)_useEnhancedPrivacyMode;
- (BOOL)allowsCellularAccess;
- (BOOL)allowsConstrainedNetworkAccess;
- (BOOL)allowsExpensiveNetworkAccess;
- (BOOL)allowsPersistentDNS;
- (BOOL)assumesHTTP3Capable;
- (BOOL)isEqual:(id)a3;
- (BOOL)requiresDNSSECValidation;
- (NSData)HTTPBody;
- (NSDictionary)allHTTPHeaderFields;
- (NSInputStream)HTTPBodyStream;
- (NSString)HTTPMethod;
- (NSString)cookiePartitionIdentifier;
- (NSString)description;
- (NSString)valueForHTTPHeaderField:(NSString *)field;
- (NSTimeInterval)timeoutInterval;
- (NSURL)URL;
- (NSURL)mainDocumentURL;
- (NSURLRequest)init;
- (NSURLRequest)initWithCoder:(id)a3;
- (NSURLRequest)initWithHTTPPropertyList:(id)a3;
- (NSURLRequest)initWithURL:(NSURL *)URL;
- (NSURLRequest)initWithURL:(NSURL *)URL cachePolicy:(NSURLRequestCachePolicy)cachePolicy timeoutInterval:(NSTimeInterval)timeoutInterval;
- (NSURLRequestAttribution)attribution;
- (NSURLRequestCachePolicy)cachePolicy;
- (NSURLRequestNetworkServiceType)networkServiceType;
- (__CFURL)cfURL;
- (double)_payloadTransmissionTimeout;
- (double)_timeWindowDelay;
- (double)_timeWindowDuration;
- (id)HTTPContentType;
- (id)HTTPExtraCookies;
- (id)HTTPPropertyList;
- (id)HTTPReferrer;
- (id)HTTPUserAgent;
- (id)_allHTTPHeaderFieldsAsArrays;
- (id)_allProtocolProperties;
- (id)_copyReplacingURLWithURL:(id)a3;
- (id)_initWithCFURLRequest:(_CFURLRequest *)a3;
- (id)_initWithInternal:(id)a3;
- (id)_initWithWebKitPropertyListData:(id)a3;
- (id)_propertyForKey:(id)a3;
- (id)_startTimeoutDate;
- (id)_trackerContext;
- (id)_webKitPropertyListData;
- (id)boundInterfaceIdentifier;
- (id)contentDispositionEncodingFallbackArray;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (unint64_t)_allowedProtocolTypes;
- (unint64_t)expectedWorkload;
- (unint64_t)hash;
- (void)_inner;
- (void)_removePropertyForKey:(id)a3;
- (void)_setProperty:(id)a3 forKey:(id)a4;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation NSURLRequest

- (id)_initWithCFURLRequest:(_CFURLRequest *)a3
{
  if (a3)
  {
    v6.receiver = self;
    v6.super_class = (Class)NSURLRequest;
    v4 = [(NSURLRequest *)&v6 init];
    if (v4) {
      v4->_internal = (NSURLRequestInternal *)[*((id *)a3 + 1) copy];
    }
  }
  else
  {

    return 0;
  }
  return v4;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(NSURLRequestInternal);
  URLRequest::initialize((URLRequest *)[(NSURLRequestInternal *)v4 _inner], (const URLRequest *)[(NSURLRequestInternal *)self->_internal _inner]);
  if (!v4) {
    return 0;
  }
  id v5 = [(NSURLRequest *)[NSMutableURLRequest alloc] _initWithInternal:v4];

  return v5;
}

- (id)_initWithInternal:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)NSURLRequest;
  v4 = [(NSURLRequest *)&v6 init];
  if (v4) {
    v4->_internal = (NSURLRequestInternal *)a3;
  }
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSURLRequestCachePolicy)cachePolicy
{
  return (uint64_t)*(int *)([(NSURLRequest *)self _inner] + 16);
}

- (NSString)description
{
  v3.receiver = self;
  v3.super_class = (Class)NSURLRequest;
  return [(NSString *)[(NSURLRequest *)&v3 description] stringByAppendingFormat:@" { URL: %@ }", [(NSURLRequest *)self URL]];
}

- (NSURLRequest)initWithCoder:(id)a3
{
  uint64_t v103 = *MEMORY[0x1E4F143B8];
  int v100 = 0;
  [a3 decodeValueOfObjCType:"i" at:&v100 size:4];
  if (v100 == 2)
  {
    LODWORD(v98) = 0;
    int v99 = 0;
    if ([a3 requiresSecureCoding] && objc_msgSend(a3, "allowsKeyedCoding"))
    {
      if (-[NSURLRequest initWithCoder:]::onceToken != -1) {
        dispatch_once(&-[NSURLRequest initWithCoder:]::onceToken, &__block_literal_global_15931);
      }
      v18 = (void *)[a3 allowedClasses];
      uint64_t v19 = [v18 setByAddingObjectsFromSet:-[NSURLRequest initWithCoder:]::plistClasses];
    }
    else
    {
      uint64_t v19 = 0;
    }
    [a3 decodeValueOfObjCType:"i" at:&v98 size:4];
    [a3 decodeValueOfObjCType:"i" at:&v99 size:4];
    if (v99 > 0x16) {
      goto LABEL_44;
    }
    v20 = (const void **)malloc_type_malloc(8 * v99, 0xC0040B8AA526DuLL);
    if (v99 >= 1)
    {
      for (int64_t i = 0; i < v99; v20[i++] = (const void *)v22)
      {
        if ([a3 requiresSecureCoding]
          && [a3 allowsKeyedCoding])
        {
          uint64_t v22 = objc_msgSend(a3, "decodeObjectOfClasses:forKey:", v19, +[NSURLRequest getObjectKeyWithIndex:]((uint64_t)NSURLRequest, i));
        }
        else
        {
          uint64_t v22 = [a3 decodeObject];
        }
      }
    }
    if ([a3 requiresSecureCoding] && objc_msgSend(a3, "allowsKeyedCoding")) {
      CFDictionaryRef v23 = (const __CFDictionary *)[a3 decodeObjectOfClasses:v19 forKey:@"__nsurlrequest_proto_props"];
    }
    else {
      CFDictionaryRef v23 = (const __CFDictionary *)[a3 decodeObject];
    }
    v9 = _CFURLRequestCreateFromArchiveList((uint64_t)v23, SLODWORD(v98), v20, v99, v23);
    free(v20);
  }
  else
  {
    if (v100 != 1)
    {
LABEL_44:

      return 0;
    }
    CFURLRef v5 = (const __CFURL *)[a3 decodeObject];
    int v99 = 0;
    [a3 decodeValueOfObjCType:"i" at:&v99 size:4];
    double v98 = 0.0;
    [a3 decodeValueOfObjCType:"d" at:&v98 size:8];
    NSURLRequestCachePolicy v6 = [a3 decodeObject];
    v7 = (void *)[a3 decodeObject];
    uint64_t v8 = [a3 decodeObject];
    objc_opt_class();
    v9 = 0;
    if (objc_opt_isKindOfClass())
    {
      if (*(void *)(v8 + 8)) {
        CFStringRef v10 = *(const __CFString **)(v8 + 8);
      }
      else {
        CFStringRef v10 = @"GET";
      }
      Request = CFHTTPMessageCreateRequest(0, v10, v5, @"HTTP/1.1");
      v12 = *(void **)(v8 + 16);
      if (v12 && [v12 count]) {
        _CFHTTPMessageSetMultipleHeaderFields(Request, *(CFDictionaryRef *)(v8 + 16));
      }
      v13 = *(void **)(v8 + 32);
      if (v13 && [v13 length]) {
        CFHTTPMessageSetBody(Request, *(CFDataRef *)(v8 + 32));
      }
      v14 = *(void **)(v8 + 24);
      if (v14 && [v14 count] || !*(unsigned char *)(v8 + 48))
      {
        v9 = (void *)_constructRequestFromParts(Request, 0, (const __CFArray *)v99, v6, v98, (const __CFURL *)1);
        if (v9)
        {
          if (*(void *)(v8 + 24))
          {
            if (-[NSURLRequest initWithCoder:]::sMainStorage) {
              goto LABEL_51;
            }
            pthread_mutex_lock(&-[NSURLRequest initWithCoder:]::gDefaultCookieStorageLock);
            if (!-[NSURLRequest initWithCoder:]::sMainStorage) {
              -[NSURLRequest initWithCoder:]::sMainStorage = (uint64_t)CFHTTPCookieStorageCreateFromFile(0, 0, 0);
            }
            pthread_mutex_unlock(&-[NSURLRequest initWithCoder:]::gDefaultCookieStorageLock);
            if (-[NSURLRequest initWithCoder:]::sMainStorage)
            {
LABEL_51:
              v44 = _CookieStorageCreateInMemory(0, v43);
              if (v44)
              {
                v45 = v44;
                v46 = +[NSHTTPCookie _ns2cfCookies:*(void *)(v8 + 24)];
                if (v46)
                {
                  v47 = v46;
                  v89 = Request;
                  long long v96 = 0u;
                  long long v97 = 0u;
                  long long v94 = 0u;
                  long long v95 = 0u;
                  uint64_t v48 = [(__CFArray *)v46 countByEnumeratingWithState:&v94 objects:v102 count:16];
                  if (v48)
                  {
                    uint64_t v49 = v48;
                    uint64_t v50 = *(void *)v95;
                    do
                    {
                      for (uint64_t j = 0; j != v49; ++j)
                      {
                        if (*(void *)v95 != v50) {
                          objc_enumerationMutation(v47);
                        }
                        CFHTTPCookieStorageSetCookie(v45, *(OpaqueCFHTTPCookie **)(*((void *)&v94 + 1) + 8 * j));
                      }
                      uint64_t v49 = [(__CFArray *)v47 countByEnumeratingWithState:&v94 objects:v102 count:16];
                    }
                    while (v49);
                  }
                  CFRelease(v47);
                  CFURLRequestSetHTTPCookieStorage(v9, v45);
                  Request = v89;
                }
                CFRelease(v45);
              }
            }
          }
          int v52 = *(unsigned __int8 *)(v8 + 48);
          uint64_t v53 = [v9 _inner];
          __int16 v54 = *(_WORD *)(v53 + 64);
          __int16 v55 = v54 | 0x21;
          __int16 v56 = v54 & 0xFFDE | 0x20;
          if (v52) {
            __int16 v56 = v55;
          }
          *(_WORD *)(v53 + 64) = v56;
          self;
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            uint64_t v57 = [v9 copy];
            CFRelease(v9);
            v9 = (void *)v57;
          }
        }
      }
      else
      {
        self;
        if (objc_opt_isKindOfClass())
        {
          CFAllocatorRef v15 = Request;
          NSURLRequestCachePolicy v16 = v6;
          uint64_t v17 = 1;
        }
        else
        {
          CFAllocatorRef v15 = Request;
          NSURLRequestCachePolicy v16 = v6;
          uint64_t v17 = 0;
        }
        v9 = (void *)_constructRequestFromParts(v15, 0, (const __CFArray *)v99, v16, v98, (const __CFURL *)v17);
      }
      CFRelease(Request);
      if (v9)
      {
        if (v7)
        {
          if ([v7 count])
          {
            v86 = (void *)[v7 keyEnumerator];
            uint64_t v87 = [v86 nextObject];
            if (v87)
            {
              CFStringRef v88 = (const __CFString *)v87;
              do
              {
                _CFURLRequestSetProtocolProperty(v9, v88, (CFStringRef)[v7 objectForKey:v88]);
                CFStringRef v88 = (const __CFString *)[v86 nextObject];
              }
              while (v88);
            }
          }
        }
      }
    }
  }
  if (!v9) {
    goto LABEL_44;
  }
  v24 = [(NSURLRequest *)self _initWithCFURLRequest:v9];
  if ([a3 allowsKeyedCoding])
  {
    [a3 decodeDoubleForKey:@"startTimeoutTime"];
    *(void *)([(NSURLRequest *)v24 _inner] + 152) = v25;
    char v26 = [a3 decodeBoolForKey:@"requiresShortConnectionTimeout"];
    *(unsigned char *)([(NSURLRequest *)v24 _inner] + 160) = v26;
    char v27 = [a3 decodeBoolForKey:@"preventHSTSStorage"];
    *(unsigned char *)([(NSURLRequest *)v24 _inner] + 161) = v27;
    char v28 = [a3 decodeBoolForKey:@"ignoreHSTS"];
    *(unsigned char *)([(NSURLRequest *)v24 _inner] + 162) = v28;
    char v29 = [a3 decodeBoolForKey:@"schemeWasUpgradedDueToDynamicHSTS"];
    *(unsigned char *)([(NSURLRequest *)v24 _inner] + 163) = v29;
    [a3 decodeDoubleForKey:@"payloadTransmissionTimeout"];
    *(void *)([(NSURLRequest *)v24 _inner] + 192) = v30;
    uint64_t v31 = (int)[a3 decodeIntForKey:@"allowedProtocolTypes"];
    *(void *)([(NSURLRequest *)v24 _inner] + 96) = v31;
    v32 = (__CFString *)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"boundInterfaceIdentifier"];
    URLRequest::setBoundInterfaceIdentifier((URLRequest *)[(NSURLRequest *)v24 _inner], v32);
    uint64_t v33 = [(NSURLRequest *)v24 _inner];
    *(_DWORD *)(v33 + 216) = [a3 decodeIntForKey:@"allowsExpensiveNetworkAccess"];
    uint64_t v34 = [(NSURLRequest *)v24 _inner];
    *(_DWORD *)(v34 + 220) = [a3 decodeIntForKey:@"allowsConstrainedNetworkAccess"];
    uint64_t v35 = [(NSURLRequest *)v24 _inner];
    *(_DWORD *)(v35 + 224) = [a3 decodeIntForKey:@"allowsUCA"];
    uint64_t v36 = [(NSURLRequest *)v24 _inner];
    *(unsigned char *)(v36 + 164) = [a3 decodeBoolForKey:@"assumesHTTP3Capable"];
    uint64_t v37 = [(NSURLRequest *)v24 _inner];
    *(void *)(v37 + 184) = [a3 decodeIntegerForKey:@"attribution"];
    uint64_t v38 = [(NSURLRequest *)v24 _inner];
    *(unsigned char *)(v38 + 165) = [a3 decodeBoolForKey:@"knownTracker"];
    uint64_t v39 = [(NSURLRequest *)v24 _inner];
    v40 = (const void *)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"trackerContext"];
    v41 = *(const void **)(v39 + 120);
    if (v41 != v40)
    {
      if (v41) {
        CFRelease(v41);
      }
      if (v40) {
        CFTypeRef v42 = CFRetain(v40);
      }
      else {
        CFTypeRef v42 = 0;
      }
      *(void *)(v39 + 120) = v42;
    }
    uint64_t v58 = [(NSURLRequest *)v24 _inner];
    v59 = (const void *)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"cookiePartitionIdentifier"];
    v60 = *(const void **)(v58 + 128);
    if (v60 != v59)
    {
      if (v60) {
        CFRelease(v60);
      }
      if (v59) {
        CFTypeRef v61 = CFRetain(v59);
      }
      else {
        CFTypeRef v61 = 0;
      }
      *(void *)(v58 + 128) = v61;
    }
    uint64_t v62 = [(NSURLRequest *)v24 _inner];
    *(unsigned char *)(v62 + 166) = [a3 decodeBoolForKey:@"privacyProxyFailClosed"];
    uint64_t v63 = [(NSURLRequest *)v24 _inner];
    *(unsigned char *)(v63 + 167) = [a3 decodeBoolForKey:@"privacyProxyFailClosedForUnreachableNonMainHosts"];
    uint64_t v64 = [(NSURLRequest *)v24 _inner];
    *(unsigned char *)(v64 + 168) = [a3 decodeBoolForKey:@"privacyProxyFailClosedForUnreachableHosts"];
    uint64_t v65 = [(NSURLRequest *)v24 _inner];
    *(_DWORD *)(v65 + 176) = [a3 decodeIntForKey:@"requiresDNSSECValidation"];
    uint64_t v66 = [(NSURLRequest *)v24 _inner];
    *(unsigned char *)(v66 + 180) = [a3 decodeBoolForKey:@"allowsPersistentDNS"];
    uint64_t v67 = [(NSURLRequest *)v24 _inner];
    *(unsigned char *)(v67 + 169) = [a3 decodeBoolForKey:@"prohibitPrivacyProxy"];
    uint64_t v68 = [(NSURLRequest *)v24 _inner];
    *(unsigned char *)(v68 + 170) = [a3 decodeBoolForKey:@"allowPrivateAccessTokensForThirdParty"];
    uint64_t v69 = [(NSURLRequest *)v24 _inner];
    *(unsigned char *)(v69 + 171) = [a3 decodeBoolForKey:@"useEnhancedPrivacyMode"];
    uint64_t v70 = [(NSURLRequest *)v24 _inner];
    *(unsigned char *)(v70 + 172) = [a3 decodeBoolForKey:@"blockTrackers"];
    uint64_t v71 = [(NSURLRequest *)v24 _inner];
    *(unsigned char *)(v71 + 173) = [a3 decodeBoolForKey:@"failInsecureLoadWithHTTPSDNSRecord"];
    uint64_t v72 = [(NSURLRequest *)v24 _inner];
    *(unsigned char *)(v72 + 174) = [a3 decodeBoolForKey:@"isWebSearchContent"];
    uint64_t v73 = [(NSURLRequest *)v24 _inner];
    *(unsigned char *)(v73 + 175) = [a3 decodeBoolForKey:@"allowOnlyPartitionedCookies"];
    v74 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v75 = objc_opt_class();
    v76 = objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v74, "setWithObjects:", v75, objc_opt_class(), 0), @"contentDispositionEncodingFallbackArray");
    objc_opt_class();
    long long v90 = 0u;
    long long v91 = 0u;
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      v76 = 0;
    }
    long long v92 = 0uLL;
    long long v93 = 0uLL;
    uint64_t v77 = [v76 countByEnumeratingWithState:&v90 objects:v101 count:16];
    if (v77)
    {
      uint64_t v78 = v77;
      uint64_t v79 = *(void *)v91;
      while (2)
      {
        for (uint64_t k = 0; k != v78; ++k)
        {
          if (*(void *)v91 != v79) {
            objc_enumerationMutation(v76);
          }
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            v76 = 0;
            goto LABEL_87;
          }
        }
        uint64_t v78 = [v76 countByEnumeratingWithState:&v90 objects:v101 count:16];
        if (v78) {
          continue;
        }
        break;
      }
    }
LABEL_87:
    v81 = +[NSURLRequest newCFContentDispositionEncodingFallbackArray:]((uint64_t)NSURLRequest, v76);
    uint64_t v82 = [(NSURLRequest *)v24 _inner];
    v83 = *(__CFArray **)(v82 + 80);
    if (v83 != v81)
    {
      if (v83) {
        CFRelease(v83);
      }
      if (v81) {
        CFTypeRef v84 = CFRetain(v81);
      }
      else {
        CFTypeRef v84 = 0;
      }
      *(void *)(v82 + 80) = v84;
    }
    if (v81) {
      CFRelease(v81);
    }
  }
  CFRelease(v9);
  return v24;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  int v24 = 2;
  uint64_t v22 = 0;
  uint64_t v23 = 0;
  v20 = 0;
  v21 = 0;
  CFAllocatorRef Default = CFAllocatorGetDefault();
  NSURLRequestCachePolicy v6 = (void **)[(NSURLRequest *)self copy];
  v7 = v6;
  if (v6)
  {
    URLRequest::createArchiveList((URLRequest *)[v6 _inner], Default, &v23, (const void ***)&v20, &v22, &v21);
    CFRelease(v7);
    uint64_t v8 = v22;
    int v9 = v23;
    v7 = v20;
  }
  else
  {
    int v9 = 0;
    uint64_t v8 = 22;
    uint64_t v22 = 22;
  }
  [a3 encodeValueOfObjCType:"i" at:&v24];
  int v24 = v9;
  [a3 encodeValueOfObjCType:"i" at:&v24];
  int v24 = v8;
  [a3 encodeValueOfObjCType:"i" at:&v24];
  if (v8 >= 1)
  {
    unint64_t v10 = 0;
    while (1)
    {
      v11 = v7[v10];
      if ([a3 requiresSecureCoding])
      {
        if ([a3 allowsKeyedCoding]) {
          break;
        }
      }
      [a3 encodeObject:v11];
      if (v11) {
        goto LABEL_11;
      }
LABEL_12:
      if (v8 == ++v10) {
        goto LABEL_13;
      }
    }
    objc_msgSend(a3, "encodeObject:forKey:", v11, +[NSURLRequest getObjectKeyWithIndex:]((uint64_t)NSURLRequest, v10));
    if (!v11) {
      goto LABEL_12;
    }
LABEL_11:
    CFRelease(v11);
    goto LABEL_12;
  }
LABEL_13:
  CFAllocatorDeallocate(Default, v7);
  v12 = v21;
  uint64_t v13 = self;
  if (v12 && ([MEMORY[0x1E4F28F98] propertyList:v12 isValidForFormat:200] & 1) == 0)
  {
    if (__CFNAPIMisuseFaultLogHandle::onceToken != -1) {
      dispatch_once(&__CFNAPIMisuseFaultLogHandle::onceToken, &__block_literal_global_10_5521);
    }
    v14 = __CFNAPIMisuseFaultLogHandle::logger;
    if (os_log_type_enabled((os_log_t)__CFNAPIMisuseFaultLogHandle::logger, OS_LOG_TYPE_FAULT))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v13;
      _os_log_fault_impl(&dword_184085000, v14, OS_LOG_TYPE_FAULT, "API MISUSE: %@ properties set by +[NSURLProtocol setProperty:forKey:inRequest:] should only include property list types (NSArray, NSDictionary, NSString, NSData, NSDate, NSNumber).", (uint8_t *)&buf, 0xCu);
    }
  }
  *(void *)&long long buf = MEMORY[0x1E4F143A8];
  *((void *)&buf + 1) = 3221225472;
  char v26 = __60__NSURLRequest_sanitizedProtocolPropertiesForSerialization___block_invoke;
  char v27 = &unk_1E5256B78;
  uint64_t v28 = v13;
  CFAllocatorRef v15 = (void *)[(__CFDictionary *)v12 keysOfEntriesPassingTest:&buf];
  NSURLRequestCachePolicy v16 = v12;
  if ([v15 count])
  {
    uint64_t v17 = (void *)[(__CFDictionary *)v12 mutableCopy];
    objc_msgSend(v17, "removeObjectsForKeys:", objc_msgSend(v15, "allObjects"));
    NSURLRequestCachePolicy v16 = v17;
  }
  if ([a3 requiresSecureCoding] && objc_msgSend(a3, "allowsKeyedCoding")) {
    [a3 encodeObject:v16 forKey:@"__nsurlrequest_proto_props"];
  }
  else {
    [a3 encodeObject:v16];
  }
  if ([a3 allowsKeyedCoding])
  {
    double v18 = *(double *)([(NSURLRequest *)self _inner] + 152);
    double v19 = *(double *)([(NSURLRequest *)self _inner] + 192);
    [a3 encodeDouble:@"startTimeoutTime" forKey:v18];
    objc_msgSend(a3, "encodeBool:forKey:", -[NSURLRequest _requiresShortConnectionTimeout](self, "_requiresShortConnectionTimeout"), @"requiresShortConnectionTimeout");
    objc_msgSend(a3, "encodeBool:forKey:", -[NSURLRequest _preventHSTSStorage](self, "_preventHSTSStorage"), @"preventHSTSStorage");
    objc_msgSend(a3, "encodeBool:forKey:", -[NSURLRequest _ignoreHSTS](self, "_ignoreHSTS"), @"ignoreHSTS");
    objc_msgSend(a3, "encodeBool:forKey:", -[NSURLRequest _schemeWasUpgradedDueToDynamicHSTS](self, "_schemeWasUpgradedDueToDynamicHSTS"), @"schemeWasUpgradedDueToDynamicHSTS");
    [a3 encodeDouble:@"payloadTransmissionTimeout" forKey:v19];
    objc_msgSend(a3, "encodeInt:forKey:", *(unsigned int *)(-[NSURLRequest _inner](self, "_inner") + 96), @"allowedProtocolTypes");
    objc_msgSend(a3, "encodeObject:forKey:", -[NSURLRequest boundInterfaceIdentifier](self, "boundInterfaceIdentifier"), @"boundInterfaceIdentifier");
    objc_msgSend(a3, "encodeInt:forKey:", *(unsigned int *)(-[NSURLRequest _inner](self, "_inner") + 216), @"allowsExpensiveNetworkAccess");
    objc_msgSend(a3, "encodeInt:forKey:", *(unsigned int *)(-[NSURLRequest _inner](self, "_inner") + 220), @"allowsConstrainedNetworkAccess");
    objc_msgSend(a3, "encodeInt:forKey:", *(unsigned int *)(-[NSURLRequest _inner](self, "_inner") + 224), @"allowsUCA");
    objc_msgSend(a3, "encodeBool:forKey:", *(unsigned char *)(-[NSURLRequest _inner](self, "_inner") + 164) != 0, @"assumesHTTP3Capable");
    objc_msgSend(a3, "encodeInteger:forKey:", *(void *)(-[NSURLRequest _inner](self, "_inner") + 184), @"attribution");
    objc_msgSend(a3, "encodeBool:forKey:", *(unsigned char *)(-[NSURLRequest _inner](self, "_inner") + 165) != 0, @"knownTracker");
    objc_msgSend(a3, "encodeObject:forKey:", *(void *)(-[NSURLRequest _inner](self, "_inner") + 120), @"trackerContext");
    objc_msgSend(a3, "encodeObject:forKey:", *(void *)(-[NSURLRequest _inner](self, "_inner") + 128), @"cookiePartitionIdentifier");
    objc_msgSend(a3, "encodeBool:forKey:", *(unsigned char *)(-[NSURLRequest _inner](self, "_inner") + 166) != 0, @"privacyProxyFailClosed");
    objc_msgSend(a3, "encodeBool:forKey:", *(unsigned char *)(-[NSURLRequest _inner](self, "_inner") + 167) != 0, @"privacyProxyFailClosedForUnreachableNonMainHosts");
    objc_msgSend(a3, "encodeBool:forKey:", *(unsigned char *)(-[NSURLRequest _inner](self, "_inner") + 168) != 0, @"privacyProxyFailClosedForUnreachableHosts");
    objc_msgSend(a3, "encodeInt:forKey:", *(unsigned int *)(-[NSURLRequest _inner](self, "_inner") + 176), @"requiresDNSSECValidation");
    objc_msgSend(a3, "encodeBool:forKey:", *(unsigned char *)(-[NSURLRequest _inner](self, "_inner") + 180) != 0, @"allowsPersistentDNS");
    objc_msgSend(a3, "encodeBool:forKey:", *(unsigned char *)(-[NSURLRequest _inner](self, "_inner") + 169) != 0, @"prohibitPrivacyProxy");
    objc_msgSend(a3, "encodeBool:forKey:", *(unsigned char *)(-[NSURLRequest _inner](self, "_inner") + 170) != 0, @"allowPrivateAccessTokensForThirdParty");
    objc_msgSend(a3, "encodeBool:forKey:", *(unsigned char *)(-[NSURLRequest _inner](self, "_inner") + 171) != 0, @"useEnhancedPrivacyMode");
    objc_msgSend(a3, "encodeBool:forKey:", *(unsigned char *)(-[NSURLRequest _inner](self, "_inner") + 172) != 0, @"blockTrackers");
    objc_msgSend(a3, "encodeBool:forKey:", *(unsigned char *)(-[NSURLRequest _inner](self, "_inner") + 173) != 0, @"failInsecureLoadWithHTTPSDNSRecord");
    objc_msgSend(a3, "encodeBool:forKey:", *(unsigned char *)(-[NSURLRequest _inner](self, "_inner") + 174) != 0, @"isWebSearchContent");
    objc_msgSend(a3, "encodeBool:forKey:", *(unsigned char *)(-[NSURLRequest _inner](self, "_inner") + 175) != 0, @"allowOnlyPartitionedCookies");
    objc_msgSend(a3, "encodeObject:forKey:", -[NSURLRequest contentDispositionEncodingFallbackArray](self, "contentDispositionEncodingFallbackArray"), @"contentDispositionEncodingFallbackArray");
    v12 = v21;
  }
  if (v12) {
    CFRelease(v12);
  }
}

- (void)_inner
{
  return [(NSURLRequestInternal *)self->_internal _inner];
}

+ (__CFString)getObjectKeyWithIndex:(uint64_t)a1
{
  if (a2 >= 0x1F) {
    __assert_rtn("+[NSURLRequest getObjectKeyWithIndex:]", "NSURLRequest.mm", 374, "false");
  }
  return _objectKeys[a2];
}

- (BOOL)_requiresShortConnectionTimeout
{
  return *(unsigned char *)([(NSURLRequest *)self _inner] + 160) != 0;
}

- (id)boundInterfaceIdentifier
{
  CFStringRef v2 = *(const __CFString **)([(NSURLRequest *)self _inner] + 112);
  if (v2) {
    Copy = (__CFString *)CFStringCreateCopy((CFAllocatorRef)*MEMORY[0x1E4F1CF80], v2);
  }
  else {
    Copy = 0;
  }

  return Copy;
}

- (id)contentDispositionEncodingFallbackArray
{
  CFStringRef v2 = *(const void **)([(NSURLRequest *)self _inner] + 80);
  if (v2 && (CFArrayRef v3 = (const __CFArray *)CFRetain(v2)) != 0)
  {
    CFArrayRef v4 = v3;
    CFIndex Count = CFArrayGetCount(v3);
    NSURLRequestCachePolicy v6 = (void *)[MEMORY[0x1E4F1CA48] arrayWithCapacity:Count];
    if (v6) {
      BOOL v7 = Count < 1;
    }
    else {
      BOOL v7 = 1;
    }
    if (!v7)
    {
      CFIndex v8 = 0;
      do
      {
        int v9 = NSNumber;
        CFStringEncoding ValueAtIndex = CFArrayGetValueAtIndex(v4, v8);
        objc_msgSend(v6, "addObject:", objc_msgSend(v9, "numberWithUnsignedLong:", CFStringConvertEncodingToNSStringEncoding(ValueAtIndex)));
        ++v8;
      }
      while (Count != v8);
    }
    CFRelease(v4);
  }
  else
  {
    NSURLRequestCachePolicy v6 = 0;
  }
  v11 = (void *)[v6 copy];

  return v11;
}

- (BOOL)_schemeWasUpgradedDueToDynamicHSTS
{
  return *(unsigned char *)([(NSURLRequest *)self _inner] + 163) != 0;
}

- (BOOL)_preventHSTSStorage
{
  return *(unsigned char *)([(NSURLRequest *)self _inner] + 161) != 0;
}

- (BOOL)_ignoreHSTS
{
  return *(unsigned char *)([(NSURLRequest *)self _inner] + 162) != 0;
}

+ (__CFArray)newCFContentDispositionEncodingFallbackArray:(uint64_t)a1
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  self;
  if (!a2) {
    return 0;
  }
  Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, 0);
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v4 = [a2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(a2);
        }
        CFStringEncoding v8 = CFStringConvertNSStringEncodingToEncoding([*(id *)(*((void *)&v10 + 1) + 8 * i) unsignedLongValue]);
        CFArrayAppendValue(Mutable, (const void *)v8);
      }
      uint64_t v5 = [a2 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }
  return Mutable;
}

- (NSURL)URL
{
  return *(NSURL **)([(NSURLRequest *)self _inner] + 8);
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)NSURLRequest;
  [(NSURLRequest *)&v3 dealloc];
}

- (NSDictionary)allHTTPHeaderFields
{
  CFStringRef v2 = *(HTTPMessage **)([(NSURLRequest *)self _inner] + 56);
  if (v2) {
    CFStringRef v2 = HTTPMessage::copyAllHeaderFields(v2);
  }

  return (NSDictionary *)v2;
}

- (id)_startTimeoutDate
{
  if (*(double *)([(NSURLRequest *)self _inner] + 152) <= 0.0) {
    return 0;
  }
  CFStringRef v2 = (void *)MEMORY[0x1E4F1C9C8];

  return (id)objc_msgSend(v2, "dateWithTimeIntervalSinceReferenceDate:");
}

- (id)_allHTTPHeaderFieldsAsArrays
{
  if (self->_internal && (CFStringRef v2 = *(HTTPMessage **)([(NSURLRequest *)self _inner] + 56)) != 0)
  {
    if (HTTPMessage::Class(void)::sOnce_HTTPMessage != -1) {
      dispatch_once(&HTTPMessage::Class(void)::sOnce_HTTPMessage, &__block_literal_global_5973);
    }
    CFDictionaryRef v3 = HTTPMessage::copyAsMultiValueDict(v2);
  }
  else
  {
    CFDictionaryRef v3 = 0;
  }

  return v3;
}

- (double)_payloadTransmissionTimeout
{
  return *(double *)([(NSURLRequest *)self _inner] + 192);
}

- (__CFURL)cfURL
{
  return *(__CFURL **)([(NSURLRequest *)self _inner] + 8);
}

- (BOOL)isEqual:(id)a3
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  internal = self->_internal;
  uint64_t v6 = *((void *)a3 + 1);

  return [(NSURLRequestInternal *)internal isEqual:v6];
}

+ (NSURLRequest)requestWithURL:(NSURL *)URL cachePolicy:(NSURLRequestCachePolicy)cachePolicy timeoutInterval:(NSTimeInterval)timeoutInterval
{
  uint64_t v5 = (void *)[objc_alloc((Class)a1) initWithURL:URL cachePolicy:cachePolicy timeoutInterval:timeoutInterval];

  return (NSURLRequest *)v5;
}

+ (NSURLRequest)requestWithURL:(NSURL *)URL
{
  CFDictionaryRef v3 = (void *)[objc_alloc((Class)a1) initWithURL:URL];

  return (NSURLRequest *)v3;
}

- (NSURLRequest)initWithURL:(NSURL *)URL cachePolicy:(NSURLRequestCachePolicy)cachePolicy timeoutInterval:(NSTimeInterval)timeoutInterval
{
  v17.receiver = self;
  v17.super_class = (Class)NSURLRequest;
  CFStringEncoding v8 = [(NSURLRequest *)&v17 init];
  if (v8)
  {
    self;
    char isKindOfClass = objc_opt_isKindOfClass();
    long long v10 = objc_alloc_init(NSURLRequestInternal);
    uint64_t v11 = [(NSURLRequestInternal *)v10 _inner];
    uint64_t v12 = v11;
    if (isKindOfClass) {
      *(_WORD *)(v11 + 64) |= 2u;
    }
    if (URL) {
      CFURLRef v13 = CFURLCopyAbsoluteURL((CFURLRef)URL);
    }
    else {
      CFURLRef v13 = 0;
    }
    if (cachePolicy) {
      __int16 v14 = 1033;
    }
    else {
      __int16 v14 = 9;
    }
    __int16 v15 = *(_WORD *)(v12 + 64) & 0xFFEF | v14;
    *(_WORD *)(v12 + 64) = v15;
    *(void *)(v12 + 8) = v13;
    *(void *)(v12 + 16) = cachePolicy;
    if (timeoutInterval != 60.0) {
      *(_WORD *)(v12 + 64) = v15 | 0x800;
    }
    *(NSTimeInterval *)(v12 + 24) = timeoutInterval;
    *(void *)(v12 + 32) = 0;
    v8->_internal = v10;
    if (!v10)
    {

      return 0;
    }
  }
  return v8;
}

- (NSURLRequest)initWithURL:(NSURL *)URL
{
  return [(NSURLRequest *)self initWithURL:URL cachePolicy:0 timeoutInterval:(double)(unint64_t)NSURLRequestTimeoutInterval];
}

- (NSString)valueForHTTPHeaderField:(NSString *)field
{
  uint64_t v4 = *(HTTPMessage **)([(NSURLRequest *)self _inner] + 56);
  if (v4) {
    uint64_t v4 = (HTTPMessage *)HTTPMessage::copyHeaderFieldValue(v4, (const __CFString *)field);
  }

  return (NSString *)v4;
}

- (NSURL)mainDocumentURL
{
  return *(NSURL **)([(NSURLRequest *)self _inner] + 32);
}

- (BOOL)HTTPShouldHandleCookies
{
  return *(_WORD *)([(NSURLRequest *)self _inner] + 64) & 1;
}

- (NSURLRequest)init
{
  return [(NSURLRequest *)self initWithURL:0];
}

- (NSString)HTTPMethod
{
  CFStringRef v2 = (void *)CFURLRequestCopyHTTPRequestMethod(self);

  return (NSString *)v2;
}

- (BOOL)_isSafeRequestForBackgroundDownload
{
  CFStringRef v2 = [(NSString *)[[(NSURLRequest *)self URL] scheme] lowercaseString];
  if ([(NSString *)v2 isEqualToString:@"http"]) {
    return 1;
  }

  return [(NSString *)v2 isEqualToString:@"https"];
}

- (NSData)HTTPBody
{
  CFStringRef v2 = *(HTTPBodyData ***)([(NSURLRequest *)self _inner] + 56);
  if (v2) {
    CFStringRef v2 = (HTTPBodyData **)HTTPMessage::copyBody(v2);
  }

  return (NSData *)v2;
}

- (NSInputStream)HTTPBodyStream
{
  CFStringRef v2 = (void *)CFURLRequestCopyHTTPRequestBodyStream(self);

  return (NSInputStream *)v2;
}

- (NSTimeInterval)timeoutInterval
{
  return *(double *)([(NSURLRequest *)self _inner] + 24);
}

- (double)_timeWindowDuration
{
  return *(double *)([(NSURLRequest *)self _inner] + 144);
}

- (double)_timeWindowDelay
{
  return *(double *)([(NSURLRequest *)self _inner] + 136);
}

- (BOOL)allowsCellularAccess
{
  return (*(unsigned __int16 *)([(NSURLRequest *)self _inner] + 64) >> 3) & 1;
}

- (id)_propertyForKey:(id)a3
{
  CFURLRef v3 = _CFURLRequestCopyProtocolPropertyForKey(self, (const __CFString *)a3);

  return v3;
}

+ (void)setAllowsAnyHTTPSCertificate:(BOOL)a3 forHost:(id)a4
{
  if (a4)
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __71__NSURLRequest_NSHTTPURLRequest__setAllowsAnyHTTPSCertificate_forHost___block_invoke;
    v5[3] = &unk_1E5256BC8;
    v5[4] = a4;
    BOOL v6 = a3;
    withHostsSPILocked((uint64_t)v5);
  }
  else
  {
    if (CFNLog::onceToken != -1) {
      dispatch_once(&CFNLog::onceToken, &__block_literal_global_2_5509);
    }
    uint64_t v4 = CFNLog::logger;
    if (os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)long long buf = 0;
      _os_log_error_impl(&dword_184085000, v4, OS_LOG_TYPE_ERROR, "nil host used in call to setAllowsAnyHTTPSCertificate:forHost:", buf, 2u);
    }
  }
}

uint64_t __71__NSURLRequest_NSHTTPURLRequest__setAllowsAnyHTTPSCertificate_forHost___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v4 = [*(id *)(a1 + 32) lowercaseString];
  if (*(unsigned char *)(a1 + 40))
  {
    return [a2 addObject:v4];
  }
  else
  {
    return [a2 removeObject:v4];
  }
}

id __30__NSURLRequest_initWithCoder___block_invoke()
{
  v0 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v1 = objc_opt_class();
  uint64_t v2 = objc_opt_class();
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  id result = (id)objc_msgSend(v0, "setWithObjects:", v1, v2, v3, v4, v5, v6, v7, objc_opt_class(), 0);
  -[NSURLRequest initWithCoder:]::plistClasses = (uint64_t)result;
  return result;
}

- (NSString)cookiePartitionIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (BOOL)_allowsUCA
{
  return *(_DWORD *)([(NSURLRequest *)self _inner] + 224) == 1;
}

- (unint64_t)_allowedProtocolTypes
{
  return *(void *)([(NSURLRequest *)self _inner] + 96);
}

- (BOOL)_allowOnlyPartitionedCookies
{
  return *(unsigned char *)([(NSURLRequest *)self _inner] + 175) != 0;
}

- (BOOL)_isWebSearchContent
{
  return *(unsigned char *)([(NSURLRequest *)self _inner] + 174) != 0;
}

- (BOOL)_failInsecureLoadWithHTTPSDNSRecord
{
  return *(unsigned char *)([(NSURLRequest *)self _inner] + 173) != 0;
}

- (BOOL)_useEnhancedPrivacyMode
{
  return *(unsigned char *)([(NSURLRequest *)self _inner] + 171) != 0;
}

- (BOOL)_allowPrivateAccessTokensForThirdParty
{
  return *(unsigned char *)([(NSURLRequest *)self _inner] + 170) != 0;
}

- (BOOL)_prohibitPrivacyProxy
{
  return *(unsigned char *)([(NSURLRequest *)self _inner] + 169) != 0;
}

- (BOOL)_privacyProxyFailClosedForUnreachableHosts
{
  return *(unsigned char *)([(NSURLRequest *)self _inner] + 168) != 0;
}

- (BOOL)_privacyProxyFailClosedForUnreachableNonMainHosts
{
  return *(unsigned char *)([(NSURLRequest *)self _inner] + 167) != 0;
}

- (BOOL)_privacyProxyFailClosed
{
  return *(unsigned char *)([(NSURLRequest *)self _inner] + 166) != 0;
}

- (id)_trackerContext
{
  return *(id *)([(NSURLRequest *)self _inner] + 120);
}

- (BOOL)_isNonAppInitiated
{
  return *(void *)([(NSURLRequest *)self _inner] + 184) == 1;
}

- (BOOL)_isKnownTracker
{
  return *(unsigned char *)([(NSURLRequest *)self _inner] + 165) != 0;
}

- (BOOL)allowsPersistentDNS
{
  return *(unsigned char *)([(NSURLRequest *)self _inner] + 180) != 0;
}

- (BOOL)requiresDNSSECValidation
{
  return *(_DWORD *)([(NSURLRequest *)self _inner] + 176) == 1;
}

- (NSURLRequestAttribution)attribution
{
  return *(void *)([(NSURLRequest *)self _inner] + 184);
}

- (BOOL)assumesHTTP3Capable
{
  return *(unsigned char *)([(NSURLRequest *)self _inner] + 164) != 0;
}

- (BOOL)allowsExpensiveNetworkAccess
{
  return *(_DWORD *)([(NSURLRequest *)self _inner] + 216) != 2;
}

- (BOOL)allowsConstrainedNetworkAccess
{
  return *(_DWORD *)([(NSURLRequest *)self _inner] + 220) != 2;
}

- (NSURLRequestNetworkServiceType)networkServiceType
{
  return (uint64_t)*(int *)([(NSURLRequest *)self _inner] + 104);
}

- (id)_allProtocolProperties
{
  return *(id *)([(NSURLRequest *)self _inner] + 40);
}

- (void)_removePropertyForKey:(id)a3
{
}

- (void)_setProperty:(id)a3 forKey:(id)a4
{
}

- (BOOL)_URLHasScheme:(id)a3
{
  if (!a3) {
    __assert_rtn("-[NSURLRequest _URLHasScheme:]", "NSURLRequest.mm", 595, "scheme");
  }
  uint64_t v4 = objc_msgSend(*(id *)(-[NSURLRequest _inner](self, "_inner") + 8), "scheme");

  return objc_msgSend(v4, "_web_isCaseInsensitiveEqualToString:", a3);
}

- (id)_copyReplacingURLWithURL:(id)a3
{
  uint64_t v4 = (void *)[(NSURLRequest *)self mutableCopy];
  [v4 setURL:a3];
  if (!v4) {
    return 0;
  }
  id v5 = [[NSURLRequest alloc] _initWithCFURLRequest:v4];
  CFRelease(v4);
  return v5;
}

+ (double)defaultTimeoutInterval
{
  return (double)(unint64_t)NSURLRequestTimeoutInterval;
}

+ (void)setDefaultTimeoutInterval:(double)a3
{
  NSURLRequestTimeoutInterval = (unint64_t)a3;
}

- (unint64_t)hash
{
  return [(NSURLRequestInternal *)self->_internal hash];
}

uint64_t __60__NSURLRequest_sanitizedProtocolPropertiesForSerialization___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if ((unint64_t)estimatedPropertyListSize(a3) <= 0x4000) {
    return [MEMORY[0x1E4F28F98] propertyList:a3 isValidForFormat:200] ^ 1;
  }
  if (__CFNAPIMisuseFaultLogHandle::onceToken != -1) {
    dispatch_once(&__CFNAPIMisuseFaultLogHandle::onceToken, &__block_literal_global_10_5521);
  }
  uint64_t v6 = __CFNAPIMisuseFaultLogHandle::logger;
  if (os_log_type_enabled((os_log_t)__CFNAPIMisuseFaultLogHandle::logger, OS_LOG_TYPE_FAULT))
  {
    uint64_t v8 = *(void *)(a1 + 32);
    int v9 = 138412546;
    uint64_t v10 = a2;
    __int16 v11 = 2112;
    uint64_t v12 = v8;
    _os_log_fault_impl(&dword_184085000, v6, OS_LOG_TYPE_FAULT, "Dropping oversized protocol property key %@ in %@", (uint8_t *)&v9, 0x16u);
  }
  return 1;
}

- (id)_initWithWebKitPropertyListData:(id)a3
{
  uint64_t v123 = *MEMORY[0x1E4F143B8];
  id v5 = objc_alloc_init(NSURLRequestInternal);
  uint64_t v6 = [(NSURLRequestInternal *)v5 _inner];
  uint64_t v7 = (void *)[a3 objectForKeyedSubscript:@"protocolProperties"];
  if (v7)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_43;
    }
  }
  uint64_t v8 = (void *)[a3 objectForKeyedSubscript:@"isMutable"];
  if (v8)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_43;
    }
  }
  int v9 = (const void *)[a3 objectForKeyedSubscript:@"URL"];
  if (v9)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_43;
    }
  }
  uint64_t v10 = (void *)[a3 objectForKeyedSubscript:@"timeout"];
  if (v10)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_43;
    }
  }
  __int16 v11 = (void *)[a3 objectForKeyedSubscript:@"cachePolicy"];
  if (v11)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_43;
    }
  }
  uint64_t v12 = (const void *)[a3 objectForKeyedSubscript:@"mainDocumentURL"];
  if (v12)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_43;
    }
  }
  v114 = (void *)[a3 objectForKeyedSubscript:@"shouldHandleHTTPCookies"];
  if (v114)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_43;
    }
  }
  v113 = (void *)[a3 objectForKeyedSubscript:@"explicitFlags"];
  if (v113)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_43;
    }
  }
  v112 = (void *)[a3 objectForKeyedSubscript:@"allowCellular"];
  if (v112)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_43;
    }
  }
  v111 = (void *)[a3 objectForKeyedSubscript:@"preventsIdleSystemSleep"];
  if (v111)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_43;
    }
  }
  v110 = (void *)[a3 objectForKeyedSubscript:@"timeWindowDelay"];
  if (v110)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_43;
    }
  }
  v109 = (void *)[a3 objectForKeyedSubscript:@"timeWindowDuration"];
  if (v109)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_43;
    }
  }
  v108 = (void *)[a3 objectForKeyedSubscript:@"networkServiceType"];
  if (v108)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_43;
    }
  }
  v107 = (void *)[a3 objectForKeyedSubscript:@"requestPriority"];
  if (v107)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_43;
    }
  }
  v106 = (void *)[a3 objectForKeyedSubscript:@"isHTTP"];
  if (v106)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_43;
    }
  }
  CFStringRef theString = (const __CFString *)[a3 objectForKeyedSubscript:@"httpMethod"];
  if (theString)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_43;
    }
  }
  if ((v104 = (void *)[a3 objectForKeyedSubscript:@"headerFields"]) != 0
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
    || (uint64_t v103 = [a3 objectForKeyedSubscript:@"body"]) != 0
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
    || (v102 = (void *)[a3 objectForKeyedSubscript:@"bodyParts"]) != 0
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
LABEL_43:

    goto LABEL_44;
  }
  if ([v8 BOOLValue]) {
    *(_WORD *)(v6 + 64) |= 2u;
  }
  if (v9) {
    CFTypeRef v13 = CFRetain(v9);
  }
  else {
    CFTypeRef v13 = 0;
  }
  *(void *)(v6 + 8) = v13;
  [v10 doubleValue];
  *(void *)(v6 + 24) = v15;
  *(void *)(v6 + 16) = [v11 unsignedIntegerValue];
  if (v12) {
    CFTypeRef v16 = CFRetain(v12);
  }
  else {
    CFTypeRef v16 = 0;
  }
  *(void *)(v6 + 32) = v16;
  *(_WORD *)(v6 + 64) = *(_WORD *)(v6 + 64) & 0xFFFE | [v114 BOOLValue];
  uint64_t v17 = [v113 integerValue];
  if (!v17) {
    goto LABEL_62;
  }
  if ((v17 & 2) != 0)
  {
    *(_WORD *)(v6 + 64) |= 0x20u;
    if ((v17 & 4) == 0)
    {
LABEL_53:
      if ((v17 & 8) == 0) {
        goto LABEL_54;
      }
      goto LABEL_104;
    }
  }
  else if ((v17 & 4) == 0)
  {
    goto LABEL_53;
  }
  *(_WORD *)(v6 + 64) |= 0x40u;
  if ((v17 & 8) == 0)
  {
LABEL_54:
    if ((v17 & 0x10) == 0) {
      goto LABEL_55;
    }
    goto LABEL_105;
  }
LABEL_104:
  *(_WORD *)(v6 + 64) |= 0x80u;
  if ((v17 & 0x10) == 0)
  {
LABEL_55:
    if ((v17 & 0x40) == 0) {
      goto LABEL_56;
    }
    goto LABEL_106;
  }
LABEL_105:
  *(_WORD *)(v6 + 64) |= 0x100u;
  if ((v17 & 0x40) == 0)
  {
LABEL_56:
    if ((v17 & 0x80) == 0) {
      goto LABEL_57;
    }
    goto LABEL_107;
  }
LABEL_106:
  *(_WORD *)(v6 + 64) |= 0x200u;
  if ((v17 & 0x80) == 0)
  {
LABEL_57:
    if ((v17 & 0x100) == 0) {
      goto LABEL_58;
    }
    goto LABEL_108;
  }
LABEL_107:
  *(_WORD *)(v6 + 64) |= 0x400u;
  if ((v17 & 0x100) == 0)
  {
LABEL_58:
    if ((v17 & 0x200) == 0) {
      goto LABEL_59;
    }
LABEL_109:
    *(_WORD *)(v6 + 64) |= 0x1000u;
    if ((v17 & 0x400) == 0)
    {
LABEL_60:
      if ((v17 & 0x1000) == 0) {
        goto LABEL_62;
      }
      goto LABEL_61;
    }
    goto LABEL_110;
  }
LABEL_108:
  *(_WORD *)(v6 + 64) |= 0x800u;
  if ((v17 & 0x200) != 0) {
    goto LABEL_109;
  }
LABEL_59:
  if ((v17 & 0x400) == 0) {
    goto LABEL_60;
  }
LABEL_110:
  *(_WORD *)(v6 + 64) |= 0x2000u;
  if ((v17 & 0x1000) != 0) {
LABEL_61:
  }
    *(_WORD *)(v6 + 64) |= 0x4000u;
LABEL_62:
  [v110 doubleValue];
  *(void *)(v6 + 136) = v18;
  [v109 doubleValue];
  *(void *)(v6 + 144) = v19;
  *(_DWORD *)(v6 + 104) = [v108 intValue];
  *(void *)(v6 + 88) = [v107 integerValue];
  if ([v112 BOOLValue]) {
    __int16 v20 = 8;
  }
  else {
    __int16 v20 = 0;
  }
  *(_WORD *)(v6 + 64) = *(_WORD *)(v6 + 64) & 0xFFF7 | v20;
  if ([v111 BOOLValue]) {
    __int16 v21 = 16;
  }
  else {
    __int16 v21 = 0;
  }
  *(_WORD *)(v6 + 64) = *(_WORD *)(v6 + 64) & 0xFFEF | v21;
  if ([v106 BOOLValue])
  {
    if (*(void *)(v6 + 56) && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_fault_impl(&dword_184085000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "can't be here", buf, 2u);
    }
    if (HTTPMessage::Class(void)::sOnce_HTTPMessage != -1) {
      dispatch_once(&HTTPMessage::Class(void)::sOnce_HTTPMessage, &__block_literal_global_5973);
    }
    Instance = (_OWORD *)_CFRuntimeCreateInstance();
    uint64_t v23 = (HTTPRequest *)Instance;
    if (Instance)
    {
      Instance[1] = 0u;
      uint64_t v23 = (HTTPRequest *)(Instance + 1);
      Instance[13] = 0u;
      Instance[14] = 0u;
      Instance[11] = 0u;
      Instance[12] = 0u;
      Instance[9] = 0u;
      Instance[10] = 0u;
      Instance[7] = 0u;
      Instance[8] = 0u;
      Instance[5] = 0u;
      Instance[6] = 0u;
      Instance[3] = 0u;
      Instance[4] = 0u;
      Instance[2] = 0u;
    }
    HTTPMethodMixedValue::HTTPMethodMixedValue((HTTPMethodMixedValue *)buf, theString);
    HTTPRequest::HTTPRequest(v23, (CFTypeRef *)buf, *(const __CFURL **)(v6 + 8));
    *(void *)(v6 + 56) = v23;
    *(void *)long long buf = &unk_1ECF9F718;
    if (cf)
    {
      CFRelease(cf);
      uint64_t v23 = *(HTTPRequest **)(v6 + 56);
    }
    HTTPMessage::ensureParserFinished((HTTPMessage *)v23);
    (*(void (**)(void, uint64_t))(**(void **)(v6 + 56) + 64))(*(void *)(v6 + 56), v103);
    if (v104)
    {
      v119[0] = MEMORY[0x1E4F143A8];
      v119[1] = 3221225472;
      v119[2] = ___ZN10URLRequest10initializeEPK14__CFDictionary_block_invoke;
      v119[3] = &__block_descriptor_40_e34_v32__0__NSString_8__NSArray_16_B24l;
      v119[4] = v6;
      [v104 enumerateKeysAndObjectsUsingBlock:v119];
    }
    if (v102)
    {
      int v24 = (const void *)[v102 mutableCopy];
      HTTPRequest::setBodyParts(*(HTTPRequest **)(v6 + 56), v24);
      if (v24) {
        CFRelease(v24);
      }
    }
  }
  if (v7) {
    *(void *)(v6 + 40) = [v7 mutableCopy];
  }
  self = [(NSURLRequest *)self _initWithInternal:v5];

  uint64_t v25 = (void *)[a3 objectForKeyedSubscript:@"startTimeoutTime"];
  if (v25)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_44;
    }
  }
  char v26 = [(NSURLRequest *)self _inner];
  [v25 doubleValue];
  v26[19] = v27;
  uint64_t v28 = (void *)[a3 objectForKeyedSubscript:@"requiresShortConnectionTimeout"];
  if (v28)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_44;
    }
  }
  uint64_t v29 = [(NSURLRequest *)self _inner];
  v29[160] = [v28 BOOLValue];
  uint64_t v30 = (void *)[a3 objectForKeyedSubscript:@"preventHSTSStorage"];
  if (v30)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_44;
    }
  }
  uint64_t v31 = [(NSURLRequest *)self _inner];
  v31[161] = [v30 BOOLValue];
  v32 = (void *)[a3 objectForKeyedSubscript:@"ignoreHSTS"];
  if (v32)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_44;
    }
  }
  uint64_t v33 = [(NSURLRequest *)self _inner];
  v33[162] = [v32 BOOLValue];
  uint64_t v34 = (void *)[a3 objectForKeyedSubscript:@"schemeWasUpgradedDueToDynamicHSTS"];
  if (v34)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_44;
    }
  }
  uint64_t v35 = [(NSURLRequest *)self _inner];
  v35[163] = [v34 BOOLValue];
  uint64_t v36 = (void *)[a3 objectForKeyedSubscript:@"payloadTransmissionTimeout"];
  if (v36)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_44;
    }
  }
  uint64_t v37 = [(NSURLRequest *)self _inner];
  [v36 doubleValue];
  v37[24] = v38;
  uint64_t v39 = (void *)[a3 objectForKeyedSubscript:@"allowedProtocolTypes"];
  if (v39)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_44;
    }
  }
  v40 = [(NSURLRequest *)self _inner];
  v40[12] = [v39 integerValue];
  uint64_t v41 = [a3 objectForKeyedSubscript:@"boundInterfaceIdentifier"];
  if (v41)
  {
    CFTypeRef v42 = (__CFString *)v41;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_44;
    }
    URLRequest::setBoundInterfaceIdentifier((URLRequest *)[(NSURLRequest *)self _inner], v42);
  }
  else
  {
    v43 = [(NSURLRequest *)self _inner];
    v44 = (const void *)v43[14];
    if (v44)
    {
      CFRelease(v44);
      v43[14] = 0;
    }
  }
  uint64_t v45 = [a3 objectForKeyedSubscript:@"allowsExpensiveNetworkAccess"];
  if (v45)
  {
    v46 = (void *)v45;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_44;
    }
    v47 = [(NSURLRequest *)self _inner];
    if ([v46 BOOLValue]) {
      int v48 = 1;
    }
    else {
      int v48 = 2;
    }
  }
  else
  {
    v47 = [(NSURLRequest *)self _inner];
    int v48 = 0;
  }
  v47[54] = v48;
  uint64_t v49 = [a3 objectForKeyedSubscript:@"allowsConstrainedNetworkAccess"];
  if (v49)
  {
    uint64_t v50 = (void *)v49;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_44;
    }
    v51 = [(NSURLRequest *)self _inner];
    if ([v50 BOOLValue]) {
      int v52 = 1;
    }
    else {
      int v52 = 2;
    }
  }
  else
  {
    v51 = [(NSURLRequest *)self _inner];
    int v52 = 0;
  }
  v51[55] = v52;
  uint64_t v53 = [a3 objectForKeyedSubscript:@"allowsUCA"];
  if (v53)
  {
    __int16 v54 = (void *)v53;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_44;
    }
    __int16 v55 = [(NSURLRequest *)self _inner];
    if ([v54 BOOLValue]) {
      int v56 = 1;
    }
    else {
      int v56 = 2;
    }
  }
  else
  {
    __int16 v55 = [(NSURLRequest *)self _inner];
    int v56 = 0;
  }
  v55[56] = v56;
  uint64_t v57 = (void *)[a3 objectForKeyedSubscript:@"assumesHTTP3Capable"];
  if (v57)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_44;
    }
  }
  uint64_t v58 = [(NSURLRequest *)self _inner];
  v58[164] = [v57 BOOLValue];
  v59 = (void *)[a3 objectForKeyedSubscript:@"attribution"];
  if (v59)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_44;
    }
  }
  v60 = [(NSURLRequest *)self _inner];
  v60[23] = [v59 integerValue];
  CFTypeRef v61 = (void *)[a3 objectForKeyedSubscript:@"knownTracker"];
  if (v61)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_44;
    }
  }
  uint64_t v62 = [(NSURLRequest *)self _inner];
  v62[165] = [v61 BOOLValue];
  uint64_t v63 = [a3 objectForKeyedSubscript:@"trackerContext"];
  if (v63)
  {
    uint64_t v64 = (__CFString *)v63;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_44;
    }
    URLRequest::setTrackerContext((URLRequest *)[(NSURLRequest *)self _inner], v64);
  }
  else
  {
    uint64_t v65 = [(NSURLRequest *)self _inner];
    uint64_t v66 = (const void *)v65[15];
    if (v66)
    {
      CFRelease(v66);
      v65[15] = 0;
    }
  }
  uint64_t v67 = [a3 objectForKeyedSubscript:@"cookiePartitionIdentifier"];
  if (v67)
  {
    uint64_t v68 = (__CFString *)v67;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_44;
    }
    URLRequest::setCookiePartitionIdentifier((URLRequest *)[(NSURLRequest *)self _inner], v68);
  }
  else
  {
    uint64_t v69 = [(NSURLRequest *)self _inner];
    uint64_t v70 = (const void *)v69[16];
    if (v70)
    {
      CFRelease(v70);
      v69[16] = 0;
    }
  }
  uint64_t v71 = (void *)[a3 objectForKeyedSubscript:@"privacyProxyFailClosed"];
  if (v71)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_44;
    }
  }
  uint64_t v72 = [(NSURLRequest *)self _inner];
  v72[166] = [v71 BOOLValue];
  uint64_t v73 = (void *)[a3 objectForKeyedSubscript:@"privacyProxyFailClosedForUnreachableNonMainHosts"];
  if (v73)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_44;
    }
  }
  v74 = [(NSURLRequest *)self _inner];
  v74[167] = [v73 BOOLValue];
  uint64_t v75 = (void *)[a3 objectForKeyedSubscript:@"privacyProxyFailClosedForUnreachableHosts"];
  if (v75)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_44;
    }
  }
  v76 = [(NSURLRequest *)self _inner];
  v76[168] = [v75 BOOLValue];
  uint64_t v77 = [a3 objectForKeyedSubscript:@"requiresDNSSECValidation"];
  if (v77)
  {
    uint64_t v78 = (void *)v77;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v79 = [(NSURLRequest *)self _inner];
      if ([v78 BOOLValue]) {
        int v80 = 1;
      }
      else {
        int v80 = 2;
      }
      goto LABEL_160;
    }
LABEL_44:

    return 0;
  }
  uint64_t v79 = [(NSURLRequest *)self _inner];
  int v80 = 0;
LABEL_160:
  v79[44] = v80;
  v81 = (void *)[a3 objectForKeyedSubscript:@"allowsPersistentDNS"];
  if (v81)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_44;
    }
  }
  uint64_t v82 = [(NSURLRequest *)self _inner];
  v82[180] = [v81 BOOLValue];
  v83 = (void *)[a3 objectForKeyedSubscript:@"prohibitPrivacyProxy"];
  if (v83)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_44;
    }
  }
  CFTypeRef v84 = [(NSURLRequest *)self _inner];
  v84[169] = [v83 BOOLValue];
  v85 = (void *)[a3 objectForKeyedSubscript:@"allowPrivateAccessTokensForThirdParty"];
  if (v85)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_44;
    }
  }
  v86 = [(NSURLRequest *)self _inner];
  v86[170] = [v85 BOOLValue];
  uint64_t v87 = (void *)[a3 objectForKeyedSubscript:@"useEnhancedPrivacyMode"];
  if (v87)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_44;
    }
  }
  CFStringRef v88 = [(NSURLRequest *)self _inner];
  v88[171] = [v87 BOOLValue];
  v89 = (void *)[a3 objectForKeyedSubscript:@"blockTrackers"];
  if (v89)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_44;
    }
  }
  long long v90 = [(NSURLRequest *)self _inner];
  v90[172] = [v89 BOOLValue];
  long long v91 = (void *)[a3 objectForKeyedSubscript:@"failInsecureLoadWithHTTPSDNSRecord"];
  if (v91)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_44;
    }
  }
  long long v92 = [(NSURLRequest *)self _inner];
  v92[173] = [v91 BOOLValue];
  long long v93 = (void *)[a3 objectForKeyedSubscript:@"isWebSearchContent"];
  if (v93)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_44;
    }
  }
  long long v94 = [(NSURLRequest *)self _inner];
  v94[174] = [v93 BOOLValue];
  long long v95 = (void *)[a3 objectForKeyedSubscript:@"allowOnlyPartitionedCookies"];
  if (v95)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_44;
    }
  }
  long long v96 = [(NSURLRequest *)self _inner];
  v96[175] = [v95 BOOLValue];
  long long v97 = (void *)[a3 objectForKeyedSubscript:@"contentDispositionEncodingFallbackArray"];
  objc_opt_class();
  long long v115 = 0u;
  long long v116 = 0u;
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    long long v97 = 0;
  }
  long long v117 = 0uLL;
  long long v118 = 0uLL;
  uint64_t v98 = [v97 countByEnumeratingWithState:&v115 objects:v122 count:16];
  if (v98)
  {
    uint64_t v99 = *(void *)v116;
    while (2)
    {
      for (uint64_t i = 0; i != v98; ++i)
      {
        if (*(void *)v116 != v99) {
          objc_enumerationMutation(v97);
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          long long v97 = 0;
          goto LABEL_188;
        }
      }
      uint64_t v98 = [v97 countByEnumeratingWithState:&v115 objects:v122 count:16];
      if (v98) {
        continue;
      }
      break;
    }
  }
LABEL_188:
  v101 = +[NSURLRequest newCFContentDispositionEncodingFallbackArray:]((uint64_t)NSURLRequest, v97);
  HTTPNetStreamInfo::setRequestFragment((HTTPNetStreamInfo *)[(NSURLRequest *)self _inner], v101);
  if (v101) {
    CFRelease(v101);
  }
  return self;
}

- (id)_webKitPropertyListData
{
  uint64_t v3 = (void *)[(NSURLRequest *)self copy];
  uint64_t v4 = [v3 _inner];
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:19];
  [v5 setObject:*(void *)(v4 + 40) forKeyedSubscript:@"protocolProperties"];
  uint64_t v6 = MEMORY[0x1E4F1CC38];
  uint64_t v7 = MEMORY[0x1E4F1CC28];
  if ((*(_WORD *)(v4 + 64) & 2) != 0) {
    uint64_t v8 = MEMORY[0x1E4F1CC38];
  }
  else {
    uint64_t v8 = MEMORY[0x1E4F1CC28];
  }
  [v5 setObject:v8 forKeyedSubscript:@"isMutable"];
  [v5 setObject:*(void *)(v4 + 8) forKeyedSubscript:@"URL"];
  objc_msgSend(v5, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithDouble:", *(double *)(v4 + 24)), @"timeout");
  objc_msgSend(v5, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedInteger:", *(void *)(v4 + 16)), @"cachePolicy");
  [v5 setObject:*(void *)(v4 + 32) forKeyedSubscript:@"mainDocumentURL"];
  if (*(_WORD *)(v4 + 64)) {
    uint64_t v9 = v6;
  }
  else {
    uint64_t v9 = v7;
  }
  [v5 setObject:v9 forKeyedSubscript:@"shouldHandleHTTPCookies"];
  objc_msgSend(v5, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithLong:", (*(unsigned __int16 *)(v4 + 64) >> 4) & 0x18 | (*(unsigned __int16 *)(v4 + 64) >> 3) & 0x7C0 | (*(unsigned __int16 *)(v4 + 64) >> 2) & 0x1000 | (*(unsigned __int16 *)(v4 + 64) >> 4) & 6u), @"explicitFlags");
  if ((*(_WORD *)(v4 + 64) & 8) != 0) {
    uint64_t v10 = v6;
  }
  else {
    uint64_t v10 = v7;
  }
  [v5 setObject:v10 forKeyedSubscript:@"allowCellular"];
  if ((*(_WORD *)(v4 + 64) & 0x10) != 0) {
    uint64_t v11 = v6;
  }
  else {
    uint64_t v11 = v7;
  }
  [v5 setObject:v11 forKeyedSubscript:@"preventsIdleSystemSleep"];
  objc_msgSend(v5, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithDouble:", *(double *)(v4 + 136)), @"timeWindowDelay");
  objc_msgSend(v5, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithDouble:", *(double *)(v4 + 144)), @"timeWindowDuration");
  objc_msgSend(v5, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInt:", *(unsigned int *)(v4 + 104)), @"networkServiceType");
  objc_msgSend(v5, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithLong:", *(void *)(v4 + 88)), @"requestPriority");
  if (*(void *)(v4 + 56))
  {
    [v5 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"isHTTP"];
    [v5 setObject:(id)CFHTTPMessageCopyRequestMethod((CFHTTPMessageRef)(*(void *)(v4 + 56) - 16)) forKeyedSubscript:@"httpMethod"];
    [v5 setObject:HTTPMessage::copyAsMultiValueDict(*(HTTPMessage **)(v4 + 56)) forKeyedSubscript:@"headerFields"];
    [v5 setObject:CFHTTPMessageCopyBody((CFHTTPMessageRef)(*(void *)(v4 + 56) - 16)) forKeyedSubscript:@"body"];
    CFArrayRef v12 = *(const __CFArray **)(*(void *)(v4 + 56) + 208);
    if (v12) {
      CFArrayRef Copy = CFArrayCreateCopy((CFAllocatorRef)*MEMORY[0x1E4F1CF80], v12);
    }
    else {
      CFArrayRef Copy = 0;
    }
    [v5 setObject:Copy forKeyedSubscript:@"bodyParts"];
  }
  if (v3) {
    CFRelease(v3);
  }
  __int16 v14 = (void *)[v5 mutableCopy];
  if (v5) {
    CFRelease(v5);
  }
  objc_msgSend(v14, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithDouble:", *(double *)(-[NSURLRequest _inner](self, "_inner") + 152)), @"startTimeoutTime");
  objc_msgSend(v14, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithBool:", -[NSURLRequest _requiresShortConnectionTimeout](self, "_requiresShortConnectionTimeout")), @"requiresShortConnectionTimeout");
  objc_msgSend(v14, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithBool:", -[NSURLRequest _preventHSTSStorage](self, "_preventHSTSStorage")), @"preventHSTSStorage");
  objc_msgSend(v14, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithBool:", -[NSURLRequest _ignoreHSTS](self, "_ignoreHSTS")), @"ignoreHSTS");
  objc_msgSend(v14, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithBool:", -[NSURLRequest _schemeWasUpgradedDueToDynamicHSTS](self, "_schemeWasUpgradedDueToDynamicHSTS")), @"schemeWasUpgradedDueToDynamicHSTS");
  objc_msgSend(v14, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithDouble:", *(double *)(-[NSURLRequest _inner](self, "_inner") + 192)), @"payloadTransmissionTimeout");
  objc_msgSend(v14, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedLong:", *(void *)(-[NSURLRequest _inner](self, "_inner") + 96)), @"allowedProtocolTypes");
  objc_msgSend(v14, "setObject:forKeyedSubscript:", -[NSURLRequest boundInterfaceIdentifier](self, "boundInterfaceIdentifier"), @"boundInterfaceIdentifier");
  int v15 = *(_DWORD *)([(NSURLRequest *)self _inner] + 216);
  if (v15 == 1) {
    uint64_t v16 = v6;
  }
  else {
    uint64_t v16 = 0;
  }
  if (v15 == 2) {
    uint64_t v17 = v7;
  }
  else {
    uint64_t v17 = v16;
  }
  [v14 setObject:v17 forKeyedSubscript:@"allowsExpensiveNetworkAccess"];
  int v18 = *(_DWORD *)([(NSURLRequest *)self _inner] + 220);
  if (v18 == 1) {
    uint64_t v19 = v6;
  }
  else {
    uint64_t v19 = 0;
  }
  if (v18 == 2) {
    uint64_t v20 = v7;
  }
  else {
    uint64_t v20 = v19;
  }
  [v14 setObject:v20 forKeyedSubscript:@"allowsConstrainedNetworkAccess"];
  int v21 = *(_DWORD *)([(NSURLRequest *)self _inner] + 224);
  if (v21 == 1) {
    uint64_t v22 = v6;
  }
  else {
    uint64_t v22 = 0;
  }
  if (v21 == 2) {
    uint64_t v23 = v7;
  }
  else {
    uint64_t v23 = v22;
  }
  [v14 setObject:v23 forKeyedSubscript:@"allowsUCA"];
  objc_msgSend(v14, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithBool:", *(unsigned char *)(-[NSURLRequest _inner](self, "_inner") + 164) != 0), @"assumesHTTP3Capable");
  objc_msgSend(v14, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedInteger:", *(void *)(-[NSURLRequest _inner](self, "_inner") + 184)), @"attribution");
  objc_msgSend(v14, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithBool:", *(unsigned char *)(-[NSURLRequest _inner](self, "_inner") + 165) != 0), @"knownTracker");
  objc_msgSend(v14, "setObject:forKeyedSubscript:", *(void *)(-[NSURLRequest _inner](self, "_inner") + 120), @"trackerContext");
  objc_msgSend(v14, "setObject:forKeyedSubscript:", *(void *)(-[NSURLRequest _inner](self, "_inner") + 128), @"cookiePartitionIdentifier");
  objc_msgSend(v14, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithBool:", *(unsigned char *)(-[NSURLRequest _inner](self, "_inner") + 166) != 0), @"privacyProxyFailClosed");
  objc_msgSend(v14, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithBool:", *(unsigned char *)(-[NSURLRequest _inner](self, "_inner") + 167) != 0), @"privacyProxyFailClosedForUnreachableNonMainHosts");
  objc_msgSend(v14, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithBool:", *(unsigned char *)(-[NSURLRequest _inner](self, "_inner") + 168) != 0), @"privacyProxyFailClosedForUnreachableHosts");
  int v24 = *(_DWORD *)([(NSURLRequest *)self _inner] + 176);
  if (v24 == 1) {
    uint64_t v25 = v6;
  }
  else {
    uint64_t v25 = 0;
  }
  if (v24 == 2) {
    uint64_t v26 = v7;
  }
  else {
    uint64_t v26 = v25;
  }
  [v14 setObject:v26 forKeyedSubscript:@"requiresDNSSECValidation"];
  objc_msgSend(v14, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithBool:", *(unsigned char *)(-[NSURLRequest _inner](self, "_inner") + 180) != 0), @"allowsPersistentDNS");
  objc_msgSend(v14, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithBool:", *(unsigned char *)(-[NSURLRequest _inner](self, "_inner") + 169) != 0), @"prohibitPrivacyProxy");
  objc_msgSend(v14, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithBool:", *(unsigned char *)(-[NSURLRequest _inner](self, "_inner") + 170) != 0), @"allowPrivateAccessTokensForThirdParty");
  objc_msgSend(v14, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithBool:", *(unsigned char *)(-[NSURLRequest _inner](self, "_inner") + 171) != 0), @"useEnhancedPrivacyMode");
  objc_msgSend(v14, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithBool:", *(unsigned char *)(-[NSURLRequest _inner](self, "_inner") + 172) != 0), @"blockTrackers");
  objc_msgSend(v14, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithBool:", *(unsigned char *)(-[NSURLRequest _inner](self, "_inner") + 173) != 0), @"failInsecureLoadWithHTTPSDNSRecord");
  objc_msgSend(v14, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithBool:", *(unsigned char *)(-[NSURLRequest _inner](self, "_inner") + 174) != 0), @"isWebSearchContent");
  objc_msgSend(v14, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithBool:", *(unsigned char *)(-[NSURLRequest _inner](self, "_inner") + 175) != 0), @"allowOnlyPartitionedCookies");
  objc_msgSend(v14, "setObject:forKeyedSubscript:", -[NSURLRequest contentDispositionEncodingFallbackArray](self, "contentDispositionEncodingFallbackArray"), @"contentDispositionEncodingFallbackArray");

  return v14;
}

- (id)HTTPPropertyList
{
  v39[2] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)([(NSURLRequest *)self _inner] + 56);
  if (v2) {
    uint64_t v3 = (__CFHTTPMessage *)(v2 - 16);
  }
  else {
    uint64_t v3 = 0;
  }
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  uint64_t v27 = __44__NSURLRequest_SwiftTypes__HTTPPropertyList__block_invoke;
  uint64_t v28 = &unk_1E5258228;
  id v29 = v4;
  CFStringRef v5 = CFHTTPMessageCopyRequestMethod(v3);
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  uint64_t v23 = __44__NSURLRequest_SwiftTypes__HTTPPropertyList__block_invoke_2;
  int v24 = &unk_1E5258228;
  CFStringRef v25 = v5;
  uint64_t v6 = @"GET";
  if (v5) {
    uint64_t v6 = (__CFString *)v5;
  }
  v38[0] = @"name";
  v38[1] = @"value";
  v39[0] = @":method";
  v39[1] = v6;
  objc_msgSend(v4, "addObject:", objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v39, v38, 2));
  if (v2)
  {
    if (HTTPMessage::Class(void)::sOnce_HTTPMessage != -1) {
      dispatch_once(&HTTPMessage::Class(void)::sOnce_HTTPMessage, &__block_literal_global_5973);
    }
    if (*(unsigned char *)(v2 + 24)) {
      uint64_t v7 = 0;
    }
    else {
      uint64_t v7 = v2;
    }
  }
  else
  {
    uint64_t v7 = 0;
  }
  CFURLRef v8 = (const __CFURL *)HTTPRequestParserClient::requestURL((HTTPRequestParserClient *)(v7 + 128));
  CFStringRef v9 = CFURLCopyScheme(v8);
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  uint64_t v19 = __44__NSURLRequest_SwiftTypes__HTTPPropertyList__block_invoke_3;
  uint64_t v20 = &unk_1E5258228;
  CFStringRef v21 = v9;
  if (v9)
  {
    v36[0] = @"name";
    v36[1] = @"value";
    v37[0] = @":scheme";
    v37[1] = v9;
    objc_msgSend(v4, "addObject:", objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v37, v36, 2));
  }
  HTTPUtilities::createAuthorityStringFromURL((HTTPUtilities *)&v17, v8);
  if (v17)
  {
    v34[0] = @"name";
    v34[1] = @"value";
    v35[0] = @":authority";
    v35[1] = v17;
    objc_msgSend(v4, "addObject:", objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v35, v34, 2));
  }
  HTTPUtilities::createPathStringFromURL((HTTPUtilities *)&cf, v8);
  if (cf)
  {
    v32[0] = @"name";
    v32[1] = @"value";
    v33[0] = @":path";
    v33[1] = cf;
    objc_msgSend(v4, "addObject:", objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v33, v32, 2));
  }
  if (HTTPMessage::Class(void)::sOnce_HTTPMessage != -1) {
    dispatch_once(&HTTPMessage::Class(void)::sOnce_HTTPMessage, &__block_literal_global_5973);
  }
  if (v2) {
    uint64_t v10 = (char *)v3 + 16;
  }
  else {
    uint64_t v10 = 0;
  }
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __44__NSURLRequest_SwiftTypes__HTTPPropertyList__block_invoke_4;
  v15[3] = &unk_1E5256C18;
  v15[4] = v4;
  (*(void (**)(char *, void *))(*(void *)v10 + 56))(v10, v15);
  uint64_t v11 = [v4 copy];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __44__NSURLRequest_SwiftTypes__HTTPPropertyList__block_invoke_5;
  v14[3] = &unk_1E5258228;
  v14[4] = v11;
  uint64_t v30 = @"headerFields";
  uint64_t v31 = v11;
  CFArrayRef v12 = (void *)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v31 forKeys:&v30 count:1];
  __44__NSURLRequest_SwiftTypes__HTTPPropertyList__block_invoke_5((uint64_t)v14);
  if (cf) {
    CFRelease(cf);
  }
  if (v17) {
    CFRelease(v17);
  }
  v19((uint64_t)v18);
  v23((uint64_t)v22);
  v27((uint64_t)v26);
  return v12;
}

void __44__NSURLRequest_SwiftTypes__HTTPPropertyList__block_invoke(uint64_t a1)
{
}

void __44__NSURLRequest_SwiftTypes__HTTPPropertyList__block_invoke_2(uint64_t a1)
{
}

void __44__NSURLRequest_SwiftTypes__HTTPPropertyList__block_invoke_3(uint64_t a1)
{
}

uint64_t __44__NSURLRequest_SwiftTypes__HTTPPropertyList__block_invoke_4(uint64_t a1, HTTPUtilities *this, uint64_t a3)
{
  v9[2] = *MEMORY[0x1E4F143B8];
  uint64_t result = HTTPUtilities::isHeaderAllowed(this, (const __CFString *)this);
  if (result)
  {
    uint64_t v7 = *(void **)(a1 + 32);
    v8[0] = @"name";
    v8[1] = @"value";
    v9[0] = this;
    v9[1] = a3;
    return objc_msgSend(v7, "addObject:", objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v9, v8, 2));
  }
  return result;
}

void __44__NSURLRequest_SwiftTypes__HTTPPropertyList__block_invoke_5(uint64_t a1)
{
}

- (NSURLRequest)initWithHTTPPropertyList:(id)a3
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0
    || (CFStringRef v5 = (void *)[a3 objectForKeyedSubscript:@"headerFields"],
        objc_opt_class(),
        (objc_opt_isKindOfClass() & 1) == 0))
  {
LABEL_34:

    return 0;
  }
  if ([v5 count])
  {
    unint64_t v6 = 0;
    uint64_t v26 = 0;
    uint64_t v27 = 0;
    uint64_t v7 = 0;
    CFStringRef v8 = 0;
    while (1)
    {
      CFStringRef v9 = (void *)[v5 objectAtIndexedSubscript:v6];
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_34;
      }
      uint64_t v10 = (void *)[v9 objectForKeyedSubscript:@"name"];
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_34;
      }
      uint64_t v11 = [v9 objectForKeyedSubscript:@"value"];
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_34;
      }
      if ([v10 hasPrefix:@":"])
      {
        if ([v10 isEqualToString:@":method"])
        {
          CFStringRef v8 = (const __CFString *)v11;
        }
        else if ([v10 isEqualToString:@":scheme"])
        {
          uint64_t v7 = v11;
        }
        else if ([v10 isEqualToString:@":authority"])
        {
          uint64_t v26 = v11;
        }
        else
        {
          int v12 = [v10 isEqualToString:@":path"];
          uint64_t v13 = v27;
          if (v12) {
            uint64_t v13 = v11;
          }
          uint64_t v27 = v13;
        }
        if (++v6 < [v5 count]) {
          continue;
        }
      }
      goto LABEL_21;
    }
  }
  CFStringRef v8 = 0;
  uint64_t v7 = 0;
  uint64_t v26 = 0;
  uint64_t v27 = 0;
  unint64_t v6 = 0;
LABEL_21:
  if (!v8 || !v7 || !v26 || !v27) {
    goto LABEL_34;
  }
  __int16 v14 = (void *)[[NSString alloc] initWithFormat:@"%@://%@%@", v7, v26, v27];
  v37[0] = MEMORY[0x1E4F143A8];
  v37[1] = 3221225472;
  uint64_t v38 = __53__NSURLRequest_SwiftTypes__initWithHTTPPropertyList___block_invoke;
  uint64_t v39 = &unk_1E5258228;
  v40 = v14;
  int v15 = (const char *)[v14 UTF8String];
  CFAllocatorRef v16 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  size_t v17 = strlen(v15);
  CFURLRef v18 = CFURLCreateAbsoluteURLWithBytes((CFAllocatorRef)*MEMORY[0x1E4F1CF80], (const UInt8 *)v15, v17, 0x8000100u, 0, 0);
  v33[0] = MEMORY[0x1E4F143A8];
  v33[1] = 3221225472;
  uint64_t v34 = __53__NSURLRequest_SwiftTypes__initWithHTTPPropertyList___block_invoke_2;
  uint64_t v35 = &__block_descriptor_40_e5_v8__0l;
  CFURLRef v36 = v18;
  CFHTTPMessageRef Request = CFHTTPMessageCreateRequest(v16, v8, v18, @"HTTP/1.1");
  if (HTTPMessage::Class(void)::sOnce_HTTPMessage != -1) {
    dispatch_once(&HTTPMessage::Class(void)::sOnce_HTTPMessage, &__block_literal_global_5973);
  }
  HTTPMessage::ensureParserFinished((CFHTTPMessageRef)((char *)Request + 16));
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  uint64_t v30 = __53__NSURLRequest_SwiftTypes__initWithHTTPPropertyList___block_invoke_3;
  uint64_t v31 = &__block_descriptor_40_e5_v8__0l;
  CFHTTPMessageRef v32 = Request;
  while (1)
  {
    if (v6 >= [v5 count])
    {
      uint64_t v25 = _constructRequestFromParts(Request, 0, 0, NSURLRequestUseProtocolCachePolicy, (double)(unint64_t)NSURLRequestTimeoutInterval, 0);
      v28[0] = MEMORY[0x1E4F143A8];
      v28[1] = 3221225472;
      v28[2] = __53__NSURLRequest_SwiftTypes__initWithHTTPPropertyList___block_invoke_4;
      v28[3] = &__block_descriptor_40_e5_v8__0l;
      v28[4] = v25;
      uint64_t v23 = [(NSURLRequest *)self _initWithCFURLRequest:v25];
      __53__NSURLRequest_SwiftTypes__initWithHTTPPropertyList___block_invoke_4((uint64_t)v28);
      goto LABEL_39;
    }
    uint64_t v20 = (void *)[v5 objectAtIndexedSubscript:v6];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      break;
    }
    CFStringRef v21 = (__CFString *)[v20 objectForKeyedSubscript:@"name"];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      break;
    }
    uint64_t v22 = (__CFString *)[v20 objectForKeyedSubscript:@"value"];
    objc_opt_class();
    if (objc_opt_isKindOfClass() & 1) == 0 || ([(__CFString *)v21 hasPrefix:@":"]) {
      break;
    }
    _CFHTTPMessageAddHeaderFieldValue((uint64_t)Request, v21, v22);
    ++v6;
  }

  uint64_t v23 = 0;
LABEL_39:
  v30((uint64_t)v29);
  v34((uint64_t)v33);
  v38((uint64_t)v37);
  return v23;
}

void __53__NSURLRequest_SwiftTypes__initWithHTTPPropertyList___block_invoke(uint64_t a1)
{
}

void __53__NSURLRequest_SwiftTypes__initWithHTTPPropertyList___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(const void **)(a1 + 32);
  if (v1) {
    CFRelease(v1);
  }
}

void __53__NSURLRequest_SwiftTypes__initWithHTTPPropertyList___block_invoke_3(uint64_t a1)
{
  uint64_t v1 = *(const void **)(a1 + 32);
  if (v1) {
    CFRelease(v1);
  }
}

void __53__NSURLRequest_SwiftTypes__initWithHTTPPropertyList___block_invoke_4(uint64_t a1)
{
  uint64_t v1 = *(const void **)(a1 + 32);
  if (v1) {
    CFRelease(v1);
  }
}

- (BOOL)_isIdempotent
{
  uint64_t v2 = *(void *)([(NSURLRequest *)self _inner] + 56);
  if (!v2) {
    goto LABEL_6;
  }
  CFStringRef v3 = *(const __CFString **)(v2 + 152);
  if (!v3) {
    return (char)v3;
  }
  if (CFEqual(v3, (CFStringRef)&gConstantCFStringValueTable[2604]))
  {
LABEL_6:
    LOBYTE(v3) = 1;
    return (char)v3;
  }
  CFStringRef v3 = *(const __CFString **)(v2 + 152);
  if (v3
    || (LODWORD(v3) = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT), v3)
    && (*(_WORD *)CFStringRef v5 = 0,
        _os_log_fault_impl(&dword_184085000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "these should always be initialized now", v5, 2u), (CFStringRef v3 = *(const __CFString **)(v2 + 152)) != 0))
  {
    LOBYTE(v3) = CFEqual(v3, (CFStringRef)&gConstantCFStringValueTable[2611]);
  }
  return (char)v3;
}

- (unint64_t)expectedWorkload
{
  return 0;
}

- (BOOL)HTTPShouldUsePipelining
{
  uint64_t v2 = *(void *)([(NSURLRequest *)self _inner] + 56);
  if (!v2 || !*(unsigned char *)(v2 + 216)) {
    return 0;
  }
  CFStringRef v3 = *(const __CFString **)(v2 + 152);
  BOOL result = v3
        && (CFEqual(v3, (CFStringRef)&gConstantCFStringValueTable[2604])
         || ((CFStringRef v4 = *(const __CFString **)(v2 + 152)) != 0
          || os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT)
          && (*(_WORD *)unint64_t v6 = 0,
              _os_log_fault_impl(&dword_184085000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "these should always be initialized now", v6, 2u), (CFStringRef v4 = *(const __CFString **)(v2 + 152)) != 0))&& CFEqual(v4, (CFStringRef)&gConstantCFStringValueTable[2611]))|| *(unsigned char *)(v2 + 218) != 0;
  return result;
}

- (id)HTTPUserAgent
{
  return [(NSURLRequest *)self valueForHTTPHeaderField:@"User-Agent"];
}

- (id)HTTPReferrer
{
  return [(NSURLRequest *)self valueForHTTPHeaderField:@"Referer"];
}

- (id)HTTPExtraCookies
{
  uint64_t v2 = *(void *)([(NSURLRequest *)self _inner] + 56);
  if (v2)
  {
    CFStringRef v3 = *(void **)(v2 + 184);
    if (v3) {
      CFStringRef v3 = (void *)CFRetain(v3);
    }
  }
  else
  {
    CFStringRef v3 = 0;
  }

  return v3;
}

- (id)HTTPContentType
{
  return [(NSURLRequest *)self valueForHTTPHeaderField:@"Content-Type"];
}

+ (void)setAllowsSpecificHTTPSCertificate:(id)a3 forHost:(id)a4
{
  if (a4)
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __76__NSURLRequest_NSHTTPURLRequest__setAllowsSpecificHTTPSCertificate_forHost___block_invoke;
    v5[3] = &unk_1E5256BF0;
    v5[4] = a4;
    void v5[5] = a3;
    withHostsSPILocked((uint64_t)v5);
  }
  else
  {
    if (CFNLog::onceToken != -1) {
      dispatch_once(&CFNLog::onceToken, &__block_literal_global_2_5509);
    }
    CFStringRef v4 = CFNLog::logger;
    if (os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)long long buf = 0;
      _os_log_error_impl(&dword_184085000, v4, OS_LOG_TYPE_ERROR, "nil host used in call to setAllowsSpecificHTTPSCertificate:forHost:", buf, 2u);
    }
  }
}

uint64_t __76__NSURLRequest_NSHTTPURLRequest__setAllowsSpecificHTTPSCertificate_forHost___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5 = [*(id *)(a1 + 32) lowercaseString];
  uint64_t v6 = *(void *)(a1 + 40);
  if (v6)
  {
    uint64_t v7 = (void *)[a3 objectForKey:v5];
    if (v7) {
      uint64_t v6 = [v7 arrayByAddingObjectsFromArray:v6];
    }
    return [a3 setObject:v6 forKey:v5];
  }
  else
  {
    return [a3 removeObjectForKey:v5];
  }
}

+ (id)allowsSpecificHTTPSCertificateForHost:(id)a3
{
  if (a3)
  {
    *(void *)long long buf = 0;
    CFStringRef v8 = buf;
    uint64_t v9 = 0x3052000000;
    uint64_t v10 = __Block_byref_object_copy__16081;
    uint64_t v11 = __Block_byref_object_dispose__16082;
    uint64_t v12 = 0;
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __72__NSURLRequest_NSHTTPURLRequest__allowsSpecificHTTPSCertificateForHost___block_invoke;
    v6[3] = &unk_1E5256BA0;
    v6[4] = a3;
    v6[5] = buf;
    withHostsSPILocked((uint64_t)v6);
    id v3 = *((id *)v8 + 5);
    _Block_object_dispose(buf, 8);
  }
  else
  {
    if (CFNLog::onceToken != -1) {
      dispatch_once(&CFNLog::onceToken, &__block_literal_global_2_5509);
    }
    CFStringRef v4 = CFNLog::logger;
    if (os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)long long buf = 0;
      _os_log_error_impl(&dword_184085000, v4, OS_LOG_TYPE_ERROR, "nil host used in call to allowsSpecificHTTPSCertificateForHost", buf, 2u);
    }
    return 0;
  }
  return v3;
}

id __72__NSURLRequest_NSHTTPURLRequest__allowsSpecificHTTPSCertificateForHost___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id result = (id)objc_msgSend(a3, "objectForKey:", objc_msgSend(*(id *)(a1 + 32), "lowercaseString"));
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  return result;
}

+ (BOOL)allowsAnyHTTPSCertificateForHost:(id)a3
{
  if (a3)
  {
    *(void *)long long buf = 0;
    CFStringRef v8 = buf;
    uint64_t v9 = 0x2020000000;
    char v10 = 0;
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __67__NSURLRequest_NSHTTPURLRequest__allowsAnyHTTPSCertificateForHost___block_invoke;
    v6[3] = &unk_1E5256BA0;
    v6[4] = a3;
    v6[5] = buf;
    withHostsSPILocked((uint64_t)v6);
    BOOL v3 = v8[24] != 0;
    _Block_object_dispose(buf, 8);
  }
  else
  {
    if (CFNLog::onceToken != -1) {
      dispatch_once(&CFNLog::onceToken, &__block_literal_global_2_5509);
    }
    CFStringRef v4 = CFNLog::logger;
    if (os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)long long buf = 0;
      _os_log_error_impl(&dword_184085000, v4, OS_LOG_TYPE_ERROR, "nil host used in call to allowsAnyHTTPSCertificateForHost:", buf, 2u);
    }
    return 0;
  }
  return v3;
}

uint64_t __67__NSURLRequest_NSHTTPURLRequest__allowsAnyHTTPSCertificateForHost___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result = objc_msgSend(a2, "containsObject:", objc_msgSend(*(id *)(a1 + 32), "lowercaseString"));
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

@end