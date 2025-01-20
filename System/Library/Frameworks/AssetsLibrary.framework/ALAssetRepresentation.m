@interface ALAssetRepresentation
+ (void)_enableImageDataUsesMap;
- (ALAssetOrientation)orientation;
- (ALAssetRepresentation)initWithManagedAsset:(id)a3 sidecar:(id)a4 extension:(id)a5 library:(id)a6;
- (ALAssetRepresentationPrivate)internal;
- (BOOL)ignoreRead;
- (BOOL)isValid;
- (CGImage)CGImageWithOptions:(id)a3 format:(unsigned __int16)a4;
- (CGImage)_largeDisplayableImageForFormatID:(unsigned __int16)a3;
- (CGImage)zoomableDisplayImage;
- (CGImageRef)CGImageWithOptions:(NSDictionary *)options;
- (CGImageRef)fullResolutionImage;
- (CGImageRef)fullScreenImage;
- (CGSize)dimensions;
- (NSDictionary)metadata;
- (NSString)UTI;
- (NSString)filename;
- (NSUInteger)getBytes:(uint8_t *)buffer fromOffset:(uint64_t)offset length:(NSUInteger)length error:(NSError *)error;
- (NSURL)url;
- (float)scale;
- (id)_imageData;
- (id)description;
- (int)_fileDescriptor;
- (uint64_t)size;
- (void)dealloc;
- (void)setIgnoreRead:(BOOL)a3;
- (void)setInternal:(id)a3;
@end

@implementation ALAssetRepresentation

- (void)setIgnoreRead:(BOOL)a3
{
  self->_ignoreRead = a3;
}

- (BOOL)ignoreRead
{
  return self->_ignoreRead;
}

- (void)setInternal:(id)a3
{
}

- (ALAssetRepresentationPrivate)internal
{
  return (ALAssetRepresentationPrivate *)self->_internal;
}

- (NSString)filename
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3052000000;
  v9 = __Block_byref_object_copy__7;
  v10 = __Block_byref_object_dispose__8;
  uint64_t v11 = 0;
  v2 = [(ALAssetRepresentation *)self internal];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __33__ALAssetRepresentation_filename__block_invoke;
  v5[3] = &unk_2642B5978;
  v5[4] = &v6;
  [(ALAssetRepresentationPrivate *)v2 _performBlockAndWait:v5];
  v3 = (NSString *)(id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

id __33__ALAssetRepresentation_filename__block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  if (a4)
  {
    v5 = a4;
  }
  else
  {
    if (+[ALAssetsLibrary _linkedBefore7])
    {
      uint64_t v7 = [a3 filename];
      goto LABEL_7;
    }
    v5 = a3;
  }
  uint64_t v7 = [v5 originalFilename];
LABEL_7:
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = v7;
  uint64_t v8 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);

  return v8;
}

- (float)scale
{
  return 1.0;
}

- (ALAssetOrientation)orientation
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  v2 = [(ALAssetRepresentation *)self internal];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __36__ALAssetRepresentation_orientation__block_invoke;
  v5[3] = &unk_2642B5978;
  v5[4] = &v6;
  [(ALAssetRepresentationPrivate *)v2 _performBlockAndWait:v5];
  ALAssetOrientation v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __36__ALAssetRepresentation_orientation__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  [a3 orientation];
  uint64_t result = PLImageOrientationFromExifOrientation();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

- (NSDictionary)metadata
{
  ALAssetOrientation v3 = (NSDictionary *)[MEMORY[0x263EFF9A0] dictionary];
  if ([(ALAssetRepresentation *)self isValid])
  {
    if ([(ALAssetRepresentationPrivate *)[(ALAssetRepresentation *)self internal] _isImage])
    {
      [(ALAssetRepresentation *)self setIgnoreRead:1];
      CFDataRef v4 = [(ALAssetRepresentation *)self _imageData];
      [(ALAssetRepresentation *)self setIgnoreRead:0];
      if (v4)
      {
        v5 = CGImageSourceCreateWithData(v4, 0);
        if (v5)
        {
          uint64_t v6 = v5;
          CFDictionaryRef v7 = CGImageSourceCopyPropertiesAtIndex(v5, 0, 0);
          if (v7)
          {
            CFDictionaryRef v8 = v7;
            [(NSDictionary *)v3 addEntriesFromDictionary:v7];
            CFRelease(v8);
          }
          CFRelease(v6);
        }
      }
    }
  }
  return v3;
}

