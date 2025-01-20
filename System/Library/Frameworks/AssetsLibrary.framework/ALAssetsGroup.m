@interface ALAssetsGroup
- (ALAssetsGroup)initWithPhotoAlbum:(id)a3 library:(id)a4 type:(unint64_t)a5;
- (ALAssetsGroupPrivate)internal;
- (BOOL)addAsset:(ALAsset *)asset;
- (BOOL)isEditable;
- (BOOL)isValid;
- (CGImageRef)posterImage;
- (NSInteger)numberOfAssets;
- (id)_typeAsString;
- (id)_uuid;
- (id)description;
- (id)valueForProperty:(NSString *)property;
- (void)_enumerateAssetsAtIndexes:(id)a3 options:(unint64_t)a4 usingBlock:(id)a5;
- (void)dealloc;
- (void)enumerateAssetsUsingBlock:(ALAssetsGroupEnumerationResultsBlock)enumerationBlock;
- (void)enumerateAssetsWithOptions:(NSEnumerationOptions)options usingBlock:(ALAssetsGroupEnumerationResultsBlock)enumerationBlock;
- (void)setAssetsFilter:(ALAssetsFilter *)filter;
- (void)setInternal:(id)a3;
@end

@implementation ALAssetsGroup

- (void)setInternal:(id)a3
{
}

- (ALAssetsGroupPrivate)internal
{
  return (ALAssetsGroupPrivate *)self->_internal;
}

- (BOOL)addAsset:(ALAsset *)asset
{
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x2020000000;
  char v15 = 0;
  if (asset)
  {
    v5 = dispatch_semaphore_create(0);
    v10[0] = 0;
    v10[1] = v10;
    v10[2] = 0x2020000000;
    char v11 = 0;
    v6 = (void *)[MEMORY[0x263F5DB78] sharedInstance];
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __26__ALAssetsGroup_addAsset___block_invoke;
    v9[3] = &unk_2642B5B18;
    v9[4] = self;
    v9[5] = asset;
    v9[7] = v10;
    v9[8] = &v12;
    v9[6] = v5;
    [v6 checkPhotosAccessAllowedWithScope:4 handler:v9];
    dispatch_semaphore_wait(v5, 0xFFFFFFFFFFFFFFFFLL);
    dispatch_release(v5);
    BOOL v7 = *((unsigned char *)v13 + 24) != 0;
    _Block_object_dispose(v10, 8);
  }
  else
  {
    BOOL v7 = 0;
  }
  _Block_object_dispose(&v12, 8);
  return v7;
}

intptr_t __26__ALAssetsGroup_addAsset___block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = PLPhotosAccessAllowed();
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)
    && [*(id *)(a1 + 32) isEditable]
    && (uint64_t v2 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "defaultRepresentation"), "url"),
        uint64_t v3 = [*(id *)(a1 + 32) _uuid],
        v2)
    && (uint64_t v4 = v3) != 0)
  {
    v5 = objc_msgSend((id)objc_msgSend(MEMORY[0x263F5DB40], "sharedSystemLibraryAssetsdClient"), "resourceClient");
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __26__ALAssetsGroup_addAsset___block_invoke_2;
    v9[3] = &unk_2642B5AF0;
    uint64_t v6 = *(void *)(a1 + 64);
    v9[4] = *(void *)(a1 + 48);
    v9[5] = v6;
    return [v5 addAssetWithURL:v2 toAlbumWithUUID:v4 completionHandler:v9];
  }
  else
  {
    v8 = *(NSObject **)(a1 + 48);
    return dispatch_semaphore_signal(v8);
  }
}

intptr_t __26__ALAssetsGroup_addAsset___block_invoke_2(uint64_t a1, char a2)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (BOOL)isEditable
{
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x2020000000;
  char v10 = 0;
  if ([(ALAssetsGroup *)self isValid])
  {
    uint64_t v3 = [(ALAssetsGroup *)self internal];
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __27__ALAssetsGroup_isEditable__block_invoke;
    v6[3] = &unk_2642B5A00;
    v6[4] = &v7;
    [(ALAssetsGroupPrivate *)v3 _performBlockAndWait:v6];
  }
  char v4 = *((unsigned char *)v8 + 24);
  _Block_object_dispose(&v7, 8);
  return v4;
}

