@interface TDPNGAsset
- (BOOL)hasCursorProduction;
- (BOOL)hasProduction;
- (CGSize)sourceImageSizeWithDocument:(id)a3;
- (id)sourceImageWithDocument:(id)a3;
- (int)exifOrientation;
- (unsigned)fileScaleFactor;
- (void)_logError:(id)a3;
- (void)setFileScaleFactor:(unsigned int)a3;
@end

@implementation TDPNGAsset

- (void)_logError:(id)a3
{
}

- (CGSize)sourceImageSizeWithDocument:(id)a3
{
  v36[3] = *MEMORY[0x263EF8340];
  double Width = *MEMORY[0x263F001B0];
  double Height = *(double *)(MEMORY[0x263F001B0] + 8);
  CFURLRef v6 = [(TDAsset *)self fileURLWithDocument:a3];
  if (objc_msgSend((id)-[__CFURL pathExtension](v6, "pathExtension"), "caseInsensitiveCompare:", @"PDF"))
  {
    if (objc_msgSend((id)-[__CFURL pathExtension](v6, "pathExtension"), "caseInsensitiveCompare:", @"SVG"))
    {
      if ((int)[(TDAsset *)self scaleFactor] < 1) {
        unsigned int v7 = 72;
      }
      else {
        unsigned int v7 = 72 * [(TDAsset *)self scaleFactor];
      }
      unsigned int valuePtr = v7;
      CFNumberRef v24 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], kCFNumberSInt32Type, &valuePtr);
      uint64_t v25 = *MEMORY[0x263F0F600];
      v35[0] = *MEMORY[0x263F0F5F0];
      v35[1] = v25;
      uint64_t v26 = *MEMORY[0x263EFFB38];
      v36[0] = v24;
      v36[1] = v26;
      v35[2] = *MEMORY[0x263F0F620];
      v36[2] = *MEMORY[0x263EFFB40];
      CFDictionaryRef v27 = (const __CFDictionary *)[NSDictionary dictionaryWithObjects:v36 forKeys:v35 count:3];
      CFRelease(v24);
      v28 = CGImageSourceCreateWithURL(v6, 0);
      if (v28)
      {
        v29 = v28;
        ImageAtIndex = CGImageSourceCreateImageAtIndex(v28, 0, v27);
        if (ImageAtIndex)
        {
          v31 = ImageAtIndex;
          double Width = (double)CGImageGetWidth(ImageAtIndex);
          double Height = (double)CGImageGetHeight(v31);
          CGImageRelease(v31);
        }
        CFRelease(v29);
        goto LABEL_27;
      }
LABEL_26:
      -[TDPNGAsset _logError:](self, "_logError:", [NSString stringWithFormat:@"Unable to get image dimensions for %@", v6]);
      goto LABEL_27;
    }
    if (!CGSVGDocumentCreateFromURL()) {
      goto LABEL_26;
    }
    CGSVGDocumentGetCanvasSize();
    double v18 = v17;
    double v20 = v19;
    unsigned int v21 = [(TDAsset *)self scaleFactor];
    double v22 = (double)v21;
    unsigned int v23 = [(TDPNGAsset *)self fileScaleFactor];
    if (!v21)
    {
      double v22 = 1.0;
      unsigned int v23 = 1;
    }
    if (!v23) {
      unsigned int v23 = +[TDAsset scaleFactorFromImageFilename:[(__CFURL *)v6 path]];
    }
    double Width = round(v22 * (v18 / (double)v23));
    double Height = round(v22 * (v20 / (double)v23));
    CGSVGDocumentRelease();
  }
  else
  {
    CGPDFDocumentRef v8 = CGPDFDocumentCreateWithURL(v6);
    if (!v8) {
      goto LABEL_26;
    }
    v9 = v8;
    unsigned int v10 = [(TDAsset *)self scaleFactor];
    unsigned int v11 = [(TDPNGAsset *)self fileScaleFactor];
    if (v10) {
      double v12 = (double)v10;
    }
    else {
      double v12 = 1.0;
    }
    if (v10) {
      unsigned int v13 = v11;
    }
    else {
      unsigned int v13 = 1;
    }
    Page = CGPDFDocumentGetPage(v9, 1uLL);
    CGRect BoxRect = CGPDFPageGetBoxRect(Page, kCGPDFCropBox);
    double v15 = BoxRect.size.width;
    double v16 = BoxRect.size.height;
    if (!v13) {
      unsigned int v13 = +[TDAsset scaleFactorFromImageFilename:[(__CFURL *)v6 path]];
    }
    double Width = round(v12 * (v15 / (double)v13));
    double Height = round(v12 * (v16 / (double)v13));
    CGPDFDocumentRelease(v9);
  }
