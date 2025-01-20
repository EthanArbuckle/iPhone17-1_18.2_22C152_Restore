@interface CUIPSDImageRef
+ (BOOL)isValidPSDResourceAtPath:(id)a3;
+ (BOOL)isValidPSDResourceAtPath:(id)a3 withImageInfo:(_PSDImageInfo *)a4;
+ (BOOL)isValidPSDResourceAtPath:(id)a3 withLayerCount:(unsigned int *)a4;
+ (BOOL)isValidPSDResourceAtPath:(id)a3 withLayerCount:(unsigned int *)a4 validateLayers:(BOOL)a5;
- ($EFF4F97A94432FEE0F91D8A1E88572D8)metricsInAlphaChannel:(SEL)a3 forRect:(int64_t)a4;
- ($EFF4F97A94432FEE0F91D8A1E88572D8)metricsInMask:(SEL)a3 forRect:(id)a4;
- (BOOL)_treatDividerAsLayer;
- (BOOL)_visibilityAtAbsoluteIndex:(unsigned int)a3;
- (BOOL)loadPSDFileWithLayers:(BOOL)a3;
- (BOOL)openImageFile;
- (CGColorSpace)copyColorSpace;
- (CGImage)_copyCGImageAtAbsoluteIndex:(unsigned int)a3;
- (CGImage)createCompositeCGImage;
- (CGRect)_boundsAtAbsoluteIndex:(unsigned int)a3;
- (CGRect)boundsForSlice:(unsigned int)a3;
- (CGSize)size;
- (CUIPSDImageRef)initWithPath:(id)a3;
- (NSString)path;
- (_PSDImageInfo)imageInfo;
- (double)_fillOpacityAtAbsoluteIndex:(unsigned int)a3;
- (double)_opacityAtAbsoluteIndex:(unsigned int)a3;
- (id)_bevelEmbossFromLayerEffectsInfo:(void *)a3;
- (id)_colorOverlayFromLayerEffectsInfo:(void *)a3;
- (id)_copySublayerInfoAtAbsoluteIndex:(unsigned int)a3 atRoot:(BOOL)a4;
- (id)_createMaskFromSlice:(unsigned int)a3 atAbsoluteIndex:(unsigned int)a4;
- (id)_dropShadowFromLayerEffectsInfo:(void *)a3;
- (id)_fillSampleAtAbsoluteIndex:(unsigned int)a3;
- (id)_gradientAtAbsoluteIndex:(unsigned int)a3;
- (id)_gradientOverlayFromLayerEffectsAtAbsoluteIndex:(unsigned int)a3;
- (id)_imageAtAbsoluteIndex:(unsigned int)a3 isZeroSizeImage:(BOOL *)a4;
- (id)_imageFromSlice:(unsigned int)a3 atAbsoluteIndex:(unsigned int)a4 isEmptyImage:(BOOL *)a5;
- (id)_innerGlowFromLayerEffectsInfo:(void *)a3;
- (id)_innerShadowFromLayerEffectsInfo:(void *)a3;
- (id)_layerEffectsAtAbsoluteIndex:(unsigned int)a3;
- (id)_layerInfo;
- (id)_layerRefAtAbsoluteIndex:(unsigned int)a3;
- (id)_nameAtAbsoluteIndex:(unsigned int)a3;
- (id)_namesOfSublayers:(id)a3;
- (id)_outerGlowFromLayerEffectsInfo:(void *)a3;
- (id)_patternFromSlice:(unsigned int)a3 atAbsoluteIndex:(unsigned int)a4 isZeroSizeImage:(BOOL *)a5;
- (id)colorFromDocumentColor:(double *)a3;
- (id)compositeImage;
- (id)imageAtLayer:(unsigned int)a3;
- (id)imageFromRef:(CGImage *)a3;
- (id)imageFromSlice:(unsigned int)a3 atAbsoluteLayer:(unsigned int)a4;
- (id)imageFromSlice:(unsigned int)a3 atLayer:(unsigned int)a4;
- (id)layerEnumerator;
- (id)layerNames;
- (id)maskFromCompositeAlphaChannel:(int64_t)a3;
- (id)metadataString;
- (id)patternFromSlice:(unsigned int)a3 atLayer:(unsigned int)a4;
- (int)_blendModeAtAbsluteIndex:(unsigned int)a3;
- (int)_layerIndexFromLayerNames:(id)a3 indexRangeBegin:(int)a4 indexRangeEnd:(int)a5 isTopLevel:(BOOL)a6;
- (int)absoluteLayerIndexFromLayerNames:(id)a3;
- (int)cgBlendModeForPSDLayerOrLayerEffectBlendMode:(unsigned int)a3;
- (int)file;
- (unsigned)_absoluteIndexOfRootLayer:(unsigned int)a3;
- (unsigned)numberOfChannels;
- (unsigned)numberOfLayers;
- (unsigned)numberOfSlices;
- (void)_logInvalidAbsoluteIndex:(unsigned int)a3 psd:(void *)a4;
- (void)_psdFileWithLayers:(BOOL)a3;
- (void)_psdLayerRecordAtAbsoluteIndex:(unsigned int)a3;
- (void)dealloc;
- (void)enumerateLayersUsingBlock:(id)a3;
- (void)metadataString;
- (void)psd;
- (void)psdFile;
- (void)psdFileForComposite;
- (void)setFile:(int)a3;
- (void)setPath:(id)a3;
- (void)setPsd:(void *)a3;
@end

@implementation CUIPSDImageRef

+ (BOOL)isValidPSDResourceAtPath:(id)a3
{
  CPSDFile::CPSDFile((CPSDFile *)v7);
  int FileOptionalLogging = CreateFileOptionalLogging((char *)[a3 fileSystemRepresentation], 0, 0);
  if (FileOptionalLogging == -1)
  {
    BOOL v5 = 0;
  }
  else
  {
    BOOL v5 = CPSDFile::ValidateFormat((CPSDFile *)v7, FileOptionalLogging) != 0;
    CloseHandle(FileOptionalLogging);
  }
  CPSDFile::~CPSDFile((CPSDFile *)v7);
  return v5;
}

+ (BOOL)isValidPSDResourceAtPath:(id)a3 withLayerCount:(unsigned int *)a4
{
  CPSDFile::CPSDFile((CPSDFile *)v9);
  uint64_t FileOptionalLogging = CreateFileOptionalLogging((char *)[a3 fileSystemRepresentation], 0, 0);
  if (FileOptionalLogging == -1)
  {
    BOOL v7 = 0;
  }
  else
  {
    if (CPSDFile::LoadLayers((CPSDFile *)v9, FileOptionalLogging))
    {
      *a4 = v10;
      BOOL v7 = 1;
    }
    else
    {
      BOOL v7 = 0;
    }
    CloseHandle(FileOptionalLogging);
  }
  CPSDFile::~CPSDFile((CPSDFile *)v9);
  return v7;
}

+ (BOOL)isValidPSDResourceAtPath:(id)a3 withLayerCount:(unsigned int *)a4 validateLayers:(BOOL)a5
{
  return 0;
}

+ (BOOL)isValidPSDResourceAtPath:(id)a3 withImageInfo:(_PSDImageInfo *)a4
{
  CPSDFile::CPSDFile((CPSDFile *)v10);
  int FileOptionalLogging = CreateFileOptionalLogging((char *)[a3 fileSystemRepresentation], 0, 0);
  if (FileOptionalLogging == -1
    || (BOOL v7 = CPSDFile::GetImageInfo((CPSDFile *)v10, FileOptionalLogging, &a4->var1, &a4->var0, &a4->var3, &a4->var2, &a4->var4) != 0, CloseHandle(FileOptionalLogging), !v7))
  {
    BOOL v8 = 0;
  }
  else
  {
    a4->var5 = CPSDFile::ValidateIsDrawable((CPSDFile *)v10);
    BOOL v8 = 1;
  }
  CPSDFile::~CPSDFile((CPSDFile *)v10);
  return v8;
}

- (BOOL)openImageFile
{
  path = self->_path;
  if (path)
  {
    if (self->_file != -1)
    {
      CloseHandle(self->_file);
      path = self->_path;
    }
    LODWORD(path) = CreateFile((char *)[(NSString *)path fileSystemRepresentation], 0);
    self->_file = (int)path;
    LOBYTE(path) = path != -1;
  }
  return (char)path;
}

- (BOOL)loadPSDFileWithLayers:(BOOL)a3
{
  if (self->_file == -1) {
    return 0;
  }
  BOOL v3 = a3;
  psd = self->_psd;
  if (psd) {
    (*(void (**)(void *, SEL))(*(void *)psd + 8))(psd, a2);
  }
  v6 = (CPSDFile *)operator new();
  CPSDFile::CPSDFile(v6);
  self->_psd = v6;
  SetFilePointer(self->_file, 0, 0, 0);
  BOOL v7 = (CPSDFile *)self->_psd;
  uint64_t file = self->_file;
  if (v3) {
    int Layers = CPSDFile::LoadLayers(v7, file);
  }
  else {
    int Layers = (*(uint64_t (**)(CPSDFile *, uint64_t))(*(void *)v7 + 16))(v7, file);
  }
  return Layers != 0;
}

- (CUIPSDImageRef)initWithPath:(id)a3
{
  v16.receiver = self;
  v16.super_class = (Class)CUIPSDImageRef;
  v4 = [(CUIPSDImageRef *)&v16 init];
  int v15 = 0;
  if (+[CUIPSDImageRef isValidPSDResourceAtPath:a3 withLayerCount:&v15])
  {
    BOOL v5 = (NSString *)[a3 copy];
    v4->_uint64_t file = -1;
    v4->_psd = 0;
    v4->_path = v5;
  }
  else
  {
    v6 = __error();
    strerror(*v6);
    _CUILog(4, (uint64_t)"-[CUIPSDImageRef initWithPath:] - WARNING - invalid or nonexistent file at %@. Image ref not created. '[%s]'", v7, v8, v9, v10, v11, v12, (uint64_t)a3);
    v13 = v4;
    return 0;
  }
  return v4;
}

