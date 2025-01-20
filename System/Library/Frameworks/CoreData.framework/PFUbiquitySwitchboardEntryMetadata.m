@interface PFUbiquitySwitchboardEntryMetadata
- (PFUbiquitySwitchboardEntryMetadata)initWithLocalPeerID:(id)a3 ubiquityRootLocation:(id)a4 localRootLocation:(id)a5 storeName:(id)a6 andPrivateQueue:(id)a7;
- (uint64_t)setUseLocalStorage:(uint64_t)result;
- (void)dealloc;
- (void)setUbiquityRootLocation:(uint64_t)a1;
- (void)setUseLocalAccount:(uint64_t)a1;
- (void)tearDown;
@end

@implementation PFUbiquitySwitchboardEntryMetadata

- (void)setUbiquityRootLocation:(uint64_t)a1
{
  if (a1)
  {
    v4 = *(void **)(a1 + 24);
    if (v4 != a2)
    {

      id v6 = a2;
      *(void *)(a1 + 24) = v6;
      v7 = *(void **)(a1 + 80);
      if (v7)
      {
        objc_setProperty_nonatomic(v7, v5, v6, 24);
        id v6 = *(id *)(a1 + 24);
      }
      v8 = *(void **)(a1 + 72);
      if (v8)
      {
        objc_setProperty_nonatomic(v8, v5, v6, 40);
        id v6 = *(id *)(a1 + 24);
      }
      -[PFUbiquitySwitchboardCacheWrapper setUbiquityRootLocation:](*(void *)(a1 + 88), v6);
      if (*(void *)(a1 + 24))
      {
        id v9 = *(id *)(a1 + 120);
        *(void *)(a1 + 120) = [[PFUbiquityBaselineHeuristics alloc] initWithLocalPeerID:*(void *)(a1 + 8) storeName:*(void *)(a1 + 16) modelVersionHash:*(void *)(a1 + 40) andUbiquityRootLocation:*(void *)(a1 + 24)];
      }
      else
      {

        *(void *)(a1 + 120) = 0;
      }
    }
  }
}

- (void)tearDown
{
  if (a1)
  {
    -[_PFUbiquityRecordsImporter tearDown](a1[9]);
    -[_PFUbiquityRecordsExporter stopWatchingForChanges](a1[10]);
    uint64_t v2 = a1[11];
    -[PFUbiquitySwitchboardCacheWrapper cacheWrapperWillBeRemovedFromEntry](v2);
  }
}

- (uint64_t)setUseLocalStorage:(uint64_t)result
{
  if (result)
  {
    uint64_t v3 = result;
    if (+[PFUbiquityLogging canLogMessageAtLevel:0]) {
      NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  %@:%@\nUsing local storage: %d for new NSFileManager current token %@", "-[PFUbiquitySwitchboardEntryMetadata setUseLocalStorage:]", 906, *(void *)(v3 + 8), *(void *)(v3 + 16), a2, objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28CB8], "defaultManager"), "ubiquityIdentityToken"));
    }
    *(unsigned char *)(v3 + 104) = a2;
    uint64_t v4 = *(void *)(v3 + 80);
    if (v4)
    {
      *(unsigned char *)(v4 + 66) = a2;
      *(unsigned char *)(v4 + 65) = a2 ^ 1;
    }
    result = *(void *)(v3 + 72);
    if (a2)
    {
      return -[_PFUbiquityRecordsImporter tearDown](result);
    }
    else if (result && (*(unsigned char *)(result + 24) & 1) == 0)
    {
      *(unsigned char *)(result + 128) = 1;
      *(unsigned char *)(result + 24) = 1;
    }
  }
  return result;
}

- (PFUbiquitySwitchboardEntryMetadata)initWithLocalPeerID:(id)a3 ubiquityRootLocation:(id)a4 localRootLocation:(id)a5 storeName:(id)a6 andPrivateQueue:(id)a7
{
  v14.receiver = self;
  v14.super_class = (Class)PFUbiquitySwitchboardEntryMetadata;
  v12 = [(PFUbiquitySwitchboardEntryMetadata *)&v14 init];
  if (v12)
  {
    *((void *)v12 + 1) = a3;
    *((void *)v12 + 2) = a6;
    *((void *)v12 + 15) = 0;
    -[PFUbiquitySwitchboardEntryMetadata setUbiquityRootLocation:]((uint64_t)v12, a4);
    *((void *)v12 + 4) = a5;
    *((void *)v12 + 5) = 0;
    *((void *)v12 + 6) = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    *(_OWORD *)(v12 + 56) = 0u;
    *(_OWORD *)(v12 + 72) = 0u;
    *((void *)v12 + 11) = 0;
    *((_WORD *)v12 + 52) = 1;
    *((void *)v12 + 14) = a7;
    dispatch_retain((dispatch_object_t)a7);
  }
  return (PFUbiquitySwitchboardEntryMetadata *)v12;
}

- (void)dealloc
{
  self->_localPeerID = 0;
  self->_storeName = 0;

  self->_ubiquityRootLocation = 0;
  self->_localRootLocation = 0;

  self->_activeModelVersionHash = 0;
  self->_stores = 0;

  self->_privatePSC = 0;
  self->_privateStore = 0;

  self->_importer = 0;
  self->_exporter = 0;
  objc_setProperty_nonatomic(self, v3, 0, 88);
  privateQueue = self->_privateQueue;
  self->_privateQueue = 0;
  dispatch_release(privateQueue);

  self->_baselineHeuristics = 0;
  v5.receiver = self;
  v5.super_class = (Class)PFUbiquitySwitchboardEntryMetadata;
  [(PFUbiquitySwitchboardEntryMetadata *)&v5 dealloc];
}

- (void)setUseLocalAccount:(uint64_t)a1
{
  if (a1)
  {
    char v2 = a2;
    if (*(unsigned char *)(a1 + 105) && (a2 & 1) == 0)
    {

      *(void *)(a1 + 80) = 0;
      -[_PFUbiquityRecordsImporter tearDown](*(void *)(a1 + 72));

      *(void *)(a1 + 72) = 0;
      -[PFUbiquitySwitchboardCacheWrapper cacheWrapperWillBeRemovedFromEntry](*(void *)(a1 + 88));

      *(void *)(a1 + 88) = 0;
LABEL_9:
      *(unsigned char *)(a1 + 105) = v2;
      return;
    }
    if (*(unsigned char *)(a1 + 105)) {
      BOOL v4 = 1;
    }
    else {
      BOOL v4 = a2 == 0;
    }
    if (!v4) {
      goto LABEL_9;
    }
  }
}

@end