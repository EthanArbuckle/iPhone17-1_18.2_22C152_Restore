@interface NSURLRequestInternal
- (BOOL)isEqual:(id)a3;
- (NSURLRequestInternal)init;
- (id).cxx_construct;
- (id)_initWithMessage:(__CFHTTPMessage *)a3 bodyParts:(__CFArray *)a4 cachePolicy:(unint64_t)a5 timeout:(double)a6 mainDocumentURL:(__CFURL *)a7 mutable:(unsigned __int8)a8;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)_inner;
- (void)dealloc;
@end

@implementation NSURLRequestInternal

- (void).cxx_destruct
{
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init((Class)objc_opt_class());
  URLRequest::initialize((URLRequest *)[v4 _inner], (const URLRequest *)-[NSURLRequestInternal _inner](self, "_inner"));
  return v4;
}

- (NSURLRequestInternal)init
{
  v3.receiver = self;
  v3.super_class = (Class)NSURLRequestInternal;
  return [(NSURLRequestInternal *)&v3 init];
}

- (id).cxx_construct
{
  self->_request._vptr$CoreLoggable = (void **)&unk_1ECF9A968;
  self->_request.fRequiresDNSSECValidation = 0;
  self->_request.fHSTSPolicy.__ptr_.__value_ = 0;
  *(void *)&self->_request.fAllowsExpensiveNetworkAccess = 0;
  self->_request.fCachePolicy = 0;
  self->_request.fTimeout = 0.0;
  *(_OWORD *)&self->_request.fRequestPriority = xmmword_1843D1820;
  *(_WORD *)&self->_request.fFlags = 0;
  self->_request.fBoundInterfaceIdentifier = 0;
  self->_request.fProtocolProperties = 0;
  self->_request._explicitStorageSession = 0;
  self->_request.fAllowsUCA = 0;
  self->_request.fTimeWindowDuration = 0.0;
  self->_request.fStartTimeoutTime = 0.0;
  self->_request.fTimeWindowDelay = 0.0;
  *(_DWORD *)&self->_request.fRequiresShortConnectionTimeout = 0;
  self->_request.fPayloadTransmissionTimeout = 0.0;
  self->_request.fATSOverrides = 0;
  if (__CFNGetHTTP3Override::onceToken != -1) {
    dispatch_once(&__CFNGetHTTP3Override::onceToken, &__block_literal_global_64_5584);
  }
  self->_request.fAssumesHTTP3Capable = __CFNGetHTTP3Override::value == 2;
  self->_request.fAttribution = 0;
  self->_request.fTrackerContext = 0;
  self->_request.fCookiePartitionIdentifier = 0;
  *(void *)&self->_request.fKnownTracker = 0;
  *(_DWORD *)&self->_request.fBlockTrackers = 0;
  return self;
}

- (void)_inner
{
  return &self->_request;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)NSURLRequestInternal;
  [(NSURLRequestInternal *)&v2 dealloc];
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = [a3 _inner];
  if (self->_request.fCachePolicy != *(void *)(v4 + 16)) {
    goto LABEL_91;
  }
  uint64_t v5 = v4;
  if (((*(unsigned __int16 *)(v4 + 64) ^ *(_WORD *)&self->_request.fFlags) & 1) != 0
    || typesNotEqualWithAppropriateNullChecks(self->_request.fURL, *(const void **)(v4 + 8))
    || typesNotEqualWithAppropriateNullChecks(self->_request.fMainDocumentURL, *(const void **)(v5 + 32))
    || dictsNotEqualWithAppropriateNullAndEmptyDictionaryChecks(self->_request.fProtocolProperties, *(const __CFDictionary **)(v5 + 40))|| typesNotEqualWithAppropriateNullChecks(self->_request.fMainDocumentURL, *(const void **)(v5 + 32))|| dictsNotEqualWithAppropriateNullAndEmptyDictionaryChecks(self->_request.fSSLProps, *(const __CFDictionary **)(v5 + 72)))
  {
    goto LABEL_91;
  }
  fHTTPRequest = self->_request.fHTTPRequest;
  if (!fHTTPRequest)
  {
    v7 = @"GET";
    goto LABEL_10;
  }
  CFGetAllocator((char *)fHTTPRequest - 16);
  v7 = (const void *)*((void *)fHTTPRequest + 19);
  if (v7)
  {
LABEL_10:
    CFTypeRef v8 = CFRetain(v7);
    goto LABEL_13;
  }
  CFTypeRef v8 = 0;