- (void)dealloc
{
  psd = self->_psd;
  if (psd) {
    (*(void (**)(void *, SEL))(*(void *)psd + 8))(psd, a2);
  }
  int file = self->_file;
  if (file != -1) {
    CloseHandle(file);
  }

  v5.receiver = self;
  v5.super_class = (Class)CUIPSDImageRef;
  [(CUIPSDImageRef *)&v5 dealloc];
}

- (NSString)path
{
  return self->_path;
}

- (void)_psdFileWithLayers:(BOOL)a3
{
  BOOL v3 = a3;
  psd = (CPSDFile *)self->_psd;
  if (psd)
  {
    if (a3)
    {
      if (!self->_parsedForLayers) {
        goto LABEL_6;
      }
      return self->_psd;
    }
    if (CPSDFile::HasCompositeImage(psd)) {
      return self->_psd;
    }
  }
LABEL_6:
  if (self->_file != -1 || !self->_path || [(CUIPSDImageRef *)self openImageFile])
  {
    if (![(CUIPSDImageRef *)self loadPSDFileWithLayers:v3]) {
      self->_psd = 0;
    }
    self->_parsedForint Layers = v3;
    CloseHandle(self->_file);
    self->_int file = -1;
    return self->_psd;
  }
  return 0;
}

- (void)psdFile
{
  return [(CUIPSDImageRef *)self _psdFileWithLayers:1];
}

- (void)psdFileForComposite
{
  return [(CUIPSDImageRef *)self _psdFileWithLayers:0];
}

- (id)imageFromRef:(CGImage *)a3
{
  return +[CUIImage imageWithCGImage:a3];
}

- (id)imageAtLayer:(unsigned int)a3
{
  return [(CUIPSDImageRef *)self _imageAtAbsoluteIndex:*(void *)&a3 isZeroSizeImage:0];
}

- (id)imageFromSlice:(unsigned int)a3 atLayer:(unsigned int)a4
{
  return [(CUIPSDImageRef *)self _imageFromSlice:*(void *)&a3 atAbsoluteIndex:*(void *)&a4 isEmptyImage:0];
}

- (id)imageFromSlice:(unsigned int)a3 atAbsoluteLayer:(unsigned int)a4
{
  return [(CUIPSDImageRef *)self _imageFromSlice:*(void *)&a3 atAbsoluteIndex:*(void *)&a4 isEmptyImage:0];
}

- (id)patternFromSlice:(unsigned int)a3 atLayer:(unsigned int)a4
{
  return [(CUIPSDImageRef *)self _patternFromSlice:*(void *)&a3 atAbsoluteIndex:*(void *)&a4 isZeroSizeImage:0];
}

- (CGImage)createCompositeCGImage
{
  BOOL v3 = [(CUIPSDImageRef *)self psdFileForComposite];
  if (v3)
  {
    CPSDFile::GetCompositeImage(v3);
    if (result)
    {
      uint64_t v5 = (*(uint64_t (**)(CGImage *))(*(void *)result + 16))(result);
      return (CGImage *)(*(uint64_t (**)(uint64_t))(*(void *)v5 + 16))(v5);
    }
  }
  else
  {
    int file = self->_file;
    if (file == -1)
    {
      return 0;
    }
    else
    {
      CloseHandle(file);
      result = 0;
      self->_int file = -1;
    }
  }
  return result;
}

- (id)compositeImage
{
  id result = [(CUIPSDImageRef *)self createCompositeCGImage];
  if (result)
  {
    v4 = (CGImage *)result;
    id v5 = [(CUIPSDImageRef *)self imageFromRef:result];
    CGImageRelease(v4);
    return v5;
  }
  return result;
}

- (id)maskFromCompositeAlphaChannel:(int64_t)a3
{
  id v5 = [(CUIPSDImageRef *)self psdFile];
  unint64_t v6 = *((unsigned __int16 *)v5 + 70);
  uint64_t v7 = *((unsigned __int16 *)v5 + 77);
  uint64_t v8 = 4;
  uint64_t v9 = 3;
  if (v7 != 3) {
    uint64_t v9 = *((unsigned __int16 *)v5 + 70);
  }
  if (v7 != 4) {
    uint64_t v8 = v9;
  }
  if (v7 != 1) {
    uint64_t v7 = v8;
  }
  if (a3 < 1) {
    return 0;
  }
  unint64_t v10 = v7 + a3;
  if (v5[104]) {
    ++v10;
  }
  if (v10 > v6) {
    return 0;
  }
  CPSDFile::GetCompositeImage((CPSDFile *)[(CUIPSDImageRef *)self psdFileForComposite]);
  if (!v11) {
    return 0;
  }
  uint64_t v12 = (*(uint64_t (**)(uint64_t, void))(*(void *)v11 + 24))(v11, (v6 - a3));
  v13 = (CGImage *)(*(uint64_t (**)(uint64_t))(*(void *)v12 + 16))(v12);
  if (!v13) {
    return 0;
  }
  id v14 = [(CUIPSDImageRef *)self imageFromRef:v13];
  CGImageRelease(v13);
  return v14;
}