- (NSURL)url
{
  uint64_t v7 = 0;
  CFDictionaryRef v8 = &v7;
  uint64_t v9 = 0x3052000000;
  v10 = __Block_byref_object_copy__7;
  uint64_t v11 = __Block_byref_object_dispose__8;
  uint64_t v12 = 0;
  if ([(ALAssetRepresentation *)self isValid])
  {
    ALAssetOrientation v3 = [(ALAssetRepresentation *)self internal];
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __28__ALAssetRepresentation_url__block_invoke;
    v6[3] = &unk_2642B5978;
    v6[4] = &v7;
    [(ALAssetRepresentationPrivate *)v3 _performBlockAndWait:v6];
  }
  CFDataRef v4 = (NSURL *)(id)v8[5];
  _Block_object_dispose(&v7, 8);
  return v4;
}

id __28__ALAssetRepresentation_url__block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  id result = (id)[a2 assetURLForPhoto:a3 extension:a5];
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = result;
  return result;
}

- (CGImage)_largeDisplayableImageForFormatID:(unsigned __int16)a3
{
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x3052000000;
  v13 = __Block_byref_object_copy__7;
  v14 = __Block_byref_object_dispose__8;
  uint64_t v15 = 0;
  CFDataRef v4 = [(ALAssetRepresentation *)self internal];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __59__ALAssetRepresentation__largeDisplayableImageForFormatID___block_invoke;
  v8[3] = &unk_2642B59A0;
  unsigned __int16 v9 = a3;
  v8[4] = &v10;
  [(ALAssetRepresentationPrivate *)v4 _performBlockAndWait:v8];
  v5 = (CGImage *)[(id)v11[5] CGImage];
  id v6 = (id)v11[5];
  _Block_object_dispose(&v10, 8);
  return v5;
}

uint64_t __59__ALAssetRepresentation__largeDisplayableImageForFormatID___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  objc_msgSend((id)objc_msgSend(MEMORY[0x263F5D8A8], "sharedAssetsSaver"), "requestSynchronousImageForAssetOID:withFormat:allowPlaceholder:wantURLOnly:networkAccessAllowed:trackCPLDownload:outImageDataInfo:outCPLDownloadContext:", objc_msgSend(a3, "objectID"), *(unsigned __int16 *)(a1 + 40), 1, 0, 0, 0, 0, 0);
  [a3 uniformTypeIdentifier];
  uint64_t result = PLCreateImageFromDataWithFormat();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = result;
  return result;
}

- (CGImageRef)fullScreenImage
{
  return [(ALAssetRepresentation *)self _largeDisplayableImageForFormatID:4007];
}

- (CGImage)zoomableDisplayImage
{
  uint64_t v3 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x263F5DB58], "defaultFormatChooser"), "fullScreenFormatForCurrentDevice"), "formatID");

  return [(ALAssetRepresentation *)self _largeDisplayableImageForFormatID:v3];
}

- (CGImageRef)fullResolutionImage
{
  return [(ALAssetRepresentation *)self CGImageWithOptions:0];
}

- (CGImageRef)CGImageWithOptions:(NSDictionary *)options
{
  return [(ALAssetRepresentation *)self CGImageWithOptions:options format:9998];
}

- (CGImage)CGImageWithOptions:(id)a3 format:(unsigned __int16)a4
{
  if (![(ALAssetRepresentation *)self isValid]) {
    return 0;
  }
  if ([(ALAssetRepresentationPrivate *)[(ALAssetRepresentation *)self internal] _isImage])
  {
    if ([(ALAssetRepresentation *)self _imageData])
    {
      [(ALAssetRepresentation *)self filename];
      PLGetSourceTypeHintFromFilename();
      v5 = (void *)PLCreateImageFromDataWithFormat();
      id v6 = (CGImage *)[v5 CGImage];
      id v7 = v5;
      return v6;
    }
    return 0;
  }
  if (![(ALAssetRepresentationPrivate *)[(ALAssetRepresentation *)self internal] _isVideo]) {
    return 0;
  }
  uint64_t v13 = 0;
  v14 = &v13;
  uint64_t v15 = 0x3052000000;
  v16 = __Block_byref_object_copy__7;
  v17 = __Block_byref_object_dispose__8;
  uint64_t v18 = 0;
  unsigned __int16 v9 = [(ALAssetRepresentation *)self internal];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __51__ALAssetRepresentation_CGImageWithOptions_format___block_invoke;
  v12[3] = &unk_2642B5978;
  v12[4] = &v13;
  [(ALAssetRepresentationPrivate *)v9 _performBlockAndWait:v12];
  uint64_t v10 = (CGImage *)[(id)v14[5] CGImage];
  id v11 = (id)v14[5];
  _Block_object_dispose(&v13, 8);
  return v10;
}

