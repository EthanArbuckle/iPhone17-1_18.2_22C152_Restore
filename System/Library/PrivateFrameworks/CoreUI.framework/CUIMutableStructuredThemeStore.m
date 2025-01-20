@interface CUIMutableStructuredThemeStore
- (BOOL)canGetRenditionWithKey:(const _renditionkeytoken *)a3;
- (BOOL)usesCUISystemThemeRenditionKey;
- (CUIMutableStructuredThemeStore)initWithIdentifier:(id)a3;
- (_renditionkeytoken)renditionKeyForAssetWithName:(id)a3 withDescription:(id)a4;
- (const)keyFormat;
- (const)renditionKeyForName:(id)a3;
- (id)allImageNames;
- (id)appearances;
- (id)defaultAppearanceName;
- (id)deploymentPlatformString;
- (id)imagesWithName:(id)a3;
- (id)nameForAppearanceIdentifier:(unsigned __int16)a3;
- (id)path;
- (id)renditionInfoForIdentifier:(unsigned __int16)a3;
- (id)renditionWithKey:(const _renditionkeytoken *)a3;
- (id)renditionWithKey:(const _renditionkeytoken *)a3 usingKeySignature:(id)a4;
- (int64_t)maximumRenditionKeyTokenCount;
- (unsigned)appearanceIdentifierForName:(id)a3;
- (void)_addRenditionInfoForImageWithName:(id)a3 andKey:(_renditionkeytoken *)a4;
- (void)_removeRenditionInfoForImageWithName:(id)a3;
- (void)clearRenditionCache;
- (void)dealloc;
- (void)insertCGImage:(CGImage *)a3 withName:(id)a4 andDescription:(id)a5;
- (void)removeImageNamed:(id)a3 withDescription:(id)a4;
- (void)removeImagesNamed:(id)a3;
@end

@implementation CUIMutableStructuredThemeStore

- (id)renditionInfoForIdentifier:(unsigned __int16)a3
{
  uint64_t v3 = a3;
  objc_sync_enter(self);
  id v5 = [(NSMutableDictionary *)self->_renditionInfoStore objectForKey:+[NSNumber numberWithUnsignedShort:v3]];
  objc_sync_exit(self);
  return v5;
}

- (id)appearances
{
  objc_sync_enter(self);
  apperanceNameIdentifierStore = self->_apperanceNameIdentifierStore;
  objc_sync_exit(self);
  return apperanceNameIdentifierStore;
}

- (id)path
{
  return +[NSString stringWithFormat:@"com.apple.coreui.mutablestorage %@", self->_identifier];
}

- (CUIMutableStructuredThemeStore)initWithIdentifier:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CUIMutableStructuredThemeStore;
  v4 = [(CUIMutableStructuredThemeStore *)&v6 init];
  v4->_identifier = (NSString *)a3;
  v4->_memoryStore = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
  v4->_nameIdentifierStore = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
  v4->_renditionInfoStore = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
  v4->_apperanceNameIdentifierStore = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
  return v4;
}

- (unsigned)appearanceIdentifierForName:(id)a3
{
  LOWORD(a3) = (unsigned __int16)objc_msgSend(-[NSMutableDictionary objectForKey:](self->_apperanceNameIdentifierStore, "objectForKey:", a3), "unsignedShortValue");
  objc_sync_exit(self);
  return (unsigned __int16)a3;
}

- (const)renditionKeyForName:(id)a3
{
  objc_sync_enter(self);
  id v5 = [(NSMutableDictionary *)self->_nameIdentifierStore objectForKey:a3];
  if (v5)
  {
    size_t v6 = (*((_DWORD *)[(CUIMutableStructuredThemeStore *)self keyFormat] + 2) + 1);
    v7 = (unsigned __int16 *)malloc_type_calloc(v6, 4uLL, 0x100004052888210uLL);
    CUIRenditionKeySetValueForAttribute(v7, 17, (unsigned __int16)[v5 integerValue], (unsigned __int16)v6);
    v8 = [+[NSData dataWithBytesNoCopy:v7 length:2 * v6 freeWhenDone:1] bytes];
  }
  else
  {
    v8 = 0;
  }
  objc_sync_exit(self);
  return v8;
}

- (BOOL)canGetRenditionWithKey:(const _renditionkeytoken *)a3
{
  return [(CUIMutableStructuredThemeStore *)self renditionWithKey:a3] != 0;
}

- (id)renditionWithKey:(const _renditionkeytoken *)a3
{
  id v5 = [(CUIStructuredThemeStore *)self copyKeySignatureForKey:a3 withBytesNoCopy:v8 length:256];
  id v6 = [(CUIMutableStructuredThemeStore *)self renditionWithKey:a3 usingKeySignature:v5];

  return v6;
}