- (CGRect)boundsForSlice:(unsigned int)a3
{
  v4 = [(CUIPSDImageRef *)self psdFile];
  if (v4)
  {
    id v5 = (_DWORD *)CPSDFile::LookupSliceWithNumber(v4, a3);
    unsigned int v7 = v5[13];
    unsigned int v6 = v5[14];
    double x = (double)v7;
    double y = (double)v6;
    double width = (double)(v5[15] - v7);
    double height = (double)(v5[16] - v6);
  }
  else
  {
    double x = NSZeroRect.origin.x;
    double y = NSZeroRect.origin.y;
    double width = NSZeroRect.size.width;
    double height = NSZeroRect.size.height;
  }
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (int)absoluteLayerIndexFromLayerNames:(id)a3
{
  return [(CUIPSDImageRef *)self _layerIndexFromLayerNames:a3 indexRangeBegin:0xFFFFFFFFLL indexRangeEnd:0xFFFFFFFFLL isTopLevel:1];
}

- (int)_layerIndexFromLayerNames:(id)a3 indexRangeBegin:(int)a4 indexRangeEnd:(int)a5 isTopLevel:(BOOL)a6
{
  BOOL v6 = a6;
  uint64_t v11 = (uint64_t)[a3 count];
  if (v11 < 1) {
    return -1;
  }
  uint64_t v12 = v11;
  v13 = [(CUIPSDImageRef *)self psdFile];
  id v14 = NewCPSDStringFromNSString((NSString *)[a3 objectAtIndex:0]);
  id v15 = 0;
  if (v12 != 1) {
    id v15 = objc_msgSend(a3, "subarrayWithRange:", 1, v12 - 1);
  }
  while (1)
  {
    int IndexOfFirstLayerNamed = CPSDFile::GetIndexOfFirstLayerNamed(v13, (const UniChar **)v14, a4, a5);
    if (IndexOfFirstLayerNamed == -1)
    {
      int v18 = -1;
LABEL_16:
      if (!v14) {
        return v18;
      }
      goto LABEL_19;
    }
    unsigned int v17 = IndexOfFirstLayerNamed;
    if (!v6 || CPSDFile::GetLayerIndexOfParentGroup(v13, IndexOfFirstLayerNamed) == -1) {
      break;
    }
    a4 = v17 + 1;
    int v18 = -1;
LABEL_11:
    if (v18 != -1 || a4 > a5) {
      goto LABEL_16;
    }
  }
  if (v15)
  {
    int v21 = a5;
    int v22 = a4;
    CPSDFile::GetRangeOfChildLayers(v13, v17, &v22, &v21);
    int v18 = [(CUIPSDImageRef *)self _layerIndexFromLayerNames:v15 indexRangeBegin:v22 indexRangeEnd:v21 isTopLevel:0];
    if (v18 == -1) {
      a4 = v17 + 1;
    }
    goto LABEL_11;
  }
  int v18 = v17;
  if (!v14) {
    return v18;
  }
LABEL_19:
  uint64_t v19 = *((void *)v14 + 1);
  if (v19)
  {
    MEMORY[0x1A6230DD0](v19, 0x1000C80BDFB0063);
    *((void *)v14 + 1) = 0;
  }
  MEMORY[0x1A6230DF0](v14, 0x1010C4082113244);
  return v18;
}

- ($EFF4F97A94432FEE0F91D8A1E88572D8)metricsInAlphaChannel:(SEL)a3 forRect:(int64_t)a4
{
  double height = a5.size.height;
  double width = a5.size.width;
  double y = a5.origin.y;
  double x = a5.origin.x;
  CGRect result = [(CUIPSDImageRef *)self maskFromCompositeAlphaChannel:a4];
  if (self)
  {
    return -[CUIPSDImageRef metricsInMask:forRect:](self, "metricsInMask:forRect:", result, x, y, width, height);
  }
  else
  {
    retstr->var1 = 0u;
    retstr->var2 = 0u;
    retstr->var0 = 0u;
  }
  return result;
}

- ($EFF4F97A94432FEE0F91D8A1E88572D8)metricsInMask:(SEL)a3 forRect:(id)a4
{
  double height = a5.size.height;
  double width = a5.size.width;
  double y = a5.origin.y;
  double x = a5.origin.x;
  *retstr = *($EFF4F97A94432FEE0F91D8A1E88572D8 *)CSIIllegalMetrics;
  unint64_t v10 = (CGImage *)[a4 image];
  int64_t BytesPerRow = CGImageGetBytesPerRow(v10);
  CGRect result = ($EFF4F97A94432FEE0F91D8A1E88572D8 *)CGImageGetHeight(v10);
  uint64_t v13 = (uint64_t)x;
  if ((uint64_t)x < 0) {
    return result;
  }
  uint64_t v14 = (uint64_t)(x + width);
  if (BytesPerRow < v14) {
    return result;
  }
  uint64_t v15 = (uint64_t)y;
  if ((uint64_t)y < 0) {
    return result;
  }
  uint64_t v16 = (uint64_t)(y + height);
  if ((uint64_t)result < v16) {
    return result;
  }
  DataProvider = CGImageGetDataProvider(v10);
  CGRect result = ($EFF4F97A94432FEE0F91D8A1E88572D8 *)CGDataProviderCopyData(DataProvider);
  if (!result) {
    return result;
  }
  int v18 = result;
  BytePtr = CFDataGetBytePtr((CFDataRef)result);
  double v20 = retstr->var0.width;
  if (v16 <= v15) {
    goto LABEL_28;
  }
  double v21 = retstr->var1.width;
  uint64_t v22 = (uint64_t)y;
  do
  {
    if (v14 <= v13) {
      goto LABEL_27;
    }
    uint64_t v23 = 0;
    uint64_t v24 = v14 - v13;
    while (1)
    {
      if (BytePtr[v13 + v22 * BytesPerRow + v23])
      {
        if (v20 < 0.0)
        {
          double v20 = (double)v23;
          retstr->var0.double width = (double)v23;
        }
        double v25 = 0.0;
        if (v21 < 0.0 && v24 == 1) {
          goto LABEL_21;
        }
      }
      else if (v21 < 0.0 && v20 >= 0.0)
      {
        double v25 = (double)v24;
LABEL_21:
        retstr->var1.double width = v25;
        double v21 = v25;
      }
      if (v20 >= 0.0 && v21 >= 0.0) {
        break;
      }
      ++v23;
      if (!--v24) {
        goto LABEL_27;
      }
    }
    uint64_t v22 = (uint64_t)(y + height);
LABEL_27:
    ++v22;
  }
  while (v22 < v16);
LABEL_28:
  if (v20 < 0.0) {
    goto LABEL_51;
  }
  uint64_t v27 = (uint64_t)(v20 + (double)v13);
  if (v27 >= v14) {
    goto LABEL_51;
  }
  double v28 = retstr->var1.height;
  double v29 = retstr->var0.height;
  while (2)
  {
    if (v16 <= v15) {
      goto LABEL_50;
    }
    uint64_t v30 = 0;
    uint64_t v31 = v16 - v15;
    v32 = &BytePtr[BytesPerRow * v15];
    while (2)
    {
      if (!v32[v27])
      {
        if (v28 < 0.0 || v29 >= 0.0) {
          goto LABEL_45;
        }
        double v33 = (double)v31;
LABEL_44:
        retstr->var0.double height = v33;
        double v29 = v33;
        goto LABEL_45;
      }
      if (v28 < 0.0)
      {
        double v28 = (double)v30;
        retstr->var1.double height = (double)v30;
      }
      double v33 = 0.0;
      if (v29 < 0.0 && v31 == 1) {
        goto LABEL_44;
      }
LABEL_45:
      if (v29 < 0.0 || v28 < 0.0)
      {
        v32 += BytesPerRow;
        ++v30;
        if (!--v31) {
          goto LABEL_50;
        }
        continue;
      }
      break;
    }
    uint64_t v27 = (uint64_t)(x + width);
LABEL_50:
    if (++v27 < v14) {
      continue;
    }
    break;
  }
LABEL_51:
  if (v20 < 0.0
    || (double v35 = retstr->var0.height, v35 < 0.0)
    || (double v36 = retstr->var1.width, v36 < 0.0)
    || (double v37 = retstr->var1.height, v37 < 0.0))
  {
    retstr->var0 = *(CGSize *)CSIIllegalMetrics;
    retstr->var1 = *(CGSize *)&CSIIllegalMetrics[16];
    retstr->var2 = *(CGSize *)&CSIIllegalMetrics[32];
  }
  else
  {
    retstr->var2.double width = width - v36 - v20;
    retstr->var2.double height = height - v37 - v35;
  }
  CFRelease(v18);
  return result;
}

- (CGColorSpace)copyColorSpace
{
  v2 = [(CUIPSDImageRef *)self psdFile];
  if (!CPSDFile::IsTaggedWithICCProfile((CPSDFile *)v2)) {
    return 0;
  }
  size_t v3 = v2[77];
  if (v3 != 1)
  {
    if (v3 == 4)
    {
      size_t v3 = 4;
    }
    else if (v3 == 3)
    {
      size_t v3 = 3;
    }
    else
    {
      size_t v3 = v2[70];
    }
  }
  ICCProint file = CPSDFile::GetICCProfile((CPSDFile *)v2);
  BOOL v6 = (const void *)(*(uint64_t (**)(uint64_t))(*(void *)ICCProfile + 56))(ICCProfile);
  unsigned int v7 = (*(uint64_t (**)(uint64_t))(*(void *)ICCProfile + 48))(ICCProfile);
  uint64_t v8 = CGDataProviderCreateWithData(0, v6, v7, 0);
  ICCBased = CGColorSpaceCreateICCBased(v3, 0, v8, 0);
  CGDataProviderRelease(v8);
  return ICCBased;
}

- (_PSDImageInfo)imageInfo
{
  CPSDFile::CPSDFile((CPSDFile *)v11);
  bzero(retstr, 0x14uLL);
  int file = self->_file;
  if (file == -1)
  {
    if (![(CUIPSDImageRef *)self openImageFile]) {
      goto LABEL_16;
    }
    int file = self->_file;
  }
  CPSDFile::GetImageInfo((CPSDFile *)v11, file, &retstr->var1, &retstr->var0, &retstr->var3, &retstr->var2, &retstr->var4);
  int v6 = self->_file;
  if (v6 != -1)
  {
    CloseHandle(v6);
    self->_int file = -1;
  }
  BOOL v9 = retstr->var2 == 3 && retstr->var3 == 8 && retstr->var4 == 4;
  retstr->var5 = v9;
LABEL_16:
  CPSDFile::~CPSDFile((CPSDFile *)v11);
  return result;
}

- (unsigned)numberOfLayers
{
  id v2 = [(CUIPSDImageRef *)self _layerInfo];
  return [v2 numberOfSublayers];
}

- (unsigned)numberOfSlices
{
  id v2 = [(CUIPSDImageRef *)self psdFile];
  if (v2) {
    LODWORD(v2) = CPSDFile::GetSliceCount(v2);
  }
  if (v2 <= 2) {
    LODWORD(v2) = 2;
  }
  return v2;
}

- (unsigned)numberOfChannels
{
  id v2 = [(CUIPSDImageRef *)self psdFile];
  if (v2) {
    LODWORD(v2) = v2[70];
  }
  return v2;
}

- (id)layerNames
{
  id v3 = [(CUIPSDImageRef *)self _layerInfo];
  return [(CUIPSDImageRef *)self _namesOfSublayers:v3];
}

- (id)metadataString
{
  id result = [(CUIPSDImageRef *)self psdFile];
  id v5 = 0;
  unsigned int v4 = 0;
  if (result)
  {
    if (CPSDFile::GetXMPMetadataString((CPSDFile *)result, &v5, &v4))
    {
      id v3 = objc_alloc((Class)NSString);
      return [v3 initWithBytes:v5 length:v4 encoding:4];
    }
    else
    {
      return 0;
    }
  }
  return result;
}

- (CGSize)size
{
  if (self)
  {
    [(CUIPSDImageRef *)self imageInfo];
    LODWORD(v3) = 0;
    LODWORD(v2) = 0;
    double v4 = (double)v2;
    double v5 = (double)v3;
  }
  else
  {
    double v5 = 0.0;
    double v4 = 0.0;
  }
  result.double height = v5;
  result.double width = v4;
  return result;
}

- (id)_layerInfo
{
  id result = self->_rootLayers;
  if (!result)
  {
    id result = [(CUIPSDImageRef *)self _copySublayerInfoAtAbsoluteIndex:0 atRoot:1];
    self->_rootint Layers = (_CUIPSDSublayerInfo *)result;
  }
  return result;
}

- (unsigned)_absoluteIndexOfRootLayer:(unsigned int)a3
{
  char v4 = 0;
  return objc_msgSend(-[CUIPSDImageRef _layerInfo](self, "_layerInfo"), "sublayerAtIndex:isValid:", *(void *)&a3, &v4);
}

- (void)_psdLayerRecordAtAbsoluteIndex:(unsigned int)a3
{
  char v4 = [(CUIPSDImageRef *)self psdFile];
  if (!v4 || v4[134] <= a3) {
    return 0;
  }
  return (void *)CPSDFile::GetLayerRecord((CPSDFile *)v4, a3);
}

- (id)_layerRefAtAbsoluteIndex:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  id result = [(CUIPSDImageRef *)self psdFile];
  if (result)
  {
    if (*((unsigned __int16 *)result + 134) <= v3)
    {
      return 0;
    }
    else
    {
      unsigned __int8 v9 = 0;
      int IsSectionDivider = CPSDFile::GetLayerIsSectionDivider((CPSDFile *)result, v3, (BOOL *)&v9);
      if (v9) {
        BOOL v7 = IsSectionDivider == 0;
      }
      else {
        BOOL v7 = 1;
      }
      uint64_t v8 = OBJC_CLASS___CUIPSDLayerGroupRef_ptr;
      if (v7) {
        uint64_t v8 = CUIPSDLayerRef_ptr;
      }
      return [objc_alloc(*v8) initWithImageRef:self layerIndex:v3];
    }
  }
  return result;
}

- (BOOL)_treatDividerAsLayer
{
  return 0;
}

