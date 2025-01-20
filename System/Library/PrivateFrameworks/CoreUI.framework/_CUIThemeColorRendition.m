@interface _CUIThemeColorRendition
- (BOOL)substituteWithSystemColor;
- (CGColor)cgColor;
- (const)csiColor;
- (id)_initWithCSIHeader:(const _csiheader *)a3 version:(unsigned int)a4;
- (id)systemColorName;
- (uint64_t)_colorSpaceWithID:(uint64_t)result;
- (void)dealloc;
@end

@implementation _CUIThemeColorRendition

- (BOOL)substituteWithSystemColor
{
  return (*((unsigned char *)self->_csiColor + 9) & 7) != 0;
}

- (id)systemColorName
{
  return self->_colorName;
}

- (CGColor)cgColor
{
  result = self->_cgColor;
  if (!result)
  {
    v4 = (CGColorSpace *)-[_CUIThemeColorRendition _colorSpaceWithID:]((uint64_t)self, *((unsigned __int8 *)self->_csiColor + 8));
    csiColor = self->_csiColor;
    uint64_t var5 = csiColor->var5;
    v7 = (const CGFloat *)((char *)&v11 - ((8 * var5 + 15) & 0xFFFFFFFF0));
    if (var5)
    {
      var6 = (uint64_t *)csiColor->var6;
      v9 = (uint64_t *)((char *)&v11 - ((8 * var5 + 15) & 0xFFFFFFFF0));
      do
      {
        uint64_t v10 = *var6++;
        *v9++ = v10;
        --var5;
      }
      while (var5);
    }
    self->_cgColor = CGColorCreate(v4, v7);
    return self->_cgColor;
  }
  return result;
}

- (uint64_t)_colorSpaceWithID:(uint64_t)result
{
  if (result)
  {
    switch(a2)
    {
      case 2:
        result = _CUIColorSpaceGetGrayGamma2_2();
        break;
      case 3:
        result = _CUIColorSpaceGetDisplayP3();
        break;
      case 4:
        result = _CUIColorSpaceGetExtendedRangeSRGB();
        break;
      case 5:
        result = _CUIColorSpaceGetExtendedLinearSRGB();
        break;
      case 6:
        result = _CUIColorSpaceGetExtendedGray();
        break;
      default:
        result = _CUIColorSpaceGetSRGB();
        break;
    }
  }
  return result;
}

- (id)_initWithCSIHeader:(const _csiheader *)a3 version:(unsigned int)a4
{
  v15.receiver = self;
  v15.super_class = (Class)_CUIThemeColorRendition;
  v6 = [(CUIThemeRendition *)&v15 _initWithCSIHeader:a3 version:*(void *)&a4];
  v7 = (char *)&a3->var0 + 4 * a3->var11.var0 + a3->var10;
  int v9 = *((_DWORD *)v7 + 45);
  v8 = v7 + 180;
  v6[28] = v8;
  uint64_t v10 = v8;
  if (v9 != 1129270354)
  {
    [+[NSAssertionHandler currentHandler] handleFailureInMethod:a2 object:v6 file:@"_CUIThemeColorRendition.m" lineNumber:25 description:@"CoreUI: Expecting a kCSIColorSignature but didn't find it"];
    uint64_t v10 = (char *)v6[28];
  }
  if ((*((_DWORD *)v10 + 2) & 0x700) == 0x100)
  {
    uint64_t v11 = &v8[8 * *((unsigned int *)v10 + 3)];
    int v13 = *((_DWORD *)v11 + 4);
    v12 = v11 + 16;
    if (v13 != 1129270354) {
      [+[NSAssertionHandler currentHandler] handleFailureInMethod:a2 object:v6 file:@"_CUIThemeColorRendition.m" lineNumber:34 description:@"CoreUI: Expecting a kCSIColorSignature but didn't find it in the extension"];
    }
    if (*((_DWORD *)v12 + 1) == 1) {
      v6[29] = [objc_alloc((Class)NSString) initWithBytes:v12 + 12 length:*((unsigned int *)v12 + 2) encoding:4];
    }
  }
  return v6;
}

- (const)csiColor
{
  return self->_csiColor;
}

- (void)dealloc
{
  CGColorRelease(self->_cgColor);
  v3.receiver = self;
  v3.super_class = (Class)_CUIThemeColorRendition;
  [(CUIThemeRendition *)&v3 dealloc];
}

@end