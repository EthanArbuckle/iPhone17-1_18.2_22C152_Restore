@interface CUIPlaceholderCUICarUtilAssetStorage
- (BOOL)_formatStorageKeyArrayBytes:(void *)a3 length:(unint64_t)a4 fromKey:(_renditionkeytoken *)a5;
- (BOOL)caAllowSubimageOfImage:(CGImage *)a3;
- (CUIPlaceholderCUICarUtilAssetStorage)initWithPath:(id)a3 forWriting:(BOOL)a4;
- (id)_newRenditionKeyDataFromKey:(_renditionkeytoken *)a3;
- (id)lookupAssetForKey:(_renditionkeytoken *)a3;
- (id)renditionWithKey:(const _renditionkeytoken *)a3;
- (void)_initDefaultHeaderVersion:(double)a3 versionString:(const char *)a4;
@end

@implementation CUIPlaceholderCUICarUtilAssetStorage

- (CUIPlaceholderCUICarUtilAssetStorage)initWithPath:(id)a3 forWriting:(BOOL)a4
{
  BOOL v4 = a4;
  v10.receiver = self;
  v10.super_class = (Class)CUIPlaceholderCUICarUtilAssetStorage;
  v6 = [(CUIPlaceholderCUICarUtilAssetStorage *)&v10 init];
  if (v6)
  {
    BOMExceptionHandlerSet(__commonAssetStoragetHandler);
    uint64_t v7 = BOMStorageOpenWithSys([a3 fileSystemRepresentation], v4, 0);
    if (!v7)
    {
      fprintf((FILE *)*MEMORY[0x1E4F143C8], "CUIPlaceholder Error: Unable to read file at '%s'\n", (const char *)[a3 UTF8String]);
      goto LABEL_6;
    }
    v8 = (unsigned char *)v7;
    if (![(CUIPlaceholderCUICommonAssetStorage *)v6 _commonInitWithStorage:v7 forWritting:v4])
    {
      BOMStorageFree(v8);
LABEL_6:

      return 0;
    }
  }
  return v6;
}

- (void)_initDefaultHeaderVersion:(double)a3 versionString:(const char *)a4
{
  v4.receiver = self;
  v4.super_class = (Class)CUIPlaceholderCUICarUtilAssetStorage;
  [(CUIPlaceholderCUICommonAssetStorage *)&v4 _initDefaultHeaderVersion:"@(#)PROGRAM:CUIPlaceholder  PROJECT:CoreUI-917.3\n" versionString:917.3];
}

- (BOOL)_formatStorageKeyArrayBytes:(void *)a3 length:(unint64_t)a4 fromKey:(_renditionkeytoken *)a5
{
  v9 = [(CUIPlaceholderCUICommonAssetStorage *)self keyFormat];
  objc_super v10 = [(CUIPlaceholderCUICommonAssetStorage *)self keyAttributeIndex];
  if (!a3 || a4 < 2 * (unint64_t)v9->var2) {
    return 0;
  }
  CUIFillCARKeyArrayForRenditionKey2((uint64_t)a3, (int *)a5, (uint64_t)v9, (uint64_t *)v10);
  return 1;
}

- (id)_newRenditionKeyDataFromKey:(_renditionkeytoken *)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  *(_OWORD *)v15 = 0u;
  v5 = [(CUIPlaceholderCUICommonAssetStorage *)self keyFormat];
  size_t var2 = v5->var2;
  if (var2 < 0x16)
  {
    uint64_t v7 = &v14;
    uint64_t v8 = 42;
  }
  else
  {
    uint64_t v7 = (long long *)malloc_type_calloc(var2, 2uLL, 0x1000040BDFB0063uLL);
    uint64_t v8 = 2 * v5->var2;
  }
  BOOL v9 = [(CUIPlaceholderCUICarUtilAssetStorage *)self _formatStorageKeyArrayBytes:v7 length:v8 fromKey:a3];
  unsigned int v10 = v5->var2;
  if (v9)
  {
    id v11 = objc_alloc(MEMORY[0x1E4F1C9B8]);
    uint64_t v12 = 2 * v5->var2;
    if (v10 < 0x16) {
      return (id)[v11 initWithBytes:v7 length:v12];
    }
    else {
      return (id)[v11 initWithBytesNoCopy:v7 length:v12 freeWhenDone:1];
    }
  }
  else
  {
    if (v10 >= 0x16) {
      free(v7);
    }
    return 0;
  }
}

- (id)lookupAssetForKey:(_renditionkeytoken *)a3
{
  id v4 = [(CUIPlaceholderCUICarUtilAssetStorage *)self _newRenditionKeyDataFromKey:a3];
  id v5 = [(CUIPlaceholderCUICommonAssetStorage *)self assetForKey:v4];

  return v5;
}

- (id)renditionWithKey:(const _renditionkeytoken *)a3
{
  id result = -[CUIPlaceholderCUICarUtilAssetStorage lookupAssetForKey:](self, "lookupAssetForKey:");
  if (result)
  {
    v6 = [[CUIPlaceholderCUIThemeRendition alloc] initWithCSIData:result forKey:a3 version:[(CUIPlaceholderCUICommonAssetStorage *)self distilledInCoreUIVersion]];
    return v6;
  }
  return result;
}

- (BOOL)caAllowSubimageOfImage:(CGImage *)a3
{
  return 0;
}

@end