uint64_t __27__ALAssetsGroup_isEditable__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  if ([a3 isCloudSharedAlbum]) {
    uint64_t result = 0;
  }
  else {
    uint64_t result = [a3 canPerformEditOperation:4];
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

- (void)enumerateAssetsWithOptions:(NSEnumerationOptions)options usingBlock:(ALAssetsGroupEnumerationResultsBlock)enumerationBlock
{
}

- (void)enumerateAssetsUsingBlock:(ALAssetsGroupEnumerationResultsBlock)enumerationBlock
{
}

- (void)_enumerateAssetsAtIndexes:(id)a3 options:(unint64_t)a4 usingBlock:(id)a5
{
  v8 = (void (**)(void, void, void, void))[a5 copy];
  objc_sync_enter(self);
  if ([(ALAssetsGroup *)self isValid] && v8)
  {
    [(ALAssetsGroupPrivate *)[(ALAssetsGroup *)self internal] populateAssets];
    uint64_t v9 = [(ALAssetsGroup *)self internal];
    uint64_t v34 = 0;
    v35 = &v34;
    uint64_t v36 = 0x3052000000;
    v37 = __Block_byref_object_copy__86;
    v38 = __Block_byref_object_dispose__87;
    id v39 = 0;
    id v39 = a3;
    uint64_t v30 = 0;
    v31 = &v30;
    uint64_t v32 = 0x2020000000;
    uint64_t v33 = 0x7FFFFFFFFFFFFFFFLL;
    uint64_t v24 = 0;
    v25 = &v24;
    uint64_t v26 = 0x3052000000;
    v27 = __Block_byref_object_copy__86;
    v28 = __Block_byref_object_dispose__87;
    uint64_t v29 = 0;
    uint64_t v18 = 0;
    v19 = &v18;
    uint64_t v20 = 0x3052000000;
    v21 = __Block_byref_object_copy__86;
    v22 = __Block_byref_object_dispose__87;
    uint64_t v23 = 0;
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __62__ALAssetsGroup__enumerateAssetsAtIndexes_options_usingBlock___block_invoke;
    v17[3] = &unk_2642B5AA0;
    v17[4] = &v34;
    v17[5] = &v18;
    v17[6] = &v30;
    v17[7] = &v24;
    [(ALAssetsGroupPrivate *)v9 _performBlockAndWait:v17];
    id v10 = (id)v35[5];
    id v11 = (id)v25[5];
    if (v19[5])
    {

      objc_exception_throw((id)v19[5]);
    }
    uint64_t v12 = malloc_type_malloc(8 * v31[3], 0x100004000313F17uLL);
    uint64_t v13 = [(id)v35[5] lastIndex];
    v16[0] = 0;
    v16[1] = v13 + 1;
    [(id)v35[5] getIndexes:v12 maxCount:v31[3] inIndexRange:v16];
    uint64_t v14 = (void *)v25[5];
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __62__ALAssetsGroup__enumerateAssetsAtIndexes_options_usingBlock___block_invoke_3;
    v15[3] = &unk_2642B5AC8;
    v15[4] = v9;
    v15[5] = v8;
    v15[6] = v12;
    [v14 enumerateObjectsWithOptions:a4 usingBlock:v15];
    free(v12);
    _Block_object_dispose(&v18, 8);
    _Block_object_dispose(&v24, 8);
    _Block_object_dispose(&v30, 8);
    _Block_object_dispose(&v34, 8);
    LOBYTE(v34) = 0;
    ((void (**)(void, void, uint64_t, uint64_t *))v8)[2](v8, 0, 0x7FFFFFFFFFFFFFFFLL, &v34);
  }
  objc_sync_exit(self);
}

id __62__ALAssetsGroup__enumerateAssetsAtIndexes_options_usingBlock___block_invoke(void *a1, uint64_t a2, void *a3)
{
  if (objc_opt_respondsToSelector())
  {
    v5 = *(void **)(*(void *)(a1[4] + 8) + 40);
    if (v5) {
      unint64_t v6 = [v5 count];
    }
    else {
      unint64_t v6 = -1;
    }
    if (v6 >= 0x7D0) {
      uint64_t v7 = 2000;
    }
    else {
      uint64_t v7 = v6;
    }
    [a3 setBatchSize:v7];
  }
  unint64_t v8 = objc_msgSend((id)objc_msgSend(a3, "assets"), "count");
  uint64_t v9 = *(void **)(*(void *)(a1[4] + 8) + 40);
  if (!v9)
  {
    *(void *)(*(void *)(a1[4] + 8) + 40) = objc_msgSend(objc_alloc(MEMORY[0x263F088D0]), "initWithIndexesInRange:", 0, v8);
    uint64_t v9 = *(void **)(*(void *)(a1[4] + 8) + 40);
  }
  if ([v9 count] <= v8
    && ([*(id *)(*(void *)(a1[4] + 8) + 40) lastIndex] == 0x7FFFFFFFFFFFFFFFLL
     || [*(id *)(*(void *)(a1[4] + 8) + 40) lastIndex] <= v8))
  {
    *(void *)(*(void *)(a1[6] + 8) + 24) = [*(id *)(*(void *)(a1[4] + 8) + 40) count];
    *(void *)(*(void *)(a1[7] + 8) + 40) = [objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:*(void *)(*(void *)(a1[6] + 8) + 24)];
    id v11 = *(void **)(*(void *)(a1[4] + 8) + 40);
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __62__ALAssetsGroup__enumerateAssetsAtIndexes_options_usingBlock___block_invoke_2;
    v13[3] = &unk_2642B5A78;
    uint64_t v12 = a1[7];
    v13[4] = a3;
    v13[5] = v12;
    return (id)[v11 enumerateIndexesUsingBlock:v13];
  }
  else
  {
    id result = (id)[MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF578] reason:@"indexSet count or lastIndex must not exceed -numberOfAssets" userInfo:0];
    *(void *)(*(void *)(a1[5] + 8) + 40) = result;
  }
  return result;
}