- (id)_copySublayerInfoAtAbsoluteIndex:(unsigned int)a3 atRoot:(BOOL)a4
{
  BOOL v7 = [(CUIPSDImageRef *)self psdFile];
  if (v7)
  {
    unsigned __int8 v8 = [(CUIPSDImageRef *)self _treatDividerAsLayer];
    unsigned __int8 v17 = 0;
    unsigned int v16 = 0;
    if (a4)
    {
      unsigned int v9 = v7[134];
      a3 = v9;
    }
    else
    {
      if (CPSDFile::GetLayerIsSectionDivider((CPSDFile *)v7, a3, (BOOL *)&v17) && !v17
        || CPSDFile::GetLayerSectionDividerType((CPSDFile *)v7, a3, &v16) && v16 != 1 && v16 != 2)
      {
        return 0;
      }
      unsigned int v9 = v7[134];
    }
    uint64_t v10 = a3 - 1;
    if (v10 < v9)
    {
      id v11 = objc_alloc_init((Class)NSMutableIndexSet);
      uint64_t v12 = 1;
      while (1)
      {
        CPSDFile::GetLayerIsSectionDivider((CPSDFile *)v7, v10, (BOOL *)&v17);
        char v13 = v17 ? v8 : 1;
        if (v13) {
          break;
        }
        CPSDFile::GetLayerSectionDividerType((CPSDFile *)v7, v10, &v16);
        if (v16 - 1 <= 1)
        {
          if (v12 == 1) {
            [v11 addIndex:v10];
          }
          ++v12;
LABEL_22:
          BOOL v14 = 1;
          if (!v10) {
            goto LABEL_31;
          }
          goto LABEL_30;
        }
        BOOL v14 = v16 != 3 || v12 > 1;
        if (v16 == 3) {
          v12 -= v12 > 1;
        }
        if (!v10)
        {
LABEL_31:
          BOOL v7 = +[_CUIPSDSublayerInfo newWithSublayerCount:indexSet:](_CUIPSDSublayerInfo, "newWithSublayerCount:indexSet:", [v11 count], v11);

          return v7;
        }
LABEL_30:
        --v10;
        if (!v14) {
          goto LABEL_31;
        }
      }
      if (v12 == 1) {
        [v11 addIndex:v10];
      }
      goto LABEL_22;
    }
    return 0;
  }
  return v7;
}

- (void)_logInvalidAbsoluteIndex:(unsigned int)a3 psd:(void *)a4
{
  _CUILog(1, (uint64_t)"CUIPSDImageRef: Absolute layer index %d is invalid for %@. Absolute layer count is %d.", *(uint64_t *)&a3, (uint64_t)a4, v4, v5, v6, v7, *(uint64_t *)&a3);
}

- (id)_nameAtAbsoluteIndex:(unsigned int)a3
{
  id result = [(CUIPSDImageRef *)self psdFile];
  if (result)
  {
    uint64_t v5 = result;
    if (*((unsigned __int16 *)result + 134) <= a3)
    {
      return 0;
    }
    else
    {
      unsigned int v9 = 0;
      UnicodeLayerName = CPSDLayerRecord::GetUnicodeLayerName((CPSDLayerRecord *)(*((void *)result + 34) + 488 * a3), &v9);
      if (UnicodeLayerName)
      {
        uint64_t v7 = UnicodeLayerName;
        id v8 = objc_alloc((Class)NSString);
        return [v8 initWithCharacters:v7 length:v9];
      }
      else if (*((unsigned __int16 *)v5 + 134) > a3 {
             && CPSDLayerRecord::GetLayerName((CPSDLayerRecord *)(v5[34] + 488 * a3), v10, 0x100u))
      }
      {
        return +[NSString stringWithCString:v10 encoding:30];
      }
      else
      {
        return &stru_1EF488038;
      }
    }
  }
  return result;
}

- (id)_namesOfSublayers:(id)a3
{
  uint64_t v4 = [(CUIPSDImageRef *)self psdFile];
  if (!v4) {
    return 0;
  }
  uint64_t v5 = v4;
  unsigned int v6 = [a3 numberOfSublayers];
  uint64_t v7 = +[NSMutableArray arrayWithCapacity:v6];
  if (v6)
  {
    uint64_t v8 = 0;
    while (1)
    {
      char v19 = 0;
      unsigned int v9 = [a3 sublayerAtIndex:v8 isValid:&v19];
      if (v19) {
        break;
      }
LABEL_14:
      uint64_t v8 = (v8 + 1);
      if (v6 == v8) {
        return v7;
      }
    }
    unsigned int v10 = v9;
    unsigned int v18 = 0;
    unsigned int v11 = *((unsigned __int16 *)v5 + 134);
    if (v9 < v11)
    {
      UnicodeLayerName = CPSDLayerRecord::GetUnicodeLayerName((CPSDLayerRecord *)(v5[34] + 488 * v9), &v18);
      if (UnicodeLayerName)
      {
        char v13 = UnicodeLayerName;
        id v14 = objc_alloc((Class)NSString);
        uint64_t v15 = (NSString *)[v14 initWithCharacters:v13 length:v18];
        goto LABEL_12;
      }
      unsigned int v11 = *((unsigned __int16 *)v5 + 134);
    }
    unsigned int v16 = &stru_1EF488038;
    if (v10 >= v11)
    {
LABEL_13:
      [(NSMutableArray *)v7 addObject:v16];

      goto LABEL_14;
    }
    if (!CPSDLayerRecord::GetLayerName((CPSDLayerRecord *)(v5[34] + 488 * v10), v20, 0x100u))
    {
      unsigned int v16 = &stru_1EF488038;
      goto LABEL_13;
    }
    uint64_t v15 = +[NSString stringWithCString:v20 encoding:30];
LABEL_12:
    unsigned int v16 = (__CFString *)v15;
    goto LABEL_13;
  }
  return v7;
}