LABEL_13:
  uint64_t v9 = *(void *)(v5 + 56);
  if (!v9)
  {
    v10 = @"GET";
    goto LABEL_15;
  }
  CFGetAllocator((CFTypeRef)(v9 - 16));
  v10 = *(const void **)(v9 + 152);
  if (v10)
  {
LABEL_15:
    CFTypeRef v11 = CFRetain(v10);
    goto LABEL_18;
  }
  CFTypeRef v11 = 0;
LABEL_18:
  int v12 = CFEqual(v8, v11);
  if (v8) {
    CFRelease(v8);
  }
  if (v11) {
    CFRelease(v11);
  }
  if (!v12) {
    goto LABEL_91;
  }
  explicitStorageSession = self->_request._explicitStorageSession;
  v14 = *(const void **)(v5 + 232);
  if ((explicitStorageSession != 0) == (v14 == 0)) {
    goto LABEL_91;
  }
  if (!explicitStorageSession || !v14 || (int v15 = CFEqual(explicitStorageSession, v14)) != 0)
  {
    v16 = self->_request.fHTTPRequest;
    uint64_t v17 = *(void *)(v5 + 56);
    if (!v16)
    {
      if (v17 && !HTTPRequest::isEffectivelyEmpty(*(HTTPRequest **)(v5 + 56))) {
        goto LABEL_91;
      }
LABEL_40:
      if (((*(unsigned __int16 *)(v5 + 64) ^ *(_WORD *)&self->_request.fFlags) & 8) == 0
        && self->_request.fTimeWindowDuration == *(double *)(v5 + 144)
        && self->_request.fTimeWindowDelay == *(double *)(v5 + 136)
        && self->_request.fRequestPriority == *(void *)(v5 + 88)
        && self->_request.fStartTimeoutTime == *(double *)(v5 + 152)
        && self->_request.fRequiresShortConnectionTimeout == *(unsigned __int8 *)(v5 + 160)
        && self->_request.fPayloadTransmissionTimeout == *(double *)(v5 + 192)
        && self->_request.fAllowedProtocolTypes == *(void *)(v5 + 96)
        && self->_request.fAllowsExpensiveNetworkAccess == *(_DWORD *)(v5 + 216)
        && self->_request.fAllowsConstrainedNetworkAccess == *(_DWORD *)(v5 + 220)
        && self->_request.fAllowsUCA == *(_DWORD *)(v5 + 224)
        && self->_request.fAssumesHTTP3Capable == *(unsigned __int8 *)(v5 + 164)
        && self->_request.fAttribution == *(void *)(v5 + 184)
        && self->_request.fKnownTracker == *(unsigned __int8 *)(v5 + 165)
        && !typesNotEqualWithAppropriateNullChecks(self->_request.fTrackerContext, *(const void **)(v5 + 120))
        && self->_request.fPrivacyProxyFailClosed == *(unsigned __int8 *)(v5 + 166)
        && self->_request.fPrivacyProxyFailClosedForUnreachableNonMainHosts == *(unsigned __int8 *)(v5 + 167)
        && self->_request.fPrivacyProxyFailClosedForUnreachableHosts == *(unsigned __int8 *)(v5 + 168)
        && self->_request.fRequiresDNSSECValidation == *(_DWORD *)(v5 + 176)
        && self->_request.fAllowsPersistentDNS == *(unsigned __int8 *)(v5 + 180)
        && self->_request.fProhibitPrivacyProxy == *(unsigned __int8 *)(v5 + 169)
        && self->_request.fAllowPrivateAccessTokensForThirdParty == *(unsigned __int8 *)(v5 + 170)
        && self->_request.fUseEnhancedPrivacyMode == *(unsigned __int8 *)(v5 + 171)
        && self->_request.fBlockTrackers == *(unsigned __int8 *)(v5 + 172)
        && self->_request.fFailInsecureLoadWithHTTPSDNSRecord == *(unsigned __int8 *)(v5 + 173)
        && self->_request.fIsWebSearchContent == *(unsigned __int8 *)(v5 + 174))
      {
        LOBYTE(v15) = self->_request.fAllowOnlyPartitionedCookies == *(unsigned __int8 *)(v5 + 175);
        return v15;
      }
LABEL_91:
      LOBYTE(v15) = 0;
      return v15;
    }
    BOOL isEffectivelyEmpty = HTTPRequest::isEffectivelyEmpty(self->_request.fHTTPRequest);
    if (!v17)
    {
      if (!isEffectivelyEmpty) {
        goto LABEL_91;
      }
      goto LABEL_40;
    }
    if (isEffectivelyEmpty != HTTPRequest::isEffectivelyEmpty((HTTPRequest *)v17)) {
      goto LABEL_91;
    }
    CFArrayRef v19 = (const __CFArray *)*((void *)v16 + 23);
    if (v19)
    {
      CFIndex Count = CFArrayGetCount(v19);
      if (*(void *)(v17 + 184))
      {
        CFIndex v21 = Count;
        if ((Count != 0) != (CFArrayGetCount(*(CFArrayRef *)(v17 + 184)) != 0)) {
          goto LABEL_91;
        }
        if (v21)
        {
          int v15 = CFEqual(*((CFTypeRef *)v16 + 23), *(CFTypeRef *)(v17 + 184));
          if (!v15) {
            return v15;
          }
        }
LABEL_70:
        if ((*((void *)v16 + 11) != 0) == (*(void *)(v17 + 88) == 0)) {
          goto LABEL_91;
        }
        v23 = (uint64_t (***)(void, uint64_t))HTTPMessage::headers((os_unfair_lock_s *)v16);
        uint64_t v24 = HTTPMessage::headers((os_unfair_lock_s *)v17);
        if ((v23 != 0) == (v24 == 0)) {
          goto LABEL_91;
        }
        if (v23)
        {
          int v15 = (**v23)(v23, v24);
          if (!v15) {
            return v15;
          }
        }
        CFArrayRef v25 = (const __CFArray *)*((void *)v16 + 26);
        if (v25)
        {
          v26 = (CFTypeRef *)(v17 + 208);
          if (!*(void *)(v17 + 208) && !*(void *)(v17 + 200)) {
            goto LABEL_91;
          }
          int v33 = CFArrayGetCount(v25) != 0;
          CFArrayRef v27 = (const __CFArray *)*v26;
          if (!*v26)
          {
            int v28 = 0;
LABEL_82:
            if (v28 != v33) {
              goto LABEL_91;
            }
            if (v33)
            {
              int v15 = CFEqual(*((CFTypeRef *)v16 + 26), *v26);
              if (!v15) {
                return v15;
              }
            }
            goto LABEL_87;
          }
        }
        else
        {
          uint64_t v29 = *((void *)v16 + 25);
          v26 = (CFTypeRef *)(v17 + 208);
          CFArrayRef v27 = *(const __CFArray **)(v17 + 208);
          if (!v27)
          {
            if ((v29 != 0) != (*(void *)(v17 + 200) != 0)) {
              goto LABEL_91;
            }
LABEL_87:
            v30 = (const void *)*((void *)v16 + 25);
            v31 = *(const void **)(v17 + 200);
            if ((v30 != 0) == (v31 == 0)) {
              goto LABEL_91;
            }
            if (v30)
            {
              int v15 = CFEqual(v30, v31);
              if (!v15) {
                return v15;
              }
            }
            goto LABEL_40;
          }
          int v33 = 0;
          if (!v29)
          {
            LOBYTE(v15) = 0;
            return v15;
          }
        }
        int v28 = CFArrayGetCount(v27) != 0;
        goto LABEL_82;
      }
    }
    else
    {
      CFArrayRef v22 = *(const __CFArray **)(v17 + 184);
      if (!v22) {
        goto LABEL_70;
      }
      CFIndex Count = CFArrayGetCount(v22);
    }
    if (Count) {
      goto LABEL_91;
    }
    goto LABEL_70;
  }
  return v15;
}