- (id)renditionWithKey:(const _renditionkeytoken *)a3 usingKeySignature:(id)a4
{
  objc_sync_enter(self);
  id v7 = objc_msgSend(-[NSMutableDictionary objectForKey:](self->_memoryStore, "objectForKey:", +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", CUIRenditionKeyValueForAttribute(&a3->identifier, 17))), "objectForKey:", a4);
  objc_sync_exit(self);
  return v7;
}

- (_renditionkeytoken)renditionKeyForAssetWithName:(id)a3 withDescription:(id)a4
{
  objc_sync_enter(self);
  id v7 = (NSNumber *)[(NSMutableDictionary *)self->_nameIdentifierStore objectForKey:a3];
  unsigned int v8 = *((_DWORD *)[(CUIMutableStructuredThemeStore *)self keyFormat] + 2) + 1;
  v9 = (_renditionkeytoken *)malloc_type_calloc(v8, 4uLL, 0x100004052888210uLL);
  uint64_t v10 = 0;
  for (unint64_t i = 0; i < *((unsigned int *)[(CUIMutableStructuredThemeStore *)self keyFormat] + 2); ++i)
  {
    v9[v10].identifier = *(_DWORD *)((char *)[(CUIMutableStructuredThemeStore *)self keyFormat]
                                   + v10 * 4
                                   + 12);
    ++v10;
  }
  if (!v7)
  {
    ++self->_maxNameIdentifier;
    id v7 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:");
    [(NSMutableDictionary *)self->_nameIdentifierStore setObject:v7 forKey:a3];
  }
  id v12 = [a4 appearanceName];
  if (!v12) {
    id v12 = [(CUIMutableStructuredThemeStore *)self defaultAppearanceName];
  }
  v13 = (NSNumber *)[(NSMutableDictionary *)self->_apperanceNameIdentifierStore objectForKey:v12];
  if (!v13)
  {
    if (objc_msgSend(v12, "isEqualToString:", -[CUIMutableStructuredThemeStore defaultAppearanceName](self, "defaultAppearanceName")))
    {
      v13 = (NSNumber *)&unk_1EF4A69D0;
    }
    else
    {
      ++self->_maxApperanceNameIdentifier;
      v13 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:");
    }
    [(NSMutableDictionary *)self->_apperanceNameIdentifierStore setObject:v13 forKey:v12];
  }
  id v23 = [a4 subtype];
  id v14 = [a4 idiom];
  CUIValidateIdiomSubtypes((uint64_t)v14, (uint64_t *)&v23, v15, v16, v17, v18, v19, v20);
  CUIRenditionKeySetValueForAttribute(&v9->identifier, 17, (unsigned __int16)[(NSNumber *)v7 integerValue], (unsigned __int16)v8);
  CUIRenditionKeySetValueForAttribute(&v9->identifier, 15, (unsigned __int16)[a4 idiom], (unsigned __int16)v8);
  [a4 scale];
  CUIRenditionKeySetValueForAttribute(&v9->identifier, 12, (int)v21, (unsigned __int16)v8);
  CUIRenditionKeySetValueForAttribute(&v9->identifier, 16, (unsigned __int16)v23, (unsigned __int16)v8);
  CUIRenditionKeySetValueForAttribute(&v9->identifier, 24, (unsigned __int16)[a4 displayGamut], (unsigned __int16)v8);
  CUIRenditionKeySetValueForAttribute(&v9->identifier, 4, (unsigned __int16)[a4 layoutDirection], (unsigned __int16)v8);
  CUIRenditionKeySetValueForAttribute(&v9->identifier, 20, (unsigned __int16)[a4 sizeClassHorizontal], (unsigned __int16)v8);
  CUIRenditionKeySetValueForAttribute(&v9->identifier, 21, (unsigned __int16)[a4 sizeClassVertical], (unsigned __int16)v8);
  CUIRenditionKeySetValueForAttribute(&v9->identifier, 7, (unsigned __int16)[(NSNumber *)v13 integerValue], (unsigned __int16)v8);
  objc_sync_exit(self);
  return v9;
}

- (const)keyFormat
{
  int64_t v4 = [(CUIMutableStructuredThemeStore *)self deploymentPlatform];
  if ((unint64_t)(v4 - 1) < 4) {
    goto LABEL_5;
  }
  if (v4 == 5)
  {
    int v11 = 4;
  }
  else
  {
    if (v4 == -1)
    {
      [+[NSAssertionHandler currentHandler] handleFailureInMethod:a2 object:self file:@"CUIMutableStructuredThemeStore.m" lineNumber:64 description:@"Unknown platform kCUIThemeSchemaPlatformUnknown."];
LABEL_5:
      int v11 = 2;
      goto LABEL_6;
    }
    int v11 = 1;
  }
LABEL_6:
  return (const _renditionkeyfmt *)CUIDefaultThemeRenditionKeyFormat(v11, 0xFFFFFFFF, v5, v6, v7, v8, v9, v10);
}

- (id)defaultAppearanceName
{
  if ([(CUIMutableStructuredThemeStore *)self deploymentPlatform]) {
    return @"UIAppearanceAny";
  }
  else {
    return @"NSAppearanceNameSystem";
  }
}

- (void)insertCGImage:(CGImage *)a3 withName:(id)a4 andDescription:(id)a5
{
  objc_sync_enter(self);
  uint64_t v9 = [(CUIMutableStructuredThemeStore *)self renditionKeyForAssetWithName:a4 withDescription:a5];
  id v10 = [(NSMutableDictionary *)self->_nameIdentifierStore objectForKey:a4];
  id v11 = [(CUIStructuredThemeStore *)self copyKeySignatureForKey:v9 withBytesNoCopy:v17 length:256];
  if (!self->_memoryStore) {
    self->_memoryStore = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
  }
  id v12 = [[CUIMutableThemeRendition alloc] initWithCGImage:a3 withDescription:a5 forKey:v9];
  [(CUIMutableThemeRendition *)v12 setName:a4];
  id v13 = [v11 copy];
  id v14 = [(NSMutableDictionary *)self->_memoryStore objectForKey:v10];
  id v15 = v14;
  if (v14)
  {
    [v14 setObject:v12 forKey:v13];
    [(NSMutableDictionary *)self->_memoryStore setObject:v15 forKey:v10];
  }
  else
  {
    id v16 = objc_alloc_init((Class)NSMutableDictionary);
    [v16 setObject:v12 forKey:v13];
    [(NSMutableDictionary *)self->_memoryStore setObject:v16 forKey:v10];
  }
  [(CUIMutableStructuredThemeStore *)self _addRenditionInfoForImageWithName:a4 andKey:v9];
  free(v9);
  objc_sync_exit(self);
}

- (void)_addRenditionInfoForImageWithName:(id)a3 andKey:(_renditionkeytoken *)a4
{
  id v6 = [(NSMutableDictionary *)self->_nameIdentifierStore objectForKey:a3];
  if (v6)
  {
    id v7 = v6;
    id v8 = [(NSMutableDictionary *)self->_renditionInfoStore objectForKey:v6];
    if (v8) {
      uint64_t v9 = (CUINamedRenditionInfo *)[v8 copy];
    }
    else {
      uint64_t v9 = [[CUINamedRenditionInfo alloc] initWithKeyFormat:[(CUIMutableStructuredThemeStore *)self keyFormat] andPlatform:[(CUIMutableStructuredThemeStore *)self deploymentPlatform]];
    }
    id v10 = v9;
    id v14 = v9;
    if (__PAIR64__(a4->value, a4->identifier))
    {
      int v11 = 1;
      do
      {
        -[CUINamedRenditionInfo setAttributePresent:withValue:](v10, "setAttributePresent:withValue:");
        id v10 = v14;
        id v12 = &a4[v11++];
        if (v12->value) {
          BOOL v13 = 0;
        }
        else {
          BOOL v13 = v12->identifier == 0;
        }
      }
      while (!v13);
    }
    [(NSMutableDictionary *)self->_renditionInfoStore setObject:v10 forKey:v7];
  }
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)CUIMutableStructuredThemeStore;
  [(CUIStructuredThemeStore *)&v3 dealloc];
}

- (int64_t)maximumRenditionKeyTokenCount
{
  return 21;
}

- (BOOL)usesCUISystemThemeRenditionKey
{
  return 1;
}

- (id)allImageNames
{
  objc_sync_enter(self);
  id v3 = [(NSMutableDictionary *)self->_nameIdentifierStore allKeys];
  objc_sync_exit(self);
  return v3;
}

- (id)imagesWithName:(id)a3
{
  objc_sync_enter(self);
  id v5 = +[NSMutableArray array];
  id v6 = [(NSMutableDictionary *)self->_memoryStore objectForKey:+[NSNumber numberWithInteger:CUIRenditionKeyValueForAttribute((unsigned __int16 *)[(CUIMutableStructuredThemeStore *)self renditionKeyForName:a3], 17)]];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = __49__CUIMutableStructuredThemeStore_imagesWithName___block_invoke;
  v8[3] = &unk_1E5A51D40;
  v8[4] = a3;
  v8[5] = self;
  v8[6] = v5;
  [v6 enumerateKeysAndObjectsUsingBlock:v8];
  objc_sync_exit(self);
  return v5;
}

void __49__CUIMutableStructuredThemeStore_imagesWithName___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = -[CUIRenditionKey initWithKeyList:]([CUIRenditionKey alloc], "initWithKeyList:", [a3 key]);
  int64_t v4 = -[CUINamedImage initWithName:usingRenditionKey:fromTheme:]([CUINamedImage alloc], "initWithName:usingRenditionKey:fromTheme:", *(void *)(a1 + 32), v5, [*(id *)(a1 + 40) themeIndex]);
  [*(id *)(a1 + 48) addObject:v4];
}