- (CGRect)_boundsAtAbsoluteIndex:(unsigned int)a3
{
  uint64_t v4 = [(CUIPSDImageRef *)self psdFile];
  if (v4 && v4[134] > a3 && CPSDFile::GetLayerBounds((uint64_t)v4, a3, &v9))
  {
    double x = (double)v9.i32[0];
    double y = (double)v9.i32[1];
    double width = (double)(v9.i32[2] - v9.i32[0]);
    double height = (double)(v9.i32[3] - v9.i32[1]);
  }
  else
  {
    double x = NSZeroRect.origin.x;
    double y = NSZeroRect.origin.y;
    double width = NSZeroRect.size.width;
    double height = NSZeroRect.size.height;
  }
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (BOOL)_visibilityAtAbsoluteIndex:(unsigned int)a3
{
  uint64_t v4 = [(CUIPSDImageRef *)self psdFile];
  if (v4)
  {
    if (v4[134] <= a3)
    {
      LOBYTE(v4) = 0;
    }
    else
    {
      LOBYTE(v6) = 0;
      CPSDFile::GetLayerIsVisible((CPSDFile *)v4, a3, (BOOL *)&v6);
      LOBYTE(v4) = (_BYTE)v6 != 0;
    }
  }
  return (char)v4;
}

- (double)_opacityAtAbsoluteIndex:(unsigned int)a3
{
  uint64_t v4 = [(CUIPSDImageRef *)self psdFile];
  double v5 = 0.0;
  if (v4 && v4[134] > a3)
  {
    v8[0] = 0;
    CPSDFile::GetLayerOpacity((CPSDFile *)v4, a3, v8);
    LOBYTE(v6) = v8[0];
    return (double)v6 / 255.0;
  }
  return v5;
}

- (double)_fillOpacityAtAbsoluteIndex:(unsigned int)a3
{
  uint64_t v4 = [(CUIPSDImageRef *)self psdFile];
  double v5 = 1.0;
  if (v4 && v4[134] > a3)
  {
    v8[0] = 0;
    if (CPSDFile::GetLayerFillOpacity((CPSDFile *)v4, a3, v8))
    {
      LOBYTE(v6) = v8[0];
      return (double)v6 / 255.0;
    }
    else
    {
      return 0.0;
    }
  }
  return v5;
}

- (int)_blendModeAtAbsluteIndex:(unsigned int)a3
{
  double v5 = [(CUIPSDImageRef *)self psdFile];
  if (v5)
  {
    if (v5[134] <= a3)
    {
      LODWORD(v5) = 0;
    }
    else
    {
      LODWORD(v7) = 0;
      CPSDFile::GetLayerBlendMode((CPSDFile *)v5, a3, (unsigned int *)&v7);
      LODWORD(v5) = [(CUIPSDImageRef *)self cgBlendModeForPSDLayerOrLayerEffectBlendMode:v7];
    }
  }
  return (int)v5;
}

- (CGImage)_copyCGImageAtAbsoluteIndex:(unsigned int)a3
{
  double v5 = [(CUIPSDImageRef *)self psdFile];
  if (v5 && v5[134] > a3)
  {
    CPSDLayerInfo::CreateImageAtLayer((CPSDLayerInfo *)(v5 + 124), a3);
    uint64_t v7 = (*(uint64_t (**)(uint64_t))(*(void *)v6 + 16))(v6);
    uint64_t v8 = (CGImage *)(*(uint64_t (**)(uint64_t))(*(void *)v7 + 16))(v7);
  }
  else
  {
    uint64_t v8 = 0;
  }
  int file = self->_file;
  p_int file = &self->_file;
  int v9 = file;
  if (file != -1)
  {
    CloseHandle(v9);
    *p_int file = -1;
  }
  return v8;
}

- (id)_imageAtAbsoluteIndex:(unsigned int)a3 isZeroSizeImage:(BOOL *)a4
{
  id result = [(CUIPSDImageRef *)self _copyCGImageAtAbsoluteIndex:*(void *)&a3];
  if (result)
  {
    uint64_t v7 = (CGImage *)result;
    if (CGImageGetWidth((CGImageRef)result))
    {
      BOOL v8 = CGImageGetHeight(v7) == 0;
      if (!a4)
      {
LABEL_5:
        id v9 = [(CUIPSDImageRef *)self imageFromRef:v7];
        CGImageRelease(v7);
        return v9;
      }
    }
    else
    {
      BOOL v8 = 1;
      if (!a4) {
        goto LABEL_5;
      }
    }
    *a4 = v8;
    goto LABEL_5;
  }
  return result;
}

- (id)_imageFromSlice:(unsigned int)a3 atAbsoluteIndex:(unsigned int)a4 isEmptyImage:(BOOL *)a5
{
  id v9 = [(CUIPSDImageRef *)self psdFile];
  if (!v9) {
    return 0;
  }
  unsigned int v10 = v9;
  unsigned int v11 = v9[134];
  int SliceCount = CPSDFile::GetSliceCount((CPSDFile *)v9);
  if (v11 <= a4) {
    return 0;
  }
  if (SliceCount) {
    unsigned int v13 = a3;
  }
  else {
    unsigned int v13 = 0;
  }
  id v14 = (CPSDSliceResource *)CPSDFile::LookupSliceWithNumber((CPSDFile *)v10, v13);
  CPSDLayerInfo::CreateImageAtLayerWithSlice((CPSDLayerInfo *)(v10 + 124), a4, v14);
  unsigned int v16 = v15;
  unsigned __int8 v17 = (void *)(*(uint64_t (**)(CPSDLayerSliceImage *))(*(void *)v15 + 16))(v15);
  unsigned int v18 = (CGImage *)(*(uint64_t (**)(void *))(*v17 + 16))(v17);
  if (!v18)
  {
    uint64_t v20 = v17[1];
    if (v20 && *(_DWORD *)(v20 + 8))
    {
      BOOL v21 = *(_DWORD *)(v20 + 12) == 0;
      if (!a5) {
        return 0;
      }
    }
    else
    {
      BOOL v21 = 1;
      if (!a5) {
        return 0;
      }
    }
    id v19 = 0;
    *a5 = v21;
    return v19;
  }
  if (a5) {
    *a5 = CPSDLayerSliceImage::IsEmptyImage(v16) != 0;
  }
  id v19 = [(CUIPSDImageRef *)self imageFromRef:v18];
  CGImageRelease(v18);
  return v19;
}

- (id)_patternFromSlice:(unsigned int)a3 atAbsoluteIndex:(unsigned int)a4 isZeroSizeImage:(BOOL *)a5
{
  BOOL v8 = [(CUIPSDImageRef *)self psdFile];
  id v9 = (CUIPattern *)v8;
  if (v8)
  {
    unsigned int v10 = v8[134];
    int SliceCount = CPSDFile::GetSliceCount((CPSDFile *)v8);
    if (v10 > a4)
    {
      if (SliceCount) {
        unsigned int v12 = a3;
      }
      else {
        unsigned int v12 = 0;
      }
      unsigned int v13 = (CPSDSliceResource *)CPSDFile::LookupSliceWithNumber((CPSDFile *)v9, v12);
      CPSDLayerInfo::CreateImageAtLayerWithSlice((CPSDLayerInfo *)&v9[7]._alpha, a4, v13);
      uint64_t v15 = (void *)(*(uint64_t (**)(uint64_t))(*(void *)v14 + 16))(v14);
      unsigned int v16 = (CGImage *)(*(uint64_t (**)(void *))(*v15 + 16))(v15);
      if (v16)
      {
        id v9 = [[CUIPattern alloc] initWithImageRef:v16];
        CGImageRelease(v16);
        return v9;
      }
      uint64_t v17 = v15[1];
      if (v17 && *(_DWORD *)(v17 + 8))
      {
        BOOL v18 = *(_DWORD *)(v17 + 12) == 0;
        if (!a5) {
          return 0;
        }
LABEL_13:
        id v9 = 0;
        *a5 = v18;
        return v9;
      }
      BOOL v18 = 1;
      if (a5) {
        goto LABEL_13;
      }
    }
    return 0;
  }
  return v9;
}

- (id)_createMaskFromSlice:(unsigned int)a3 atAbsoluteIndex:(unsigned int)a4
{
  uint64_t v7 = [(CUIPSDImageRef *)self psdFile];
  if (!v7) {
    return 0;
  }
  BOOL v8 = v7;
  unsigned int v9 = v7[134];
  int SliceCount = CPSDFile::GetSliceCount((CPSDFile *)v7);
  if (v9 <= a4) {
    return 0;
  }
  unsigned int v11 = SliceCount ? a3 : 0;
  unsigned int v12 = (CPSDSliceResource *)CPSDFile::LookupSliceWithNumber((CPSDFile *)v8, v11);
  CPSDLayerInfo::CreateImageAtLayerWithSlice((CPSDLayerInfo *)(v8 + 124), a4, v12);
  uint64_t v14 = (*(uint64_t (**)(uint64_t, void))(*(void *)v13 + 24))(v13, 0);
  uint64_t v15 = (CGImage *)(*(uint64_t (**)(uint64_t))(*(void *)v14 + 16))(v14);
  if (!v15) {
    return 0;
  }
  id v16 = [(CUIPSDImageRef *)self imageFromRef:v15];
  CGImageRelease(v15);
  return v16;
}

- (id)_fillSampleAtAbsoluteIndex:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  double v5 = -[CUIPSDImageRef createCGImageAtLayer:](self, "createCGImageAtLayer:");
  [(CUIPSDImageRef *)self boundsAtLayer:v3];
  if (!v5) {
    return 0;
  }
  if (rint(v6) == 0.0 || rint(v7) == 0.0)
  {
    CGImageRelease(v5);
    return 0;
  }
  CPSDLayerInfo::CreateImageAtLayer((CPSDLayerInfo *)((char *)[(CUIPSDImageRef *)self psdFile] + 248), v3);
  uint64_t v9 = v8;
  unint64_t v10 = *(unsigned __int16 *)(v8 + 16);
  uint64_t v11 = *(unsigned __int16 *)(v8 + 24);
  unsigned int v12 = [(CUIPSDImageRef *)self copyColorSpace];
  if (v12)
  {
    SRGB = v12;
    CFAutorelease(v12);
  }
  else
  {
    SRGB = (CGColorSpace *)_CUIColorSpaceGetSRGB();
  }
  size_t v15 = v10 >> 3;
  id v16 = malloc_type_calloc(v10 >> 3, 1uLL, 0x68E8B41BuLL);
  uint64_t v17 = CGBitmapContextCreate(v16, 1uLL, 1uLL, 8uLL, v15, SRGB, 2u);
  v28.origin.double x = 0.0;
  v28.origin.double y = 0.0;
  v28.size.double width = 1.0;
  v28.size.double height = 1.0;
  CGContextDrawImage(v17, v28, v5);
  CGImageRelease(v5);
  Data = CGBitmapContextGetData(v17);
  id v19 = (const CGFloat *)operator new[]();
  BOOL v21 = v19;
  if (v11 >= 2)
  {
    uint64_t v22 = Data + 1;
    uint64_t v23 = v11 - 1;
    unint64_t v20 = 0x406FE00000000000;
    uint64_t v24 = (double *)v19;
    do
    {
      unsigned int v25 = *v22++;
      *v24++ = (double)v25 / 255.0;
      --v23;
    }
    while (v23);
  }
  LOBYTE(v20) = *Data;
  v19[v11 - 1] = (double)v20 / 255.0;
  v26 = CGColorCreate(SRGB, v19);
  CGContextRelease(v17);
  free(v16);
  MEMORY[0x1A6230DD0](v21, 0x1000C8000313F17);
  if (v9) {
    (*(void (**)(uint64_t))(*(void *)v9 + 8))(v9);
  }
  if (v26) {
    uint64_t v14 = +[CUIColor colorWithCGColor:v26];
  }
  else {
    uint64_t v14 = 0;
  }
  CGColorRelease(v26);
  return v14;
}

- (int)cgBlendModeForPSDLayerOrLayerEffectBlendMode:(unsigned int)a3
{
  int result = 0;
  if ((int)a3 > 1668246641)
  {
    if ((int)a3 > 1818518630)
    {
      if ((int)a3 > 1870030193)
      {
        if ((int)a3 > 1935766559)
        {
          if (a3 == 1935766560) {
            return 13;
          }
          if (a3 != 1935897198)
          {
            int v4 = 1936553316;
LABEL_14:
            if (a3 == v4) {
              return 11;
            }
            return result;
          }
          return 2;
        }
        if (a3 != 1870030194)
        {
          if (a3 != 1934387572) {
            return result;
          }
          return 8;
        }
        return 3;
      }
      if ((int)a3 > 1819634975)
      {
        if (a3 == 1819634976) {
          return 15;
        }
        int v9 = 1836411936;
        goto LABEL_57;
      }
      if (a3 == 1818518631) {
        return 27;
      }
      int v7 = 1818850405;
      goto LABEL_61;
    }
    if ((int)a3 <= 1749838195)
    {
      if ((int)a3 > 1684629093)
      {
        if (a3 != 1684629094)
        {
          int v5 = 1684633120;
LABEL_51:
          if (a3 == v5) {
            return 6;
          }
          return result;
        }
        return 10;
      }
      if (a3 == 1668246642) {
        return 14;
      }
      if (a3 != 1684107883) {
        return result;
      }
      return 4;
    }
    if ((int)a3 > 1768188277)
    {
      if (a3 != 1768188278)
      {
        int v6 = 1818391150;
LABEL_66:
        if (a3 == v6) {
          return 26;
        }
        return result;
      }
      return 7;
    }
    if (a3 != 1749838196)
    {
      int v8 = 1752524064;
LABEL_37:
      if (a3 == v8) {
        return 12;
      }
      return result;
    }
    return 9;
  }
  if ((int)a3 > 1282240114)
  {
    if ((int)a3 > 1333162603)
    {
      if ((int)a3 > 1399223371)
      {
        if (a3 != 1399223372)
        {
          if (a3 != 1400140404)
          {
            int v4 = 1482910837;
            goto LABEL_14;
          }
          return 13;
        }
        return 8;
      }
      if (a3 != 1333162604)
      {
        if (a3 != 1399026286) {
          return result;
        }
        return 2;
      }
      return 3;
    }
    if ((int)a3 <= 1282240117)
    {
      if (a3 != 1282240115)
      {
        int v6 = 1282240116;
        goto LABEL_66;
      }
      return 15;
    }
    if (a3 != 1282240118)
    {
      int v9 = 1298953328;
LABEL_57:
      if (a3 == v9) {
        return 1;
      }
      return result;
    }
    return 27;
  }
  if ((int)a3 <= 1148349293)
  {
    if ((int)a3 <= 1131180575)
    {
      if (a3 != 1128428142)
      {
        int v5 = 1128555623;
        goto LABEL_51;
      }
      return 7;
    }
    if (a3 != 1131180576)
    {
      if (a3 != 1147564654) {
        return result;
      }
      return 10;
    }
    return 14;
  }
  if ((int)a3 <= 1215456331)
  {
    if (a3 != 1148349294)
    {
      int v8 = 1210064928;
      goto LABEL_37;
    }
    return 4;
  }
  if (a3 == 1215456332) {
    return 9;
  }
  int v7 = 1281845358;
LABEL_61:
  if (a3 == v7) {
    return 5;
  }
  return result;
}

