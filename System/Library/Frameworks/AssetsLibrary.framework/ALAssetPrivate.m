@interface ALAssetPrivate
- (ALAssetPrivate)initWithManagedAsset:(id)a3 library:(id)a4;
- (ALAssetsLibrary)library;
- (BOOL)isDeletable;
- (BOOL)isValid;
- (PLManagedAsset)photo;
- (PLPhotoLibrary)_photoLibrary;
- (void)_performBlockAndWait:(id)a3;
- (void)dealloc;
- (void)libraryDidChange;
- (void)setIsValid:(BOOL)a3;
- (void)setLibrary:(id)a3;
- (void)setPhoto:(id)a3;
- (void)set_photoLibrary:(id)a3;
@end

@implementation ALAssetPrivate

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

- (void)setPhoto:(id)a3
{
}

- (PLManagedAsset)photo
{
  return self->_photo;
}

- (void)_performBlockAndWait:(id)a3
{
  v5 = [(ALAssetPrivate *)self library];
  if (v5)
  {
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __39__ALAssetPrivate__performBlockAndWait___block_invoke;
    v9[3] = &unk_2642B5F28;
    v9[4] = self;
    v9[5] = a3;
    [(ALAssetsLibrary *)v5 _performBlockAndWait:v9];
  }
  else if (_CFExecutableLinkedOnOrAfter())
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __39__ALAssetPrivate__performBlockAndWait___block_invoke_4;
    block[3] = &unk_2642B5F78;
    block[4] = self;
    if (_performBlockAndWait__onceToken_264 != -1) {
      dispatch_once(&_performBlockAndWait__onceToken_264, block);
    }
  }
  else
  {
    objc_sync_enter(self);
    v6 = dispatch_group_create();
    if ([(ALAssetPrivate *)self _photoLibrary])
    {
      photoLibrary = self->_photoLibrary;
      block[5] = MEMORY[0x263EF8330];
      block[6] = 3221225472;
      block[7] = __39__ALAssetPrivate__performBlockAndWait___block_invoke_3;
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
      block[13] = __39__ALAssetPrivate__performBlockAndWait___block_invoke_2;
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

uint64_t __39__ALAssetPrivate__performBlockAndWait___block_invoke(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void, uint64_t, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), a2, *(void *)(*(void *)(a1 + 32) + 24));
}

uint64_t __39__ALAssetPrivate__performBlockAndWait___block_invoke_2(uint64_t a1)
{
  v2 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 32), "objectWithObjectID:", objc_msgSend(*(id *)(*(void *)(a1 + 32) + 24), "objectID"));
  v3 = *(void **)(*(void *)(a1 + 32) + 24);
  if (v3 != v2)
  {

    *(void *)(*(void *)(a1 + 32) + 24) = v2;
  }
  v4 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v4();
}

uint64_t __39__ALAssetPrivate__performBlockAndWait___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(*(void *)(a1 + 32) + 32), *(void *)(*(void *)(a1 + 32) + 24));
}

void __39__ALAssetPrivate__performBlockAndWait___block_invoke_4(uint64_t a1)
{
  uint64_t v2 = objc_opt_class();
  NSLog(&cfstr_InvalidAttempt.isa, v2, *(void *)(a1 + 32));
}

- (BOOL)isDeletable
{
  uint64_t v5 = 0;
  v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 0;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __29__ALAssetPrivate_isDeletable__block_invoke;
  v4[3] = &unk_2642B5ED8;
  v4[4] = &v5;
  [(ALAssetPrivate *)self _performBlockAndWait:v4];
  char v2 = *((unsigned char *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

uint64_t __29__ALAssetPrivate_isDeletable__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t result = [a3 isDeletableFromAssetsLibrary];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
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
  self->_photoLibrary = 0;
  [(ALAssetPrivate *)self setLibrary:0];
  [(ALAssetPrivate *)self setPhoto:0];
  v3.receiver = self;
  v3.super_class = (Class)ALAssetPrivate;
  [(ALAssetPrivate *)&v3 dealloc];
}

- (ALAssetPrivate)initWithManagedAsset:(id)a3 library:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)ALAssetPrivate;
  v6 = [(ALAssetPrivate *)&v9 init];
  uint64_t v7 = v6;
  if (v6)
  {
    [(ALAssetPrivate *)v6 setPhoto:a3];
    [(ALAssetPrivate *)v7 setLibrary:a4];
    [(ALAssetPrivate *)v7 setIsValid:1];
  }
  return v7;
}

@end