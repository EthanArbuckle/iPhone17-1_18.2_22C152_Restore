@interface WKWebsiteDataStore(WKPrivate)
+ (uint64_t)_fetchAllIdentifiers:()WKPrivate;
+ (uint64_t)_removeDataStoreWithIdentifier:()WKPrivate completionHandler:;
- (uint64_t)_abortBackgroundFetch:()WKPrivate completionHandler:;
- (uint64_t)_appBoundDomains:()WKPrivate;
- (uint64_t)_appBoundSchemes:()WKPrivate;
- (uint64_t)_clearPrevalentDomain:()WKPrivate completionHandler:;
- (uint64_t)_clearResourceLoadStatistics:()WKPrivate;
- (uint64_t)_clickBackgroundFetch:()WKPrivate completionHandler:;
- (uint64_t)_closeDatabases:()WKPrivate;
- (uint64_t)_countNonDefaultSessionSets:()WKPrivate;
- (uint64_t)_fetchDataRecordsOfTypes:()WKPrivate withOptions:completionHandler:;
- (uint64_t)_getAllBackgroundFetchIdentifiers:()WKPrivate;
- (uint64_t)_getAppBadgeForTesting:()WKPrivate;
- (uint64_t)_getBackgroundFetchState:()WKPrivate completionHandler:;
- (uint64_t)_getIsPrevalentDomain:()WKPrivate completionHandler:;
- (uint64_t)_getPendingPushMessage:()WKPrivate;
- (uint64_t)_getPendingPushMessages:()WKPrivate;
- (uint64_t)_getResourceLoadStatisticsDataSummary:()WKPrivate;
- (uint64_t)_isRegisteredAsSubresourceUnderFirstParty:()WKPrivate thirdParty:completionHandler:;
- (uint64_t)_isRelationshipOnlyInDatabaseOnce:()WKPrivate thirdParty:completionHandler:;
- (uint64_t)_loadedSubresourceDomainsFor:()WKPrivate completionHandler:;
- (uint64_t)_logUserInteraction:()WKPrivate completionHandler:;
- (uint64_t)_originDirectoryForTesting:()WKPrivate topOrigin:type:completionHandler:;
- (uint64_t)_pauseBackgroundFetch:()WKPrivate completionHandler:;
- (uint64_t)_processPushMessage:()WKPrivate completionHandler:;
- (uint64_t)_processStatisticsAndDataRecords:()WKPrivate;
- (uint64_t)_processWebCorePersistentNotificationClick:()WKPrivate completionHandler:;
- (uint64_t)_processWebCorePersistentNotificationClose:()WKPrivate completionHandler:;
- (uint64_t)_renameOrigin:()WKPrivate to:forDataOfTypes:completionHandler:;
- (uint64_t)_resumeBackgroundFetch:()WKPrivate completionHandler:;
- (uint64_t)_scheduleCookieBlockingUpdate:()WKPrivate;
- (uint64_t)_scopeURL:()WKPrivate hasPushSubscriptionForTesting:;
- (uint64_t)_sendNetworkProcessPrepareToSuspend:()WKPrivate;
- (uint64_t)_setBackupExclusionPeriodForTesting:()WKPrivate completionHandler:;
- (uint64_t)_setCompletionHandlerForRemovalFromNetworkProcess:()WKPrivate;
- (uint64_t)_setPrevalentDomain:()WKPrivate completionHandler:;
- (uint64_t)_setResourceLoadStatisticsTestingCallback:()WKPrivate;
- (uint64_t)_setThirdPartyCookieBlockingMode:()WKPrivate onlyOnSitesWithoutUserInteraction:completionHandler:;
- (uint64_t)_setUserAgentStringQuirkForTesting:()WKPrivate withUserAgent:completionHandler:;
- (uint64_t)_statisticsDatabaseHasAllTables:()WKPrivate;
- (uint64_t)_storeServiceWorkerRegistrations:()WKPrivate;
- (void)_getPendingPushMessage:()WKPrivate;
- (void)_getPendingPushMessages:()WKPrivate;
- (void)_getResourceLoadStatisticsDataSummary:()WKPrivate;
@end

