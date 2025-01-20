@interface TDRadiosityImageRenditionSpec
- (BOOL)updatePackingPropertiesWithDocument:(id)a3;
- (id)createCSIRepresentationWithCompression:(BOOL)a3 colorSpaceID:(unint64_t)a4 document:(id)a5;
@end

@implementation TDRadiosityImageRenditionSpec

- (id)createCSIRepresentationWithCompression:(BOOL)a3 colorSpaceID:(unint64_t)a4 document:(id)a5
{
  __int16 v6 = a4;
  BOOL v7 = a3;
  if (!objc_msgSend((id)-[TDRadiosityImageRenditionSpec flattenedImage](self, "flattenedImage"), "asset")
    && !objc_msgSend((id)objc_msgSend((id)-[TDRadiosityImageRenditionSpec flattenedImage](self, "flattenedImage"), "layerReferences"), "count"))
  {
    return 0;
  }
  BOOL v30 = v7;
  v9 = objc_msgSend(objc_alloc(MEMORY[0x263F38370]), "initWithCanvasSize:sliceCount:layout:", 0, 0, (double)(int)-[TDRadiosityImageRenditionSpec width](self, "width"), (double)(int)-[TDRadiosityImageRenditionSpec height](self, "height"));
  int v10 = objc_msgSend((id)objc_msgSend((id)-[TDRadiosityImageRenditionSpec keySpec](self, "keySpec"), "gamut"), "identifier");
  objc_msgSend(v9, "setTargetPlatform:", objc_msgSend(a5, "targetPlatform"));
  if ([(TDRadiosityImageRenditionSpec *)self monochrome]) {
    uint64_t v11 = 1195456544;
  }
  else {
    uint64_t v11 = 1095911234;
  }
  [v9 setPixelFormat:v11];
  [v9 setName:objc_msgSend(NSString, "stringWithFormat:", @"ZZZZRadiosityImage-%d.%d.%d", objc_msgSend((id)-[TDRadiosityImageRenditionSpec keySpec](self, "keySpec"), "scaleFactor"), -[TDRadiosityImageRenditionSpec opaque](self, "opaque"), -[TDRadiosityImageRenditionSpec monochrome](self, "monochrome"))];
  if (v10 == 1) {
    __int16 v12 = 3;
  }
  else {
    __int16 v12 = v6;
  }
  [v9 setColorSpaceID:v12];
  objc_msgSend(v9, "setScaleFactor:", objc_msgSend((id)-[TDRadiosityImageRenditionSpec keySpec](self, "keySpec"), "scaleFactor"));
  objc_msgSend(v9, "addSliceRect:", *MEMORY[0x263F08670], *(double *)(MEMORY[0x263F08670] + 8), *(double *)(MEMORY[0x263F08670] + 16), *(double *)(MEMORY[0x263F08670] + 24));
  [v9 setBlendMode:0];
  [v9 setOpacity:1.0];
  objc_msgSend(v9, "setRenditionProperties:", -[TDRenditionSpec propertiesAsDictionary](self, "propertiesAsDictionary"));
  if (objc_msgSend((id)-[TDRadiosityImageRenditionSpec compressionType](self, "compressionType"), "identifier")&& objc_msgSend((id)-[TDRadiosityImageRenditionSpec compressionType](self, "compressionType"), "identifier") != 2)
  {
    uint64_t v13 = objc_msgSend((id)-[TDRadiosityImageRenditionSpec compressionType](self, "compressionType"), "identifier");
  }
  else
  {
    uint64_t v13 = 6;
  }
  [v9 setCompressionType:v13];
  v14 = objc_msgSend(objc_alloc(MEMORY[0x263F38368]), "initWithPixelWidth:pixelHeight:", -[TDRadiosityImageRenditionSpec width](self, "width"), -[TDRadiosityImageRenditionSpec height](self, "height"));
  objc_msgSend(v14, "setTargetPlatform:", objc_msgSend(a5, "targetPlatform"));
  objc_msgSend(v14, "setPixelFormat:", objc_msgSend(v9, "pixelFormat"));
  if ([(TDRadiosityImageRenditionSpec *)self opaque]) {
    uint64_t v15 = 6;
  }
  else {
    uint64_t v15 = 2;
  }
  [v14 setSourceAlphaInfo:v15];
  v16 = (CGContext *)[v14 bitmapContext];
  objc_msgSend((id)-[TDRadiosityImageRenditionSpec flattenedImage](self, "flattenedImage"), "drawFlattenedImageIntoContext:document:", v16, a5);
  Data = CGBitmapContextGetData(v16);
  size_t BytesPerRow = CGBitmapContextGetBytesPerRow(v16);
  size_t BitsPerPixel = CGBitmapContextGetBitsPerPixel(v16);
  size_t Width = CGBitmapContextGetWidth(v16);
  size_t Height = CGBitmapContextGetHeight(v16);
  v40[0] = 1;
  CGSize v22 = (CGSize)*MEMORY[0x263F001B0];
  long long v38 = 0u;
  CGSize v39 = v22;
  *(_OWORD *)v37 = 0u;
  objc_msgSend(MEMORY[0x263F38398], "_doRadiosityBlurOnPixelBuffer:bytesPerRow:bitsPerPixel:width:height:scaleFactor:usesGaussianBlur:adjustedSize:", Data, BytesPerRow, BitsPerPixel, Width, Height, objc_msgSend((id)-[TDRadiosityImageRenditionSpec keySpec](self, "keySpec"), "scaleFactor"), v40, &v39);
  if (v40[0])
  {
    [v9 addBitmap:v14];
    v23 = (void *)[v9 CSIRepresentationWithCompression:v30];
  }
  else
  {
    int v36 = 0;
    v31[0] = 8;
    v31[1] = BitsPerPixel;
    CGColorSpaceRef ColorSpace = CGBitmapContextGetColorSpace(v16);
    int v33 = 8194;
    uint64_t v35 = 0;
    uint64_t v34 = 0;
    v24 = (CGImage *)MEMORY[0x237DD6330](v37, v31, 0, 0, 0, 0);
    id v25 = objc_alloc(MEMORY[0x263F38368]);
    v26 = (void *)[v25 initWithPixelWidth:v39.width pixelHeight:v39.height];
    objc_msgSend(v26, "setTargetPlatform:", objc_msgSend(a5, "targetPlatform"));
    objc_msgSend(v26, "setPixelFormat:", objc_msgSend(v9, "pixelFormat"));
    if ([(TDRadiosityImageRenditionSpec *)self opaque]) {
      uint64_t v27 = 6;
    }
    else {
      uint64_t v27 = 2;
    }
    [v26 setSourceAlphaInfo:v27];
    v28 = (CGContext *)[v26 bitmapContext];
    v41.size = v39;
    v41.origin.x = 0.0;
    v41.origin.y = 0.0;
    CGContextDrawImage(v28, v41, v24);
    [v9 addBitmap:v26];
    v23 = (void *)[v9 CSIRepresentationWithCompression:v30];
    CGImageRelease(v24);

    free(v37[0]);
  }

  return v23;
}

- (BOOL)updatePackingPropertiesWithDocument:(id)a3
{
  return 1;
}

@end