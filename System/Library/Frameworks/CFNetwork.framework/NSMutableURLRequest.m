@interface NSMutableURLRequest
- (BOOL)_explicitlySetAllowsCellularAccess;
- (BOOL)_explicitlySetAllowsConstrainedNetworkAccess;
- (BOOL)_explicitlySetAllowsExpensiveNetworkAccess;
- (BOOL)_explicitlySetAllowsUCA;
- (BOOL)_explicitlySetCachePolicy;
- (BOOL)_explicitlySetNetworkServiceType;
- (BOOL)_explicitlySetPreventsIdleSystemSleep;
- (BOOL)_explicitlySetProxySettings;
- (BOOL)_explicitlySetSSLProperties;
- (BOOL)_explicitlySetShouldHandleCookies;
- (BOOL)_explicitlySetTimeoutInterval;
- (unint64_t)requestPriority;
- (void)_removeAllProtocolProperties;
- (void)_setAllowOnlyPartitionedCookies:(BOOL)a3;
- (void)_setAllowPrivateAccessTokensForThirdParty:(BOOL)a3;
- (void)_setAllowsUCA:(BOOL)a3;
- (void)_setBlockTrackers:(BOOL)a3;
- (void)_setFailInsecureLoadWithHTTPSDNSRecord:(BOOL)a3;
- (void)_setIgnoreHSTS:(BOOL)a3;
- (void)_setKnownTracker:(BOOL)a3;
- (void)_setNonAppInitiated:(BOOL)a3;
- (void)_setPayloadTransmissionTimeout:(double)a3;
- (void)_setPreventHSTSStorage:(BOOL)a3;
- (void)_setPrivacyProxyFailClosed:(BOOL)a3;
- (void)_setPrivacyProxyFailClosedForUnreachableHosts:(BOOL)a3;
- (void)_setPrivacyProxyFailClosedForUnreachableNonMainHosts:(BOOL)a3;
- (void)_setProhibitPrivacyProxy:(BOOL)a3;
- (void)_setRequiresShortConnectionTimeout:(BOOL)a3;
- (void)_setSchemeWasUpgradedDueToDynamicHSTS:(BOOL)a3;
- (void)_setStartTimeoutDate:(id)a3;
- (void)_setTimeWindowDelay:(double)a3;
- (void)_setTimeWindowDuration:(double)a3;
- (void)_setUseEnhancedPrivacyMode:(BOOL)a3;
- (void)_setWebSearchContent:(BOOL)a3;
- (void)addValue:(NSString *)value forHTTPHeaderField:(NSString *)field;
- (void)setAllHTTPHeaderFields:(NSDictionary *)allHTTPHeaderFields;
- (void)setAllowsCellularAccess:(BOOL)allowsCellularAccess;
- (void)setAllowsConstrainedNetworkAccess:(BOOL)allowsConstrainedNetworkAccess;
- (void)setAllowsExpensiveNetworkAccess:(BOOL)allowsExpensiveNetworkAccess;
- (void)setAllowsPersistentDNS:(BOOL)a3;
- (void)setAssumesHTTP3Capable:(BOOL)assumesHTTP3Capable;
- (void)setAttribution:(NSURLRequestAttribution)attribution;
- (void)setBoundInterfaceIdentifier:(id)a3;
- (void)setCachePolicy:(NSURLRequestCachePolicy)cachePolicy;
- (void)setContentDispositionEncodingFallbackArray:(id)a3;
- (void)setCookiePartitionIdentifier:(id)a3;
- (void)setHTTPBody:(NSData *)HTTPBody;
- (void)setHTTPBodyStream:(NSInputStream *)HTTPBodyStream;
- (void)setHTTPContentType:(id)a3;
- (void)setHTTPExtraCookies:(id)a3;
- (void)setHTTPMethod:(NSString *)HTTPMethod;
- (void)setHTTPReferrer:(id)a3;
- (void)setHTTPShouldHandleCookies:(BOOL)HTTPShouldHandleCookies;
- (void)setHTTPShouldUsePipelining:(BOOL)HTTPShouldUsePipelining;
- (void)setHTTPUserAgent:(id)a3;
- (void)setMainDocumentURL:(NSURL *)mainDocumentURL;
- (void)setNetworkServiceType:(NSURLRequestNetworkServiceType)networkServiceType;
- (void)setRequestPriority:(unint64_t)a3;
- (void)setRequiresDNSSECValidation:(BOOL)requiresDNSSECValidation;
- (void)setTimeoutInterval:(NSTimeInterval)timeoutInterval;
- (void)setURL:(NSURL *)URL;
- (void)setValue:(NSString *)value forHTTPHeaderField:(NSString *)field;
- (void)set_trackerContext:(id)a3;
@end