@implementation WKWebsiteDataStore(WKPrivate)

+ (uint64_t)_fetchAllIdentifiers:()WKPrivate
{
  *(void *)a1 = &unk_1EE9C6C98;
  _Block_release(*(const void **)(a1 + 8));
  return a1;
}

+ (uint64_t)_removeDataStoreWithIdentifier:()WKPrivate completionHandler:
{
  v7[1] = *MEMORY[0x1E4F143B8];
  if (*(void *)a2 && *(_DWORD *)(*(void *)a2 + 4))
  {
    v3 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v6 = *MEMORY[0x1E4F28568];
    v7[0] = WTF::StringImpl::operator NSString *();
    objc_msgSend(v3, "errorWithDomain:code:userInfo:", @"WKWebSiteDataStore", 1, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1));
    return (*(uint64_t (**)(void))(*(void *)(a1 + 8) + 16))();
  }
  else
  {
    v5 = *(uint64_t (**)(void))(*(void *)(a1 + 8) + 16);
    return v5();
  }
}

- (uint64_t)_fetchDataRecordsOfTypes:()WKPrivate withOptions:completionHandler:
{
  uint64_t v2 = result;
  v14 = *(uint64_t **)a2;
  int v3 = *(_DWORD *)(a2 + 8);
  uint64_t v4 = *(unsigned int *)(a2 + 12);
  *(void *)a2 = 0;
  *(void *)(a2 + 8) = 0;
  int v15 = v3;
  unsigned int v16 = v4;
  v18 = 0;
  uint64_t v19 = 0;
  if (v4)
  {
    if (v4 >> 29)
    {
      __break(0xC471u);
      return result;
    }
    v5 = (uint64_t *)WTF::fastMalloc((WTF *)(8 * v4));
    LODWORD(v19) = v4;
    v18 = v5;
    unsigned int v6 = v16;
    if (v16)
    {
      v7 = v14;
      uint64_t v8 = 80 * v16;
      do
      {
        uint64_t v9 = API::Object::newObject(0x60uLL, 123);
        *v5++ = API::WebsiteDataRecord::WebsiteDataRecord(v9, v7);
        v7 += 10;
        v8 -= 80;
      }
      while (v8);
      HIDWORD(v19) = v6;
    }
  }
  API::Array::create((uint64_t *)&v18, &v17);
  uint64_t v10 = v17;
  v11 = *(const void **)(v17 + 8);
  if (v11) {
    CFRetain(*(CFTypeRef *)(v17 + 8));
  }
  (*(void (**)(void))(*(void *)(v2 + 8) + 16))();
  if (v11) {
    CFRelease(v11);
  }
  CFRelease(*(CFTypeRef *)(v10 + 8));
  WTF::Vector<WTF::RefPtr<API::Object,WTF::RawPtrTraits<API::Object>,WTF::DefaultRefDerefTraits<API::Object>>,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)&v18, v12);
  return WTF::Vector<WebKit::WebsiteDataRecord,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)&v14, v13);
}

- (uint64_t)_setResourceLoadStatisticsTestingCallback:()WKPrivate
{
  if (*a2) {
    WTF::StringImpl::operator NSString *();
  }
  int v3 = *(uint64_t (**)(void))(*(void *)(a1 + 8) + 16);

  return v3();
}

