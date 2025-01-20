@interface WKWebsiteDataRecord
+ (BOOL)accessInstanceVariablesDirectly;
- (NSSet)dataTypes;
- (NSString)description;
- (NSString)displayName;
- (Object)_apiObject;
- (_WKWebsiteDataSize)_dataSize;
- (id)_originsStrings;
- (void)dealloc;
@end

@implementation WKWebsiteDataRecord

+ (BOOL)accessInstanceVariablesDirectly
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  char v3 = WTF::linkedOnOrAfterSDKWithBehavior();
  if ((v3 & 1) == 0 && (+[WKWebsiteDataRecord accessInstanceVariablesDirectly]::didLogFault & 1) == 0)
  {
    +[WKWebsiteDataRecord accessInstanceVariablesDirectly]::didLogFault = 1;
    v4 = qword_1EB357B50;
    if (os_log_type_enabled((os_log_t)qword_1EB357B50, OS_LOG_TYPE_FAULT))
    {
      int v6 = 136446210;
      Name = class_getName((Class)a1);
      _os_log_fault_impl(&dword_1985F2000, v4, OS_LOG_TYPE_FAULT, "Do not access private instance variables of %{public}s via key-value coding. This will raise an exception when linking against newer SDKs.", (uint8_t *)&v6, 0xCu);
    }
  }
  return v3 ^ 1;
}

- (void)dealloc
{
  char v3 = (objc_class *)objc_opt_class();
  if ((WebCoreObjCScheduleDeallocateOnMainRunLoop(v3, (objc_object *)self) & 1) == 0)
  {
    WebKit::WebsiteDataRecord::~WebsiteDataRecord((WebKit::WebsiteDataRecord *)&self->_websiteDataRecord.data.__lx[16], v4);
    v5.receiver = self;
    v5.super_class = (Class)WKWebsiteDataRecord;
    [(WKWebsiteDataRecord *)&v5 dealloc];
  }
}

- (NSString)description
{
  id v3 = objc_alloc(MEMORY[0x1E4F28E78]);
  v4 = (objc_class *)objc_opt_class();
  objc_super v5 = NSStringFromClass(v4);
  int v6 = [(WKWebsiteDataRecord *)self displayName];
  v7 = [(WKWebsiteDataRecord *)self dataTypes];
  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if ([(NSSet *)v7 containsObject:@"WKWebsiteDataTypeDiskCache"]) {
    [v8 addObject:@"Disk Cache"];
  }
  if ([(NSSet *)v7 containsObject:@"WKWebsiteDataTypeFetchCache"]) {
    [v8 addObject:@"Fetch Cache"];
  }
  if ([(NSSet *)v7 containsObject:@"WKWebsiteDataTypeMemoryCache"]) {
    [v8 addObject:@"Memory Cache"];
  }
  if ([(NSSet *)v7 containsObject:@"WKWebsiteDataTypeOfflineWebApplicationCache"]) {
    [v8 addObject:@"Offline Web Application Cache"];
  }
  if ([(NSSet *)v7 containsObject:@"WKWebsiteDataTypeCookies"]) {
    [v8 addObject:@"Cookies"];
  }
  if ([(NSSet *)v7 containsObject:@"WKWebsiteDataTypeSessionStorage"]) {
    [v8 addObject:@"Session Storage"];
  }
  if ([(NSSet *)v7 containsObject:@"WKWebsiteDataTypeLocalStorage"]) {
    [v8 addObject:@"Local Storage"];
  }
  if ([(NSSet *)v7 containsObject:@"WKWebsiteDataTypeWebSQLDatabases"]) {
    [v8 addObject:@"Web SQL"];
  }
  if ([(NSSet *)v7 containsObject:@"WKWebsiteDataTypeIndexedDBDatabases"]) {
    [v8 addObject:@"IndexedDB"];
  }
  if ([(NSSet *)v7 containsObject:@"WKWebsiteDataTypeServiceWorkerRegistrations"]) {
    [v8 addObject:@"Service Worker Registrations"];
  }
  if ([(NSSet *)v7 containsObject:@"_WKWebsiteDataTypeHSTSCache"]) {
    [v8 addObject:@"HSTS Cache"];
  }
  if ([(NSSet *)v7 containsObject:@"WKWebsiteDataTypeMediaKeys"]) {
    [v8 addObject:@"Media Keys"];
  }
  if ([(NSSet *)v7 containsObject:@"WKWebsiteDataTypeHashSalt"]) {
    [v8 addObject:@"Hash Salt"];
  }
  if ([(NSSet *)v7 containsObject:@"WKWebsiteDataTypeSearchFieldRecentSearches"]) {
    [v8 addObject:@"Search Field Recent Searches"];
  }
  if ([(NSSet *)v7 containsObject:@"WKWebsiteDataTypeFileSystem"]) {
    [v8 addObject:@"File System"];
  }
  if ([(NSSet *)v7 containsObject:@"_WKWebsiteDataTypeResourceLoadStatistics"]) {
    [v8 addObject:@"Resource Load Statistics"];
  }
  if ([(NSSet *)v7 containsObject:@"_WKWebsiteDataTypeCredentials"]) {
    [v8 addObject:@"Credentials"];
  }
  if ([(NSSet *)v7 containsObject:@"_WKWebsiteDataTypeAdClickAttributions"]
    || [(NSSet *)v7 containsObject:@"_WKWebsiteDataTypePrivateClickMeasurements"])
  {
    [v8 addObject:@"Private Click Measurements"];
  }
  if ([(NSSet *)v7 containsObject:@"_WKWebsiteDataTypeAlternativeServices"]) {
    [v8 addObject:@"Alternative Services"];
  }
  uint64_t v9 = [v8 componentsJoinedByString:@", "];
  if (v8) {
    CFRelease(v8);
  }
  v10 = objc_msgSend(v3, "initWithFormat:", @"<%@: %p; displayName = %@; dataTypes = { %@ }",
                  v5,
                  self,
                  v6,
                  v9);
  v11 = [(WKWebsiteDataRecord *)self _dataSize];
  if (v11) {
    objc_msgSend(v10, "appendFormat:", @"; _dataSize = { %llu bytes }",
  }
      [(_WKWebsiteDataSize *)v11 totalSize]);
  [v10 appendString:@">"];
  return (NSString *)(id)CFMakeCollectable(v10);
}