@implementation NSMutableURLRequest

- (void)addValue:(NSString *)value forHTTPHeaderField:(NSString *)field
{
}

- (void)setTimeoutInterval:(NSTimeInterval)timeoutInterval
{
  v4 = [(NSURLRequest *)self _inner];
  v4[32] |= 0x800u;
  *((NSTimeInterval *)v4 + 3) = timeoutInterval;
}

- (void)setHTTPShouldHandleCookies:(BOOL)HTTPShouldHandleCookies
{
  BOOL v3 = HTTPShouldHandleCookies;
  v4 = [(NSURLRequest *)self _inner];
  __int16 v5 = v4[32];
  __int16 v6 = v5 | 0x21;
  __int16 v7 = v5 & 0xFFDE | 0x20;
  if (v3) {
    __int16 v7 = v6;
  }
  v4[32] = v7;
}

- (void)setURL:(NSURL *)URL
{
}

- (void)setAllHTTPHeaderFields:(NSDictionary *)allHTTPHeaderFields
{
  if (allHTTPHeaderFields) {
    CFURLRequestSetMultipleHTTPHeaderFields(self, (const __CFDictionary *)allHTTPHeaderFields);
  }
}

- (void)setHTTPMethod:(NSString *)HTTPMethod
{
  if (!HTTPMethod && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)__int16 v5 = 0;
    _os_log_fault_impl(&dword_184085000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "assertion failure", v5, 2u);
  }
  CFURLRequestSetHTTPRequestMethod(self, (const __CFString *)HTTPMethod);
}

- (void)setValue:(NSString *)value forHTTPHeaderField:(NSString *)field
{
}

- (void)setHTTPBody:(NSData *)HTTPBody
{
}

- (void)setHTTPBodyStream:(NSInputStream *)HTTPBodyStream
{
}

- (void)setCachePolicy:(NSURLRequestCachePolicy)cachePolicy
{
  int v3 = cachePolicy;
  v4 = [(NSURLRequest *)self _inner];
  v4[32] |= 0x400u;
  *((void *)v4 + 2) = v3;
}

- (void)setAllowsExpensiveNetworkAccess:(BOOL)allowsExpensiveNetworkAccess
{
  if (allowsExpensiveNetworkAccess) {
    int v3 = 1;
  }
  else {
    int v3 = 2;
  }
  *(_DWORD *)([(NSURLRequest *)self _inner] + 216) = v3;
}

- (void)setAllowsConstrainedNetworkAccess:(BOOL)allowsConstrainedNetworkAccess
{
  if (allowsConstrainedNetworkAccess) {
    int v3 = 1;
  }
  else {
    int v3 = 2;
  }
  *(_DWORD *)([(NSURLRequest *)self _inner] + 220) = v3;
}

- (void)_setNonAppInitiated:(BOOL)a3
{
  *(void *)([(NSURLRequest *)self _inner] + 184) = a3;
}

- (void)setNetworkServiceType:(NSURLRequestNetworkServiceType)networkServiceType
{
  int v3 = networkServiceType;
  v4 = [(NSURLRequest *)self _inner];
  v4[32] |= 0x40u;
  *((_DWORD *)v4 + 26) = v3;
}

- (void)setAllowsCellularAccess:(BOOL)allowsCellularAccess
{
  BOOL v3 = allowsCellularAccess;
  v4 = [(NSURLRequest *)self _inner];
  __int16 v5 = v4[32];
  __int16 v6 = v5 | 0x88;
  __int16 v7 = v5 & 0xFF77 | 0x80;
  if (v3) {
    __int16 v7 = v6;
  }
  v4[32] = v7;
}

- (BOOL)_explicitlySetSSLProperties
{
  return (*(unsigned __int16 *)([(NSURLRequest *)self _inner] + 64) >> 13) & 1;
}

- (BOOL)_explicitlySetProxySettings
{
  return (*(unsigned __int16 *)([(NSURLRequest *)self _inner] + 64) >> 12) & 1;
}

- (BOOL)_explicitlySetPreventsIdleSystemSleep
{
  return HIBYTE(*(unsigned __int16 *)([(NSURLRequest *)self _inner] + 64)) & 1;
}

- (BOOL)_explicitlySetAllowsUCA
{
  return *(_DWORD *)([(NSURLRequest *)self _inner] + 224) != 0;
}

- (BOOL)_explicitlySetAllowsConstrainedNetworkAccess
{
  return *(_DWORD *)([(NSURLRequest *)self _inner] + 220) != 0;
}

- (BOOL)_explicitlySetAllowsExpensiveNetworkAccess
{
  return *(_DWORD *)([(NSURLRequest *)self _inner] + 216) != 0;
}