void __62__ALAssetsGroup__enumerateAssetsAtIndexes_options_usingBlock___block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = -[ALAsset initWithManagedAsset:library:]([ALAsset alloc], "initWithManagedAsset:library:", a2, [*(id *)(a1 + 32) library]);
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t __62__ALAssetsGroup__enumerateAssetsAtIndexes_options_usingBlock___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "assets"), "objectAtIndex:", a2);
  char v4 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);

  return [v4 addObject:v3];
}

- (NSInteger)numberOfAssets
{
  uint64_t v7 = 0;
  unint64_t v8 = &v7;
  uint64_t v9 = 0x2020000000;
  uint64_t v10 = 0;
  if ([(ALAssetsGroup *)self isValid])
  {
    [(ALAssetsGroupPrivate *)[(ALAssetsGroup *)self internal] populateAssets];
    uint64_t v3 = [(ALAssetsGroup *)self internal];
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __31__ALAssetsGroup_numberOfAssets__block_invoke;
    v6[3] = &unk_2642B5A00;
    v6[4] = &v7;
    [(ALAssetsGroupPrivate *)v3 _performBlockAndWait:v6];
  }
  NSInteger v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

uint64_t __31__ALAssetsGroup_numberOfAssets__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t result = objc_msgSend((id)objc_msgSend(a3, "assets"), "count");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

- (void)setAssetsFilter:(ALAssetsFilter *)filter
{
  if ([(ALAssetsGroup *)self isValid])
  {
    v5 = [(ALAssetsGroup *)self internal];
    [(ALAssetsGroupPrivate *)v5 setAssetsFilter:filter];
  }
}

- (CGImageRef)posterImage
{
  int v3 = _CFExecutableLinkedOnOrAfter();
  if (![(ALAssetsGroup *)self isValid]) {
    return 0;
  }
  NSInteger v4 = [(ALAssetsGroup *)self internal];
  [(ALAssetsGroupPrivate *)v4 populateAssets];
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x3052000000;
  uint64_t v14 = __Block_byref_object_copy__86;
  char v15 = __Block_byref_object_dispose__87;
  uint64_t v16 = 0;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __28__ALAssetsGroup_posterImage__block_invoke;
  v9[3] = &unk_2642B5A50;
  BOOL v10 = v3 == 0;
  v9[4] = &v11;
  [(ALAssetsGroupPrivate *)v4 _performBlockAndWait:v9];
  v5 = (void *)v12[5];
  if (v5)
  {
    unint64_t v6 = (CGImage *)[v5 CGImage];
    id v7 = (id)v12[5];
  }
  else
  {
    unint64_t v6 = 0;
  }
  _Block_object_dispose(&v11, 8);
  return v6;
}

id __28__ALAssetsGroup_posterImage__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  if (*(unsigned char *)(a1 + 40)) {
    a3 = objc_msgSend(MEMORY[0x263F5D910], "unfilteredAlbum:");
  }
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = [a3 posterImage];
  NSInteger v4 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);

  return v4;
}