- (uint64_t)_loadedSubresourceDomainsFor:()WKPrivate completionHandler:
{
  uint64_t v2 = result;
  uint64_t v18 = 0;
  uint64_t v19 = 0;
  uint64_t v3 = *((unsigned int *)a2 + 3);
  if (v3)
  {
    if (v3 >> 29)
    {
      __break(0xC471u);
      return result;
    }
    uint64_t v5 = WTF::fastMalloc((WTF *)(8 * v3));
    LODWORD(v19) = v3;
    uint64_t v18 = v5;
    uint64_t v6 = *((unsigned int *)a2 + 3);
    if (v6)
    {
      uint64_t v7 = 0;
      uint64_t v8 = *a2;
      uint64_t v9 = 8 * v6;
      do
      {
        uint64_t v10 = *(WTF::StringImpl **)(v8 + 8 * v7);
        if (v10) {
          *(_DWORD *)v10 += 2;
        }
        v20 = v10;
        API::String::create(&v20, (WebKit **)&v21);
        v12 = v20;
        v13 = (WebKit *)v21;
        v20 = 0;
        v21 = 0;
        if (v12)
        {
          if (*(_DWORD *)v12 == 2) {
            WTF::StringImpl::destroy(v12, v11);
          }
          else {
            *(_DWORD *)v12 -= 2;
          }
        }
        *(void *)(v5 + 8 * v7++) = v13;
        v9 -= 8;
      }
      while (v9);
      HIDWORD(v19) = v6;
    }
  }
  API::Array::create(&v18, (uint64_t *)&v21);
  int v15 = (WebKit *)v21;
  CFTypeRef v16 = v21[1];
  if (v16) {
    CFRetain(v21[1]);
  }
  (*(void (**)(void, CFTypeRef, uint64_t))(*(void *)(v2 + 8) + 16))(*(void *)(v2 + 8), v16, v14);
  if (v16) {
    CFRelease(v16);
  }
  CFRelease(*((CFTypeRef *)v15 + 1));
  return WTF::Vector<WTF::RefPtr<API::Object,WTF::RawPtrTraits<API::Object>,WTF::DefaultRefDerefTraits<API::Object>>,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)&v18, v17);
}

- (uint64_t)_scheduleCookieBlockingUpdate:()WKPrivate
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 8) + 16))();
}

- (uint64_t)_logUserInteraction:()WKPrivate completionHandler:
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 8) + 16))();
}

- (uint64_t)_setPrevalentDomain:()WKPrivate completionHandler:
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 8) + 16))();
}

- (uint64_t)_getIsPrevalentDomain:()WKPrivate completionHandler:
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 8) + 16))();
}

- (uint64_t)_clearPrevalentDomain:()WKPrivate completionHandler:
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 8) + 16))();
}

- (uint64_t)_clearResourceLoadStatistics:()WKPrivate
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 8) + 16))();
}

- (uint64_t)_closeDatabases:()WKPrivate
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 8) + 16))();
}

- (uint64_t)_getResourceLoadStatisticsDataSummary:()WKPrivate
{
  *a1 = &unk_1EE9C6E78;
  _Block_release(a1[1]);

  return WTF::fastFree((WTF *)a1, v2);
}

- (void)_getResourceLoadStatisticsDataSummary:()WKPrivate
{
  uint64_t v4 = (WTF::RunLoop *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:*((unsigned int *)a2 + 3)];
  uint64_t v5 = v4;
  unsigned int v6 = *((_DWORD *)a2 + 3);
  if (v6)
  {
    uint64_t v7 = *a2;
    uint64_t v8 = (uint64_t)&(*a2)[3 * v6];
    do
    {
      uint64_t v9 = (WTF::RunLoop *)WTF::RunLoop::main(v4);
      if ((WTF::RunLoop::isCurrent(v9) & 1) == 0)
      {
        __break(0xC471u);
        JUMPOUT(0x198BD192CLL);
      }
      uint64_t v10 = API::Object::newObject(0x28uLL, 96);
      *(void *)uint64_t v10 = &unk_1EE9D1E28;
      WebKit::InitializeWebKit2((WebKit *)v10);
      *(void *)uint64_t v10 = &unk_1EE9C6EA0;
      uint64_t v11 = *v7;
      uint64_t *v7 = 0;
      *(void *)(v10 + 24) = 0;
      *(void *)(v10 + 32) = 0;
      *(void *)(v10 + 16) = v11;
      uint64_t v12 = v7[1];
      v7[1] = 0;
      *(void *)(v10 + 24) = v12;
      LODWORD(v12) = *((_DWORD *)v7 + 4);
      *((_DWORD *)v7 + 4) = 0;
      *(_DWORD *)(v10 + 32) = v12;
      LODWORD(v12) = *((_DWORD *)v7 + 5);
      *((_DWORD *)v7 + 5) = 0;
      *(_DWORD *)(v10 + 36) = v12;
      v13 = *(const void **)(v10 + 8);
      if (v13)
      {
        CFRetain(*(CFTypeRef *)(v10 + 8));
        CFRelease(*(CFTypeRef *)(v10 + 8));
        [(WTF::RunLoop *)v5 addObject:v13];
        uint64_t v14 = v13;
      }
      else
      {
        uint64_t v14 = 0;
      }
      CFRelease(v14);
      v7 += 3;
    }
    while (v7 != (uint64_t *)v8);
  }
  (*(void (**)(void))(*(void *)(a1 + 8) + 16))();
  if (v5)
  {
    CFRelease(v5);
  }
}

