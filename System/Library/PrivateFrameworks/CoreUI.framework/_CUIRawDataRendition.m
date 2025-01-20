@interface _CUIRawDataRendition
- (id)_initWithCSIHeader:(const _csiheader *)a3 version:(unsigned int)a4;
- (id)data;
- (int)pixelFormat;
- (void)dealloc;
@end

@implementation _CUIRawDataRendition

- (id)_initWithCSIHeader:(const _csiheader *)a3 version:(unsigned int)a4
{
  v22.receiver = self;
  v22.super_class = (Class)_CUIRawDataRendition;
  v6 = [(CUIThemeRendition *)&v22 _initWithCSIHeader:a3 version:*(void *)&a4];
  if (a3->var6 != 1145132097)
  {
    v19 = +[NSAssertionHandler currentHandler];
    v20 = (objc_class *)objc_opt_class();
    v21 = NSStringFromClass(v20);
    -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:](v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, v6, @"CUIThemeRendition.m", 2289, @"CoreUI: -[%@ %@] pixel format must be kCSIPixelFormatRawData", v21, NSStringFromSelector(a2));
  }
  v7 = (char *)&a3->var0 + 4 * a3->var11.var0 + a3->var10;
  int v9 = *((_DWORD *)v7 + 45);
  v8 = v7 + 180;
  unsigned int v10 = *((_DWORD *)v8 + 2);
  unsigned int v11 = bswap32(v10);
  if (v9 == 1146569042) {
    uint64_t v12 = v11;
  }
  else {
    uint64_t v12 = v10;
  }
  uint64_t v13 = v8 - (unsigned char *)objc_msgSend(objc_msgSend(v6, "srcData"), "bytes") + 12;
  int v14 = *((_DWORD *)v8 + 1);
  v15 = (unsigned int *)[v6 renditionFlags];
  unsigned int v16 = *v15 & 0xFFFFFFC3;
  if (v14)
  {
    unsigned int *v15 = v16 | 0x10;
    v17 = -[_CUISubrangeData initWithData:range:]([_CUISubrangeData alloc], "initWithData:range:", [v6 srcData], v13, v12);
    v6[27] = CUIUncompressDataWithLZFSE((const __CFData *)v17);
  }
  else
  {
    unsigned int *v15 = v16;
    v6[27] = -[_CUISubrangeData initWithData:range:]([_CUISubrangeData alloc], "initWithData:range:", [v6 srcData], v13, v12);
  }
  return v6;
}

- (id)data
{
  v2 = self->_dataBytes;
  return v2;
}

- (void)dealloc
{
  dataBytes = self->_dataBytes;
  if (dataBytes) {
    CFRelease(dataBytes);
  }
  v4.receiver = self;
  v4.super_class = (Class)_CUIRawDataRendition;
  [(CUIThemeRendition *)&v4 dealloc];
}

- (int)pixelFormat
{
  return 1145132097;
}

@end