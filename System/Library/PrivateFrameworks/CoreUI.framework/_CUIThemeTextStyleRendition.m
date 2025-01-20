@interface _CUIThemeTextStyleRendition
- (const)csiTextStyle;
- (id)_initWithCSIHeader:(const _csiheader *)a3 version:(unsigned int)a4;
@end

@implementation _CUIThemeTextStyleRendition

- (id)_initWithCSIHeader:(const _csiheader *)a3 version:(unsigned int)a4
{
  v10.receiver = self;
  v10.super_class = (Class)_CUIThemeTextStyleRendition;
  v6 = [(CUIThemeRendition *)&v10 _initWithCSIHeader:a3 version:*(void *)&a4];
  v7 = (char *)&a3->var0 + 4 * a3->var11.var0 + a3->var10;
  int v8 = *((_DWORD *)v7 + 45);
  v6[27] = v7 + 180;
  if (v8 != 1398036812) {
    [+[NSAssertionHandler currentHandler] handleFailureInMethod:a2 object:v6 file:@"_CUIThemeTextStyleRendition.m" lineNumber:21 description:@"CoreUI: Expecting a kCSITextStyleSignature but didn't find it"];
  }
  return v6;
}

- (const)csiTextStyle
{
  return self->_csiTextStyle;
}

@end