- (uint64_t)_isRelationshipOnlyInDatabaseOnce:()WKPrivate thirdParty:completionHandler:
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 8) + 16))();
}

- (uint64_t)_isRegisteredAsSubresourceUnderFirstParty:()WKPrivate thirdParty:completionHandler:
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 8) + 16))();
}

- (uint64_t)_statisticsDatabaseHasAllTables:()WKPrivate
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 8) + 16))();
}

- (uint64_t)_processStatisticsAndDataRecords:()WKPrivate
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 8) + 16))();
}

- (uint64_t)_setThirdPartyCookieBlockingMode:()WKPrivate onlyOnSitesWithoutUserInteraction:completionHandler:
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 8) + 16))();
}

- (uint64_t)_renameOrigin:()WKPrivate to:forDataOfTypes:completionHandler:
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 8) + 16))();
}

- (uint64_t)_setUserAgentStringQuirkForTesting:()WKPrivate withUserAgent:completionHandler:
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 8) + 16))();
}

- (uint64_t)_appBoundDomains:()WKPrivate
{
  uint64_t v4 = result;
  uint64_t v16 = 0;
  uint64_t v17 = 0;
  if (*a2 && (uint64_t v5 = *(unsigned int *)(*a2 - 12), v5))
  {
    if (v5 >> 29)
    {
      __break(0xC471u);
      return result;
    }
    uint64_t v6 = WTF::fastMalloc((WTF *)(8 * v5));
    LODWORD(v17) = v5;
    uint64_t v16 = v6;
  }
  else
  {
    uint64_t v6 = 0;
  }
  uint64_t v7 = WTF::HashTable<WebCore::RegistrableDomain,WebCore::RegistrableDomain,WTF::IdentityExtractor,WTF::DefaultHash<WebCore::RegistrableDomain>,WTF::HashTraits<WebCore::RegistrableDomain>,WTF::HashTraits<WebCore::RegistrableDomain>>::begin(a2, (uint64_t)a2, a3);
  v18[0] = v7;
  v18[1] = v8;
  if (*a2) {
    uint64_t v9 = *a2 + 8 * *(unsigned int *)(*a2 - 4);
  }
  else {
    uint64_t v9 = 0;
  }
  if (v9 != v7)
  {
    unsigned int v10 = 0;
    do
    {
      API::String::create(&v19);
      *(void *)(v6 + 8 * v10) = v19;
      v18[0] += 8;
      WTF::HashTableConstIterator<WTF::HashTable<WebCore::RegistrableDomain,WebCore::RegistrableDomain,WTF::IdentityExtractor,WTF::DefaultHash<WebCore::RegistrableDomain>,WTF::HashTraits<WebCore::RegistrableDomain>,WTF::HashTraits<WebCore::RegistrableDomain>>,WebCore::RegistrableDomain,WebCore::RegistrableDomain,WTF::IdentityExtractor,WTF::DefaultHash<WebCore::RegistrableDomain>,WTF::HashTraits<WebCore::RegistrableDomain>,WTF::HashTraits<WebCore::RegistrableDomain>>::skipEmptyBuckets((uint64_t)v18, v11, v12);
      ++v10;
    }
    while (v18[0] != v9);
    HIDWORD(v17) = v10;
  }
  API::Array::create(&v16, v18);
  uint64_t v13 = v18[0];
  uint64_t v14 = *(const void **)(v18[0] + 8);
  if (v14) {
    CFRetain(*(CFTypeRef *)(v18[0] + 8));
  }
  (*(void (**)(void))(*(void *)(v4 + 8) + 16))();
  if (v14) {
    CFRelease(v14);
  }
  CFRelease(*(CFTypeRef *)(v13 + 8));
  return WTF::Vector<WTF::RefPtr<API::Object,WTF::RawPtrTraits<API::Object>,WTF::DefaultRefDerefTraits<API::Object>>,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)&v16, v15);
}

