@interface ALAssetRepresentationPrivate
+ (int)_fileDescriptorForPersistentURL:(id)a3;
+ (int)_updateFileDescriptor:(int)a3 forPersistentURL:(id)a4;
+ (void)_clearFileDescriptorQueue;
+ (void)_setupFileDescriptorQueue;
- (ALAssetRepresentationPrivate)initWithManagedAsset:(id)a3 sidecar:(id)a4 extension:(id)a5 library:(id)a6;
- (ALAssetsLibrary)library;
- (BOOL)_isImage;
- (BOOL)_isVideo;
- (BOOL)isValid;
- (NSString)extension;
- (PLManagedAsset)photo;
- (PLPhotoLibrary)_photoLibrary;
- (PLSidecar)sidecar;
- (void)_performBlockAndWait:(id)a3;
- (void)dealloc;
- (void)libraryDidChange;
- (void)setExtension:(id)a3;
- (void)setIsValid:(BOOL)a3;
- (void)setLibrary:(id)a3;
- (void)setPhoto:(id)a3;
- (void)setSidecar:(id)a3;
- (void)set_photoLibrary:(id)a3;
@end

@implementation ALAssetRepresentationPrivate

- (void).cxx_destruct
{
}

- (void)set_photoLibrary:(id)a3
{
}

- (PLPhotoLibrary)_photoLibrary
{
  return self->_photoLibrary;
}

- (void)setIsValid:(BOOL)a3
{
  self->_isValid = a3;
}

- (BOOL)isValid
{
  return self->_isValid;
}

- (void)setExtension:(id)a3
{
}

- (NSString)extension
{
  return self->_extension;
}

- (void)setSidecar:(id)a3
{
}

- (PLSidecar)sidecar
{
  return self->_sidecar;
}

- (void)setPhoto:(id)a3
{
}

- (PLManagedAsset)photo
{
  return self->_photo;
}

- (void)_performBlockAndWait:(id)a3
{
  v5 = [(ALAssetRepresentationPrivate *)self library];
  if (v5)
  {
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __53__ALAssetRepresentationPrivate__performBlockAndWait___block_invoke;
    v9[3] = &unk_2642B5F28;
    v9[4] = self;
    v9[5] = a3;
    [(ALAssetsLibrary *)v5 _performBlockAndWait:v9];
  }
  else if (_CFExecutableLinkedOnOrAfter())
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __53__ALAssetRepresentationPrivate__performBlockAndWait___block_invoke_4;
    block[3] = &unk_2642B5F78;
    block[4] = self;
    if (_performBlockAndWait__onceToken != -1) {
      dispatch_once(&_performBlockAndWait__onceToken, block);
    }
  }
  else
  {
    objc_sync_enter(self);
    v6 = dispatch_group_create();
    if ([(ALAssetRepresentationPrivate *)self _photoLibrary])
    {
      photoLibrary = self->_photoLibrary;
      block[5] = MEMORY[0x263EF8330];
      block[6] = 3221225472;
      block[7] = __53__ALAssetRepresentationPrivate__performBlockAndWait___block_invoke_3;
      block[8] = &unk_2642B5F50;
      block[9] = self;
      block[10] = a3;
    }
    else
    {
      photoLibrary = (PLPhotoLibrary *)+[ALAssetsLibrary _library];
      self->_photoLibrary = photoLibrary;
      block[11] = MEMORY[0x263EF8330];
      block[12] = 3221225472;
      block[13] = __53__ALAssetRepresentationPrivate__performBlockAndWait___block_invoke_2;
      block[14] = &unk_2642B5F50;
      block[15] = self;
      block[16] = a3;
    }
    -[PLPhotoLibrary withDispatchGroup:performBlock:](photoLibrary, "withDispatchGroup:performBlock:", v6);
    dispatch_group_wait(v6, 0xFFFFFFFFFFFFFFFFLL);
    dispatch_release(v6);
    objc_sync_exit(self);
  }
}

uint64_t __53__ALAssetRepresentationPrivate__performBlockAndWait___block_invoke(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void, uint64_t, void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), a2, *(void *)(*(void *)(a1 + 32) + 24), *(void *)(*(void *)(a1 + 32) + 32), *(void *)(*(void *)(a1 + 32) + 40));
}

