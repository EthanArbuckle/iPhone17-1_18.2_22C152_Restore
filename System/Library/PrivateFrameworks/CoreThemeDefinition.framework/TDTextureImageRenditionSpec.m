@interface TDTextureImageRenditionSpec
- (BOOL)canBePackedWithDocument:(id)a3;
- (BOOL)isCubeMap;
- (BOOL)updatePackingPropertiesWithDocument:(id)a3;
- (CGImage)_createImageRefWithURL:(id)a3 andDocument:(id)a4 format:(int *)a5;
- (TDTextureRenditionSpec)texture;
- (id)associatedFileModificationDateWithDocument:(id)a3;
- (id)createCSIRepresentationWithCompression:(BOOL)a3 colorSpaceID:(unint64_t)a4 document:(id)a5;
- (id)textureFacesWithDocument:(id)a3;
- (int)_pixelFormatOfCGImage:(CGImage *)a3;
- (int64_t)textureFormat;
@end

@implementation TDTextureImageRenditionSpec

- (TDTextureRenditionSpec)texture
{
  v2 = (void *)[(TDTextureImageRenditionSpec *)self textureLevelAssignment];

  return (TDTextureRenditionSpec *)[v2 texture];
}

- (int64_t)textureFormat
{
  return objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)-[TDTextureImageRenditionSpec textureLevelAssignment](self, "textureLevelAssignment"), "texture"), "pixelFormat"), "identifier");
}

- (BOOL)isCubeMap
{
  v2 = objc_msgSend((id)-[TDTextureImageRenditionSpec textureLevelAssignment](self, "textureLevelAssignment"), "texture");

  return [v2 cubeMap];
}

