@interface _CUIThemeTextureImageRendition
- (id)_initWithCSIHeader:(const _csiheader *)a3 version:(unsigned int)a4;
- (id)textureImages;
- (int)pixelFormat;
- (void)dealloc;
@end

@implementation _CUIThemeTextureImageRendition

- (id)_initWithCSIHeader:(const _csiheader *)a3 version:(unsigned int)a4
{
  v40.receiver = self;
  v40.super_class = (Class)_CUIThemeTextureImageRendition;
  v6 = [(CUIThemeRendition *)&v40 _initWithCSIHeader:a3 version:*(void *)&a4];
  v6[27] = [objc_alloc((Class)NSMutableArray) initWithCapacity:a3->var11.var0];
  uint64_t var10 = a3->var10;
  v8 = &a3->var11.var1[a3->var11.var0 + 1];
  v9 = (unsigned int *)((char *)v8 + var10);
  v10 = 0;
  if (var10)
  {
    do
    {
      if (*v8 == 1007)
      {
        v10 = v8 + 2;
      }
      else if (*v8 == 1006)
      {
        [v6 setExifOrientation:v8[2]];
      }
      v8 = (unsigned int *)((char *)v8 + v8[1] + 8);
    }
    while (v8 < v9);
  }
  signed int var6 = a3->var6;
  if (var6 > 1195456543)
  {
    if (var6 == 1195456544) {
      goto LABEL_19;
    }
    if (var6 == 1380401751)
    {
      if ((*((_DWORD *)a3 + 7) & 0xFu) - 3 > 2) {
        v20 = (CFStringRef *)&kCGColorSpaceSRGB;
      }
      else {
        v20 = (CFStringRef *)qword_1E5A58A90[(*((_DWORD *)a3 + 7) & 0xF) - 3];
      }
      v19 = CGColorSpaceCreateWithName(*v20);
      if (!v19)
      {
        _CUILog(1, (uint64_t)"Defaulting to sRGB colorspace", v26, v27, v28, v29, v30, v31, v39);
        CGColorSpaceRef DeviceRGB = CGColorSpaceCreateDeviceRGB();
        goto LABEL_23;
      }
      goto LABEL_27;
    }
LABEL_24:
    v23 = +[NSAssertionHandler currentHandler];
    v24 = (objc_class *)objc_opt_class();
    v25 = NSStringFromClass(v24);
    -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:](v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, v6, @"CUIThemeRendition.m", 2829, @"CoreUI: -[%@ %@] unknown pixel format %d", v25, NSStringFromSelector(a2), a3->var6);
    v19 = 0;
    goto LABEL_27;
  }
  if (var6 == 1095911234)
  {
    v22 = (CFStringRef *)&kCGColorSpaceGenericRGB;
    if ((*((_DWORD *)a3 + 7) & 0xF) != 0) {
      v22 = (CFStringRef *)&kCGColorSpaceSRGB;
    }
    CGColorSpaceRef DeviceRGB = CGColorSpaceCreateWithName(*v22);
    goto LABEL_23;
  }
  if (var6 != 1195454774) {
    goto LABEL_24;
  }
  if ((*((_DWORD *)a3 + 7) & 0xF) == 6) {
    v12 = (CFStringRef *)&kCGColorSpaceExtendedGray;
  }
  else {
    v12 = (CFStringRef *)&kCGColorSpaceGenericGrayGamma2_2;
  }
  v19 = CGColorSpaceCreateWithName(*v12);
  if (!v19)
  {
    _CUILog(1, (uint64_t)"Defaulting to Device Gray colorspace", v13, v14, v15, v16, v17, v18, v39);
LABEL_19:
    CGColorSpaceRef DeviceRGB = CGColorSpaceCreateDeviceGray();
LABEL_23:
    v19 = DeviceRGB;
  }
LABEL_27:
  if (a3->var11.var0)
  {
    unint64_t v32 = 0;
    do
    {
      v33 = (_csibitmap *)((char *)v9 + a3->var11.var1[v32]);
      if (!v32)
      {
        unsigned int var0 = v33->var1.var0;
        v35 = (unsigned int *)[v6 renditionFlags];
        unsigned int *v35 = *v35 & 0xFFFFFFFD | (2 * ((var0 >> 1) & 1));
      }
      v36 = objc_alloc_init(CSITextureHelper);
      v36->bmp = v33;
      v36->colorspaceHint = CGColorSpaceRetain(v19);
      if (v10) {
        unint64_t v37 = *v10;
      }
      else {
        unint64_t v37 = 0;
      }
      v36->sourceRowbytes = v37;
      v36->width = a3->var3;
      v36->height = a3->var4;
      v36->pixelFormat = a3->var6;
      [v6[27] addObject:v36];

      ++v32;
    }
    while (v32 < a3->var11.var0);
  }
  CGColorSpaceRelease(v19);
  return v6;
}

- (int)pixelFormat
{
  return *((_DWORD *)[(NSData *)[(CUIThemeRendition *)self srcData] bytes] + 6);
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)_CUIThemeTextureImageRendition;
  [(CUIThemeRendition *)&v3 dealloc];
}

- (id)textureImages
{
  return self->_textureImages;
}

@end