- (void)_removeRenditionInfoForImageWithName:(id)a3
{
  id v4 = [(NSMutableDictionary *)self->_nameIdentifierStore objectForKey:a3];
  if (v4)
  {
    id v5 = v4;
    renditionInfoStore = self->_renditionInfoStore;
    [(NSMutableDictionary *)renditionInfoStore removeObjectForKey:v5];
  }
}

- (void)removeImageNamed:(id)a3 withDescription:(id)a4
{
  objc_sync_enter(self);
  id v7 = [(NSMutableDictionary *)self->_nameIdentifierStore objectForKey:a3];
  if (v7)
  {
    id v8 = [(CUIMutableStructuredThemeStore *)self renditionKeyForAssetWithName:a3 withDescription:a4];
    id v9 = [(CUIStructuredThemeStore *)self copyKeySignatureForKey:v8 withBytesNoCopy:v11 length:256];
    id v10 = [(NSMutableDictionary *)self->_memoryStore objectForKey:v7];
    [v10 removeObjectForKey:v9];
    free(v8);

    if (![v10 count])
    {
      [(CUIMutableStructuredThemeStore *)self _removeRenditionInfoForImageWithName:a3];
      [(NSMutableDictionary *)self->_memoryStore removeObjectForKey:v7];
      [(NSMutableDictionary *)self->_nameIdentifierStore removeObjectForKey:a3];
    }
  }
  objc_sync_exit(self);
}