uint64_t __51__ALAssetRepresentation_CGImageWithOptions_format___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  PLPushPhotoLibraryClient();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = (id)[a3 imageWithFormat:4007];

  return MEMORY[0x270F53768]();
}

- (id)_imageData
{
  size_t v3 = [(ALAssetRepresentation *)self size];
  if (v3)
  {
    size_t v4 = v3;
    if (_imageDataUsesMap == 1)
    {
      v5 = mmap(0, v3, 1, 1, [(ALAssetRepresentation *)self _fileDescriptor], 0);
      if (v5 != (void *)-1)
      {
        id result = (id)[objc_alloc(MEMORY[0x263EFF8F8]) initWithBytesNoCopy:v5 length:v4 deallocator:&__block_literal_global_9];
        if (result) {
          return result;
        }
      }
    }
    id v7 = malloc_type_malloc(v4, 0x98345673uLL);
    if (v4 == [(ALAssetRepresentation *)self getBytes:v7 fromOffset:0 length:v4 error:0])
    {
      CFDictionaryRef v8 = (void *)MEMORY[0x263EFF8F8];
      return (id)[v8 dataWithBytesNoCopy:v7 length:v4];
    }
    free(v7);
  }
  unsigned __int16 v9 = (void *)MEMORY[0x263EFF8F8];

  return (id)[v9 data];
}

void __35__ALAssetRepresentation__imageData__block_invoke(int a1, void *a2, size_t a3)
{
  if (munmap(a2, a3)) {
    NSLog(&cfstr_FailureUnmappi.isa, a2, a3);
  }
}

- (NSUInteger)getBytes:(uint8_t *)buffer fromOffset:(uint64_t)offset length:(NSUInteger)length error:(NSError *)error
{
  if (![(ALAssetRepresentation *)self isValid]) {
    return 0;
  }
  int v10 = [(ALAssetRepresentation *)self _fileDescriptor];
  if (v10 < 0) {
    return 0;
  }

  return pread(v10, buffer, length, offset);
}

- (uint64_t)size
{
  int v2 = [(ALAssetRepresentation *)self _fileDescriptor];
  if (v2 < 0) {
    return 0;
  }
  memset(&v4, 0, sizeof(v4));
  if (fstat(v2, &v4)) {
    return 0;
  }
  else {
    return v4.st_size;
  }
}

- (CGSize)dimensions
{
  size_t v3 = (long long *)MEMORY[0x263F001B0];
  double v4 = *(double *)(MEMORY[0x263F001B0] + 8);
  double v17 = *MEMORY[0x263F001B0];
  if ([(ALAssetRepresentation *)self isValid])
  {
    v33[0] = 0;
    v33[1] = v33;
    v33[2] = 0x2020000000;
    v33[3] = 0x3FF0000000000000;
    uint64_t v28 = 0;
    v29 = (float64x2_t *)&v28;
    uint64_t v30 = 0x3010000000;
    v31 = "";
    long long v32 = *v3;
    uint64_t v23 = 0;
    v24 = (float64x2_t *)&v23;
    uint64_t v25 = 0x3010000000;
    v26 = "";
    long long v27 = v32;
    v5 = [(ALAssetRepresentation *)self internal];
    v22[0] = MEMORY[0x263EF8330];
    v22[1] = 3221225472;
    v22[2] = __35__ALAssetRepresentation_dimensions__block_invoke;
    v22[3] = &unk_2642B5930;
    v22[4] = v33;
    v22[5] = &v28;
    v22[6] = &v23;
    [(ALAssetRepresentationPrivate *)v5 _performBlockAndWait:v22];
    if ([(ALAssetRepresentationPrivate *)[(ALAssetRepresentation *)self internal] sidecar])
    {
      double v7 = v29[2].f64[0];
      double v6 = v29[2].f64[1];
      if (v7 != v17 || v6 != v4)
      {
        double v9 = v24[2].f64[0];
        double v8 = v24[2].f64[1];
        if (v9 != v17 || v8 != v4)
        {
          BOOL v10 = v8 == v6 && v9 == v7;
          id v20 = 0;
          id v21 = 0;
          id v19 = 0;
          MEMORY[0x21D453120]([(ALAssetRepresentation *)self metadata], &v21, &v20, &v19);
          [v21 intValue];
          if (PLExifOrientationSwapsWidthAndHeight())
          {
            [v19 doubleValue];
            float64_t v18 = v11;
            [v20 doubleValue];
          }
          else
          {
            [v20 doubleValue];
            float64_t v18 = v13;
            [v19 doubleValue];
          }
          v14.f64[0] = v18;
          v14.f64[1] = v12;
          if (!v10) {
            float64x2_t v14 = vdivq_f64(v14, vcvtq_f64_f32(vcvt_f32_f64(vdivq_f64(v29[2], v24[2]))));
          }
          double v4 = v14.f64[1];
          double v17 = v14.f64[0];
        }
      }
    }
    else
    {
      double v4 = v24[2].f64[1];
      double v17 = v24[2].f64[0];
    }
    _Block_object_dispose(&v23, 8);
    _Block_object_dispose(&v28, 8);
    _Block_object_dispose(v33, 8);
  }
  double v15 = v17;
  double v16 = v4;
  result.height = v16;
  result.width = v15;
  return result;
}

