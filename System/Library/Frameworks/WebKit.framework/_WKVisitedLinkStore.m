@interface _WKVisitedLinkStore
- (BOOL)containsVisitedLinkWithURL:(id)a3;
- (Object)_apiObject;
- (_WKVisitedLinkStore)init;
- (void)addVisitedLinkWithString:(id)a3;
- (void)addVisitedLinkWithURL:(id)a3;
- (void)dealloc;
- (void)removeAll;
- (void)removeVisitedLinkWithURL:(id)a3;
@end

@implementation _WKVisitedLinkStore

- (Object)_apiObject
{
  return (Object *)&self->_visitedLinkStore;
}

- (_WKVisitedLinkStore)init
{
  v5.receiver = self;
  v5.super_class = (Class)_WKVisitedLinkStore;
  v2 = [(_WKVisitedLinkStore *)&v5 init];
  v3 = v2;
  if (v2) {
    *((void *)WebKit::VisitedLinkStore::VisitedLinkStore((WebKit::VisitedLinkStore *)[(_WKVisitedLinkStore *)v2 _apiObject])+ 1) = v2;
  }
  return v3;
}

- (void)dealloc
{
  v3 = (objc_class *)objc_opt_class();
  if ((WebCoreObjCScheduleDeallocateOnMainRunLoop(v3, (objc_object *)self) & 1) == 0)
  {
    WebKit::VisitedLinkStore::~VisitedLinkStore((WebKit::VisitedLinkStore *)&self->_visitedLinkStore);
    v4.receiver = self;
    v4.super_class = (Class)_WKVisitedLinkStore;
    [(_WKVisitedLinkStore *)&v4 dealloc];
  }
}

- (void)addVisitedLinkWithURL:(id)a3
{
  MEMORY[0x19972EAD0](&v8, [a3 absoluteString]);
  int v6 = WebCore::computeSharedStringHash((WebCore *)&v8, v4);
  v7 = v8;
  v8 = 0;
  if (v7)
  {
    if (*(_DWORD *)v7 == 2) {
      WTF::StringImpl::destroy(v7, v5);
    }
    else {
      *(_DWORD *)v7 -= 2;
    }
  }
  WebKit::SharedStringHashStore::scheduleAddition((WebKit::SharedStringHashStore *)&self[1]._visitedLinkStore.data.__lx[8], v6);
}

- (void)addVisitedLinkWithString:(id)a3
{
  MEMORY[0x19972EAD0](&v8, a3);
  int v5 = WebCore::computeSharedStringHash((WebCore *)&v8, v4);
  WebKit::SharedStringHashStore::scheduleAddition((WebKit::SharedStringHashStore *)&self[1]._visitedLinkStore.data.__lx[8], v5);
  v7 = v8;
  v8 = 0;
  if (v7)
  {
    if (*(_DWORD *)v7 == 2) {
      WTF::StringImpl::destroy(v7, v6);
    }
    else {
      *(_DWORD *)v7 -= 2;
    }
  }
}

- (void)removeAll
{
}

- (BOOL)containsVisitedLinkWithURL:(id)a3
{
  MEMORY[0x19972EAD0](&v9, [a3 absoluteString]);
  unsigned int v6 = WebCore::computeSharedStringHash((WebCore *)&v9, v4);
  v7 = v9;
  v9 = 0;
  if (v7)
  {
    if (*(_DWORD *)v7 == 2) {
      WTF::StringImpl::destroy(v7, v5);
    }
    else {
      *(_DWORD *)v7 -= 2;
    }
  }
  return WebKit::SharedStringHashStore::contains((WebKit::SharedStringHashStore *)&self[1]._visitedLinkStore.data.__lx[8], v6);
}

- (void)removeVisitedLinkWithURL:(id)a3
{
  MEMORY[0x19972EAD0](&v8, [a3 absoluteString]);
  int v6 = WebCore::computeSharedStringHash((WebCore *)&v8, v4);
  v7 = v8;
  v8 = 0;
  if (v7)
  {
    if (*(_DWORD *)v7 == 2) {
      WTF::StringImpl::destroy(v7, v5);
    }
    else {
      *(_DWORD *)v7 -= 2;
    }
  }
  WebKit::SharedStringHashStore::scheduleRemoval((WebKit::SharedStringHashStore *)&self[1]._visitedLinkStore.data.__lx[8], v6);
}

@end