- (BOOL)_explicitlySetAllowsCellularAccess
{
  return (*(unsigned __int16 *)([(NSURLRequest *)self _inner] + 64) >> 7) & 1;
}

- (BOOL)_explicitlySetNetworkServiceType
{
  return (*(unsigned __int16 *)([(NSURLRequest *)self _inner] + 64) >> 6) & 1;
}

- (BOOL)_explicitlySetTimeoutInterval
{
  return (*(unsigned __int16 *)([(NSURLRequest *)self _inner] + 64) >> 11) & 1;
}

- (BOOL)_explicitlySetCachePolicy
{
  return (*(unsigned __int16 *)([(NSURLRequest *)self _inner] + 64) >> 10) & 1;
}

- (BOOL)_explicitlySetShouldHandleCookies
{
  return (*(unsigned __int16 *)([(NSURLRequest *)self _inner] + 64) >> 5) & 1;
}

- (void)_setAllowsUCA:(BOOL)a3
{
  if (a3) {
    int v3 = 1;
  }
  else {
    int v3 = 2;
  }
  *(_DWORD *)([(NSURLRequest *)self _inner] + 224) = v3;
}

- (void)_removeAllProtocolProperties
{
  v2 = [(NSURLRequest *)self _inner];
  int v3 = (const void *)v2[5];
  if (v3) {
    CFRelease(v3);
  }
  v2[5] = 0;
}

- (void)_setAllowOnlyPartitionedCookies:(BOOL)a3
{
  *(unsigned char *)([(NSURLRequest *)self _inner] + 175) = a3;
}

- (void)_setWebSearchContent:(BOOL)a3
{
  *(unsigned char *)([(NSURLRequest *)self _inner] + 174) = a3;
}

- (void)_setFailInsecureLoadWithHTTPSDNSRecord:(BOOL)a3
{
  *(unsigned char *)([(NSURLRequest *)self _inner] + 173) = a3;
}

- (void)_setBlockTrackers:(BOOL)a3
{
  *(unsigned char *)([(NSURLRequest *)self _inner] + 172) = a3;
}

- (void)_setUseEnhancedPrivacyMode:(BOOL)a3
{
  *(unsigned char *)([(NSURLRequest *)self _inner] + 171) = a3;
}

- (void)_setAllowPrivateAccessTokensForThirdParty:(BOOL)a3
{
  *(unsigned char *)([(NSURLRequest *)self _inner] + 170) = a3;
}

- (void)_setProhibitPrivacyProxy:(BOOL)a3
{
  *(unsigned char *)([(NSURLRequest *)self _inner] + 169) = a3;
}

- (void)_setPrivacyProxyFailClosedForUnreachableHosts:(BOOL)a3
{
  *(unsigned char *)([(NSURLRequest *)self _inner] + 168) = a3;
}

- (void)_setPrivacyProxyFailClosedForUnreachableNonMainHosts:(BOOL)a3
{
  *(unsigned char *)([(NSURLRequest *)self _inner] + 167) = a3;
}

- (void)_setPrivacyProxyFailClosed:(BOOL)a3
{
  *(unsigned char *)([(NSURLRequest *)self _inner] + 166) = a3;
}

- (void)set_trackerContext:(id)a3
{
  v4 = [(NSURLRequest *)self _inner];
  id v5 = (id)v4[15];
  if (v5 != a3)
  {
    if (v5) {
      CFRelease(v5);
    }
    if (a3) {
      CFTypeRef v6 = CFRetain(a3);
    }
    else {
      CFTypeRef v6 = 0;
    }
    v4[15] = v6;
  }
}

- (void)_setKnownTracker:(BOOL)a3
{
  *(unsigned char *)([(NSURLRequest *)self _inner] + 165) = a3;
}

- (void)setBoundInterfaceIdentifier:(id)a3
{
  v4 = [(NSURLRequest *)self _inner];

  URLRequest::setBoundInterfaceIdentifier(v4, (__CFString *)a3);
}

- (void)setAllowsPersistentDNS:(BOOL)a3
{
  *(unsigned char *)([(NSURLRequest *)self _inner] + 180) = a3;
}

- (void)setRequiresDNSSECValidation:(BOOL)requiresDNSSECValidation
{
  BOOL v3 = requiresDNSSECValidation;
  v4 = [(NSURLRequest *)self _inner];
  if (v3) {
    int v5 = 1;
  }
  else {
    int v5 = 2;
  }
  v4[44] = v5;
}

- (void)setAttribution:(NSURLRequestAttribution)attribution
{
  *(void *)([(NSURLRequest *)self _inner] + 184) = attribution;
}

- (void)setAssumesHTTP3Capable:(BOOL)assumesHTTP3Capable
{
  *(unsigned char *)([(NSURLRequest *)self _inner] + 164) = assumesHTTP3Capable;
}