LABEL_27:
  double v32 = Width;
  double v33 = Height;
  result.height = v33;
  result.width = v32;
  return result;
}

- (id)sourceImageWithDocument:(id)a3
{
  v21[2] = *MEMORY[0x263EF8340];
  CFURLRef v4 = [(TDAsset *)self fileURLWithDocument:a3];
  v5 = CGImageSourceCreateWithURL(v4, 0);
  uint64_t v6 = *MEMORY[0x263F0F600];
  v20[0] = *MEMORY[0x263F0F620];
  v20[1] = v6;
  uint64_t v7 = *MEMORY[0x263EFFB38];
  v21[0] = *MEMORY[0x263EFFB40];
  v21[1] = v7;
  CFDictionaryRef v8 = (const __CFDictionary *)[NSDictionary dictionaryWithObjects:v21 forKeys:v20 count:2];
  if (!v5) {
    goto LABEL_13;
  }
  CFDictionaryRef v9 = v8;
  CGImageRef ImageAtIndex = CGImageSourceCreateImageAtIndex(v5, 0, v8);
  if (!ImageAtIndex)
  {
    CFRelease(v5);
LABEL_13:
    -[TDPNGAsset _logError:](self, "_logError:", [NSString stringWithFormat:@"CoreThemeDefinition: Unable to create image for %@", v4]);
    return 0;
  }
  unsigned int v11 = ImageAtIndex;
  double v12 = &self->super._scaleFactor + 1;
  *double v12 = 1;
  CFDictionaryRef v13 = CGImageSourceCopyPropertiesAtIndex(v5, 0, v9);
  if (v13)
  {
    CFDictionaryRef v14 = v13;
    double v15 = (const void *)*MEMORY[0x263F0F4C8];
    CFNumberRef Value = (const __CFNumber *)CFDictionaryGetValue(v13, (const void *)*MEMORY[0x263F0F4C8]);
    if (Value && !CFNumberGetValue(Value, kCFNumberSInt32Type, v12)) {
      *double v12 = 1;
    }
    CFNumberRef v17 = (const __CFNumber *)CFDictionaryGetValue(v14, v15);
    if (v17 && !CFNumberGetValue(v17, kCFNumberSInt32Type, v12)) {
      *double v12 = 1;
    }
    CFRelease(v14);
  }
  CFRelease(v5);
  double v18 = (void *)[MEMORY[0x263F38388] imageWithCGImage:v11];
  CGImageRelease(v11);
  return v18;
}

- (int)exifOrientation
{
  int v2 = *(&self->super._scaleFactor + 1);
  if (!v2)
  {
    int v2 = 1;
    *(&self->super._scaleFactor + 1) = 1;
  }
  return v2;
}

- (void)setFileScaleFactor:(unsigned int)a3
{
  [(TDPNGAsset *)self willChangeValueForKey:@"fileScaleFactor"];
  self->_exifOrientation = a3;

  [(TDPNGAsset *)self didChangeValueForKey:@"fileScaleFactor"];
}

- (unsigned)fileScaleFactor
{
  [(TDPNGAsset *)self willAccessValueForKey:@"fileScaleFactor"];
  unsigned int exifOrientation = self->_exifOrientation;
  [(TDPNGAsset *)self didAccessValueForKey:@"fileScaleFactor"];
  return exifOrientation;
}

- (BOOL)hasCursorProduction
{
  return 0;
}

- (BOOL)hasProduction
{
  uint64_t v3 = [(TDPNGAsset *)self renditions];
  if (v3) {
    LOBYTE(v3) = objc_msgSend((id)-[TDPNGAsset renditions](self, "renditions"), "count") != 0;
  }
  return v3;
}

@end