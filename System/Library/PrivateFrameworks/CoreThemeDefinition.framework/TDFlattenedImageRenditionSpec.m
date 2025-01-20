@interface TDFlattenedImageRenditionSpec
- (BOOL)updatePackingPropertiesWithDocument:(id)a3;
- (id)createCSIRepresentationWithCompression:(BOOL)a3 colorSpaceID:(unint64_t)a4 document:(id)a5;
- (void)addLayerReferencesObject:(id)a3;
- (void)drawFlattenedImageIntoContext:(CGContext *)a3 document:(id)a4;
@end

@implementation TDFlattenedImageRenditionSpec

- (void)drawFlattenedImageIntoContext:(CGContext *)a3 document:(id)a4
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  unsigned int v7 = objc_msgSend((id)-[TDFlattenedImageRenditionSpec keySpec](self, "keySpec"), "scaleFactor");
  CGContextSaveGState(a3);
  double Width = (double)CGBitmapContextGetWidth(a3);
  double Height = (double)CGBitmapContextGetHeight(a3);
  CGContextTranslateCTM(a3, (Width - (double)(int)[(TDFlattenedImageRenditionSpec *)self width]) * 0.5, (Height - (double)(int)[(TDFlattenedImageRenditionSpec *)self height]) * 0.5);
  double v10 = (double)(int)[(TDFlattenedImageRenditionSpec *)self width];
  double v11 = (double)(int)[(TDFlattenedImageRenditionSpec *)self height];
  v31.origin.x = 0.0;
  v31.origin.y = 0.0;
  v31.size.width = v10;
  v31.size.height = v11;
  CGContextClipToRect(a3, v31);
  if (objc_msgSend((id)-[TDFlattenedImageRenditionSpec layerReferences](self, "layerReferences"), "count"))
  {
    double v12 = (double)v7;
    CGContextScaleCTM(a3, (double)v7, (double)v7);
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    v13 = (void *)[(TDFlattenedImageRenditionSpec *)self layerReferences];
    uint64_t v14 = [v13 countByEnumeratingWithState:&v25 objects:v29 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v26;
      double v17 = Height / v12;
      do
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v26 != v16) {
            objc_enumerationMutation(v13);
          }
          v19 = *(void **)(*((void *)&v25 + 1) + 8 * i);
          v20 = (void *)[v19 reference];
          v21 = (CGImage *)objc_msgSend(v20, "_createImageRefWithURL:andDocument:format:vectorBased:", objc_msgSend((id)objc_msgSend(v20, "asset"), "fileURLWithDocument:", a4), a4, 0, 0);
          CGContextSetBlendMode(a3, (CGBlendMode)objc_msgSend((id)objc_msgSend(v19, "blendMode"), "integerValue"));
          objc_msgSend((id)objc_msgSend(v19, "opacity"), "floatValue");
          CGContextSetAlpha(a3, v22);
          [v19 frameRect];
          v32.origin.y = v17 - v32.size.height - v23;
          CGContextDrawImage(a3, v32, v21);
          CGImageRelease(v21);
        }
        uint64_t v15 = [v13 countByEnumeratingWithState:&v25 objects:v29 count:16];
      }
      while (v15);
    }
  }
  else if ([(TDFlattenedImageRenditionSpec *)self asset])
  {
    v24 = -[TDSimpleArtworkRenditionSpec _createImageRefWithURL:andDocument:format:vectorBased:](self, "_createImageRefWithURL:andDocument:format:vectorBased:", objc_msgSend((id)-[TDFlattenedImageRenditionSpec asset](self, "asset"), "fileURLWithDocument:", a4), a4, 0, 0);
    CGContextSetBlendMode(a3, kCGBlendModeNormal);
    CGContextSetAlpha(a3, 1.0);
    v33.origin.x = 0.0;
    v33.origin.y = 0.0;
    v33.size.width = v10;
    v33.size.height = v11;
    CGContextDrawImage(a3, v33, v24);
    CGImageRelease(v24);
  }
  CGContextRestoreGState(a3);
}