- (void)setMainDocumentURL:(NSURL *)mainDocumentURL
{
}

- (void)setContentDispositionEncodingFallbackArray:(id)a3
{
  v4 = +[NSURLRequest newCFContentDispositionEncodingFallbackArray:]((uint64_t)NSURLRequest, a3);
  _CFURLRequestSetContentDispositionEncodingFallbackArray(self, v4);
  if (v4)
  {
    CFRelease(v4);
  }
}

- (void)_setPayloadTransmissionTimeout:(double)a3
{
  *(double *)([(NSURLRequest *)self _inner] + 192) = a3;
}

- (void)_setSchemeWasUpgradedDueToDynamicHSTS:(BOOL)a3
{
  *(unsigned char *)([(NSURLRequest *)self _inner] + 163) = a3;
}

- (void)_setIgnoreHSTS:(BOOL)a3
{
  *(unsigned char *)([(NSURLRequest *)self _inner] + 162) = a3;
}

- (void)_setPreventHSTSStorage:(BOOL)a3
{
  *(unsigned char *)([(NSURLRequest *)self _inner] + 161) = a3;
}

- (void)_setRequiresShortConnectionTimeout:(BOOL)a3
{
  *(unsigned char *)([(NSURLRequest *)self _inner] + 160) = a3;
}

- (void)_setStartTimeoutDate:(id)a3
{
  v4 = [(NSURLRequest *)self _inner];
  [a3 timeIntervalSinceReferenceDate];
  v4[19] = v5;
}

- (void)_setTimeWindowDuration:(double)a3
{
  *(double *)([(NSURLRequest *)self _inner] + 144) = a3;
}

- (void)_setTimeWindowDelay:(double)a3
{
  *(double *)([(NSURLRequest *)self _inner] + 136) = a3;
}

- (void)setHTTPShouldUsePipelining:(BOOL)HTTPShouldUsePipelining
{
}

- (unint64_t)requestPriority
{
  return *(void *)([(NSURLRequest *)self _inner] + 88);
}

- (void)setRequestPriority:(unint64_t)a3
{
  *(void *)([(NSURLRequest *)self _inner] + 88) = a3;
}

- (void)setCookiePartitionIdentifier:(id)a3
{
  v4 = [(NSURLRequest *)self _inner];
  id v5 = (id)v4[16];
  if (v5 != a3)
  {
    if (v5) {
      CFRelease(v5);
    }
    if (a3) {
      CFTypeRef v6 = CFRetain(a3);
    }
    else {
      CFTypeRef v6 = 0;
    }
    v4[16] = v6;
  }
}

- (void)setHTTPUserAgent:(id)a3
{
}

- (void)setHTTPReferrer:(id)a3
{
  if ([a3 rangeOfString:@"file:" options:9] == 0x7FFFFFFFFFFFFFFFLL)
  {
    if ([a3 length]) {
      id v5 = a3;
    }
    else {
      id v5 = 0;
    }
    [(NSMutableURLRequest *)self setValue:v5 forHTTPHeaderField:@"Referer"];
  }
}

- (void)setHTTPExtraCookies:(id)a3
{
  v4 = [(NSURLRequest *)self _inner];
  fHTTPRequest = v4->fHTTPRequest;
  if (fHTTPRequest)
  {
    if (a3)
    {
LABEL_3:
      CFArrayRef Copy = CFArrayCreateCopy((CFAllocatorRef)*MEMORY[0x1E4F1CF80], (CFArrayRef)a3);
      CFArrayRef v7 = (CFArrayRef)*((void *)fHTTPRequest + 23);
      if (v7 != Copy)
      {
        if (v7) {
          CFRelease(v7);
        }
        if (Copy) {
          CFTypeRef v8 = CFRetain(Copy);
        }
        else {
          CFTypeRef v8 = 0;
        }
        *((void *)fHTTPRequest + 23) = v8;
      }
      if (Copy) {
        CFRelease(Copy);
      }
      return;
    }
  }
  else
  {
    v9 = v4;
    HTTPMethodMixedValue::HTTPMethodMixedValue(&v11);
    URLRequest::createHTTPRequest(v9, &v11);
    CFTypeRef v11 = &unk_1ECF9F718;
    if (cf) {
      CFRelease(cf);
    }
    fHTTPRequest = v9->fHTTPRequest;
    if (a3) {
      goto LABEL_3;
    }
  }
  v10 = (const void *)*((void *)fHTTPRequest + 23);
  if (v10)
  {
    CFRelease(v10);
    *((void *)fHTTPRequest + 23) = 0;
  }
}

- (void)setHTTPContentType:(id)a3
{
}

@end