- (id)_gradientAtAbsoluteIndex:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  int v5 = [(CUIPSDImageRef *)self psdFile];
  if (!v5) {
    return 0;
  }
  int v6 = v5;
  unsigned int v72 = 0;
  int LayerGradientStyle = CPSDFile::GetLayerGradientStyle(v5, v3, &v72);
  if (!LayerGradientStyle && !CPSDFile::GetLayerEffectGradientStyle(v6, v3, &v72)) {
    return 0;
  }
  double v70 = 0.0;
  long double v71 = 0.0;
  double v68 = 1.0;
  *(void *)v69 = 0;
  *(_WORD *)v67 = 0;
  unsigned int v66 = 0;
  if (!LayerGradientStyle)
  {
    if (CPSDFile::GetLayerEffectGradientAngle(v6, v3, &v71)
      && CPSDFile::GetLayerEffectGradientSmoothing(v6, v3, &v70))
    {
      int v8 = 0;
      if (!CPSDFile::GetLayerEffectGradientColorStopCount(v6, v3, &v69[1]) || !v69[1]) {
        return v8;
      }
      if (CPSDFile::GetLayerEffectGradientOpacityStopCount(v6, v3, v69)
        && CPSDFile::GetLayerEffectOpacity(v6, v3, &v68)
        && CPSDFile::GetLayerEffectGradientBlendMode(v6, v3, &v66))
      {
        double v68 = v68 / 100.0;
        double v36 = (CGColor *)objc_msgSend(-[CUIPSDImageRef fillSampleAtLayer:](self, "fillSampleAtLayer:", v3), "CGColor");
        if (v36)
        {
          Components = CGColorGetComponents(v36);
          double v11 = *Components;
          double v10 = Components[1];
          double v9 = Components[2];
        }
        else
        {
          double v9 = 0.0;
          double v10 = 0.0;
          double v11 = 0.0;
        }
        v73[0] = 0;
        if (CPSDFile::GetLayerFillOpacity(v6, v3, v73))
        {
          LOBYTE(v59) = v73[0];
          double v61 = (double)v59 / 255.0;
          CPSDFile::GetLayerEffectGradientIsReversed(v6, v3, v67);
          goto LABEL_12;
        }
      }
    }
    return 0;
  }
  if (!CPSDFile::GetLayerGradientAngle(v6, v3, &v71)
    || !CPSDFile::GetLayerGradientSmoothing(v6, v3, &v70))
  {
    return 0;
  }
  int v8 = 0;
  if (!CPSDFile::GetLayerGradientColorStopCount(v6, v3, &v69[1]) || !v69[1]) {
    return v8;
  }
  if (!CPSDFile::GetLayerGradientOpacityStopCount(v6, v3, v69)
    || !CPSDFile::GetLayerGradientBlendMode(v6, v3, &v66))
  {
    return 0;
  }
  CPSDFile::GetLayerGradientIsReversed(v6, v3, v67);
  CPSDFile::GetLayerGradientIsDithered(v6, v3, &v67[1]);
  double v61 = 0.0;
  double v9 = 0.0;
  double v10 = 0.0;
  double v11 = 0.0;
LABEL_12:
  double v62 = v9;
  if (v67[0]) {
    long double v71 = remainder(v71 + 180.0, 360.0);
  }
  id v12 = objc_alloc((Class)NSMutableArray);
  id v13 = [v12 initWithCapacity:v69[1]];
  id v14 = objc_alloc((Class)NSMutableArray);
  id v63 = [v14 initWithCapacity:v69[1]];
  if (v69[1])
  {
    unsigned int v15 = 0;
    do
    {
      *(_OWORD *)v73 = xmmword_1A139E378;
      long long v74 = xmmword_1A139E388;
      double v64 = 0.0;
      double v65 = 0.0;
      if (LayerGradientStyle)
      {
        if (!CPSDFile::GetLayerGradientColorStopAtIndex(v6, v3, v15, (double *)v73, &v65, &v64)) {
          break;
        }
      }
      else if (!CPSDFile::GetLayerEffectGradientColorStopAtIndex(v6, v3, v15, (double *)v73, &v65, &v64))
      {
        break;
      }
      double v16 = *(double *)v73 / 255.0;
      double v17 = *(double *)&v73[8] / 255.0;
      double v18 = v68;
      double v19 = *(double *)&v74 / 255.0;
      id v20 = [v13 lastObject];
      if (v20
        && (BOOL v21 = v20, ([v20 isDoubleStop] & 1) == 0)
        && (double v22 = v65, [v21 colorLocation], v22 - v23 <= 0.01001))
      {
        [v21 colorLocation];
        double v29 = v28;
        double v30 = v65;
        if (fmod(v65 * 100.0, 5.0) != 0.0)
        {
          if (fmod(v29 * 100.0, 5.0) == 0.0) {
            double v30 = v29;
          }
          else {
            double v30 = (v29 + v30) * 0.5;
          }
        }
        uint64_t v31 = [CUIPSDGradientDoubleColorStop alloc];
        [v21 gradientColor];
        unsigned int v25 = -[CUIPSDGradientDoubleColorStop initWithLocation:leadInColor:leadOutColor:](v31, "initWithLocation:leadInColor:leadOutColor:", v30, v32, v33, v34, v35, *(void *)&v16, *(void *)&v17, *(void *)&v19, *(void *)&v18);
        [v13 removeLastObject];
        id v27 = 0;
      }
      else
      {
        uint64_t v24 = [CUIPSDGradientColorStop alloc];
        unsigned int v25 = -[CUIPSDGradientColorStop initWithLocation:gradientColor:](v24, "initWithLocation:gradientColor:", v65, v16, v17, v19, v18);
        id v26 = objc_alloc((Class)NSNumber);
        id v27 = [v26 initWithDouble:v64];
        [v63 addObject:v27];
      }
      [v13 addObject:v25];

      ++v15;
    }
    while (v15 < v69[1]);
  }
  v69[1] = [v13 count];
  if (v69[1]) {
    [v63 removeObjectAtIndex:0];
  }
  id v38 = objc_alloc((Class)NSMutableArray);
  id v39 = [v38 initWithCapacity:v69[0]];
  id v40 = objc_alloc((Class)NSMutableArray);
  id v41 = [v40 initWithCapacity:v69[0]];
  if (v69[0])
  {
    unsigned int v42 = 0;
    do
    {
      *(void *)v73 = 0;
      double v64 = 0.0;
      double v65 = 0.0;
      if (LayerGradientStyle)
      {
        if (!CPSDFile::GetLayerGradientOpacityStopAtIndex(v6, v3, v42, (double *)v73, &v65, &v64)) {
          break;
        }
      }
      else if (!CPSDFile::GetLayerEffectGradientOpacityStopAtIndex(v6, v3, v42, (double *)v73, &v65, &v64))
      {
        break;
      }
      *(double *)v73 = *(double *)v73 / 100.0;
      id v43 = [v39 lastObject];
      if (!v43
        || (v44 = v43, ([v43 isDoubleStop] & 1) != 0)
        || (double v45 = v65, [v44 opacityLocation], v45 - v46 >= 0.01001))
      {
        v54 = [CUIPSDGradientOpacityStop alloc];
        v52 = [(CUIPSDGradientOpacityStop *)v54 initWithLocation:v65 opacity:*(double *)v73];
        id v55 = objc_alloc((Class)NSNumber);
        id v53 = [v55 initWithDouble:v64];
        [v41 addObject:v53];
      }
      else
      {
        [v44 opacityLocation];
        double v48 = v47;
        double v49 = v65;
        if (fmod(v65 * 100.0, 5.0) != 0.0)
        {
          if (fmod(v48 * 100.0, 5.0) == 0.0) {
            double v49 = v48;
          }
          else {
            double v49 = (v48 + v49) * 0.5;
          }
        }
        v50 = [CUIPSDGradientDoubleOpacityStop alloc];
        [v44 opacity];
        v52 = [(CUIPSDGradientDoubleOpacityStop *)v50 initWithLocation:v49 leadInOpacity:v51 leadOutOpacity:*(double *)v73];
        [v39 removeLastObject];
        id v53 = 0;
      }
      [v39 addObject:v52];

      ++v42;
    }
    while (v42 < v69[0]);
  }
  v69[0] = [v39 count];
  if (v69[0]) {
    [v41 removeObjectAtIndex:0];
  }
  v56 = [CUIPSDGradientEvaluator alloc];
  v57 = -[CUIPSDGradientEvaluator initWithColorStops:colorMidpoints:opacityStops:opacityMidpoints:smoothingCoefficient:fillColor:dither:](v56, "initWithColorStops:colorMidpoints:opacityStops:opacityMidpoints:smoothingCoefficient:fillColor:dither:", v13, v63, v39, v41, v67[1] != 0, v70, v11, v10, v62, v61);
  [(CUIPSDGradientEvaluator *)v57 setBlendMode:[(CUIPSDImageRef *)self cgBlendModeForPSDLayerOrLayerEffectBlendMode:v66]];

  v58 = [CUIPSDGradient alloc];
  int v8 = [(CUIPSDGradient *)v58 initWithEvaluator:v57 drawingAngle:v72 gradientStyle:(double)v71];

  return v8;
}