uint64_t __53__ALAssetRepresentationPrivate__performBlockAndWait___block_invoke_2(uint64_t a1)
{
  v2 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 48), "objectWithObjectID:", objc_msgSend(*(id *)(*(void *)(a1 + 32) + 24), "objectID"));
  v3 = objc_msgSend(v2, "sidecarWithResourceObjectID:", objc_msgSend(*(id *)(*(void *)(a1 + 32) + 32), "objectID"));
  uint64_t v4 = *(void *)(a1 + 32);
  v5 = *(void **)(v4 + 24);
  if (v5 != v2)
  {

    *(void *)(*(void *)(a1 + 32) + 24) = v2;
    uint64_t v4 = *(void *)(a1 + 32);
  }
  v6 = *(void **)(v4 + 32);
  if (v6 != v3)
  {

    *(void *)(*(void *)(a1 + 32) + 32) = v3;
  }
  v7 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v7();
}

uint64_t __53__ALAssetRepresentationPrivate__performBlockAndWait___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(*(void *)(a1 + 32) + 48), *(void *)(*(void *)(a1 + 32) + 24), *(void *)(*(void *)(a1 + 32) + 32), *(void *)(*(void *)(a1 + 32) + 40));
}

void __53__ALAssetRepresentationPrivate__performBlockAndWait___block_invoke_4(uint64_t a1)
{
  uint64_t v2 = objc_opt_class();
  NSLog(&cfstr_InvalidAttempt.isa, v2, *(void *)(a1 + 32));
}

- (BOOL)_isVideo
{
  uint64_t v5 = 0;
  v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 0;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __40__ALAssetRepresentationPrivate__isVideo__block_invoke;
  v4[3] = &unk_2642B5EB0;
  v4[4] = self;
  v4[5] = &v5;
  [(ALAssetRepresentationPrivate *)self _performBlockAndWait:v4];
  char v2 = *((unsigned char *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

uint64_t __40__ALAssetRepresentationPrivate__isVideo__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 24) isVideo];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (BOOL)_isImage
{
  uint64_t v5 = 0;
  v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 0;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __40__ALAssetRepresentationPrivate__isImage__block_invoke;
  v4[3] = &unk_2642B5EB0;
  v4[4] = self;
  v4[5] = &v5;
  [(ALAssetRepresentationPrivate *)self _performBlockAndWait:v4];
  char v2 = *((unsigned char *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

uint64_t __40__ALAssetRepresentationPrivate__isImage__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 24) isPhoto];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)libraryDidChange
{
}

- (ALAssetsLibrary)library
{
  return (ALAssetsLibrary *)objc_loadWeak((id *)&self->_library);
}

- (void)setLibrary:(id)a3
{
}

- (void)dealloc
{
  [(ALAssetRepresentationPrivate *)self setLibrary:0];

  self->_photoLibrary = 0;
  self->_extension = 0;

  self->_sidecar = 0;
  self->_photo = 0;
  v3.receiver = self;
  v3.super_class = (Class)ALAssetRepresentationPrivate;
  [(ALAssetRepresentationPrivate *)&v3 dealloc];
}

- (ALAssetRepresentationPrivate)initWithManagedAsset:(id)a3 sidecar:(id)a4 extension:(id)a5 library:(id)a6
{
  v12.receiver = self;
  v12.super_class = (Class)ALAssetRepresentationPrivate;
  v10 = [(ALAssetRepresentationPrivate *)&v12 init];
  if (v10)
  {
    v10->_photo = (PLManagedAsset *)a3;
    v10->_sidecar = (PLSidecar *)a4;
    v10->_extension = (NSString *)[a5 copy];
    [(ALAssetRepresentationPrivate *)v10 setLibrary:a6];
    [(ALAssetRepresentationPrivate *)v10 setIsValid:1];
  }
  return v10;
}

+ (void)_clearFileDescriptorQueue
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  char v2 = objc_opt_class();
  objc_sync_enter(v2);
  if (__persistentURLQueue && [(id)__persistentURLQueue count])
  {
    long long v10 = 0u;
    long long v11 = 0u;
    long long v8 = 0u;
    long long v9 = 0u;
    objc_super v3 = (void *)__persistentURLQueue;
    uint64_t v4 = [(id)__persistentURLQueue countByEnumeratingWithState:&v8 objects:v12 count:16];
    if (v4)
    {
      uint64_t v5 = *(void *)v9;
      do
      {
        for (uint64_t i = 0; i != v4; ++i)
        {
          if (*(void *)v9 != v5) {
            objc_enumerationMutation(v3);
          }
          uint64_t v7 = *(void *)(*((void *)&v8 + 1) + 8 * i);
          close(objc_msgSend((id)objc_msgSend((id)__fileDescriptorDictionary, "objectForKey:", v7), "intValue"));
          [(id)__fileDescriptorDictionary removeObjectForKey:v7];
        }
        uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
      }
      while (v4);
    }
    [(id)__persistentURLQueue removeAllObjects];
  }
  objc_sync_exit(v2);
}