- (uint64_t)_appBoundSchemes:()WKPrivate
{
  uint64_t v3 = result;
  uint64_t v15 = 0;
  uint64_t v16 = 0;
  if (*a2)
  {
    uint64_t v4 = *((unsigned int *)*a2 - 3);
    if (v4)
    {
      if (v4 >> 29)
      {
        __break(0xC471u);
        return result;
      }
      LODWORD(v16) = *((_DWORD *)*a2 - 3);
      uint64_t v15 = WTF::fastMalloc((WTF *)(8 * v4));
    }
  }
  uint64_t v5 = WTF::HashTable<WTF::String,WTF::String,WTF::IdentityExtractor,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTraits<WTF::String>>::begin(a2);
  uint64_t v6 = v5;
  uint64_t v8 = v7;
  if (*a2) {
    uint64_t v9 = (uint64_t)&(*a2)[*((unsigned int *)*a2 - 1)];
  }
  else {
    uint64_t v9 = 0;
  }
  if ((void *)v9 != v5)
  {
    unsigned int v10 = 0;
    uint64_t v11 = v15;
    do
    {
      API::String::create((WebKit **)&v17);
      *(void *)(v11 + 8 * v10) = v17;
      while (++v6 != v8)
      {
        if ((unint64_t)(*v6 + 1) > 1) {
          goto LABEL_14;
        }
      }
      uint64_t v6 = v8;
LABEL_14:
      ++v10;
    }
    while (v6 != (void *)v9);
    HIDWORD(v16) = v10;
  }
  API::Array::create(&v15, (uint64_t *)&v17);
  uint64_t v12 = (WebKit *)v17;
  CFTypeRef v13 = v17[1];
  if (v13) {
    CFRetain(v17[1]);
  }
  (*(void (**)(void))(*(void *)(v3 + 8) + 16))();
  if (v13) {
    CFRelease(v13);
  }
  CFRelease(*((CFTypeRef *)v12 + 1));
  return WTF::Vector<WTF::RefPtr<API::Object,WTF::RawPtrTraits<API::Object>,WTF::DefaultRefDerefTraits<API::Object>>,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)&v15, v14);
}

- (uint64_t)_sendNetworkProcessPrepareToSuspend:()WKPrivate
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 8) + 16))();
}

- (uint64_t)_countNonDefaultSessionSets:()WKPrivate
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 8) + 16))();
}

- (uint64_t)_getPendingPushMessage:()WKPrivate
{
  *a1 = &unk_1EE9C71E0;
  _Block_release(a1[1]);

  return WTF::fastFree((WTF *)a1, v2);
}

- (void)_getPendingPushMessage:()WKPrivate
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if (*((unsigned char *)this + 216))
  {
    uint64_t v3 = (const void *)WebKit::WebPushMessage::toDictionary(this);
    uint64_t v4 = v3;
    if (v3) {
      CFRetain(v3);
    }
  }
  else
  {
    uint64_t v4 = 0;
  }
  uint64_t v5 = qword_1EB3583C0;
  if (os_log_type_enabled((os_log_t)qword_1EB3583C0, OS_LOG_TYPE_DEFAULT))
  {
    v6[0] = 67109120;
    v6[1] = v4 != 0;
    _os_log_impl(&dword_1985F2000, v5, OS_LOG_TYPE_DEFAULT, "Giving application %d pending push messages", (uint8_t *)v6, 8u);
  }
  (*(void (**)(void))(*(void *)(a1 + 8) + 16))();
  if (v4) {
    CFRelease(v4);
  }
}

