@interface _CUIThemeModelAssetRendition
- (NSArray)meshKeys;
- (id)_initWithCSIHeader:(const _csiheader *)a3 version:(unsigned int)a4;
- (id)initForArchiving:(id)a3 withMeshRenditionKeys:(id)a4;
- (id)modelAsset;
- (unint64_t)writeToData:(id)a3;
- (void)dealloc;
@end

@implementation _CUIThemeModelAssetRendition

- (id)initForArchiving:(id)a3 withMeshRenditionKeys:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)_CUIThemeModelAssetRendition;
  v6 = [(_CUIThemeModelAssetRendition *)&v8 init];
  if (v6)
  {
    v6->_asset = (MDLAsset *)a3;
    v6->_meshKeys = (NSMutableArray *)[objc_alloc((Class)NSMutableArray) initWithArray:a4];
  }
  return v6;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)_CUIThemeModelAssetRendition;
  [(CUIThemeRendition *)&v3 dealloc];
}

- (id)_initWithCSIHeader:(const _csiheader *)a3 version:(unsigned int)a4
{
  v14.receiver = self;
  v14.super_class = (Class)_CUIThemeModelAssetRendition;
  id v6 = [(CUIThemeRendition *)&v14 _initWithCSIHeader:a3 version:*(void *)&a4];
  if (v6)
  {
    memset(v15, 0, 92);
    v7 = (char *)&a3->var0 + 4 * a3->var11.var0 + a3->var10;
    int v9 = *((_DWORD *)v7 + 45);
    objc_super v8 = v7 + 180;
    if (v9 != 1297040449) {
      [+[NSAssertionHandler currentHandler] handleFailureInMethod:a2 object:v6 file:@"_CUIThemeModelAssetRendition.m" lineNumber:70 description:@"CoreUI: Expecting a kCSIModelAssetSignature but didn't find it"];
    }
    *((void *)v6 + 28) = [objc_alloc((Class)NSMutableArray) initWithCapacity:*((unsigned int *)v8 + 2)];
    if (*((void *)v8 + 1))
    {
      unint64_t v10 = 0;
      v11 = (unsigned int *)(v8 + 16);
      do
      {
        __memcpy_chk();
        v12 = [[CUIRenditionKey alloc] initWithKeyList:v15];
        [*((id *)v6 + 28) addObject:v12];

        v11 = (unsigned int *)((char *)v11 + *v11 + 4);
        ++v10;
      }
      while (v10 < *((void *)v8 + 1));
    }
    *((void *)v6 + 27) = objc_alloc_init(getMDLAssetClass());
  }
  return v6;
}

- (id)modelAsset
{
  return self->_asset;
}

- (NSArray)meshKeys
{
  id v2 = [(NSMutableArray *)self->_meshKeys copy];
  return (NSArray *)v2;
}

- (unint64_t)writeToData:(id)a3
{
  unsigned int v17 = 0;
  v5 = [a3 length];
  v18[0] = 0x14D4F4441;
  v18[1] = [(NSMutableArray *)self->_meshKeys count];
  [a3 appendBytes:v18 length:16];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  meshKeys = self->_meshKeys;
  id v7 = [(NSMutableArray *)meshKeys countByEnumeratingWithState:&v13 objects:v19 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      unint64_t v10 = 0;
      do
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(meshKeys);
        }
        id v11 = [*(id *)(*((void *)&v13 + 1) + 8 * (void)v10) keyList];
        unsigned int v17 = 4 * CUIRenditionKeyTokenCount((uint64_t)v11) + 4;
        [a3 appendBytes:&v17 length:4];
        [a3 appendBytes:v11 length:v17];
        unint64_t v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [(NSMutableArray *)meshKeys countByEnumeratingWithState:&v13 objects:v19 count:16];
    }
    while (v8);
  }
  return (unsigned char *)[a3 length] - v5;
}

@end