- (void)removeImagesNamed:(id)a3
{
  objc_sync_enter(self);
  id v5 = [(NSMutableDictionary *)self->_nameIdentifierStore objectForKey:a3];
  if (v5)
  {
    [(NSMutableDictionary *)self->_memoryStore removeObjectForKey:v5];
    [(NSMutableDictionary *)self->_nameIdentifierStore removeObjectForKey:a3];
    [(CUIMutableStructuredThemeStore *)self _removeRenditionInfoForImageWithName:a3];
  }
  objc_sync_exit(self);
}

- (void)clearRenditionCache
{
  objc_sync_enter(self);
  v4.receiver = self;
  v4.super_class = (Class)CUIMutableStructuredThemeStore;
  [(CUIStructuredThemeStore *)&v4 clearRenditionCache];
  id v3 = self->_memoryStore;
  self->_memoryStore = 0;
  [(NSMutableDictionary *)self->_nameIdentifierStore removeAllObjects];
  [(NSMutableDictionary *)self->_renditionInfoStore removeAllObjects];
  [(NSMutableDictionary *)self->_apperanceNameIdentifierStore removeAllObjects];
  self->_maxNameIdentifier = 0;
  self->_maxApperanceNameIdentifier = 0;
  objc_sync_exit(self);
}

- (id)deploymentPlatformString
{
  uint64_t v2 = CUICurrentPlatform();
  return CUIPlatformNameForPlatform(v2);
}

- (id)nameForAppearanceIdentifier:(unsigned __int16)a3
{
  int v3 = a3;
  objc_sync_enter(self);
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  apperanceNameIdentifierStore = self->_apperanceNameIdentifierStore;
  id v6 = [(NSMutableDictionary *)apperanceNameIdentifierStore countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v12;
LABEL_3:
    uint64_t v8 = 0;
    while (1)
    {
      if (*(void *)v12 != v7) {
        objc_enumerationMutation(apperanceNameIdentifierStore);
      }
      id v9 = *(void **)(*((void *)&v11 + 1) + 8 * v8);
      if (objc_msgSend(-[NSMutableDictionary objectForKey:](self->_apperanceNameIdentifierStore, "objectForKey:", v9), "unsignedShortValue") == v3)break; {
      if (v6 == (id)++v8)
      }
      {
        id v6 = [(NSMutableDictionary *)apperanceNameIdentifierStore countByEnumeratingWithState:&v11 objects:v15 count:16];
        if (v6) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:
    id v9 = 0;
  }
  objc_sync_exit(self);
  return v9;
}

@end