- (uint64_t)_getPendingPushMessages:()WKPrivate
{
  *a1 = &unk_1EE9C7208;
  _Block_release(a1[1]);

  return WTF::fastFree((WTF *)a1, v2);
}

- (void)_getPendingPushMessages:()WKPrivate
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:*(unsigned int *)(a2 + 12)];
  unsigned int v5 = *(_DWORD *)(a2 + 12);
  if (v5)
  {
    uint64_t v6 = *(WebKit::WebPushMessage **)a2;
    uint64_t v7 = 216 * v5;
    do
    {
      [v4 addObject:WebKit::WebPushMessage::toDictionary(v6)];
      uint64_t v6 = (WebKit::WebPushMessage *)((char *)v6 + 216);
      v7 -= 216;
    }
    while (v7);
  }
  uint64_t v8 = qword_1EB3583C0;
  if (os_log_type_enabled((os_log_t)qword_1EB3583C0, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = *(unsigned int *)(a2 + 12);
    int v10 = 134217984;
    uint64_t v11 = v9;
    _os_log_impl(&dword_1985F2000, v8, OS_LOG_TYPE_DEFAULT, "Giving application %zu pending push messages", (uint8_t *)&v10, 0xCu);
  }
  (*(void (**)(void))(*(void *)(a1 + 8) + 16))();
  if (v4) {
    CFRelease(v4);
  }
}

- (uint64_t)_processPushMessage:()WKPrivate completionHandler:
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = qword_1EB3583C0;
  if (os_log_type_enabled((os_log_t)qword_1EB3583C0, OS_LOG_TYPE_DEFAULT))
  {
    v6[0] = 67109120;
    v6[1] = a2;
    _os_log_impl(&dword_1985F2000, v4, OS_LOG_TYPE_DEFAULT, "Push message processing complete. Callback result: %d", (uint8_t *)v6, 8u);
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 8) + 16))();
}

- (uint64_t)_processWebCorePersistentNotificationClick:()WKPrivate completionHandler:
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = qword_1EB3583C0;
  if (os_log_type_enabled((os_log_t)qword_1EB3583C0, OS_LOG_TYPE_DEFAULT))
  {
    v6[0] = 67109120;
    v6[1] = a2;
    _os_log_impl(&dword_1985F2000, v4, OS_LOG_TYPE_DEFAULT, "Notification click event processing complete. Callback result: %d", (uint8_t *)v6, 8u);
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 8) + 16))();
}

- (uint64_t)_processWebCorePersistentNotificationClose:()WKPrivate completionHandler:
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = qword_1EB3583C0;
  if (os_log_type_enabled((os_log_t)qword_1EB3583C0, OS_LOG_TYPE_DEFAULT))
  {
    v6[0] = 67109120;
    v6[1] = a2;
    _os_log_impl(&dword_1985F2000, v4, OS_LOG_TYPE_DEFAULT, "Notification close event processing complete. Callback result: %d", (uint8_t *)v6, 8u);
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 8) + 16))();
}

