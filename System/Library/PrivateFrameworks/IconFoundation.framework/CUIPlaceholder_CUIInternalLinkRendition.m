@interface CUIPlaceholder_CUIInternalLinkRendition
- (BOOL)edgesOnly;
- (BOOL)isInternalLink;
- (BOOL)isOpaque;
- (BOOL)isScaled;
- (BOOL)isTiled;
- (double)alphaCroppedRect;
- (double)originalUncroppedSize;
- (id)_initWithCSIHeader:(const _csiheader *)a3 version:(unsigned int)a4;
- (id)data;
- (id)linkingToRendition;
- (id)metrics;
- (id)properties;
- (id)sliceInformation;
- (int)bitmapEncoding;
- (int)pixelFormat;
- (void)_setStructuredThemeStore:(id)a3;
- (void)dealloc;
@end

@implementation CUIPlaceholder_CUIInternalLinkRendition

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)CUIPlaceholder_CUIInternalLinkRendition;
  [(CUIPlaceholderCUIThemeRendition *)&v3 dealloc];
}

- (void)_setStructuredThemeStore:(id)a3
{
}

- (id)_initWithCSIHeader:(const _csiheader *)a3 version:(unsigned int)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  v22.receiver = self;
  v22.super_class = (Class)CUIPlaceholder_CUIInternalLinkRendition;
  v5 = [(CUIPlaceholderCUIThemeRendition *)&v22 _initWithCSIHeader:a3 version:*(void *)&a4];
  uint64_t var0 = a3->var11.var0;
  if (var0)
  {
    uint64_t var10 = a3->var10;
    long long v26 = 0u;
    memset(v27, 0, sizeof(v27));
    long long v24 = 0u;
    long long v25 = 0u;
    long long v23 = 0u;
    if (var10)
    {
      int v8 = 0;
      v9 = (char *)&a3->var11.var1[var0 + 1] + var10;
      v21 = a3;
      do
      {
        v10 = 0;
        v11 = &v9[-var10];
        do
        {
          int v12 = *(_DWORD *)v11;
          if (*(int *)v11 > 1009)
          {
            if (v12 == 1010)
            {
              uint64_t v17 = *((void *)v11 + 2);
              v18.i64[0] = v17;
              v18.i64[1] = HIDWORD(v17);
              *(float64x2_t *)(v5 + 888) = vcvtq_f64_u64(v18);
              uint64_t v19 = *((void *)v11 + 3);
              v18.i64[0] = v19;
              v18.i64[1] = HIDWORD(v19);
              *(float64x2_t *)(v5 + 904) = vcvtq_f64_u64(v18);
              __memcpy_chk();
              *((void *)v5 + 116) = [[CUIPlaceholderCUIRenditionKey alloc] initWithKeyList:&v23];
              [v5 _initializeTypeIdentifiersWithLayout:*((unsigned __int16 *)v11 + 16)];
            }
            else if (v12 == 1011)
            {
              uint64_t v13 = *((void *)v11 + 2);
              v14.i64[0] = v13;
              v14.i64[1] = HIDWORD(v13);
              *(float64x2_t *)(v5 + 936) = vcvtq_f64_u64(v14);
              uint64_t v15 = *((void *)v11 + 3);
              v14.i64[0] = v15;
              v14.i64[1] = HIDWORD(v15);
              *(float64x2_t *)(v5 + 952) = vcvtq_f64_u64(v14);
              uint64_t v16 = *((void *)v11 + 4);
              v14.i64[0] = v16;
              v14.i64[1] = HIDWORD(v16);
              *(float64x2_t *)(v5 + 968) = vcvtq_f64_u64(v14);
            }
          }
          else if (v12 == 1001)
          {
            v10 = v11 + 8;
            *((_DWORD *)v5 + 54) = *((_DWORD *)v11 + 2);
          }
          else if (v12 == 1006)
          {
            [v5 setExifOrientation:*((unsigned int *)v11 + 2)];
          }
          v11 += *((unsigned int *)v11 + 1) + 8;
        }
        while (v11 < v9);
        if (!v10) {
          break;
        }
        if (++v8 >= v21->var11.var0) {
          return v5;
        }
        uint64_t var10 = v21->var10;
        long long v26 = 0u;
        memset(v27, 0, sizeof(v27));
        long long v24 = 0u;
        long long v25 = 0u;
        long long v23 = 0u;
      }
      while (var10);
    }

    return 0;
  }
  return v5;
}

- (int)bitmapEncoding
{
  id v2 = [(CUIPlaceholderCUIThemeRendition *)self _sourceRendition];

  return [v2 bitmapEncoding];
}

- (BOOL)isOpaque
{
  id v2 = [(CUIPlaceholderCUIThemeRendition *)self _sourceRendition];

  return [v2 isOpaque];
}

- (int)pixelFormat
{
  id v2 = [(CUIPlaceholderCUIThemeRendition *)self _sourceRendition];

  return [v2 pixelFormat];
}

- (BOOL)isInternalLink
{
  return 1;
}

- (id)linkingToRendition
{
  return self->_referenceKey;
}

- (id)sliceInformation
{
  return self->_sliceInformation;
}

- (id)metrics
{
  id v2 = self->_renditionMetrics;

  return v2;
}

- (BOOL)isScaled
{
  return [(CUIPlaceholderCUIThemeRendition *)self subtype] == 31
      || [(CUIPlaceholderCUIThemeRendition *)self subtype] == 12
      || [(CUIPlaceholderCUIThemeRendition *)self type] == 2
      || [(CUIPlaceholderCUIThemeRendition *)self type] == 1;
}

- (id)data
{
  id v2 = [(CUIPlaceholderCUIThemeRendition *)self _sourceRendition];

  return (id)[v2 data];
}

- (id)properties
{
  v8.receiver = self;
  v8.super_class = (Class)CUIPlaceholder_CUIInternalLinkRendition;
  id v3 = [(CUIPlaceholderCUIThemeRendition *)&v8 properties];
  v4 = objc_msgSend(-[CUIPlaceholderCUIThemeRendition _sourceRendition](self, "_sourceRendition"), "properties");
  v5 = v4;
  if (v3)
  {
    if ([v4 count])
    {
      v6 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithDictionary:v3];
      [v6 addEntriesFromDictionary:v5];
    }
    else
    {
      v6 = (void *)[v3 copy];
    }
    return v6;
  }
  return v5;
}

- (BOOL)isTiled
{
  if ([(CUIPlaceholderCUIThemeRendition *)self type] == 3
    || ![(CUIPlaceholderCUIThemeRendition *)self type]
    || [(CUIPlaceholderCUIThemeRendition *)self type] == 5
    || [(CUIPlaceholderCUIThemeRendition *)self type] == 8)
  {
    return [(CUIPlaceholderCUIThemeRendition *)self subtype] == 30
        || [(CUIPlaceholderCUIThemeRendition *)self subtype] == 11;
  }
  [(CUIPlaceholderCUIThemeRendition *)self name];
  _CUILog();
  return 0;
}

- (BOOL)edgesOnly
{
  return [(CUIPlaceholderCUIThemeRendition *)self subtype] == 34
      && CUIRenditionKeyValueForAttribute((unsigned __int16 *)[(CUIPlaceholderCUIThemeRendition *)self key], 11) != 2;
}

- (double)originalUncroppedSize
{
  if (a1) {
    return *(double *)(a1 + 936);
  }
  else {
    return 0.0;
  }
}

- (double)alphaCroppedRect
{
  if (a1) {
    return *(double *)(a1 + 952);
  }
  else {
    return 0.0;
  }
}

- (void).cxx_destruct
{
}

@end