- (NSString)displayName
{
  if (*(void *)&self->_websiteDataRecord.data.__lx[16]) {
    return (NSString *)WTF::StringImpl::operator NSString *();
  }
  else {
    return (NSString *)&stru_1EEA10550;
  }
}

- (NSSet)dataTypes
{
  int v2 = *(_DWORD *)&self->_websiteDataRecord.data.__lx[24];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  v4 = v3;
  if (v2) {
    [v3 addObject:@"WKWebsiteDataTypeCookies"];
  }
  if ((v2 & 2) != 0) {
    [v4 addObject:@"WKWebsiteDataTypeDiskCache"];
  }
  if ((v2 & 0x8000) != 0) {
    [v4 addObject:@"WKWebsiteDataTypeFetchCache"];
  }
  if ((v2 & 4) != 0) {
    [v4 addObject:@"WKWebsiteDataTypeMemoryCache"];
  }
  if ((v2 & 8) != 0) {
    [v4 addObject:@"WKWebsiteDataTypeOfflineWebApplicationCache"];
  }
  if ((v2 & 0x10) != 0) {
    [v4 addObject:@"WKWebsiteDataTypeSessionStorage"];
  }
  if ((v2 & 0x20) != 0) {
    [v4 addObject:@"WKWebsiteDataTypeLocalStorage"];
  }
  if ((v2 & 0x40) != 0) {
    [v4 addObject:@"WKWebsiteDataTypeWebSQLDatabases"];
  }
  if ((v2 & 0x80) != 0) {
    [v4 addObject:@"WKWebsiteDataTypeIndexedDBDatabases"];
  }
  if ((v2 & 0x4000) != 0) {
    [v4 addObject:@"WKWebsiteDataTypeServiceWorkerRegistrations"];
  }
  if ((v2 & 0x80000) != 0) {
    [v4 addObject:@"WKWebsiteDataTypeFileSystem"];
  }
  if ((v2 & 0x200) != 0) {
    [v4 addObject:@"_WKWebsiteDataTypeHSTSCache"];
  }
  if ((v2 & 0x100) != 0) {
    [v4 addObject:@"WKWebsiteDataTypeMediaKeys"];
  }
  if ((v2 & 0x400) != 0) {
    [v4 addObject:@"WKWebsiteDataTypeSearchFieldRecentSearches"];
  }
  if ((v2 & 0x10000) != 0) {
    [v4 addObject:@"WKWebsiteDataTypeHashSalt"];
  }
  if ((v2 & 0x1000) != 0) {
    [v4 addObject:@"_WKWebsiteDataTypeResourceLoadStatistics"];
  }
  if ((v2 & 0x2000) != 0) {
    [v4 addObject:@"_WKWebsiteDataTypeCredentials"];
  }
  if ((v2 & 0x20000) != 0) {
    [v4 addObject:@"_WKWebsiteDataTypePrivateClickMeasurements"];
  }
  if ((v2 & 0x40000) != 0) {
    [v4 addObject:@"_WKWebsiteDataTypeAlternativeServices"];
  }
  objc_super v5 = (void *)CFMakeCollectable(v4);

  return (NSSet *)v5;
}