- (id)createCSIRepresentationWithCompression:(BOOL)a3 colorSpaceID:(unint64_t)a4 document:(id)a5
{
  BOOL v7 = a3;
  if ([(TDFlattenedImageRenditionSpec *)self asset]
    || (id result = (id)objc_msgSend((id)-[TDFlattenedImageRenditionSpec layerReferences](self, "layerReferences"), "count")) != 0)
  {
    int v11 = [a5 allowsExtendedRangePixelFormats];
    double v12 = objc_msgSend(objc_alloc(MEMORY[0x263F38370]), "initWithCanvasSize:sliceCount:layout:", 0, 0, (double)(int)-[TDFlattenedImageRenditionSpec width](self, "width"), (double)(int)-[TDFlattenedImageRenditionSpec height](self, "height"));
    if (objc_msgSend((id)objc_msgSend((id)-[TDFlattenedImageRenditionSpec keySpec](self, "keySpec"), "gamut"), "identifier") == 1)unint64_t v13 = 3; {
    else
    }
      unint64_t v13 = a4;
    if (v11)
    {
      if (v13 == 3)
      {
        if ([(TDFlattenedImageRenditionSpec *)self monochrome]) {
          uint64_t v16 = 1195454774;
        }
        else {
          uint64_t v16 = 1380401751;
        }
        [v12 setPixelFormat:v16];
        if ([(TDFlattenedImageRenditionSpec *)self monochrome]) {
          LOWORD(a4) = 6;
        }
        else {
          LOWORD(a4) = 4;
        }
      }
      else if (v13 == 1)
      {
        if ([(TDFlattenedImageRenditionSpec *)self monochrome]) {
          uint64_t v14 = 1195456544;
        }
        else {
          uint64_t v14 = 1095911234;
        }
        [v12 setPixelFormat:v14];
        LOWORD(a4) = 1;
      }
      else
      {
        objc_msgSend((id)objc_msgSend(MEMORY[0x263F08690], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"TDFlattenedImageRenditionSpec.m", 99, @"Flattened image %@ got passed an unexpected colorValue '%d'", objc_msgSend((id)objc_msgSend((id)-[TDFlattenedImageRenditionSpec production](self, "production"), "name"), "name"), v13);
      }
    }
    else
    {
      if ([(TDFlattenedImageRenditionSpec *)self monochrome]) {
        uint64_t v15 = 1195456544;
      }
      else {
        uint64_t v15 = 1095911234;
      }
      [v12 setPixelFormat:v15];
      LOWORD(a4) = v13;
    }
    [v12 setName:objc_msgSend(NSString, "stringWithFormat:", @"ZZZZFlattenedImage-%d.%d.%d-gamut%d", objc_msgSend((id)-[TDFlattenedImageRenditionSpec keySpec](self, "keySpec"), "scaleFactor"), -[TDFlattenedImageRenditionSpec opaque](self, "opaque"), -[TDFlattenedImageRenditionSpec monochrome](self, "monochrome"), objc_msgSend((id)objc_msgSend((id)-[TDFlattenedImageRenditionSpec keySpec](self, "keySpec"), "gamut"), "identifier"))];
    [v12 setColorSpaceID:(__int16)a4];
    objc_msgSend(v12, "setScaleFactor:", objc_msgSend((id)-[TDFlattenedImageRenditionSpec keySpec](self, "keySpec"), "scaleFactor"));
    objc_msgSend(v12, "addSliceRect:", *MEMORY[0x263F08670], *(double *)(MEMORY[0x263F08670] + 8), *(double *)(MEMORY[0x263F08670] + 16), *(double *)(MEMORY[0x263F08670] + 24));
    [v12 setBlendMode:0];
    [v12 setOpacity:1.0];
    if (objc_msgSend((id)-[TDFlattenedImageRenditionSpec compressionType](self, "compressionType"), "identifier"))objc_msgSend(v12, "setCompressionType:", objc_msgSend((id)-[TDFlattenedImageRenditionSpec compressionType](self, "compressionType"), "identifier")); {
    double v17 = objc_msgSend(objc_alloc(MEMORY[0x263F38368]), "initWithPixelWidth:pixelHeight:", -[TDFlattenedImageRenditionSpec width](self, "width"), -[TDFlattenedImageRenditionSpec height](self, "height"));
    }
    objc_msgSend(v17, "setPixelFormat:", objc_msgSend(v12, "pixelFormat"));
    if ([(TDFlattenedImageRenditionSpec *)self opaque]) {
      uint64_t v18 = 6;
    }
    else {
      uint64_t v18 = 2;
    }
    [v17 setSourceAlphaInfo:v18];
    objc_msgSend(v17, "setColorSpaceID:", (int)objc_msgSend(v12, "colorSpaceID"));
    [v12 addBitmap:v17];
    -[TDFlattenedImageRenditionSpec drawFlattenedImageIntoContext:document:](self, "drawFlattenedImageIntoContext:document:", [v17 bitmapContext], a5);
    v19 = (void *)[v12 CSIRepresentationWithCompression:v7];

    return v19;
  }
  return result;
}

- (void)addLayerReferencesObject:(id)a3
{
  v5 = objc_msgSend(MEMORY[0x263EFF9B0], "orderedSetWithOrderedSet:", -[TDFlattenedImageRenditionSpec layerReferences](self, "layerReferences"));
  [v5 addObject:a3];

  [(TDFlattenedImageRenditionSpec *)self setLayerReferences:v5];
}

- (BOOL)updatePackingPropertiesWithDocument:(id)a3
{
  return 1;
}

@end