+ (int)_updateFileDescriptor:(int)a3 forPersistentURL:(id)a4
{
  uint64_t v5 = *(void *)&a3;
  +[ALAssetRepresentationPrivate _setupFileDescriptorQueue];
  v6 = objc_opt_class();
  objc_sync_enter(v6);
  uint64_t v7 = (void *)[(id)__fileDescriptorDictionary objectForKey:a4];
  long long v8 = v7;
  if (v7)
  {
    if ([v7 intValue] != v5)
    {
      close(v5);
      LODWORD(v5) = [v8 intValue];
    }
    uint64_t v9 = [(id)__persistentURLQueue indexOfObject:a4];
    uint64_t v10 = [(id)__persistentURLQueue count];
    if (v9 != 0x7FFFFFFFFFFFFFFFLL && v9 != v10 - 1) {
      objc_msgSend((id)__persistentURLQueue, "exchangeObjectAtIndex:withObjectAtIndex:", v9);
    }
  }
  else
  {
    if ((unint64_t)[(id)__persistentURLQueue count] >= 0xA)
    {
      uint64_t v11 = [(id)__persistentURLQueue objectAtIndex:0];
      close(objc_msgSend((id)objc_msgSend((id)__fileDescriptorDictionary, "objectForKey:", v11), "intValue"));
      [(id)__fileDescriptorDictionary removeObjectForKey:v11];
      [(id)__persistentURLQueue removeObject:v11];
    }
    [(id)__persistentURLQueue addObject:a4];
    objc_msgSend((id)__fileDescriptorDictionary, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithInt:", v5), a4);
  }
  objc_sync_exit(v6);
  return v5;
}

+ (int)_fileDescriptorForPersistentURL:(id)a3
{
  +[ALAssetRepresentationPrivate _setupFileDescriptorQueue];
  uint64_t v4 = objc_opt_class();
  objc_sync_enter(v4);
  unint64_t v5 = [(id)__persistentURLQueue indexOfObject:a3];
  if (v5 == 0x7FFFFFFFFFFFFFFFLL || v5 >= [(id)__persistentURLQueue count])
  {
    int v6 = -1;
  }
  else
  {
    int v6 = objc_msgSend((id)objc_msgSend((id)__fileDescriptorDictionary, "objectForKey:", a3), "intValue");
    if ((unint64_t)[(id)__persistentURLQueue count] >= 2
      && v5 != [(id)__persistentURLQueue count] - 1)
    {
      objc_msgSend((id)__persistentURLQueue, "exchangeObjectAtIndex:withObjectAtIndex:", v5);
    }
  }
  objc_sync_exit(v4);
  return v6;
}

+ (void)_setupFileDescriptorQueue
{
  char v2 = objc_opt_class();
  objc_sync_enter(v2);
  if (!__persistentURLQueue) {
    __persistentURLQueue = [objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:10];
  }
  if (!__fileDescriptorDictionary) {
    __fileDescriptorDictionary = [objc_alloc(MEMORY[0x263EFF9A0]) initWithCapacity:10];
  }

  objc_sync_exit(v2);
}

@end