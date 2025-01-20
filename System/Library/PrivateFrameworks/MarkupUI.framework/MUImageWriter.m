@interface MUImageWriter
- (BOOL)writeUsingBaseImage:(id)a3 withAnnotationsFromController:(id)a4 asImageOfType:(id)a5 toConsumer:(CGDataConsumer *)a6 embedSourceImageAndAnnotationsAsMetadata:(BOOL)a7 encryptPrivateMetadata:(BOOL)a8 error:(id *)a9;
- (id)encodedModelFromAnnotationsController:(id)a3 encrypt:(BOOL)a4;
@end

@implementation MUImageWriter

- (BOOL)writeUsingBaseImage:(id)a3 withAnnotationsFromController:(id)a4 asImageOfType:(id)a5 toConsumer:(CGDataConsumer *)a6 embedSourceImageAndAnnotationsAsMetadata:(BOOL)a7 encryptPrivateMetadata:(BOOL)a8 error:(id *)a9
{
  BOOL v9 = a8;
  BOOL v102 = a7;
  v130[1] = *MEMORY[0x263EF8340];
  id v13 = a3;
  id v14 = a4;
  type = (__CFString *)a5;
  v15 = @"base_image";
  BOOL v100 = v9;
  if (v9)
  {
    v15 = @"enc_base_image";
    v16 = @"enc_model";
  }
  else
  {
    v16 = @"model";
  }
  v105 = v15;
  name = v16;
  v113 = v14;
  [v14 commitEditing];
  objc_opt_class();
  v106 = v13;
  v99 = self;
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      ImageAtIndedouble x = (CGImage *)[v13 CGImage];
      CGImageRetain(ImageAtIndex);
      BOOL v102 = 0;
      isrc = 0;
      goto LABEL_13;
    }
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    CGImageSourceRef v17 = CGImageSourceCreateWithURL((CFURLRef)v13, 0);
    if (v17) {
      goto LABEL_8;
    }
    goto LABEL_11;
  }
  CGImageSourceRef v17 = CGImageSourceCreateWithData((CFDataRef)v13, 0);
  if (!v17)
  {
LABEL_11:
    isrc = 0;
    ImageAtIndedouble x = 0;
LABEL_13:
    CFDictionaryRef options = 0;
    BOOL v22 = 0;
LABEL_16:
    Mutable = CGImageMetadataCreateMutable();
    goto LABEL_17;
  }
LABEL_8:
  isrc = v17;
  uint64_t v129 = *MEMORY[0x263F0F5A0];
  v130[0] = MEMORY[0x263EFFA88];
  CFDictionaryRef v18 = [NSDictionary dictionaryWithObjects:v130 forKeys:&v129 count:1];
  CFDictionaryRef v19 = CGImageSourceCopyPropertiesAtIndex(isrc, 0, v18);
  CFDictionaryRef options = (const __CFDictionary *)[(__CFDictionary *)v19 muDeepMutableCopy];

  v20 = CGImageSourceCopyMetadataAtIndex(isrc, 0, 0);
  v21 = v20;
  BOOL v22 = v20 != 0;
  if (v20)
  {
    Mutable = CGImageMetadataCreateMutableCopy(v20);
    CFRelease(v21);
  }
  else
  {
    Mutable = 0;
  }
  uint64_t v127 = *MEMORY[0x263F0F600];
  uint64_t v128 = MEMORY[0x263EFFA80];
  CFDictionaryRef v25 = [NSDictionary dictionaryWithObjects:&v128 forKeys:&v127 count:1];
  ImageAtIndedouble x = CGImageSourceCreateImageAtIndex(isrc, 0, v25);

  if (!Mutable) {
    goto LABEL_16;
  }