- (Object)_apiObject
{
  return (Object *)&self->_websiteDataRecord;
}

- (_WKWebsiteDataSize)_dataSize
{
  if (!LOBYTE(self[1].super.isa)) {
    return 0;
  }
  result = [_WKWebsiteDataSize alloc];
  if (LOBYTE(self[1].super.isa))
  {
    v4 = (void *)CFMakeCollectable([(_WKWebsiteDataSize *)result initWithSize:&self->_websiteDataRecord.data.__lx[32]]);
    return (_WKWebsiteDataSize *)v4;
  }
  else
  {
    __break(1u);
  }
  return result;
}

- (id)_originsStrings
{
  id v3 = objc_alloc(MEMORY[0x1E4F1CA48]);
  uint64_t v6 = *(void *)self[1]._websiteDataRecord.data.__lx;
  p_websiteDataRecord = (uint64_t *)&self[1]._websiteDataRecord;
  uint64_t v4 = v6;
  if (v6) {
    uint64_t v7 = *(unsigned int *)(v4 - 12);
  }
  else {
    uint64_t v7 = 0;
  }
  id v8 = (void *)[v3 initWithCapacity:v7];
  uint64_t v9 = WTF::HashTable<WebCore::SecurityOriginData,WebCore::SecurityOriginData,WTF::IdentityExtractor,WTF::DefaultHash<WebCore::SecurityOriginData>,WTF::HashTraits<WebCore::SecurityOriginData>,WTF::HashTraits<WebCore::SecurityOriginData>>::begin(p_websiteDataRecord);
  v10 = v9;
  v12 = v11;
  if (*p_websiteDataRecord) {
    uint64_t v13 = *p_websiteDataRecord + 32 * *(unsigned int *)(*p_websiteDataRecord - 4);
  }
  else {
    uint64_t v13 = 0;
  }
  if ((WebCore::SecurityOriginData *)v13 != v9)
  {
    while (1)
    {
      WebCore::SecurityOriginData::toString((uint64_t *)&v18, v10);
      if (!v18) {
        break;
      }
      v15 = (__CFString *)WTF::StringImpl::operator NSString *();
      v16 = v18;
      v18 = 0;
      if (v16)
      {
        if (*(_DWORD *)v16 == 2)
        {
          WTF::StringImpl::destroy(v16, v14);
          if (!v15) {
            goto LABEL_15;
          }
          goto LABEL_14;
        }
        *(_DWORD *)v16 -= 2;
      }
      if (v15) {
        goto LABEL_14;
      }
LABEL_15:
      while (1)
      {
        v10 = (WebCore::SecurityOriginData *)((char *)v10 + 32);
        if (v10 == v12) {
          break;
        }
        if (!WTF::HashTable<WebCore::SecurityOriginData,WebCore::SecurityOriginData,WTF::IdentityExtractor,WTF::DefaultHash<WebCore::SecurityOriginData>,WTF::HashTraits<WebCore::SecurityOriginData>,WTF::HashTraits<WebCore::SecurityOriginData>>::isEmptyOrDeletedBucket(v10)) {
          goto LABEL_19;
        }
      }
      v10 = v12;
LABEL_19:
      if (v10 == (WebCore::SecurityOriginData *)v13) {
        return (id)(id)CFMakeCollectable(v8);
      }
    }
    v15 = &stru_1EEA10550;
LABEL_14:
    [v8 addObject:v15];
    goto LABEL_15;
  }
  return (id)(id)CFMakeCollectable(v8);
}

@end