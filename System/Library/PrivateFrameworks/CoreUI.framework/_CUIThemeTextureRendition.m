@interface _CUIThemeTextureRendition
- (id)_initWithCSIHeader:(const _csiheader *)a3 version:(unsigned int)a4;
- (id)_texturedImageWithKey:(id)a3;
- (id)mipLevels;
- (id)provideImageInfoAtLevel:(unint64_t)a3 element:(unint64_t)a4 face:(unint64_t)a5 withBufferAllocator:(id)a6;
- (id)provideTextureInfo;
- (int64_t)textureIntepretation;
- (void)_setStructuredThemeStore:(id)a3;
- (void)dealloc;
@end

@implementation _CUIThemeTextureRendition

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)_CUIThemeTextureRendition;
  [(CUIThemeRendition *)&v3 dealloc];
}

- (id)_initWithCSIHeader:(const _csiheader *)a3 version:(unsigned int)a4
{
  v20.receiver = self;
  v20.super_class = (Class)_CUIThemeTextureRendition;
  id v6 = [(CUIThemeRendition *)&v20 _initWithCSIHeader:a3 version:*(void *)&a4];
  uint64_t var10 = a3->var10;
  v8 = (char *)&a3->var0 + 4 * a3->var11.var0 + var10;
  int v10 = *((_DWORD *)v8 + 45);
  v9 = v8 + 180;
  if (v10 != 1415074898)
  {
    [+[NSAssertionHandler currentHandler] handleFailureInMethod:a2 object:v6 file:@"CUIThemeRendition.m" lineNumber:2581 description:@"CoreUI: Expecting a kCSITextureDataSignature but didn't find it"];
    uint64_t var10 = a3->var10;
  }
  if (var10)
  {
    v11 = &v9[-var10];
    do
    {
      if (*(_DWORD *)v11 == 1014)
      {
        *((void *)v6 + 28) = *((unsigned int *)v11 + 3);
        *((unsigned char *)v6 + 232) = *((_DWORD *)v11 + 4) != 0;
      }
      v11 += *((unsigned int *)v11 + 1) + 8;
    }
    while (v11 < v9);
  }
  int v12 = *((unsigned __int16 *)v9 + 10);
  uint64_t v13 = *((unsigned int *)v9 + 2);
  id v14 = objc_alloc_init((Class)TXRTextureInfo);
  *((void *)v6 + 30) = v14;
  [v14 setDimensions:*(double *)&a3->var3];
  [*((id *)v6 + 30) setCubemap:v12 == 5];
  [*((id *)v6 + 30) setPixelFormat:v13];
  [*((id *)v6 + 30) setArrayLength:*((unsigned int *)v9 + 4)];
  [*((id *)v6 + 30) setMipmapLevelCount:*((unsigned __int16 *)v9 + 11)];
  if (*((unsigned char *)v6 + 232)) {
    uint64_t v15 = 2;
  }
  else {
    uint64_t v15 = *((void *)v6 + 28) == 2;
  }
  [*((id *)v6 + 30) setAlphaInfo:v15];
  *((void *)v6 + 31) = [objc_alloc((Class)NSMutableArray) initWithCapacity:*((unsigned __int16 *)v9 + 11)];
  if (*((_WORD *)v9 + 11))
  {
    unsigned int v16 = 0;
    v17 = (unsigned int *)(v9 + 24);
    do
    {
      memset(v21, 0, 92);
      __memcpy_chk();
      v18 = [[CUIRenditionKey alloc] initWithKeyList:v21];
      [*((id *)v6 + 31) addObject:v18];

      v17 = (unsigned int *)((char *)v17 + *v17 + 8);
      ++v16;
    }
    while (v16 < *((unsigned __int16 *)v9 + 11));
  }
  return v6;
}

- (id)mipLevels
{
  return self->_textureMipLevels;
}

- (void)_setStructuredThemeStore:(id)a3
{
}

- (id)_texturedImageWithKey:(id)a3
{
  id v3 = objc_msgSend(objc_loadWeak((id *)&self->_sourceProvider), "renditionWithKey:", objc_msgSend(a3, "keyList"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v4 = (objc_class *)objc_opt_class();
    v5 = NSStringFromClass(v4);
    _CUILog(4, (uint64_t)"CoreUI: tried to find the TextureImageRendition but got back a '%@'", v6, v7, v8, v9, v10, v11, (uint64_t)v5);
    return 0;
  }
  return v3;
}

- (id)provideTextureInfo
{
  return self->_textureInfo;
}

- (int64_t)textureIntepretation
{
  return self->_textureInterpretation;
}

- (id)provideImageInfoAtLevel:(unint64_t)a3 element:(unint64_t)a4 face:(unint64_t)a5 withBufferAllocator:(id)a6
{
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v10 = [(_CUIThemeTextureRendition *)self mipLevels];
  id result = [v10 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (result)
  {
    id v12 = result;
    uint64_t v13 = *(void *)v23;
    while (2)
    {
      id v14 = 0;
      do
      {
        if (*(void *)v23 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = *(void **)(*((void *)&v22 + 1) + 8 * (void)v14);
        if ([v15 themeDimension2] == (id)a3)
        {
          id v16 = [(_CUIThemeTextureRendition *)self _texturedImageWithKey:v15];
          if (v16)
          {
            id v17 = [v16 textureImages];
            if ((unint64_t)[v17 count] >= a5)
            {
              v18 = [v17 objectAtIndex:a5];
              id v19 = [a6 newBufferWithLength:v18[3] * *((unsigned int *)v18 + 9)];
              if (v19)
              {
                objc_super v20 = v19;
                -[CSITextureHelper expandIntoBuffer:error:]((uint64_t)v18, v19);
                id v21 = objc_alloc_init((Class)TXRImageInfo);
                [v21 setOffset:0];
                [v21 setBuffer:v20];
                [v21 setBytesPerRow:v18[3]];
                [v21 setBytesPerImage:*((unsigned int *)v18 + 10)];
                [v21 setError:0];

                return v21;
              }
            }
          }
        }
        id v14 = (char *)v14 + 1;
      }
      while (v12 != v14);
      id result = [v10 countByEnumeratingWithState:&v22 objects:v26 count:16];
      id v12 = result;
      if (result) {
        continue;
      }
      break;
    }
  }
  return result;
}

- (void).cxx_destruct
{
}

@end