- (uint64_t)_getAllBackgroundFetchIdentifiers:()WKPrivate
{
  CFTypeRef v13 = *a2;
  uint64_t v3 = a2[1];
  *a2 = 0;
  a2[1] = 0;
  uint64_t v14 = v3;
  uint64_t v4 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:HIDWORD(v3)];
  if (HIDWORD(v14))
  {
    unsigned int v5 = v13;
    uint64_t v6 = 8 * HIDWORD(v14);
    do
    {
      uint64_t v7 = *v5;
      if (*v5)
      {
        *(_DWORD *)v7 += 2;
        uint64_t v8 = (__CFString *)WTF::StringImpl::operator NSString *();
      }
      else
      {
        uint64_t v8 = &stru_1EEA10550;
      }
      objc_msgSend(v4, "addObject:", v8, v13, v14);
      if (v7)
      {
        if (*(_DWORD *)v7 == 2) {
          WTF::StringImpl::destroy(v7, v9);
        }
        else {
          *(_DWORD *)v7 -= 2;
        }
      }
      ++v5;
      v6 -= 8;
    }
    while (v6);
  }
  CFTypeRef v10 = (id)CFMakeCollectable(v4);
  (*(void (**)(void))(*(void *)(a1 + 8) + 16))();
  return WTF::Vector<WTF::String,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)&v13, v11);
}

- (uint64_t)_getBackgroundFetchState:()WKPrivate completionHandler:
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v5[0] = 0;
  char v6 = 0;
  if (*(unsigned char *)(a2 + 152))
  {
    std::construct_at[abi:sn180100]<WebKit::BackgroundFetchState,WebKit::BackgroundFetchState,WebKit::BackgroundFetchState*>((uint64_t)v5, a2);
    char v6 = 1;
    WebKit::BackgroundFetchState::toDictionary((WebKit::BackgroundFetchState *)v5);
  }
  (*(void (**)(void))(*(void *)(a1 + 8) + 16))();
  return std::__optional_destruct_base<WebKit::BackgroundFetchState,false>::~__optional_destruct_base[abi:sn180100]((uint64_t)v5, v3);
}

- (uint64_t)_abortBackgroundFetch:()WKPrivate completionHandler:
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 8) + 16))();
}

- (uint64_t)_pauseBackgroundFetch:()WKPrivate completionHandler:
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 8) + 16))();
}

- (uint64_t)_resumeBackgroundFetch:()WKPrivate completionHandler:
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 8) + 16))();
}

- (uint64_t)_clickBackgroundFetch:()WKPrivate completionHandler:
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 8) + 16))();
}

- (uint64_t)_storeServiceWorkerRegistrations:()WKPrivate
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 8) + 16))();
}

- (uint64_t)_scopeURL:()WKPrivate hasPushSubscriptionForTesting:
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 8) + 16))();
}

- (uint64_t)_originDirectoryForTesting:()WKPrivate topOrigin:type:completionHandler:
{
  uint64_t v3 = *a2;
  if (*a2)
  {
    *(_DWORD *)v3 += 2;
    WTF::StringImpl::operator NSString *();
  }
  uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 8) + 16))();
  if (v3)
  {
    if (*(_DWORD *)v3 == 2)
    {
      return WTF::StringImpl::destroy(v3, v5);
    }
    else
    {
      *(_DWORD *)v3 -= 2;
    }
  }
  return result;
}

- (uint64_t)_setBackupExclusionPeriodForTesting:()WKPrivate completionHandler:
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 8) + 16))();
}

- (uint64_t)_setCompletionHandlerForRemovalFromNetworkProcess:()WKPrivate
{
  v8[1] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *a2;
  *a2 = 0;
  if (v3 && *((_DWORD *)v3 + 1))
  {
    uint64_t v4 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v7 = *MEMORY[0x1E4F28568];
    v8[0] = WTF::StringImpl::operator NSString *();
    objc_msgSend(v4, "errorWithDomain:code:userInfo:", @"WKWebSiteDataStore", 1, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1));
    uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 8) + 16))();
  }
  else
  {
    uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 8) + 16))();
    if (!v3) {
      return result;
    }
  }
  if (*(_DWORD *)v3 == 2) {
    return WTF::StringImpl::destroy(v3, v6);
  }
  *(_DWORD *)v3 -= 2;
  return result;
}

- (uint64_t)_getAppBadgeForTesting:()WKPrivate
{
  if (a3) {
    [NSNumber numberWithUnsignedLongLong:a2];
  }
  uint64_t v4 = *(uint64_t (**)(void))(*(void *)(a1 + 8) + 16);

  return v4();
}

@end