LABEL_17:
  CFErrorRef err = 0;
  CGImageMetadataRegisterNamespaceForPrefix(Mutable, kMetadataNamespaceAnnotationKit, kMetadataPrefixAnnotationKit, &err);
  if (v22)
  {
    v26 = [NSString stringWithFormat:@"%@:%@", kMetadataPrefixAnnotationKit, name];
    CGImageMetadataRemoveTagWithPath(Mutable, 0, v26);
  }
  v27 = [v113 modelController];
  v114 = [v27 pageModelControllers];

  if ((unint64_t)[v114 count] >= 2) {
    NSLog(&cfstr_Pagemodelcontr_0.isa, "-[MUImageWriter writeUsingBaseImage:withAnnotationsFromController:asImageOfType:toConsumer:embedSourceImageAndAnnotationsAsMetadata:encryptPrivateMetadata:error:]");
  }
  if (!ImageAtIndex)
  {
    NSLog(&cfstr_SFailedToCreat_1.isa, "-[MUImageWriter writeUsingBaseImage:withAnnotationsFromController:asImageOfType:toConsumer:embedSourceImageAndAnnotationsAsMetadata:encryptPrivateMetadata:error:]", v106);
    Image = 0;
    ImageAtIndedouble x = 0;
    BOOL v38 = 0;
    goto LABEL_114;
  }
  v111 = [v114 firstObject];
  v109 = [v111 annotations];
  if (![v109 count])
  {
    Image = CGImageRetain(ImageAtIndex);
    goto LABEL_71;
  }
  unint64_t Width = CGImageGetWidth(ImageAtIndex);
  unint64_t Height = CGImageGetHeight(ImageAtIndex);
  context = [v111 cropAnnotation];
  [v111 appliedCropRect];
  BOOL IsInfinite = CGRectIsInfinite(v131);
  double v31 = (double)Width;
  double v32 = (double)Height;
  v33 = context;
  if (context) {
    BOOL v34 = 0;
  }
  else {
    BOOL v34 = IsInfinite;
  }
  if (v34)
  {
    double y = 0.0;
    double x = 0.0;
  }
  else
  {
    if (context)
    {
      v39 = (void *)[v109 mutableCopy];
      [v39 removeObject:context];

      v33 = context;
    }
    else
    {
      v39 = v109;
    }
    double v40 = 0.0;
    double v41 = (double)Height;
    double v42 = (double)Width;
    double v43 = 0.0;
    if (!IsInfinite)
    {
      [v111 appliedCropRect];
      double v43 = v44;
      double v40 = v45;
      double v42 = v46;
      v33 = context;
    }
    if (v33)
    {
      [v33 rectangle];
      double v48 = v47;
      [context rectangle];
      double v50 = v49;
      [context rectangle];
      double v42 = v51;
      [context rectangle];
      double v43 = v43 + v48;
      double v40 = v40 + v50;
    }
    v136.origin.double x = 0.0;
    v136.origin.double y = 0.0;
    double v52 = v43;
    double v53 = v40;
    double v54 = v42;
    v136.size.width = (double)Width;
    v136.size.height = (double)Height;
    CGRect v132 = CGRectIntersection(*(CGRect *)(&v41 - 3), v136);
    double x = v132.origin.x;
    double y = v132.origin.y;
    CGFloat v55 = v132.size.width;
    CGFloat v56 = v132.size.height;
    double v57 = CGRectGetWidth(v132);
    v133.origin.double x = x;
    v133.origin.double y = y;
    v133.size.width = v55;
    v133.size.height = v56;
    unint64_t Width = (unint64_t)v57;
    unint64_t Height = (unint64_t)CGRectGetHeight(v133);
    v109 = v39;
  }
  ColorSpace = CGImageGetColorSpace(ImageAtIndex);
  BOOL v59 = CGColorSpaceUsesExtendedRange(ColorSpace) || CGColorSpaceUsesITUR_2100TF(ColorSpace);
  if (MUGlowHDREnabled_onceToken != -1) {
    dispatch_once(&MUGlowHDREnabled_onceToken, &__block_literal_global_3);
  }
  if (MUGlowHDREnabled__glowHDREnabled) {
    BOOL v60 = v59;
  }
  else {
    BOOL v60 = 0;
  }
  if (v60)
  {
    CGColorSpaceRef v61 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x263F001E8]);
  }
  else
  {
    if (ColorSpace && CGColorSpaceSupportsOutput(ColorSpace) && CGColorSpaceGetNumberOfComponents(ColorSpace) == 3)
    {
      v62 = 0;
      goto LABEL_54;
    }
    CGColorSpaceRef v61 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x263F002D8]);
  }
  v62 = v61;
  ColorSpace = v61;