- (id)_initWithMessage:(__CFHTTPMessage *)a3 bodyParts:(__CFArray *)a4 cachePolicy:(unint64_t)a5 timeout:(double)a6 mainDocumentURL:(__CFURL *)a7 mutable:(unsigned __int8)a8
{
  int v8 = a8;
  v26.receiver = self;
  v26.super_class = (Class)NSURLRequestInternal;
  v14 = [(NSURLRequestInternal *)&v26 init];
  int v15 = v14;
  if (v14)
  {
    if (v8) {
      *(_WORD *)&v14->_request.fFlags |= 2u;
    }
    CFURLRef v16 = CFHTTPMessageCopyRequestURL(a3);
    if (a5) {
      __int16 v17 = 1033;
    }
    else {
      __int16 v17 = 9;
    }
    __int16 v18 = *(_WORD *)&v15->_request.fFlags & 0xFFEF | v17;
    *(_WORD *)&v15->_request.fFlags = v18;
    v15->_request.fURL = v16;
    v15->_request.fCachePolicy = a5;
    if (a6 != 60.0) {
      *(_WORD *)&v15->_request.fFlags = v18 | 0x800;
    }
    v15->_request.fTimeout = a6;
    if (a7) {
      CFArrayRef v19 = (__CFURL *)CFRetain(a7);
    }
    else {
      CFArrayRef v19 = 0;
    }
    v15->_request.fMainDocumentURL = v19;
    if (v15->_request.fHTTPRequest && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_184085000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "can't be here", buf, 2u);
    }
    if (HTTPMessage::Class(void)::sOnce_HTTPMessage != -1) {
      dispatch_once(&HTTPMessage::Class(void)::sOnce_HTTPMessage, &__block_literal_global_5973);
    }
    Instance = (_OWORD *)_CFRuntimeCreateInstance();
    CFIndex v21 = Instance;
    if (Instance)
    {
      Instance[1] = 0u;
      CFIndex v21 = Instance + 1;
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
    if (a3)
    {
      if (HTTPMessage::Class(void)::sOnce_HTTPMessage != -1) {
        dispatch_once(&HTTPMessage::Class(void)::sOnce_HTTPMessage, &__block_literal_global_5973);
      }
      if (*((unsigned char *)a3 + 40)) {
        CFArrayRef v22 = 0;
      }
      else {
        CFArrayRef v22 = (__CFHTTPMessage *)((char *)a3 + 16);
      }
    }
    else
    {
      CFArrayRef v22 = 0;
    }
    HTTPRequestMessage::HTTPRequestMessage((HTTPRequestMessage *)v21, v22);
    *(void *)CFIndex v21 = &unk_1ECF9AE88;
    *((void *)v21 + 1) = &unk_1ECF9AF08;
    *((void *)v21 + 2) = &unk_1ECF9AF28;
    *((void *)v21 + 16) = &unk_1ECF9AF58;
    *(_OWORD *)((char *)v21 + 184) = 0u;
    *(_OWORD *)((char *)v21 + 200) = 0u;
    *((_DWORD *)v21 + 54) = 256;
    if (a4)
    {
      CFAllocatorRef v23 = CFGetAllocator(v21 - 1);
      CFIndex Count = CFArrayGetCount(a4);
      *((void *)v21 + 26) = CFArrayCreateMutableCopy(v23, Count, a4);
      (*(void (**)(_OWORD *, void))(*(void *)v21 + 64))(v21, 0);
    }
    v15->_request.fHTTPRequest = (HTTPRequest *)v21;
  }
  return v15;
}

- (unint64_t)hash
{
  return (*((uint64_t (**)(void))self->_request._vptr$CoreLoggable + 4))();
}

@end