- (id)colorFromDocumentColor:(double *)a3
{
  GenericRGB = (CGColorSpace *)_CUIColorSpaceGetGenericRGB();
  float64x2_t v8 = vdivq_f64(*(float64x2_t *)a3, (float64x2_t)vdupq_n_s64(0x406FE00000000000uLL));
  double v9 = a3[2] / 255.0;
  uint64_t v10 = 0x3FF0000000000000;
  int v5 = CGColorCreate(GenericRGB, v8.f64);
  int v6 = +[CUIColor colorWithCGColor:v5];
  CGColorRelease(v5);
  return v6;
}

- (id)_dropShadowFromLayerEffectsInfo:(void *)a3
{
  id result = [(CUIPSDImageRef *)self psdFile];
  if (result)
  {
    int v6 = (CPSDFile *)result;
    id result = (id)CPSDObjectEffectsLayerInfo::GetEffect((uint64_t)a3, 1148343144);
    if (result)
    {
      int v7 = (CPSDDropShadowDescriptor *)result;
      float64x2_t v8 = objc_alloc_init(CUIPSDLayerEffectDropShadow);
      -[CUIPSDLayerEffectDropShadow setColor:](v8, "setColor:", -[CUIPSDImageRef colorFromDocumentColor:](self, "colorFromDocumentColor:", v10, CPSDDropShadowDescriptor::GetColor(v7, v10)));
      [(CUIPSDLayerEffectDropShadow *)v8 setOpacity:CPSDDropShadowDescriptor::GetOpacity(v7) / 100.0];
      [(CUIPSDLayerEffectDropShadow *)v8 setBlendMode:[(CUIPSDImageRef *)self cgBlendModeForPSDLayerOrLayerEffectBlendMode:CPSDDropShadowDescriptor::GetBlendMode(v7)]];
      [(CUIPSDLayerEffectDropShadow *)v8 setBlurSize:(unint64_t)rint(CPSDDropShadowDescriptor::GetBlurSize(v7))];
      [(CUIPSDLayerEffectDropShadow *)v8 setSpread:(unint64_t)rint(CPSDDropShadowDescriptor::GetSpread(v7))];
      [(CUIPSDLayerEffectDropShadow *)v8 setDistance:(unint64_t)rint(CPSDDropShadowDescriptor::GetDistance(v7))];
      if (CPSDDropShadowDescriptor::UseGlobalLightAngle(v7)) {
        double GlobalLightAngle = (double)(int)CPSDFile::GetGlobalLightAngle(v6);
      }
      else {
        double GlobalLightAngle = rint(CPSDDropShadowDescriptor::GetAngle(v7));
      }
      [(CUIPSDLayerEffectDropShadow *)v8 setAngle:(int)GlobalLightAngle];
      [(CUIPSDLayerEffectComponent *)v8 setVisible:CPSDDropShadowDescriptor::GetIsEnabled(v7) != 0];
      return v8;
    }
  }
  return result;
}

- (id)_innerShadowFromLayerEffectsInfo:(void *)a3
{
  id result = [(CUIPSDImageRef *)self psdFile];
  if (result)
  {
    int v6 = (CPSDFile *)result;
    id result = (id)CPSDObjectEffectsLayerInfo::GetEffect((uint64_t)a3, 1232229224);
    if (result)
    {
      int v7 = (CPSDDropShadowDescriptor *)result;
      float64x2_t v8 = objc_alloc_init(CUIPSDLayerEffectInnerShadow);
      -[CUIPSDLayerEffectInnerShadow setColor:](v8, "setColor:", -[CUIPSDImageRef colorFromDocumentColor:](self, "colorFromDocumentColor:", v10, CPSDDropShadowDescriptor::GetColor(v7, v10)));
      [(CUIPSDLayerEffectInnerShadow *)v8 setOpacity:CPSDDropShadowDescriptor::GetOpacity(v7) / 100.0];
      [(CUIPSDLayerEffectInnerShadow *)v8 setBlendMode:[(CUIPSDImageRef *)self cgBlendModeForPSDLayerOrLayerEffectBlendMode:CPSDDropShadowDescriptor::GetBlendMode(v7)]];
      [(CUIPSDLayerEffectInnerShadow *)v8 setBlurSize:(unint64_t)rint(CPSDDropShadowDescriptor::GetBlurSize(v7))];
      [(CUIPSDLayerEffectInnerShadow *)v8 setDistance:(unint64_t)rint(CPSDDropShadowDescriptor::GetDistance(v7))];
      if (CPSDDropShadowDescriptor::UseGlobalLightAngle(v7)) {
        double GlobalLightAngle = (double)(int)CPSDFile::GetGlobalLightAngle(v6);
      }
      else {
        double GlobalLightAngle = rint(CPSDDropShadowDescriptor::GetAngle(v7));
      }
      [(CUIPSDLayerEffectInnerShadow *)v8 setAngle:(int)GlobalLightAngle];
      [(CUIPSDLayerEffectComponent *)v8 setVisible:CPSDDropShadowDescriptor::GetIsEnabled(v7) != 0];
      return v8;
    }
  }
  return result;
}

- (id)_innerGlowFromLayerEffectsInfo:(void *)a3
{
  id result = [(CUIPSDImageRef *)self psdFile];
  if (result)
  {
    id result = (id)CPSDObjectEffectsLayerInfo::GetEffect((uint64_t)a3, 1232226156);
    if (result)
    {
      int v6 = (CPSDDropShadowDescriptor *)result;
      int v7 = objc_alloc_init(CUIPSDLayerEffectInnerGlow);
      -[CUIPSDLayerEffectInnerGlow setColor:](v7, "setColor:", -[CUIPSDImageRef colorFromDocumentColor:](self, "colorFromDocumentColor:", v8, CPSDDropShadowDescriptor::GetColor(v6, v8)));
      [(CUIPSDLayerEffectInnerGlow *)v7 setOpacity:CPSDDropShadowDescriptor::GetOpacity(v6) / 100.0];
      [(CUIPSDLayerEffectInnerGlow *)v7 setBlendMode:[(CUIPSDImageRef *)self cgBlendModeForPSDLayerOrLayerEffectBlendMode:CPSDDropShadowDescriptor::GetBlendMode(v6)]];
      [(CUIPSDLayerEffectInnerGlow *)v7 setBlurSize:(unint64_t)rint(CPSDDropShadowDescriptor::GetBlurSize(v6))];
      [(CUIPSDLayerEffectComponent *)v7 setVisible:CPSDDropShadowDescriptor::GetIsEnabled(v6) != 0];
      return v7;
    }
  }
  return result;
}

- (id)_outerGlowFromLayerEffectsInfo:(void *)a3
{
  id result = [(CUIPSDImageRef *)self psdFile];
  if (result)
  {
    id result = (id)CPSDObjectEffectsLayerInfo::GetEffect((uint64_t)a3, 1332889452);
    if (result)
    {
      int v6 = (CPSDDropShadowDescriptor *)result;
      int v7 = objc_alloc_init(CUIPSDLayerEffectOuterGlow);
      -[CUIPSDLayerEffectOuterGlow setColor:](v7, "setColor:", -[CUIPSDImageRef colorFromDocumentColor:](self, "colorFromDocumentColor:", v8, CPSDDropShadowDescriptor::GetColor(v6, v8)));
      [(CUIPSDLayerEffectOuterGlow *)v7 setOpacity:CPSDDropShadowDescriptor::GetOpacity(v6) / 100.0];
      [(CUIPSDLayerEffectOuterGlow *)v7 setBlendMode:[(CUIPSDImageRef *)self cgBlendModeForPSDLayerOrLayerEffectBlendMode:CPSDDropShadowDescriptor::GetBlendMode(v6)]];
      [(CUIPSDLayerEffectOuterGlow *)v7 setBlurSize:(unint64_t)rint(CPSDDropShadowDescriptor::GetBlurSize(v6))];
      [(CUIPSDLayerEffectOuterGlow *)v7 setSpread:(unint64_t)rint(CPSDDropShadowDescriptor::GetSpread(v6))];
      [(CUIPSDLayerEffectComponent *)v7 setVisible:CPSDDropShadowDescriptor::GetIsEnabled(v6) != 0];
      return v7;
    }
  }
  return result;
}