- (id)valueForProperty:(NSString *)property
{
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x3052000000;
  v19 = __Block_byref_object_copy__86;
  uint64_t v20 = __Block_byref_object_dispose__87;
  uint64_t v21 = 0;
  if ([(ALAssetsGroup *)self isValid])
  {
    id v5 = [(ALAssetsGroupPrivate *)[(ALAssetsGroup *)self internal] valueForProperty:property];
    v17[5] = (uint64_t)v5;
    if (!v5)
    {
      if ([(NSString *)property isEqualToString:@"ALAssetsGroupPropertyType"])
      {
        uint64_t v6 = objc_msgSend(objc_alloc(NSNumber), "initWithUnsignedInteger:", -[ALAssetsGroupPrivate groupType](-[ALAssetsGroup internal](self, "internal"), "groupType"));
        v17[5] = v6;
      }
      else
      {
        unint64_t v8 = [(ALAssetsGroup *)self internal];
        v15[0] = MEMORY[0x263EF8330];
        v15[1] = 3221225472;
        v15[2] = __34__ALAssetsGroup_valueForProperty___block_invoke;
        v15[3] = &unk_2642B5A28;
        v15[5] = self;
        v15[6] = &v16;
        v15[4] = property;
        [(ALAssetsGroupPrivate *)v8 _performBlockAndWait:v15];
      }
      uint64_t v9 = [(ALAssetsGroup *)self internal];
      uint64_t v10 = v17[5];
      if (!v10) {
        uint64_t v10 = [MEMORY[0x263EFF9D0] null];
      }
      [(ALAssetsGroupPrivate *)v9 setValue:v10 forProperty:property];
      id v11 = (id)v17[5];
      id v5 = (id)v17[5];
    }
    uint64_t v12 = [MEMORY[0x263EFF9D0] null];
    id v7 = v17;
    if (v5 == (id)v12) {
      v17[5] = 0;
    }
  }
  else
  {
    id v7 = v17;
  }
  uint64_t v13 = (void *)v7[5];
  _Block_object_dispose(&v16, 8);
  return v13;
}