- (id)textureFacesWithDocument:(id)a3
{
  v8[1] = *MEMORY[0x263EF8340];
  uint64_t v5 = [MEMORY[0x263F08A98] predicateWithFormat:@"textureLevelAssignment.texture = %@ AND textureLevelAssignment.level=%d", -[TDTextureImageRenditionSpec texture](self, "texture"), (int)objc_msgSend((id)-[TDTextureImageRenditionSpec textureLevelAssignment](self, "textureLevelAssignment"), "level")];
  v8[0] = [MEMORY[0x263F08B30] sortDescriptorWithKey:@"textureLevelAssignment.face.identifier" ascending:1];
  v6 = objc_msgSend(a3, "objectsForEntity:withPredicate:sortDescriptors:withContext:error:", @"TextureImageRenditionSpec", v5, objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:count:", v8, 1), -[TDTextureImageRenditionSpec managedObjectContext](self, "managedObjectContext"), 0);
  [v6 count];
  [v6 objectAtIndexedSubscript:0];
  return v6;
}

- (id)associatedFileModificationDateWithDocument:(id)a3
{
  uint64_t v3 = objc_msgSend((id)objc_msgSend((id)-[TDTextureImageRenditionSpec asset](self, "asset"), "fileURLWithDocument:", a3), "path");
  v4 = (void *)[MEMORY[0x263F08850] defaultManager];
  int v5 = [v4 fileExistsAtPath:v3];
  if (v5) {
    v6 = (void *)[v4 attributesOfItemAtPath:v3 error:0];
  }
  else {
    v6 = 0;
  }
  id result = (id)[v6 objectForKey:*MEMORY[0x263F08048]];
  if (result) {
    int v8 = 0;
  }
  else {
    int v8 = v5;
  }
  if (v8 == 1)
  {
    NSLog(&cfstr_Tdtextureimage.isa, v3);
    v9 = (void *)MEMORY[0x263EFF910];
    return (id)[v9 distantFuture];
  }
  return result;
}

- (int)_pixelFormatOfCGImage:(CGImage *)a3
{
  int v4 = [(TDTextureImageRenditionSpec *)self monochrome];
  int BitsPerComponent = CGImageGetBitsPerComponent(a3);
  if (BitsPerComponent << 16 <= 983040) {
    int v6 = 1195456544;
  }
  else {
    int v6 = 1195454774;
  }
  if (BitsPerComponent << 16 <= 983040) {
    int v7 = 1095911234;
  }
  else {
    int v7 = 1380401751;
  }
  if (v4) {
    return v6;
  }
  else {
    return v7;
  }
}

- (CGImage)_createImageRefWithURL:(id)a3 andDocument:(id)a4 format:(int *)a5
{
  v10 = (void *)[(TDTextureImageRenditionSpec *)self asset];
  v11 = (void *)[a3 pathExtension];
  if (![v11 length]
    || [v11 caseInsensitiveCompare:@"PNG"]
    && [v11 caseInsensitiveCompare:@"JPG"]
    && [v11 caseInsensitiveCompare:@"JPEG"]
    && [v11 caseInsensitiveCompare:@"TIFF"]
    && [v11 caseInsensitiveCompare:@"TGA"])
  {
    v12 = (objc_class *)objc_opt_class();
    v13 = NSStringFromClass(v12);
    v14 = NSStringFromSelector(a2);
    NSLog(&cfstr_TextureImageAs.isa, v13, v14, a3);
    return 0;
  }
  v15 = (void *)[v10 sourceImageWithDocument:a4];
  uint64_t v16 = [v15 image];
  if (!v15) {
    return 0;
  }
  v17 = (CGImage *)v16;
  if (a5) {
    *a5 = [(TDTextureImageRenditionSpec *)self _pixelFormatOfCGImage:v16];
  }
  CGImageRetain(v17);
  return v17;
}

- (id)createCSIRepresentationWithCompression:(BOOL)a3 colorSpaceID:(unint64_t)a4 document:(id)a5
{
  BOOL v6 = a3;
  uint64_t v50 = *MEMORY[0x263EF8340];
  int v8 = (void *)[(TDTextureImageRenditionSpec *)self production];
  v9 = (void *)[(TDTextureImageRenditionSpec *)self asset];
  unsigned int v48 = 1095911234;
  if (objc_msgSend((id)objc_msgSend((id)-[TDTextureImageRenditionSpec textureLevelAssignment](self, "textureLevelAssignment"), "face"), "identifier"))return 0; {
  unsigned int v11 = [(TDThemeConstant *)[(TDRenditionSpec *)self renditionType] identifier];
  }
  if (v11 == 1006)
  {
    id v12 = objc_alloc(MEMORY[0x263F38370]);
    v13 = objc_msgSend(v12, "initWithCanvasSize:sliceCount:layout:", 0, 1006, *MEMORY[0x263F08678], *(double *)(MEMORY[0x263F08678] + 8));
    objc_msgSend(v13, "setTargetPlatform:", objc_msgSend(a5, "targetPlatform"));
    objc_msgSend(v13, "setScaleFactor:", objc_msgSend((id)-[TDTextureImageRenditionSpec keySpec](self, "keySpec"), "scaleFactor"));
    v10 = (void *)[v13 CSIRepresentationWithCompression:v6];
  }
  else
  {
    __int16 v14 = v11;
    v15 = -[TDTextureImageRenditionSpec _createImageRefWithURL:andDocument:format:](self, "_createImageRefWithURL:andDocument:format:", [v9 fileURLWithDocument:a5], a5, &v48);
    int v40 = [(TDTextureImageRenditionSpec *)self width];
    int v39 = [(TDTextureImageRenditionSpec *)self height];
    if ([v8 renditionSubtype]) {
      __int16 v14 = objc_msgSend((id)objc_msgSend(v8, "renditionSubtype"), "identifier");
    }
    BOOL v36 = v6;
    if ([(TDTextureImageRenditionSpec *)self parentRendition])
    {
      [(TDRenditionSpec *)self packedPoint];
      v18 = objc_msgSend(objc_alloc(MEMORY[0x263F38370]), "initWithInternalReferenceRect:layout:", v14, v16, v17, (double)v40, (double)v39);
      id v19 = objc_alloc_init(MEMORY[0x263F383C0]);
      v20 = objc_msgSend(objc_alloc(MEMORY[0x263F383B8]), "initWithKeyList:", objc_msgSend((id)objc_msgSend((id)-[TDTextureImageRenditionSpec parentRendition](self, "parentRendition"), "keySpec"), "key"));
      [v19 setReferenceKey:v20];
      [v18 addLayerReference:v19];
    }
    else
    {
      v18 = objc_msgSend(objc_alloc(MEMORY[0x263F38370]), "initWithTextureImageWithSize:forPixelFormat:cubeMap:", -[TDTextureImageRenditionSpec textureFormat](self, "textureFormat"), -[TDTextureImageRenditionSpec isCubeMap](self, "isCubeMap"), (double)v40, (double)v39);
    }
    objc_msgSend(v18, "setTargetPlatform:", objc_msgSend(a5, "targetPlatform"));
    [v18 setPixelFormat:v48];
    objc_msgSend(v18, "setName:", objc_msgSend(v9, "name"));
    if (v15)
    {
      CGImageGetColorSpace(v15);
      v21 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x263F001E8]);
      size_t BitsPerComponent = CGImageGetBitsPerComponent(v15);
      int v23 = [(TDTextureImageRenditionSpec *)self monochrome];
      [a5 allowsExtendedRangePixelFormats];
      if (objc_msgSend((id)objc_msgSend((id)-[TDTextureImageRenditionSpec keySpec](self, "keySpec"), "gamut"), "identifier") != 1|| (!CGColorSpaceEqualToColorSpace() || BitsPerComponent <= 8)&& (BitsPerComponent > 8 ? (char v24 = v23) : (char v24 = 0), (v24 & 1) == 0 && BitsPerComponent >= 9))
      {
        if (v23) {
          uint64_t v25 = 1195456544;
        }
        else {
          uint64_t v25 = 1095911234;
        }
        [v18 setPixelFormat:v25];
      }
      CGColorSpaceRelease(v21);
    }
    objc_msgSend(v18, "setScaleFactor:", objc_msgSend(v9, "scaleFactor", v15));
    objc_msgSend(v18, "setExifOrientation:", objc_msgSend(v9, "exifOrientation"));
    objc_msgSend(v18, "setRenditionProperties:", -[TDRenditionSpec propertiesAsDictionary](self, "propertiesAsDictionary"));
    memset(v45, 0, sizeof(v45));
    double v46 = (double)v40;
    double v47 = (double)v39;
    [v18 addMetrics:v45];
    v38 = self;
    long long v41 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    id obj = [(TDTextureImageRenditionSpec *)self textureFacesWithDocument:a5];
    uint64_t v26 = [obj countByEnumeratingWithState:&v41 objects:v49 count:16];
    if (v26)
    {
      uint64_t v27 = v26;
      uint64_t v28 = *(void *)v42;
      do
      {
        for (uint64_t i = 0; i != v27; ++i)
        {
          if (*(void *)v42 != v28) {
            objc_enumerationMutation(obj);
          }
          v30 = *(void **)(*((void *)&v41 + 1) + 8 * i);
          v31 = (CGImage *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v30, "asset"), "sourceImageWithDocument:", a5), "image");
          CGImageGetWidth(v31);
          CGImageGetHeight(v31);
          uint64_t v32 = CGImageGetBitmapInfo(v31) & 0x1F;
          v33 = objc_msgSend(objc_alloc(MEMORY[0x263F38368]), "initWithCGImage:width:height:texturePixelFormat:", v31, v40, v39, -[TDTextureImageRenditionSpec textureFormat](v38, "textureFormat"));
          objc_msgSend(v33, "setTargetPlatform:", objc_msgSend(a5, "targetPlatform"));
          objc_msgSend(v33, "setPixelFormat:", objc_msgSend(v18, "pixelFormat"));
          objc_msgSend(v33, "setColorSpaceID:", (int)objc_msgSend(v18, "colorSpaceID"));
          [v33 setSourceAlphaInfo:v32];
          objc_msgSend(v33, "setTextureInterpretation:", objc_msgSend((id)objc_msgSend(v8, "textureInterpretation"), "identifier"));
          objc_msgSend(v33, "setExifOrientation:", objc_msgSend((id)objc_msgSend(v30, "asset"), "exifOrientation"));
          objc_msgSend(v33, "setFlipped:", objc_msgSend(v30, "flipped"));
          [v18 addBitmap:v33];
        }
        uint64_t v27 = [obj countByEnumeratingWithState:&v41 objects:v49 count:16];
      }
      while (v27);
    }
    objc_msgSend(v18, "setOptOutOfThinning:", objc_msgSend(v8, "optOutOfThinning"));
    v10 = (void *)[v18 CSIRepresentationWithCompression:v36];

    CGImageRelease(image);
  }
  return v10;
}

- (BOOL)updatePackingPropertiesWithDocument:(id)a3
{
  int v5 = (void *)[(TDTextureImageRenditionSpec *)self asset];
  int v11 = 0;
  v10.receiver = self;
  v10.super_class = (Class)TDTextureImageRenditionSpec;
  [(TDRenditionSpec *)&v10 updatePackingPropertiesWithDocument:a3];
  BOOL v6 = -[TDTextureImageRenditionSpec _createImageRefWithURL:andDocument:format:](self, "_createImageRefWithURL:andDocument:format:", [v5 fileURLWithDocument:a3], a3, &v11);
  int AlphaInfo = CUICGImageGetAlphaInfo();
  if (AlphaInfo == 5 || AlphaInfo == 0) {
    [(TDTextureImageRenditionSpec *)self setOpaque:1];
  }
  if (CUIImageIsMonochrome()) {
    [(TDTextureImageRenditionSpec *)self setMonochrome:1];
  }
  CGImageRelease(v6);
  return 1;
}

- (BOOL)canBePackedWithDocument:(id)a3
{
  return 0;
}

@end