- (id)_colorOverlayFromLayerEffectsInfo:(void *)a3
{
  id result = [(CUIPSDImageRef *)self psdFile];
  if (result)
  {
    id result = (id)CPSDObjectEffectsLayerInfo::GetEffect((uint64_t)a3, 1399801449);
    if (result)
    {
      int v6 = (CPSDDropShadowDescriptor *)result;
      int v7 = objc_alloc_init(CUIPSDLayerEffectColorOverlay);
      -[CUIPSDLayerEffectColorOverlay setColor:](v7, "setColor:", -[CUIPSDImageRef colorFromDocumentColor:](self, "colorFromDocumentColor:", v8, CPSDDropShadowDescriptor::GetColor(v6, v8)));
      [(CUIPSDLayerEffectColorOverlay *)v7 setOpacity:CPSDDropShadowDescriptor::GetOpacity(v6) / 100.0];
      [(CUIPSDLayerEffectColorOverlay *)v7 setBlendMode:[(CUIPSDImageRef *)self cgBlendModeForPSDLayerOrLayerEffectBlendMode:CPSDDropShadowDescriptor::GetBlendMode(v6)]];
      [(CUIPSDLayerEffectComponent *)v7 setVisible:CPSDDropShadowDescriptor::GetIsEnabled(v6) != 0];
      return v7;
    }
  }
  return result;
}

- (id)_gradientOverlayFromLayerEffectsAtAbsoluteIndex:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  int v5 = [(CUIPSDImageRef *)self psdFile];
  if (!v5) {
    return 0;
  }
  LayerEffectsInfo = CPSDFile::GetLayerEffectsInfo(v5, v3);
  Effect = (CPSDDropShadowDescriptor *)CPSDObjectEffectsLayerInfo::GetEffect((uint64_t)LayerEffectsInfo, 1198671468);
  id v8 = [(CUIPSDImageRef *)self _gradientAtAbsoluteIndex:v3];
  if (!v8) {
    return 0;
  }
  id v9 = v8;
  uint64_t v10 = objc_alloc_init(CUIPSDLayerEffectGradientOverlay);
  [(CUIPSDLayerEffectGradientOverlay *)v10 setGradient:v9];
  [(CUIPSDLayerEffectComponent *)v10 setVisible:CPSDDropShadowDescriptor::GetIsEnabled(Effect) != 0];
  return v10;
}

- (id)_bevelEmbossFromLayerEffectsInfo:(void *)a3
{
  id result = [(CUIPSDImageRef *)self psdFile];
  if (result)
  {
    int v6 = (CPSDFile *)result;
    id result = (id)CPSDObjectEffectsLayerInfo::GetEffect((uint64_t)a3, 1700946540);
    if (result)
    {
      int v7 = (CPSDDropShadowDescriptor *)result;
      id v8 = objc_alloc_init(CUIPSDLayerEffectBevelEmboss);
      [(CUIPSDLayerEffectBevelEmboss *)v8 setBlurSize:(unint64_t)rint(CPSDDropShadowDescriptor::GetBlurSize(v7))];
      [(CUIPSDLayerEffectBevelEmboss *)v8 setSoftenSize:(unint64_t)rint(CPSDBevelEmbossDescriptor::GetSoftenSize(v7))];
      if (CPSDDropShadowDescriptor::UseGlobalLightAngle(v7)) {
        double GlobalLightAngle = (double)(int)CPSDFile::GetGlobalLightAngle(v6);
      }
      else {
        double GlobalLightAngle = CPSDDropShadowDescriptor::GetAngle(v7);
      }
      [(CUIPSDLayerEffectBevelEmboss *)v8 setAngle:(int)GlobalLightAngle];
      if (CPSDDropShadowDescriptor::UseGlobalLightAngle(v7)) {
        double GlobalLightAltitude = (double)CPSDFile::GetGlobalLightAltitude(v6);
      }
      else {
        double GlobalLightAltitude = CPSDBevelEmbossDescriptor::GetAltitude(v7);
      }
      [(CUIPSDLayerEffectBevelEmboss *)v8 setAltitude:(unint64_t)GlobalLightAltitude];
      [(CUIPSDLayerEffectBevelEmboss *)v8 setHighlightBlendMode:[(CUIPSDImageRef *)self cgBlendModeForPSDLayerOrLayerEffectBlendMode:CPSDBevelEmbossDescriptor::GetHighlightBlendMode(v7)]];
      -[CUIPSDLayerEffectBevelEmboss setHighlightColor:](v8, "setHighlightColor:", -[CUIPSDImageRef colorFromDocumentColor:](self, "colorFromDocumentColor:", v11, CPSDBevelEmbossDescriptor::GetHighlightColor(v7, v11)));
      [(CUIPSDLayerEffectBevelEmboss *)v8 setHighlightOpacity:CPSDBevelEmbossDescriptor::GetHighlightOpacity(v7) / 100.0];
      [(CUIPSDLayerEffectBevelEmboss *)v8 setShadowBlendMode:[(CUIPSDImageRef *)self cgBlendModeForPSDLayerOrLayerEffectBlendMode:CPSDBevelEmbossDescriptor::GetShadowBlendMode(v7)]];
      -[CUIPSDLayerEffectBevelEmboss setShadowColor:](v8, "setShadowColor:", -[CUIPSDImageRef colorFromDocumentColor:](self, "colorFromDocumentColor:", v11, CPSDBevelEmbossDescriptor::GetShadowColor(v7, v11)));
      [(CUIPSDLayerEffectBevelEmboss *)v8 setShadowOpacity:CPSDBevelEmbossDescriptor::GetShadowOpacity(v7) / 100.0];
      [(CUIPSDLayerEffectBevelEmboss *)v8 setDirection:CPSDBevelEmbossDescriptor::GetBevelDirection(v7)];
      [(CUIPSDLayerEffectComponent *)v8 setVisible:CPSDDropShadowDescriptor::GetIsEnabled(v7) != 0];
      return v8;
    }
  }
  return result;
}

- (id)_layerEffectsAtAbsoluteIndex:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  int v5 = [(CUIPSDImageRef *)self psdFile];
  if (!v5) {
    return 0;
  }
  LayerEffectsInfo = (CPSDObjectEffectsLayerInfo *)CPSDFile::GetLayerEffectsInfo(v5, v3);
  if (!LayerEffectsInfo) {
    return 0;
  }
  int v7 = LayerEffectsInfo;
  id v8 = objc_alloc_init(CUIPSDLayerEffects);
  [(CUIPSDLayerEffects *)v8 setVisible:CPSDObjectEffectsLayerInfo::GetMasterEffectsSwitch(v7) != 0];
  [(CUIPSDLayerEffects *)v8 setEffectScale:CPSDGradientDescriptor::GetScale(v7)];
  id v9 = [(CUIPSDImageRef *)self _colorOverlayFromLayerEffectsInfo:v7];
  if (v9) {
    [(CUIPSDLayerEffects *)v8 addLayerEffectComponent:v9];
  }
  id v10 = [(CUIPSDImageRef *)self _gradientOverlayFromLayerEffectsAtAbsoluteIndex:v3];
  if (v10) {
    [(CUIPSDLayerEffects *)v8 addLayerEffectComponent:v10];
  }
  id v11 = [(CUIPSDImageRef *)self _dropShadowFromLayerEffectsInfo:v7];
  if (v11) {
    [(CUIPSDLayerEffects *)v8 addLayerEffectComponent:v11];
  }
  id v12 = [(CUIPSDImageRef *)self _innerShadowFromLayerEffectsInfo:v7];
  if (v12) {
    [(CUIPSDLayerEffects *)v8 addLayerEffectComponent:v12];
  }
  id v13 = [(CUIPSDImageRef *)self _innerGlowFromLayerEffectsInfo:v7];
  if (v13) {
    [(CUIPSDLayerEffects *)v8 addLayerEffectComponent:v13];
  }
  id v14 = [(CUIPSDImageRef *)self _outerGlowFromLayerEffectsInfo:v7];
  if (v14) {
    [(CUIPSDLayerEffects *)v8 addLayerEffectComponent:v14];
  }
  id v15 = [(CUIPSDImageRef *)self _bevelEmbossFromLayerEffectsInfo:v7];
  if (v15) {
    [(CUIPSDLayerEffects *)v8 addLayerEffectComponent:v15];
  }
  return v8;
}

- (int)file
{
  return self->_file;
}

- (void)setFile:(int)a3
{
  self->_int file = a3;
}

- (void)setPath:(id)a3
{
}

- (void)psd
{
  return self->_psd;
}

- (void)setPsd:(void *)a3
{
  self->_psd = a3;
}

- (id)layerEnumerator
{
  return +[CUIPSDLayerEnumerator enumeratorWithPSDImage:self];
}

- (void)enumerateLayersUsingBlock:(id)a3
{
  id v4 = [(CUIPSDImageRef *)self layerEnumerator];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v12;
LABEL_3:
    uint64_t v8 = 0;
    while (1)
    {
      if (*(void *)v12 != v7) {
        objc_enumerationMutation(v4);
      }
      uint64_t v9 = *(void *)(*((void *)&v11 + 1) + 8 * v8);
      char v10 = 0;
      (*((void (**)(id, uint64_t, char *))a3 + 2))(a3, v9, &v10);
      if (v10) {
        break;
      }
      if (v6 == (id)++v8)
      {
        id v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
        if (v6) {
          goto LABEL_3;
        }
        return;
      }
    }
  }
}

- (uint64_t)loadPSDFileWithLayers:(void *)a3 .cold.1(void *a1, uint64_t a2, void *a3, uint64_t *a4)
{
  uint64_t v7 = *((void *)__cxa_get_exception_ptr(a1) + 1);
  *a3 = &unk_1EF485F50;
  a3[1] = v7;
  __cxa_begin_catch(a1);
  uint64_t result = *a4;
  if (*a4) {
    return (*(uint64_t (**)(uint64_t))(*(void *)result + 8))(result);
  }
  return result;
}

- (void)metadataString
{
  uint64_t v2 = *((void *)__cxa_get_exception_ptr(a1) + 1);
  v3[0] = &unk_1EF485F50;
  v3[1] = v2;
  __cxa_begin_catch(a1);
  CStdException::~CStdException((CStdException *)v3);
  __cxa_end_catch();
}

@end