id __34__ALAssetsGroup_valueForProperty___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  if ([*(id *)(a1 + 32) isEqualToString:@"ALAssetsGroupPropertyName"])
  {
    uint64_t v5 = [a3 localizedTitle];
  }
  else if ([*(id *)(a1 + 32) isEqualToString:@"ALAssetsGroupPropertyPersistentID"])
  {
    uint64_t v5 = [a3 uuid];
  }
  else if ([*(id *)(a1 + 32) isEqualToString:@"ALAssetsGroupPropertyURL"])
  {
    uint64_t v5 = [a3 groupURL];
  }
  else
  {
    if (objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "internal"), "groupType") != 128) {
      goto LABEL_15;
    }
    if ([*(id *)(a1 + 32) isEqualToString:@"ALAssetsGroupPropertyRepresentativeLocationNames"])
    {
      uint64_t v5 = [a3 localizedLocationNames];
    }
    else if ([*(id *)(a1 + 32) isEqualToString:@"ALAssetsGroupPropertyRepresentativeStartDate"])
    {
      uint64_t v5 = [a3 startDate];
    }
    else
    {
      if (![*(id *)(a1 + 32) isEqualToString:@"ALAssetsGroupPropertyRepresentativeEndDate"])goto LABEL_15; {
      uint64_t v5 = [a3 endDate];
      }
    }
  }
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = v5;
LABEL_15:
  uint64_t v6 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);

  return v6;
}

- (BOOL)isValid
{
  uint64_t v2 = [(ALAssetsGroup *)self internal];

  return [(ALAssetsGroupPrivate *)v2 isValid];
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"ALAssetsGroup - Name:%@, Type:%@, Assets count:%ld", -[ALAssetsGroup valueForProperty:](self, "valueForProperty:", @"ALAssetsGroupPropertyName", -[ALAssetsGroup _typeAsString](self, "_typeAsString"), -[ALAssetsGroup numberOfAssets](self, "numberOfAssets")];
}

- (id)_uuid
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3052000000;
  uint64_t v9 = __Block_byref_object_copy__86;
  uint64_t v10 = __Block_byref_object_dispose__87;
  uint64_t v11 = 0;
  uint64_t v2 = [(ALAssetsGroup *)self internal];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __22__ALAssetsGroup__uuid__block_invoke;
  v5[3] = &unk_2642B5A00;
  v5[4] = &v6;
  [(ALAssetsGroupPrivate *)v2 _performBlockAndWait:v5];
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __22__ALAssetsGroup__uuid__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t result = objc_msgSend((id)objc_msgSend(a3, "uuid"), "copy");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = result;
  return result;
}

- (id)_typeAsString
{
  uint64_t v2 = [(ALAssetsGroupPrivate *)[(ALAssetsGroup *)self internal] groupType];
  if (v2 > 15)
  {
    if (v2 > 63)
    {
      if (v2 == 64) {
        return @"Collection";
      }
      if (v2 == 128) {
        return @"Moment";
      }
    }
    else
    {
      if (v2 == 16) {
        return @"Saved Photos";
      }
      if (v2 == 32) {
        return @"Photo Stream";
      }
    }
    return 0;
  }
  else
  {
    uint64_t v3 = v2 - 1;
    id result = @"Library";
    switch(v3)
    {
      case 0:
        return result;
      case 1:
        id result = @"Album";
        break;
      case 3:
        id result = @"Event";
        break;
      case 7:
        id result = @"Faces";
        break;
      default:
        return 0;
    }
  }
  return result;
}

- (void)dealloc
{
  [(ALAssetsGroup *)self setInternal:0];
  v3.receiver = self;
  v3.super_class = (Class)ALAssetsGroup;
  [(ALAssetsGroup *)&v3 dealloc];
}

- (ALAssetsGroup)initWithPhotoAlbum:(id)a3 library:(id)a4 type:(unint64_t)a5
{
  v11.receiver = self;
  v11.super_class = (Class)ALAssetsGroup;
  uint64_t v8 = [(ALAssetsGroup *)&v11 init];
  if (v8)
  {
    uint64_t v9 = [[ALAssetsGroupPrivate alloc] initWithAlbum:a3 library:a4];
    [(ALAssetsGroupPrivate *)v9 setGroupType:a5];
    [(ALAssetsGroup *)v8 setInternal:v9];

    objc_msgSend(a4, "registerAlbum:assetGroupPrivate:", a3, -[ALAssetsGroup internal](v8, "internal"));
  }
  return v8;
}

@end