LABEL_54:
  size_t AlignedBytesPerRow = CGBitmapGetAlignedBytesPerRow();
  v64 = CGBitmapContextCreate(0, Width, Height, 8uLL, AlignedBytesPerRow, ColorSpace, 2u);
  v65 = v64;
  if (v64)
  {
    CGContextTranslateCTM(v64, -x, -y);
    v134.origin.double x = 0.0;
    v134.origin.double y = 0.0;
    v134.size.width = v31;
    v134.size.height = v32;
    CGContextDrawImage(v65, v134, ImageAtIndex);
    CGImageRelease(ImageAtIndex);
    CGContextScaleCTM(v65, 1.0, 1.0);
    CGContextSaveGState(v65);
    if (!IsInfinite)
    {
      [v111 appliedCropRect];
      CGContextTranslateCTM(v65, v66, v67);
    }
    long long v118 = 0u;
    long long v119 = 0u;
    long long v116 = 0u;
    long long v117 = 0u;
    id v68 = v109;
    uint64_t v69 = [v68 countByEnumeratingWithState:&v116 objects:v126 count:16];
    if (v69)
    {
      uint64_t v70 = *(void *)v117;
      do
      {
        for (uint64_t i = 0; i != v69; ++i)
        {
          if (*(void *)v117 != v70) {
            objc_enumerationMutation(v68);
          }
          v72 = *(void **)(*((void *)&v116 + 1) + 8 * i);
          v73 = (void *)MEMORY[0x230F8EA40]();
          CGContextSaveGState(v65);
          [v72 integralDrawingBounds];
          CGFloat v74 = v135.origin.x;
          CGFloat v75 = v135.origin.y;
          if (!CGRectIsInfinite(v135)) {
            CGContextTranslateCTM(v65, v74, v75);
          }
          [MEMORY[0x263F24BB8] renderAnnotation:v72 inContext:v65];
          CGContextRestoreGState(v65);
        }
        uint64_t v69 = [v68 countByEnumeratingWithState:&v116 objects:v126 count:16];
      }
      while (v69);
    }

    CGContextRestoreGState(v65);
    Image = CGBitmapContextCreateImage(v65);
    CGContextRelease(v65);
    ImageAtIndedouble x = 0;
    if (!v62) {
      goto LABEL_70;
    }
    goto LABEL_69;
  }
  NSLog(&cfstr_Cgbitmapcontex.isa);
  Image = CGImageRetain(ImageAtIndex);
  if (v62) {
LABEL_69:
  }
    CGColorSpaceRelease(v62);
LABEL_70:

LABEL_71:
  v76 = CGImageDestinationCreateWithDataConsumer(a6, type, 1uLL, 0);
  if (v76)
  {
    if (!v102)
    {
LABEL_98:
      v94 = [v113 modifiedImageDescription];
      if (v94)
      {
        CFErrorRef v115 = 0;
        uint64_t v122 = 0;
        v123 = &v122;
        uint64_t v124 = 0x2020000000;
        v95 = (uint64_t (*)(CGImageMetadata *, void *, CFErrorRef *))getMAImageCaptioningSetCaptionIntoMetadataSymbolLoc_ptr;
        v125 = getMAImageCaptioningSetCaptionIntoMetadataSymbolLoc_ptr;
        if (!getMAImageCaptioningSetCaptionIntoMetadataSymbolLoc_ptr)
        {
          v121[0] = (CFErrorRef)MEMORY[0x263EF8330];
          v121[1] = (CFErrorRef)3221225472;
          v121[2] = (CFErrorRef)__getMAImageCaptioningSetCaptionIntoMetadataSymbolLoc_block_invoke;
          v121[3] = (CFErrorRef)&unk_2649C27C8;
          v121[4] = (CFErrorRef)&v122;
          __getMAImageCaptioningSetCaptionIntoMetadataSymbolLoc_block_invoke((uint64_t)v121);
          v95 = (uint64_t (*)(CGImageMetadata *, void *, CFErrorRef *))v123[3];
        }
        _Block_object_dispose(&v122, 8);
        if (!v95) {
          +[MUImageReader imageDescriptionFromSourceContent:]();
        }
        if ((v95(Mutable, v94, &v115) & 1) == 0)
        {
          if (v115)
          {
            v96 = (__CFString *)CFErrorCopyDescription(v115);
            CFRelease(v115);
          }
          else
          {
            v96 = 0;
          }
          if ([(__CFString *)v96 length]) {
            NSLog(&cfstr_S.isa, "-[MUImageWriter writeUsingBaseImage:withAnnotationsFromController:asImageOfType:toConsumer:embedSourceImageAndAnnotationsAsMetadata:encryptPrivateMetadata:error:]", v96);
          }
          else {
            NSLog(&cfstr_SErrorSettingI.isa, "-[MUImageWriter writeUsingBaseImage:withAnnotationsFromController:asImageOfType:toConsumer:embedSourceImageAndAnnotationsAsMetadata:encryptPrivateMetadata:error:]");
          }
        }
      }
      CGImageDestinationAddImageAndMetadata(v76, Image, Mutable, options);
      BOOL v38 = CGImageDestinationFinalize(v76);
      if (!v38) {
        NSLog(&cfstr_SCgimagedestin.isa, "-[MUImageWriter writeUsingBaseImage:withAnnotationsFromController:asImageOfType:toConsumer:embedSourceImageAndAnnotationsAsMetadata:encryptPrivateMetadata:error:]");
      }
      CFRelease(v76);

      goto LABEL_113;
    }
    v77 = (void *)MEMORY[0x230F8EA40]();
    v78 = [(MUImageWriter *)v99 encodedModelFromAnnotationsController:v113 encrypt:v100];
    v79 = [v78 base64EncodedStringWithOptions:0];
    v80 = CGImageMetadataTagCreate(kMetadataNamespaceAnnotationKit, kMetadataPrefixAnnotationKit, name, kCGImageMetadataTypeString, v79);
    if (v80)
    {
      v81 = [NSString stringWithFormat:@"%@:%@", kMetadataPrefixAnnotationKit, name];
      CGImageMetadataSetTagWithPath(Mutable, 0, v81, v80);
      CFRelease(v80);
    }
    v82 = [NSString stringWithFormat:@"%@:%@", kMetadataPrefixAnnotationKit, v105];
    CGImageMetadataTagRef v83 = CGImageMetadataCopyTagWithPath(Mutable, 0, v82);
    if (v83)
    {
      CFRelease(v83);
      v84 = v82;
LABEL_97:

      goto LABEL_98;
    }
    v85 = [MEMORY[0x263EFF990] data];
    if (isrc)
    {
      CFStringRef v86 = CGImageSourceGetType(isrc);
      v87 = CGImageDestinationCreateWithData(v85, v86, 1uLL, 0);
      CGImageDestinationRef v88 = v87;
      if (v87)
      {
        v121[0] = 0;
        if (CGImageDestinationCopyImageSource(v87, isrc, 0, v121)) {
          goto LABEL_84;
        }
        NSLog(&cfstr_Cgimagedestina.isa, v121[0]);
        CFRelease(v88);
      }
      else
      {
        NSLog(&cfstr_Cgimagedestina_0.isa);
      }
    }
    else
    {
      v89 = [(id)*MEMORY[0x263F1DB40] identifier];
      CGImageDestinationRef v88 = CGImageDestinationCreateWithData(v85, v89, 1uLL, 0);

      if (v88)
      {
        CGImageDestinationAddImage(v88, ImageAtIndex, 0);
        if (ImageAtIndex)
        {
LABEL_84:
          CFRelease(v88);
          contexta = (void *)MEMORY[0x230F8EA40]();
          if (v100)
          {
            v90 = +[MUPayloadEncryption sharedInstance];
            v91 = [v90 encryptData:v85];
          }
          else
          {
            v91 = v85;
          }
          if (v91)
          {
            v92 = [(__CFData *)v91 base64EncodedStringWithOptions:0];
            v93 = CGImageMetadataTagCreate(kMetadataNamespaceAnnotationKit, kMetadataPrefixAnnotationKit, v105, kCGImageMetadataTypeString, v92);
            v84 = [NSString stringWithFormat:@"%@:%@", kMetadataPrefixAnnotationKit, v105];

            CGImageMetadataSetTagWithPath(Mutable, 0, v84, v93);
            CFRelease(v93);
          }
          else
          {
            v84 = v82;
          }

          goto LABEL_96;
        }
        NSLog(&cfstr_Cgimagedestina_1.isa);
        CFRelease(v88);
      }
      else
      {
        NSLog(&cfstr_Cgimagedestina_2.isa);
      }
    }
    NSLog(&cfstr_DidnTWriteBase.isa);
    v84 = v82;
LABEL_96:

    goto LABEL_97;
  }
  NSLog(&cfstr_SFailedToCreat_0.isa, "-[MUImageWriter writeUsingBaseImage:withAnnotationsFromController:asImageOfType:toConsumer:embedSourceImageAndAnnotationsAsMetadata:encryptPrivateMetadata:error:]");
  BOOL v38 = 0;
LABEL_113:

LABEL_114:
  if (isrc) {
    CFRelease(isrc);
  }
  if (ImageAtIndex) {
    CFRelease(ImageAtIndex);
  }
  if (Image) {
    CFRelease(Image);
  }
  if (Mutable) {
    CFRelease(Mutable);
  }
  if (a9) {
    char v97 = v38;
  }
  else {
    char v97 = 1;
  }
  if ((v97 & 1) == 0)
  {
    *a9 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F07F70] code:512 userInfo:0];
  }

  return v38;
}

- (id)encodedModelFromAnnotationsController:(id)a3 encrypt:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  [v5 commitEditing];
  v6 = [v5 modelController];

  v7 = [v6 archivedPageModelControllers];

  if (v4)
  {
    v8 = +[MUPayloadEncryption sharedInstance];
    uint64_t v9 = [v8 encryptData:v7];

    v7 = (void *)v9;
  }
  return v7;
}

@end