double __35__ALAssetRepresentation_dimensions__block_invoke(void *a1, uint64_t a2, void *a3)
{
  *(double *)(*(void *)(a1[4] + 8) + 24) = (double)(int)[a3 orientation];
  uint64_t v5 = [a3 originalWidth];
  uint64_t v6 = [a3 originalHeight];
  uint64_t v7 = [a3 width];
  uint64_t v8 = [a3 height];
  int v9 = PLExifOrientationSwapsWidthAndHeight();
  uint64_t v10 = *(void *)(a1[5] + 8);
  if (v9) {
    uint64_t v11 = v6;
  }
  else {
    uint64_t v11 = v5;
  }
  if (v9) {
    uint64_t v12 = v5;
  }
  else {
    uint64_t v12 = v6;
  }
  *(double *)(v10 + 32) = (double)v11;
  *(double *)(v10 + 40) = (double)v12;
  double result = (double)v7;
  uint64_t v14 = *(void *)(a1[6] + 8);
  *(double *)(v14 + 32) = (double)v7;
  *(double *)(v14 + 40) = (double)v8;
  return result;
}

- (int)_fileDescriptor
{
  if ([(ALAssetRepresentation *)self isValid]
    && PUTGetCurrentAccess() == 2
    && (size_t v3 = [(ALAssetRepresentation *)self url]) != 0)
  {
    double v4 = v3;
    uint64_t v5 = +[ALAssetRepresentationPrivate _fileDescriptorForPersistentURL:v3];
    int v7 = v5;
    if (v5 == -1)
    {
      objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x263F5DB40], "sharedSystemLibraryAssetsdClient", v5), "resourceClient"), "fileDescriptorForAssetURL:withAdjustments:fileExtension:fileDescriptor:error:", v4, 1, 0, &v7, 0);
      LODWORD(v5) = v7;
      if ((v7 & 0x80000000) == 0) {
        LODWORD(v5) = +[ALAssetRepresentationPrivate _updateFileDescriptor:forPersistentURL:](ALAssetRepresentationPrivate, "_updateFileDescriptor:forPersistentURL:");
      }
    }
  }
  else
  {
    LODWORD(v5) = -1;
  }
  return v5;
}

- (NSString)UTI
{
  if ([(ALAssetRepresentation *)self isValid]) {
    [(ALAssetRepresentationPrivate *)[(ALAssetRepresentation *)self internal] extension];
  }
  return 0;
}

- (BOOL)isValid
{
  int v2 = [(ALAssetRepresentation *)self internal];

  return [(ALAssetRepresentationPrivate *)v2 isValid];
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"ALAssetRepresentation - UTI:%@", -[ALAssetRepresentation UTI](self, "UTI")];
}

- (void)dealloc
{
  [(ALAssetRepresentation *)self setInternal:0];
  v3.receiver = self;
  v3.super_class = (Class)ALAssetRepresentation;
  [(ALAssetRepresentation *)&v3 dealloc];
}

- (ALAssetRepresentation)initWithManagedAsset:(id)a3 sidecar:(id)a4 extension:(id)a5 library:(id)a6
{
  v13.receiver = self;
  v13.super_class = (Class)ALAssetRepresentation;
  uint64_t v10 = [(ALAssetRepresentation *)&v13 init];
  if (v10)
  {
    uint64_t v11 = [[ALAssetRepresentationPrivate alloc] initWithManagedAsset:a3 sidecar:a4 extension:a5 library:a6];
    [(ALAssetRepresentation *)v10 setInternal:v11];
  }
  return v10;
}

+ (void)_enableImageDataUsesMap
{
  _imageDataUsesMap = 1;
}

@end