@interface MFWebKitMainThread
+ (id)sharedInstance;
- (MFWebKitMainThread)init;
- (int)dictValueForMimeType:(id)a3;
- (void)_mainThreadPopulateDictForMimeType:(id)a3;
- (void)dealloc;
@end

@implementation MFWebKitMainThread

+ (id)sharedInstance
{
  v2 = (void *)sWKMTSharedInstance;
  if (!sWKMTSharedInstance)
  {
    v3 = objc_alloc_init(MFWebKitMainThread);
    v4 = (void *)sWKMTSharedInstance;
    sWKMTSharedInstance = (uint64_t)v3;

    v2 = (void *)sWKMTSharedInstance;
  }

  return v2;
}

- (MFWebKitMainThread)init
{
  v6.receiver = self;
  v6.super_class = (Class)MFWebKitMainThread;
  v2 = [(MFWebKitMainThread *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [objc_alloc(MEMORY[0x1E4F734E8]) initWithName:@"MFWebKitMainThread_Lock" andDelegate:v2];
    visibleDictLock = v2->_visibleDictLock;
    v2->_visibleDictLock = (MFLock *)v3;

    v2->_visibleDict = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E4F1D530], 0);
  }
  return v2;
}

- (void)dealloc
{
  visibleDict = self->_visibleDict;
  if (visibleDict) {
    CFRelease(visibleDict);
  }
  v4.receiver = self;
  v4.super_class = (Class)MFWebKitMainThread;
  [(MFWebKitMainThread *)&v4 dealloc];
}

- (void)_mainThreadPopulateDictForMimeType:(id)a3
{
  id key = a3;
  WebThreadLock();
  unsigned int v4 = [MEMORY[0x1E4FB6E08] canShowMIMEType:key];
  [(MFLock *)self->_visibleDictLock lock];
  CFDictionarySetValue(self->_visibleDict, key, (const void *)v4);
  [(MFLock *)self->_visibleDictLock unlock];
}

- (int)dictValueForMimeType:(id)a3
{
  id v4 = a3;
  value = 0;
  [(MFLock *)self->_visibleDictLock lock];
  visibleDict = self->_visibleDict;
  if (!visibleDict || !CFDictionaryGetValueIfPresent(visibleDict, v4, (const void **)&value))
  {
    [(MFLock *)self->_visibleDictLock unlock];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __43__MFWebKitMainThread_dictValueForMimeType___block_invoke;
    v11[3] = &unk_1E5F79038;
    v11[4] = self;
    id v6 = v4;
    id v12 = v6;
    v7 = [MEMORY[0x1E4F60F28] mainThreadScheduler];
    [v7 performSyncBlock:v11];

    [(MFLock *)self->_visibleDictLock lock];
    v8 = self->_visibleDict;
    if (v8) {
      value = (void *)CFDictionaryGetValue(v8, v6);
    }
  }
  [(MFLock *)self->_visibleDictLock unlock];
  int v9 = (int)value;

  return v9;
}

uint64_t __43__MFWebKitMainThread_dictValueForMimeType___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _mainThreadPopulateDictForMimeType:*(void *)(a1 + 40)];
}

- (void).cxx_destruct
{
}

@end