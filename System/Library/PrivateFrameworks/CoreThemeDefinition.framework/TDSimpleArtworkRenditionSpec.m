@interface TDSimpleArtworkRenditionSpec
+ (void)initialize;
- ($56AE26BFB60993BDE24C7578AE3A2D7B)_edgeMetricsForAlignmentRect:(SEL)a3 originalRenditionSize:(CGRect)a4 newRenditionSize:(id)a5;
- (BOOL)canBePackedWithDocument:(id)a3;
- (BOOL)isBackstop;
- (BOOL)updatePackingPropertiesWithDocument:(id)a3;
- (CGImage)_createImageRefWithURL:(id)a3 andDocument:(id)a4 format:(unsigned int *)a5 vectorBased:(BOOL *)a6;
- (CGRect)alignmentRect;
- (CGRect)primitiveAlignmentRect;
- (CGSize)_scaleRecognitionImageFromSize:(CGSize)a3;
- (CGSize)physicalSizeInMeters;
- (TDImageColorHistogram)histogram;
- (id)_sliceRectanglesForRenditionSize:(id)a3 unadjustedSliceRectangles:(id *)a4 imageSlicesNeedAdjustment:(BOOL *)a5 newRenditionSize:(id *)a6;
- (id)associatedFileModificationDateWithDocument:(id)a3;
- (id)createCSIRepresentationWithCompression:(BOOL)a3 colorSpaceID:(unint64_t)a4 document:(id)a5;
- (int)_rawPixelFormatOfCGImage:(CGImage *)a3;
- (void)_logError:(id)a3;
- (void)_logWarning:(id)a3;
- (void)awakeFromFetch;
- (void)copyAttributesInto:(id)a3;
- (void)dealloc;
- (void)drawPackableRenditionInContext:(CGContext *)a3 withDocument:(id)a4;
- (void)setAlignmentRect:(CGRect)a3;
- (void)setHistogram:(id)a3;
- (void)setIsBackstop:(BOOL)a3;
- (void)setPhysicalSizeInMeters:(CGSize)a3;
- (void)setPrimitiveAlignmentRect:(CGRect)a3;
@end

@implementation TDSimpleArtworkRenditionSpec

+ (void)initialize
{
}

- (void)dealloc
{
  [(TDSimpleArtworkRenditionSpec *)self setHistogram:0];
  v3.receiver = self;
  v3.super_class = (Class)TDSimpleArtworkRenditionSpec;
  [(TDSimpleArtworkRenditionSpec *)&v3 dealloc];
}

- (void)setPrimitiveAlignmentRect:(CGRect)a3
{
  self->_alignmentRect = a3;
}

- (CGRect)primitiveAlignmentRect
{
  double x = self->_alignmentRect.origin.x;
  double y = self->_alignmentRect.origin.y;
  double width = self->_alignmentRect.size.width;
  double height = self->_alignmentRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setAlignmentRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  [(TDSimpleArtworkRenditionSpec *)self willChangeValueForKey:@"alignmentRect"];
  self->_alignmentRect.origin.CGFloat x = x;
  self->_alignmentRect.origin.CGFloat y = y;
  self->_alignmentRect.size.CGFloat width = width;
  self->_alignmentRect.size.CGFloat height = height;
  [(TDSimpleArtworkRenditionSpec *)self didChangeValueForKey:@"alignmentRect"];
  v10.origin.CGFloat x = x;
  v10.origin.CGFloat y = y;
  v10.size.CGFloat width = width;
  v10.size.CGFloat height = height;
  v8 = NSStringFromRect(v10);

  [(TDSimpleArtworkRenditionSpec *)self setAlignmentRectString:v8];
}

- (CGRect)alignmentRect
{
  [(TDSimpleArtworkRenditionSpec *)self willAccessValueForKey:@"alignmentRect"];
  [(TDSimpleArtworkRenditionSpec *)self primitiveAlignmentRect];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  [(TDSimpleArtworkRenditionSpec *)self didAccessValueForKey:@"alignmentRect"];
  double v11 = v4;
  double v12 = v6;
  double v13 = v8;
  double v14 = v10;
  result.size.CGFloat height = v14;
  result.size.CGFloat width = v13;
  result.origin.CGFloat y = v12;
  result.origin.CGFloat x = v11;
  return result;
}

- (void)setPhysicalSizeInMeters:(CGSize)a3
{
  double v4 = NSStringFromSize(a3);

  [(TDSimpleArtworkRenditionSpec *)self setPhysicalSizeInMetersString:v4];
}

- (CGSize)physicalSizeInMeters
{
  v2 = (NSString *)[(TDSimpleArtworkRenditionSpec *)self physicalSizeInMetersString];

  NSSize v5 = NSSizeFromString(v2);
  double height = v5.height;
  double width = v5.width;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)awakeFromFetch
{
  v3.receiver = self;
  v3.super_class = (Class)TDSimpleArtworkRenditionSpec;
  [(TDSimpleArtworkRenditionSpec *)&v3 awakeFromFetch];
  NSRect v4 = NSRectFromString((NSString *)[(TDSimpleArtworkRenditionSpec *)self alignmentRectString]);
  -[TDSimpleArtworkRenditionSpec setPrimitiveAlignmentRect:](self, "setPrimitiveAlignmentRect:", v4.origin.x, v4.origin.y, v4.size.width, v4.size.height);
}

- (void)copyAttributesInto:(id)a3
{
  [(TDSimpleArtworkRenditionSpec *)self alignmentRect];
  objc_msgSend(a3, "setAlignmentRect:");
  objc_msgSend(a3, "setNonAlphaImageAreaString:", -[TDSimpleArtworkRenditionSpec nonAlphaImageAreaString](self, "nonAlphaImageAreaString"));
  objc_msgSend(a3, "setAlphaCrop:", -[TDSimpleArtworkRenditionSpec alphaCrop](self, "alphaCrop"));
  objc_msgSend(a3, "setHeight:", -[TDSimpleArtworkRenditionSpec height](self, "height"));
  objc_msgSend(a3, "setWidth:", -[TDSimpleArtworkRenditionSpec width](self, "width"));
  objc_msgSend(a3, "setMonochrome:", -[TDSimpleArtworkRenditionSpec monochrome](self, "monochrome"));
  objc_msgSend(a3, "setOpaque:", -[TDSimpleArtworkRenditionSpec opaque](self, "opaque"));
  objc_msgSend(a3, "setCompressionType:", -[TDSimpleArtworkRenditionSpec compressionType](self, "compressionType"));
  objc_msgSend(a3, "setRenditionType:", -[TDRenditionSpec renditionType](self, "renditionType"));
  [(TDSimpleArtworkRenditionSpec *)self postScaleFactor];
  objc_msgSend(a3, "setPostScaleFactor:");
  objc_msgSend(a3, "setAllowsPaletteImageCompression:", -[TDSimpleArtworkRenditionSpec allowsPaletteImageCompression](self, "allowsPaletteImageCompression"));
  objc_msgSend(a3, "setAllowsHevcCompression:", -[TDSimpleArtworkRenditionSpec allowsHevcCompression](self, "allowsHevcCompression"));
  objc_msgSend(a3, "setAllowsDeepmapCompression:", -[TDSimpleArtworkRenditionSpec allowsDeepmapCompression](self, "allowsDeepmapCompression"));
  objc_msgSend(a3, "setAllowsDeepmap2Compression:", -[TDSimpleArtworkRenditionSpec allowsDeepmap2Compression](self, "allowsDeepmap2Compression"));
  objc_msgSend(a3, "setPhysicalSizeInMetersString:", -[TDSimpleArtworkRenditionSpec physicalSizeInMetersString](self, "physicalSizeInMetersString"));
  uint64_t v5 = [(TDSimpleArtworkRenditionSpec *)self preserveForArchiveOnly];

  [a3 setPreserveForArchiveOnly:v5];
}

- (id)associatedFileModificationDateWithDocument:(id)a3
{
  uint64_t v3 = objc_msgSend((id)objc_msgSend((id)-[TDSimpleArtworkRenditionSpec asset](self, "asset"), "fileURLWithDocument:", a3), "path");
  NSRect v4 = (void *)[MEMORY[0x263F08850] defaultManager];
  int v5 = [v4 fileExistsAtPath:v3];
  if (v5) {
    double v6 = (void *)[v4 attributesOfItemAtPath:v3 error:0];
  }
  else {
    double v6 = 0;
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
    NSLog(&cfstr_Tdsimpleartwor.isa, v3);
    double v9 = (void *)MEMORY[0x263EFF910];
    return (id)[v9 distantFuture];
  }
  return result;
}

- (void)_logError:(id)a3
{
}

- (void)_logWarning:(id)a3
{
}

- (id)_sliceRectanglesForRenditionSize:(id)a3 unadjustedSliceRectangles:(id *)a4 imageSlicesNeedAdjustment:(BOOL *)a5 newRenditionSize:(id *)a6
{
  uint64_t v164 = *MEMORY[0x263EF8340];
  double v9 = (void *)[MEMORY[0x263EFF980] array];
  id v10 = [(TDSimpleArtworkRenditionSpec *)self _slicesToUseForCSI];
  unsigned int v11 = [(TDThemeConstant *)[(TDRenditionSpec *)self renditionType] identifier];
  if ([v10 count])
  {
    long long v160 = 0u;
    long long v161 = 0u;
    long long v158 = 0u;
    long long v159 = 0u;
    uint64_t v12 = [v10 countByEnumeratingWithState:&v158 objects:v163 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v159;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v159 != v14) {
            objc_enumerationMutation(v10);
          }
          [*(id *)(*((void *)&v158 + 1) + 8 * i) sliceRect];
          objc_msgSend(v9, "addObject:", objc_msgSend(MEMORY[0x263F08D40], "valueWithRect:"));
        }
        uint64_t v13 = [v10 countByEnumeratingWithState:&v158 objects:v163 count:16];
      }
      while (v13);
    }
  }
  if (![v9 count]) {
    objc_msgSend(v9, "addObject:", objc_msgSend(MEMORY[0x263F08D40], "valueWithRect:", 0.0, 0.0, (double)a3.var0, (double)a3.var1));
  }
  if (v11 - 1 > 1)
  {
    if (v11 == 3 && [v9 count] == 9)
    {
      objc_msgSend((id)objc_msgSend(v9, "objectAtIndex:", 1), "rectValue");
      double v49 = v48;
      double v51 = v50;
      objc_msgSend((id)objc_msgSend(v9, "objectAtIndex:", 2), "rectValue");
      double v53 = v52 - (v49 + v51);
      objc_msgSend((id)objc_msgSend(v9, "objectAtIndex:", 3), "rectValue");
      double v55 = v54;
      double v57 = v56;
      objc_msgSend((id)objc_msgSend(v9, "objectAtIndex:", 6), "rectValue");
      double v59 = v58 - (v55 + v57);
      if (v53 > 0.0 || v59 > 0.0)
      {
        int v74 = (int)((double)a6->var0 - v53);
        double var1 = (double)a6->var1;
        *a5 = 1;
        a6->var0 = v74;
        a6->double var1 = (int)(var1 - v59);
        goto LABEL_40;
      }
    }
  }
  else if ([v9 count] == 4)
  {
    *(&a6->var0 + (v11 != 1)) = 0;
    v16 = (void *)[MEMORY[0x263EFF980] array];
    if ([v9 count])
    {
      unint64_t v17 = 0;
      do
      {
        if (v17 != 2)
        {
          v18 = (void *)[v9 objectAtIndex:v17];
          [v16 addObject:v18];
          [v18 rectValue];
          if (v11 == 1) {
            double v21 = v19;
          }
          else {
            double v21 = v20;
          }
          *(&a6->var0 + (v11 != 1)) = (int)(v21 + (double)*(&a6->var0 + (v11 != 1)));
        }
        ++v17;
      }
      while (v17 < [v9 count]);
    }
    *a5 = 1;
    if (v11 == 2)
    {
      if ([v16 count] == 3)
      {
        objc_msgSend((id)objc_msgSend(v16, "objectAtIndex:", 2), "rectValue");
        double v23 = v22;
        double v25 = v24;
        double v27 = v26;
        double v29 = v28;
        objc_msgSend((id)objc_msgSend(v16, "objectAtIndex:", 1), "rectValue");
        double v31 = v30;
        double v33 = v32;
        double v35 = v34;
        double v37 = v36;
        double v38 = v25 - (v32 + v36);
        if (v38 < 0.0) {
          double v38 = 0.0;
        }
        double v39 = v25 - v38;
        objc_msgSend((id)objc_msgSend(v16, "objectAtIndex:", 0), "rectValue");
        v40 = (void *)MEMORY[0x263EFF8C0];
        uint64_t v41 = objc_msgSend(MEMORY[0x263F08D40], "valueWithRect:");
        uint64_t v42 = objc_msgSend(MEMORY[0x263F08D40], "valueWithRect:", v31, v33, v35, v37);
        v43 = (void *)MEMORY[0x263F08D40];
        double v44 = v23;
        double v45 = v39;
        double v46 = v27;
        double v47 = v29;
LABEL_36:
        uint64_t v73 = objc_msgSend(v40, "arrayWithObjects:", v41, v42, objc_msgSend(v43, "valueWithRect:", v44, v45, v46, v47), 0);
LABEL_42:
        double v9 = (void *)v73;
        goto LABEL_45;
      }
      goto LABEL_44;
    }
    if (v11 == 1)
    {
      if ([v16 count] == 3)
      {
        objc_msgSend((id)objc_msgSend(v16, "objectAtIndex:", 1), "rectValue");
        double v61 = v60;
        double v63 = v62;
        objc_msgSend((id)objc_msgSend(v16, "objectAtIndex:", 2), "rectValue");
        double v66 = v65;
        double v68 = v67;
        double v70 = v69;
        double v71 = v64 - (v61 + v63);
        if (v71 < 0.0) {
          double v71 = 0.0;
        }
        double v72 = v64 - v71;
        v40 = (void *)MEMORY[0x263EFF8C0];
        uint64_t v41 = [v16 objectAtIndex:0];
        uint64_t v42 = [v16 objectAtIndex:1];
        v43 = (void *)MEMORY[0x263F08D40];
        double v44 = v72;
        double v45 = v66;
        double v46 = v68;
        double v47 = v70;
        goto LABEL_36;
      }
LABEL_44:
      double v9 = 0;
      goto LABEL_45;
    }
    if (v11 != 3) {
      goto LABEL_44;
    }
    double v9 = v16;
LABEL_40:
    if ([v9 count] == 9)
    {
      objc_msgSend((id)objc_msgSend(v9, "objectAtIndex:", 0), "rectValue");
      double v154 = v77;
      double v156 = v76;
      double v152 = v79;
      double v153 = v78;
      objc_msgSend((id)objc_msgSend(v9, "objectAtIndex:", 1), "rectValue");
      double v81 = v80;
      double v150 = v83;
      double v151 = v82;
      double v85 = v84;
      objc_msgSend((id)objc_msgSend(v9, "objectAtIndex:", 2), "rectValue");
      double v87 = v86;
      double v148 = v89;
      double v149 = v88;
      double v147 = v90;
      objc_msgSend((id)objc_msgSend(v9, "objectAtIndex:", 3), "rectValue");
      double v145 = v92;
      double v146 = v91;
      double v94 = v93;
      double v127 = v95;
      objc_msgSend((id)objc_msgSend(v9, "objectAtIndex:", 4), "rectValue");
      double v143 = v97;
      double v144 = v96;
      double v141 = v99;
      double v142 = v98;
      objc_msgSend((id)objc_msgSend(v9, "objectAtIndex:", 5), "rectValue");
      double v101 = v100;
      double v139 = v103;
      double v140 = v102;
      double v138 = v104;
      objc_msgSend((id)objc_msgSend(v9, "objectAtIndex:", 6), "rectValue");
      double v136 = v106;
      double v137 = v105;
      double v108 = v107;
      double v135 = v109;
      objc_msgSend((id)objc_msgSend(v9, "objectAtIndex:", 7), "rectValue");
      double v133 = v111;
      double v134 = v110;
      double v113 = v112;
      double v132 = v114;
      objc_msgSend((id)objc_msgSend(v9, "objectAtIndex:", 8), "rectValue");
      double v130 = v116;
      double v131 = v115;
      double v117 = fmax(v87 - (v81 + v85), 0.0);
      double v118 = v87 - v117;
      double v119 = v101 - v117;
      double v121 = v120 - v117;
      double v122 = fmax(v108 - (v94 + v127), 0.0);
      double v123 = v108 - v122;
      double v124 = v113 - v122;
      double v128 = v125 - v122;
      double v129 = v121;
      v162[0] = objc_msgSend(MEMORY[0x263F08D40], "valueWithRect:", v156, v154, v153, v152);
      v162[1] = objc_msgSend(MEMORY[0x263F08D40], "valueWithRect:", v81, v151, v85, v150);
      v162[2] = objc_msgSend(MEMORY[0x263F08D40], "valueWithRect:", v118, v149, v148, v147);
      v162[3] = objc_msgSend(MEMORY[0x263F08D40], "valueWithRect:", v146, v94, v145, v127);
      v162[4] = objc_msgSend(MEMORY[0x263F08D40], "valueWithRect:", v144, v143, v142, v141);
      v162[5] = objc_msgSend(MEMORY[0x263F08D40], "valueWithRect:", v119, v140, v139, v138);
      v162[6] = objc_msgSend(MEMORY[0x263F08D40], "valueWithRect:", v137, v123, v136, v135);
      v162[7] = objc_msgSend(MEMORY[0x263F08D40], "valueWithRect:", v134, v124, v133, v132);
      v162[8] = objc_msgSend(MEMORY[0x263F08D40], "valueWithRect:", v129, v128, v131, v130);
      uint64_t v73 = [MEMORY[0x263EFF8C0] arrayWithObjects:v162 count:9];
      v16 = v9;
      goto LABEL_42;
    }
    v16 = v9;
    goto LABEL_44;
  }
  v16 = v9;
LABEL_45:
  *a4 = v16;
  return v9;
}

- ($56AE26BFB60993BDE24C7578AE3A2D7B)_edgeMetricsForAlignmentRect:(SEL)a3 originalRenditionSize:(CGRect)a4 newRenditionSize:(id)a5
{
  CGFloat v6 = a4.size.width - (double)(a5.var0 - a6.var0);
  CGFloat v7 = a4.size.height - (double)(a5.var1 - a6.var1);
  retstr->var0.double width = a4.origin.x;
  retstr->var0.double height = a4.origin.y;
  retstr->var1.double width = (double)a6.var0 - (a4.origin.x + v6);
  retstr->var1.double height = (double)a6.var1 - (a4.origin.y + v7);
  retstr->var2.double width = v6;
  retstr->var2.double height = v7;
  return self;
}

- (BOOL)canBePackedWithDocument:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)TDSimpleArtworkRenditionSpec;
  unsigned int v4 = [(TDRenditionSpec *)&v10 canBePackedWithDocument:a3];
  if (v4)
  {
    int v5 = (void *)[(TDSimpleArtworkRenditionSpec *)self asset];
    CGFloat v6 = objc_msgSend((id)objc_msgSend(v5, "name"), "pathExtension");
    if ([v6 length])
    {
      if ([v6 caseInsensitiveCompare:@"PDF"]
        && [v6 caseInsensitiveCompare:@"SVG"])
      {
        if ((![v6 caseInsensitiveCompare:@"JPEG"]
           || ![v6 caseInsensitiveCompare:@"JPG"]
           || ![v6 caseInsensitiveCompare:@"HEIF"]
           || ![v6 caseInsensitiveCompare:@"HEIC"])
          && ([(TDSimpleArtworkRenditionSpec *)self alphaCrop] & 1) == 0)
        {
          [(TDSimpleArtworkRenditionSpec *)self physicalSizeInMeters];
          if (v7 <= 0.0)
          {
            [(TDSimpleArtworkRenditionSpec *)self physicalSizeInMeters];
            if (v8 <= 0.0)
            {
              LOBYTE(v4) = 0;
              return v4;
            }
          }
        }
      }
      else
      {
        unsigned int v4 = [v5 scaleFactor];
        if (!v4) {
          return v4;
        }
      }
    }
    LOBYTE(v4) = 1;
  }
  return v4;
}

- (int)_rawPixelFormatOfCGImage:(CGImage *)a3
{
  int v5 = 1095911234;
  if ([(TDSimpleArtworkRenditionSpec *)self allowsMultiPassEncoding])
  {
    int v6 = [(TDSimpleArtworkRenditionSpec *)self monochrome];
    signed int v7 = CGImageGetBitsPerComponent(a3) << 16;
    if (v7 <= 983040) {
      int v8 = 1095911234;
    }
    else {
      int v8 = 1380401751;
    }
    if (v7 <= 983040) {
      int v9 = 1195456544;
    }
    else {
      int v9 = 1195454774;
    }
    if (v6) {
      return v9;
    }
    else {
      return v8;
    }
  }
  return v5;
}

- (CGImage)_createImageRefWithURL:(id)a3 andDocument:(id)a4 format:(unsigned int *)a5 vectorBased:(BOOL *)a6
{
  uint64_t v12 = (void *)[(TDSimpleArtworkRenditionSpec *)self asset];
  if (!objc_msgSend((id)objc_msgSend(a3, "pathExtension"), "caseInsensitiveCompare:", @"PDF"))
  {
    int v16 = [v12 scaleFactor];
    if (a5 && !v16)
    {
      CGImageRef Image = 0;
      unsigned int v15 = 1346651680;
      goto LABEL_17;
    }
    CGPDFDocumentRef v18 = CGPDFDocumentCreateWithURL((CFURLRef)a3);
    if (v18)
    {
      double v19 = v18;
      double v93 = a2;
      double v94 = a6;
      unsigned int v20 = [v12 scaleFactor];
      double v21 = (double)v20;
      Page = CGPDFDocumentGetPage(v19, 1uLL);
      CGRect BoxRect = CGPDFPageGetBoxRect(Page, kCGPDFCropBox);
      double x = BoxRect.origin.x;
      double y = BoxRect.origin.y;
      double width = BoxRect.size.width;
      double height = BoxRect.size.height;
      uint64_t v27 = [v12 fileScaleFactor];
      if (!v27) {
        uint64_t v27 = +[TDAsset scaleFactorFromImageFilename:](TDAsset, "scaleFactorFromImageFilename:", [a3 path]);
      }
      if (!v20) {
        double v21 = 1.0;
      }
      [(TDSimpleArtworkRenditionSpec *)self postScaleFactor];
      double v29 = v21 * v28;
      uint64_t v92 = v27;
      double v30 = (double)v27;
      double v31 = round(width / (double)v27 * v29);
      double v32 = round(height / (double)v27 * v29);
      if ((CGPDFPageContainsWideGamutContent() & 1) == 0) {
        goto LABEL_82;
      }
      char v33 = 1;
      uint64_t v34 = 4097;
      double v35 = (CFStringRef *)MEMORY[0x263F001E8];
      size_t v36 = 16;
      for (unint64_t i = 8; ; unint64_t i = 4)
      {
        double v71 = CGColorSpaceCreateWithName(*v35);
        double v72 = CGBitmapContextCreate(0, (unint64_t)v31, (unint64_t)v32, v36, (unint64_t)(v31 * (double)i), v71, v34);
        if (!v72)
        {
          double v91 = (void *)[MEMORY[0x263F08690] currentHandler];
          uint64_t v90 = objc_msgSend((id)objc_msgSend((id)-[TDSimpleArtworkRenditionSpec production](self, "production"), "name"), "name");
          [(TDSimpleArtworkRenditionSpec *)self postScaleFactor];
          objc_msgSend(v91, "handleFailureInMethod:object:file:lineNumber:description:", v93, self, @"TDSimpleArtworkRenditionSpec.m", 477, @"CoreThemeDefinition: '%@' Unable to create bitmap context for %s (%fx%f) colorSpace:'%@' [pdfsize:%fx%f fileScale:%d postScaleFactor:%f scale:%f bpc:%d bpp:%d bitmapInfo:%d]", v90, "-[TDSimpleArtworkRenditionSpec _createImageRefWithURL:andDocument:format:vectorBased:]", *(void *)&v31, *(void *)&v32, v71, *(void *)&width, *(void *)&height, v92, v87, *(void *)&v29, v36, i,
            v34);
        }
        CGColorSpaceRelease(v71);
        CGContextScaleCTM(v72, v29 / v30, v29 / v30);
        CGContextTranslateCTM(v72, -x, -y);
        CGContextDrawPDFPage(v72, Page);
        CGImageRef Image = CGBitmapContextCreateImage(v72);
        if (v33 & 1) == 0 || (CUIImageIsWideGamut()) {
          break;
        }
        CFRelease(Image);
        CFRelease(v72);
LABEL_82:
        char v33 = 0;
        uint64_t v34 = 8193;
        double v35 = (CFStringRef *)MEMORY[0x263F002D8];
        size_t v36 = 8;
      }
      CFRelease(v72);
      CGPDFDocumentRelease(v19);
      a2 = v93;
      if (v94) {
        *double v94 = 1;
      }
      if (a5) {
        *a5 = [(TDSimpleArtworkRenditionSpec *)self _rawPixelFormatOfCGImage:Image];
      }
      goto LABEL_92;
    }
    return 0;
  }
  if (!objc_msgSend((id)objc_msgSend(a3, "pathExtension"), "caseInsensitiveCompare:", @"SVG"))
  {
    int v17 = [v12 scaleFactor];
    if (a5 && !v17)
    {
      CGImageRef Image = 0;
      unsigned int v15 = 1398163232;
      goto LABEL_17;
    }
    if (objc_msgSend((id)objc_msgSend((id)-[TDSimpleArtworkRenditionSpec keySpec](self, "keySpec"), "glyphWeight"), "identifier")|| objc_msgSend((id)objc_msgSend((id)-[TDSimpleArtworkRenditionSpec keySpec](self, "keySpec"), "glyphSize"), "identifier"))
    {
      v43 = +[TDVectorGlyphReader vectorGlyphReaderWithURL:a3 error:0];
      -[TDVectorGlyphReader canvasSizeForWeight:size:](v43, "canvasSizeForWeight:size:", objc_msgSend((id)objc_msgSend((id)-[TDSimpleArtworkRenditionSpec keySpec](self, "keySpec"), "glyphWeight"), "identifier"), objc_msgSend((id)objc_msgSend((id)-[TDSimpleArtworkRenditionSpec keySpec](self, "keySpec"), "glyphSize"), "identifier"));
      double v45 = v44;
      double v47 = v46;
      [(TDVectorGlyphReader *)v43 templateVersion];
      int v48 = [(TDVectorGlyphReader *)v43 containsWideGamutContent];
      uint64_t v49 = 0;
    }
    else
    {
      double v68 = (void *)[objc_alloc(MEMORY[0x263EFF8F8]) initWithContentsOfURL:a3 options:8 error:0];
      uint64_t v49 = CGSVGDocumentCreateFromData();
      CGSVGDocumentGetCanvasSize();
      double v45 = v69;
      double v47 = v70;
      int v48 = CGSVGDocumentContainsWideGamutContent();

      v43 = 0;
    }
    if (v45 != 0.0 && v47 != 0.0)
    {
      double v95 = a6;
      unsigned int v50 = [v12 scaleFactor];
      double v51 = (double)v50;
      [v12 fileScaleFactor];
      if (!v50) {
        double v51 = 1.0;
      }
      [(TDSimpleArtworkRenditionSpec *)self postScaleFactor];
      double v53 = v51 * v52;
      double v54 = v45 * v53;
      double v55 = ceil(v54);
      double v56 = v47 * v53;
      if (v48) {
        size_t v57 = 16;
      }
      else {
        size_t v57 = 8;
      }
      if (v48) {
        double v58 = 8.0;
      }
      else {
        double v58 = 4.0;
      }
      if (v48) {
        uint32_t v59 = 4097;
      }
      else {
        uint32_t v59 = 8193;
      }
      double v60 = (CFStringRef *)MEMORY[0x263F001E8];
      if (!v48) {
        double v60 = (CFStringRef *)MEMORY[0x263F002D8];
      }
      double v61 = CGColorSpaceCreateWithName(*v60);
      double v62 = CGBitmapContextCreate(0, vcvtpd_u64_f64(v54), vcvtpd_u64_f64(v56), v57, (unint64_t)(v55 * v58), v61, v59);
      if (!v62) {
        objc_msgSend((id)objc_msgSend(MEMORY[0x263F08690], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"TDSimpleArtworkRenditionSpec.m", 596, @"CoreThemeDefinition: Unable to create bitmap context for %@", a3);
      }
      CGColorSpaceRelease(v61);
      if (v43)
      {
        [(TDSimpleArtworkRenditionSpec *)self postScaleFactor];
        double v64 = v63;
        [(TDVectorGlyphReader *)v43 defaultPointSize];
        -[TDVectorGlyphReader drawInContext:atPointSize:scaleFactor:weight:size:](v43, "drawInContext:atPointSize:scaleFactor:weight:size:", v62, objc_msgSend((id)objc_msgSend((id)-[TDSimpleArtworkRenditionSpec keySpec](self, "keySpec"), "glyphWeight"), "identifier"), objc_msgSend((id)objc_msgSend((id)-[TDSimpleArtworkRenditionSpec keySpec](self, "keySpec"), "glyphSize"), "identifier"), v64 * v65, (double)objc_msgSend(v12, "scaleFactor"));
      }
      else
      {
        CGContextScaleCTM(v62, v53, v53);
        CGContextDrawSVGDocument();
      }
      CGImageRef Image = CGBitmapContextCreateImage(v62);
      CFRelease(v62);
      CGSVGDocumentRelease();
      if (v95) {
        *double v95 = 1;
      }
      if (a5) {
        *a5 = [(TDSimpleArtworkRenditionSpec *)self _rawPixelFormatOfCGImage:Image];
      }
      if (v43) {

      }
      goto LABEL_92;
    }
    if (objc_msgSend((id)objc_msgSend((id)-[TDSimpleArtworkRenditionSpec keySpec](self, "keySpec"), "glyphWeight"), "identifier")|| objc_msgSend((id)objc_msgSend((id)-[TDSimpleArtworkRenditionSpec keySpec](self, "keySpec"), "glyphSize"), "identifier"))
    {
      NSLog(&cfstr_SGotZeroWidthH.isa, "-[TDSimpleArtworkRenditionSpec _createImageRefWithURL:andDocument:format:vectorBased:]", a3, objc_msgSend((id)objc_msgSend((id)-[TDSimpleArtworkRenditionSpec keySpec](self, "keySpec"), "glyphWeight"), "identifier"), objc_msgSend((id)objc_msgSend((id)-[TDSimpleArtworkRenditionSpec keySpec](self, "keySpec"), "glyphSize"), "identifier"));
      if (v45 == 0.0 && v47 == 0.0) {
        objc_msgSend((id)objc_msgSend(MEMORY[0x263F08690], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"TDSimpleArtworkRenditionSpec.m", 552, @"%s ot zero width/height canvas size for %@", "-[TDSimpleArtworkRenditionSpec _createImageRefWithURL:andDocument:format:vectorBased:]", a3, v88, v89);
      }
    }
    else
    {
      NSLog(&cfstr_SGotZeroWidthH_0.isa, "-[TDSimpleArtworkRenditionSpec _createImageRefWithURL:andDocument:format:vectorBased:]", a3);
      if (v45 == 0.0 && v47 == 0.0) {
        objc_msgSend((id)objc_msgSend(MEMORY[0x263F08690], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"TDSimpleArtworkRenditionSpec.m", 556, @"%s ot zero width/height canvas size for %@ weight:%d size:%d", "-[TDSimpleArtworkRenditionSpec _createImageRefWithURL:andDocument:format:vectorBased:]", a3, objc_msgSend((id)objc_msgSend((id)-[TDSimpleArtworkRenditionSpec keySpec](self, "keySpec"), "glyphWeight"), "identifier"), objc_msgSend((id)objc_msgSend((id)-[TDSimpleArtworkRenditionSpec keySpec](self, "keySpec"), "glyphSize"), "identifier"));
      }
    }
    if (v49) {
      CGSVGDocumentRelease();
    }
    return 0;
  }
  uint64_t v13 = (void *)[a3 pathExtension];
  if ([v13 length])
  {
    if ([v13 caseInsensitiveCompare:@"JPEG"]
      && [v13 caseInsensitiveCompare:@"JPG"])
    {
      if ([v13 caseInsensitiveCompare:@"HEIF"]
        && [v13 caseInsensitiveCompare:@"HEIC"])
      {
        if ([v13 caseInsensitiveCompare:@"PNG"]) {
          goto LABEL_9;
        }
LABEL_32:
        uint64_t v41 = (void *)[v12 sourceImageWithDocument:a4];
        uint64_t v42 = [v41 image];
        if (v41)
        {
          CGImageRef Image = (CGImageRef)v42;
          if (a5) {
            *a5 = [(TDSimpleArtworkRenditionSpec *)self _rawPixelFormatOfCGImage:v42];
          }
          goto LABEL_68;
        }
        return 0;
      }
      if (a5) {
        *a5 = 1212500294;
      }
    }
    else if (a5)
    {
      if (([(TDSimpleArtworkRenditionSpec *)self alphaCrop] & 1) != 0
        || ([(TDSimpleArtworkRenditionSpec *)self physicalSizeInMeters], v38 > 0.0)
        || ([(TDSimpleArtworkRenditionSpec *)self physicalSizeInMeters], v39 > 0.0))
      {
        unsigned int v40 = [(TDSimpleArtworkRenditionSpec *)self _rawPixelFormatOfCGImage:0];
      }
      else
      {
        unsigned int v40 = 1246774599;
      }
      *a5 = v40;
    }
    double v66 = (void *)[v12 sourceImageWithDocument:a4];
    uint64_t v67 = [v66 image];
    if (v66)
    {
      CGImageRef Image = (CGImageRef)v67;
LABEL_68:
      CGImageRetain(Image);
      goto LABEL_92;
    }
    return 0;
  }
  if (![a3 checkResourceIsReachableAndReturnError:0]) {
    goto LABEL_32;
  }
LABEL_9:
  CGImageRef Image = 0;
  if (a5)
  {
    unsigned int v15 = 1145132097;
LABEL_17:
    *a5 = v15;
  }
LABEL_92:
  [(TDSimpleArtworkRenditionSpec *)self physicalSizeInMeters];
  if (v73 > 0.0 || ([(TDSimpleArtworkRenditionSpec *)self physicalSizeInMeters], v74 > 0.0))
  {
    size_t v75 = CGImageGetWidth(Image);
    double v76 = (double)v75;
    double v77 = (double)CGImageGetHeight(Image);
    if (v75 <= 0x63) {
      objc_msgSend((id)objc_msgSend(MEMORY[0x263F08690], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"TDSimpleArtworkRenditionSpec.m", 771, @"CoreThemeDefintiion: '%@' should have a width >= 100 pixels", objc_msgSend((id)objc_msgSend((id)-[TDSimpleArtworkRenditionSpec production](self, "production"), "name"), "name"));
    }
    -[TDSimpleArtworkRenditionSpec _scaleRecognitionImageFromSize:](self, "_scaleRecognitionImageFromSize:", v76, v77);
    if (v78 != v76 || v79 != v77)
    {
      double v81 = v78;
      double v82 = v79;
      memset(&dest, 0, sizeof(dest));
      double v83 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x263F002D8]);
      v98[0] = 0x2000000008;
      v98[1] = v83;
      int v99 = 12289;
      memset(v101, 0, sizeof(v101));
      uint64_t v100 = 0;
      src.double height = (unint64_t)v77;
      src.double width = (unint64_t)v76;
      src.data = 0;
      src.rowBytes = CGBitmapGetAlignedBytesPerRow();
      CGImageGetColorSpace(Image);
      uint64_t v84 = CUIConvertCGImageFormat();
      CGColorSpaceRelease(v83);
      if (!v84)
      {
        dest.double height = (unint64_t)v82;
        dest.double width = (unint64_t)v81;
        dest.rowBytes = 32 * (unint64_t)v81;
        dest.data = malloc_type_calloc(dest.rowBytes * (unint64_t)v82, 1uLL, 0x100004077774924uLL);
        vImage_Error v85 = vImageScale_ARGB8888(&src, &dest, 0, 0x20u);
        CGBitmapFreeData();
        if (!v85)
        {
          CGImageRelease(Image);
          return (CGImage *)MEMORY[0x237DD6330](&dest, v98, 0, 0, 512, 0);
        }
      }
    }
  }
  return Image;
}

- (id)createCSIRepresentationWithCompression:(BOOL)a3 colorSpaceID:(unint64_t)a4 document:(id)a5
{
  __int16 v6 = a4;
  uint64_t v7 = a3;
  uint64_t v164 = *MEMORY[0x263EF8340];
  int v9 = (void *)[(TDSimpleArtworkRenditionSpec *)self production];
  objc_super v10 = (void *)[(TDSimpleArtworkRenditionSpec *)self asset];
  uint64_t v162 = 0;
  unsigned __int8 v161 = 0;
  unsigned int v160 = 1246774599;
  unsigned int v11 = [(TDThemeConstant *)[(TDRenditionSpec *)self renditionType] identifier];
  if (v11 == 1006)
  {
    id v12 = objc_alloc(MEMORY[0x263F38370]);
    uint64_t v13 = objc_msgSend(v12, "initWithCanvasSize:sliceCount:layout:", 0, 1006, *MEMORY[0x263F08678], *(double *)(MEMORY[0x263F08678] + 8));
    objc_msgSend(v13, "setScaleFactor:", objc_msgSend((id)-[TDSimpleArtworkRenditionSpec keySpec](self, "keySpec"), "scaleFactor"));
    objc_msgSend(v13, "setTargetPlatform:", objc_msgSend(a5, "targetPlatform"));
    uint64_t v14 = (void *)[v13 CSIRepresentationWithCompression:v7];

    return v14;
  }
  unsigned int v15 = v11;
  double Width = *MEMORY[0x263F001B0];
  double v17 = *(double *)(MEMORY[0x263F001B0] + 8);
  CGPDFDocumentRef v18 = (void *)[v10 fileURLWithDocument:a5];
  if ([v10 rawData])
  {
    __int16 v142 = v6;
    double v19 = 0;
    unsigned int v160 = 1145132097;
LABEL_5:
    int v144 = 1;
    goto LABEL_39;
  }
  unsigned int v20 = [(TDSimpleArtworkRenditionSpec *)self _createImageRefWithURL:v18 andDocument:a5 format:&v160 vectorBased:&v161];
  double v19 = v20;
  if (v20)
  {
LABEL_7:
    if (v160 == 1145132097)
    {
      __int16 v142 = v6;
      goto LABEL_5;
    }
    if (v160 == 1246774599 || v160 == 1212500294)
    {
      if (v20)
      {
        __int16 v142 = v6;
        if (v160 == 1212500294 && [(TDSimpleArtworkRenditionSpec *)self isBackstop])
        {
          int v144 = 0;
          unsigned int v160 = 1095911234;
        }
        else
        {
          int v144 = 1;
        }
        double Width = (double)CGImageGetWidth(v19);
        size_t Height = CGImageGetHeight(v19);
        goto LABEL_38;
      }
    }
    else if (v20)
    {
      __int16 v142 = v6;
      double Width = (double)CGImageGetWidth(v20);
      size_t Height = CGImageGetHeight(v19);
      int v144 = 0;
LABEL_38:
      double v17 = (double)Height;
LABEL_39:
      uint64_t v137 = (int)v17;
      uint64_t v138 = (int)Width;
      LODWORD(v162) = (int)Width;
      HIDWORD(v162) = (int)v17;
      char v159 = 0;
      id v158 = 0;
      id v48 = [(TDSimpleArtworkRenditionSpec *)self _sliceRectanglesForRenditionSize:v162 unadjustedSliceRectangles:&v158 imageSlicesNeedAdjustment:&v159 newRenditionSize:&v162];
      unsigned int v136 = v15;
      if ([v9 renditionSubtype]) {
        __int16 v49 = objc_msgSend((id)objc_msgSend(v9, "renditionSubtype"), "identifier");
      }
      else {
        __int16 v49 = v15;
      }
      imagea = v19;
      if (!v144)
      {
        if ([(TDSimpleArtworkRenditionSpec *)self parentRendition])
        {
          NSRect v165 = NSRectFromString((NSString *)[(TDSimpleArtworkRenditionSpec *)self nonAlphaImageAreaString]);
          double x = v165.origin.x;
          double y = v165.origin.y;
          double v68 = v165.size.width;
          double v69 = v165.size.height;
          NSSize v70 = NSSizeFromString((NSString *)[(TDSimpleArtworkRenditionSpec *)self originalImageSizeString]);
          [(TDRenditionSpec *)self packedPoint];
          double v72 = v71;
          double v74 = v73;
          v166.origin.double x = x;
          v166.origin.double y = y;
          v166.size.double width = v68;
          v166.size.double height = v69;
          if (!CGRectIsEmpty(v166))
          {
            LODWORD(v162) = (int)v68;
            HIDWORD(v162) = (int)v69;
          }
          id v75 = objc_alloc(MEMORY[0x263F38370]);
          double v76 = objc_msgSend(v75, "initWithInternalReferenceRect:layout:", v49, v72, v74, (double)(int)v162, (double)SHIDWORD(v162));
          v167.origin.double x = x;
          v167.origin.double y = y;
          v167.size.double width = v68;
          v167.size.double height = v69;
          if (!CGRectIsEmpty(v167))
          {
            objc_msgSend(v76, "setAlphaCroppedFrame:", x, y, v68, v69);
            objc_msgSend(v76, "setOriginalUncroppedSize:", v70.width, v70.height);
          }
          id v77 = objc_alloc_init(MEMORY[0x263F383C0]);
          double v78 = objc_msgSend(objc_alloc(MEMORY[0x263F383B8]), "initWithKeyList:", objc_msgSend((id)objc_msgSend((id)-[TDSimpleArtworkRenditionSpec parentRendition](self, "parentRendition"), "keySpec"), "key"));
          [v77 setReferenceKey:v78];
          [v76 addLayerReference:v77];

          double v19 = imagea;
        }
        else
        {
          id v79 = objc_alloc(MEMORY[0x263F38370]);
          double v76 = objc_msgSend(v79, "initWithCanvasSize:sliceCount:layout:", objc_msgSend(v48, "count"), v49, (double)(int)v162, (double)SHIDWORD(v162));
        }
        objc_msgSend(v76, "setTargetPlatform:", objc_msgSend(a5, "targetPlatform"));
        [v76 setPixelFormat:v160];
        objc_msgSend(v76, "setName:", objc_msgSend(v10, "name"));
        if (!v19) {
          goto LABEL_84;
        }
LABEL_76:
        if (v160 != 1246774599 && v160 != 1212500294)
        {
          double v140 = v9;
          vImage_Error v85 = v10;
          uint64_t v86 = v7;
          size_t BitsPerComponent = CGImageGetBitsPerComponent(v19);
          int v88 = [(TDSimpleArtworkRenditionSpec *)self monochrome];
          int v89 = [a5 allowsExtendedRangePixelFormats];
          if (objc_msgSend((id)objc_msgSend((id)-[TDSimpleArtworkRenditionSpec keySpec](self, "keySpec"), "gamut"), "identifier") == 1)
          {
            if (CUIImageIsWideGamut())
            {
              if (v89) {
                __int16 v90 = 4;
              }
              else {
                __int16 v90 = 3;
              }
              [v76 setPixelFormat:1380401751];
            }
            else
            {
              if (BitsPerComponent > 8) {
                int v92 = v88;
              }
              else {
                int v92 = 0;
              }
              if (v92 != 1)
              {
                BOOL v131 = BitsPerComponent >= 9;
                double v19 = imagea;
                uint64_t v7 = v86;
                objc_super v10 = v85;
                int v9 = v140;
                __int16 v90 = v142;
                if (v131)
                {
                  if (v88) {
                    __int16 v90 = 2;
                  }
                  else {
                    __int16 v90 = 1;
                  }
                  if (v88) {
                    uint64_t v132 = 1195456544;
                  }
                  else {
                    uint64_t v132 = 1095911234;
                  }
                  [v76 setPixelFormat:v132];
                }
                goto LABEL_101;
              }
              if (v89) {
                __int16 v90 = 6;
              }
              else {
                __int16 v90 = 2;
              }
            }
            double v19 = imagea;
          }
          else
          {
            if (v88) {
              __int16 v90 = 2;
            }
            else {
              __int16 v90 = 1;
            }
            if (v88) {
              uint64_t v91 = 1195456544;
            }
            else {
              uint64_t v91 = 1095911234;
            }
            [v76 setPixelFormat:v91];
          }
          uint64_t v7 = v86;
          objc_super v10 = v85;
          int v9 = v140;
LABEL_101:
          objc_msgSend(v76, "setAllowsMultiPassEncoding:", -[TDSimpleArtworkRenditionSpec allowsMultiPassEncoding](self, "allowsMultiPassEncoding"));
          objc_msgSend(v76, "setAllowsOptimalRowbytesPacking:", -[TDSimpleArtworkRenditionSpec allowsOptimalRowbytesPacking](self, "allowsOptimalRowbytesPacking"));
          [v76 setColorSpaceID:v90];
          [v76 setIsVectorBased:v161];
          objc_msgSend(v76, "setExifOrientation:", objc_msgSend(v10, "exifOrientation"));
          objc_msgSend(v76, "setAllowsPaletteImageCompression:", -[TDSimpleArtworkRenditionSpec allowsPaletteImageCompression](self, "allowsPaletteImageCompression"));
          objc_msgSend(v76, "setAllowsHevcCompression:", -[TDSimpleArtworkRenditionSpec allowsHevcCompression](self, "allowsHevcCompression"));
          objc_msgSend(v76, "setAllowsDeepmapImageCompression:", -[TDSimpleArtworkRenditionSpec allowsDeepmapCompression](self, "allowsDeepmapCompression"));
          objc_msgSend(v76, "setAllowsDeepmap2ImageCompression:", -[TDSimpleArtworkRenditionSpec allowsDeepmap2Compression](self, "allowsDeepmap2Compression"));
          if (objc_msgSend((id)-[TDSimpleArtworkRenditionSpec compressionType](self, "compressionType"), "identifier"))objc_msgSend(v76, "setCompressionType:", objc_msgSend((id)-[TDSimpleArtworkRenditionSpec compressionType](self, "compressionType"), "identifier")); {
          objc_msgSend(v76, "setScaleFactor:", objc_msgSend(v10, "scaleFactor"));
          }
          uint64_t v93 = MEMORY[0x263F38358];
          CGSize v141 = *(CGSize *)(MEMORY[0x263F38358] + 16);
          long long v143 = *MEMORY[0x263F38358];
          v157.origin = (CGPoint)*MEMORY[0x263F38358];
          v157.size = v141;
          double v95 = *(double *)(MEMORY[0x263F38358] + 32);
          double v94 = *(double *)(MEMORY[0x263F38358] + 40);
          [(TDSimpleArtworkRenditionSpec *)self alignmentRect];
          double v96 = v168.origin.x;
          double v97 = v168.origin.y;
          double v98 = v168.size.width;
          double v99 = v168.size.height;
          if (!NSEqualRects(v168, *MEMORY[0x263F08670])
            && (v96 >= 0.0 || v97 >= 0.0 || v96 + v98 <= (double)(int)v138 || v97 + v99 <= (double)(int)v137))
          {
            if (self)
            {
              -[TDSimpleArtworkRenditionSpec _edgeMetricsForAlignmentRect:originalRenditionSize:newRenditionSize:](self, "_edgeMetricsForAlignmentRect:originalRenditionSize:newRenditionSize:", v138 | (v137 << 32), v162, v96, v97, v98, v99);
              double v94 = *((double *)&v156 + 1);
              double v95 = *(double *)&v156;
            }
            else
            {
              long long v156 = 0u;
              memset(&mediaBox, 0, sizeof(mediaBox));
              double v94 = 0.0;
              double v95 = 0.0;
            }
            CGRect v157 = mediaBox;
          }
          mediaBodouble x = v157;
          *(double *)&long long v156 = v95;
          *((double *)&v156 + 1) = v94;
          *(_OWORD *)value = v143;
          CGSize v153 = v141;
          long long v154 = *(_OWORD *)(v93 + 32);
          if (CSIEqualMetrics())
          {
            memset(&v157, 0, sizeof(v157));
            double v95 = (double)(int)v162;
            double v94 = (double)SHIDWORD(v162);
          }
          objc_msgSend(v76, "setClampMetrics:", objc_msgSend(a5, "_clampMetrics"));
          mediaBodouble x = v157;
          *(double *)&long long v156 = v95;
          *((double *)&v156 + 1) = v94;
          [v76 addMetrics:&mediaBox];
          [v76 setBlendMode:0];
          [v76 setOpacity:1.0];
          if ([(TDSimpleArtworkRenditionSpec *)self parentRendition]
            || (([v9 makeOpaqueIfPossible] & 1) == 0 && v160 != 1195456544 && v160 != 1195454774
              ? (uint64_t AlphaInfo = CGImageGetBitmapInfo(v19) & 0x1F)
              : (uint64_t AlphaInfo = CUICGImageGetAlphaInfo()),
                (v144 & 1) != 0))
          {
            double v101 = 0;
          }
          else
          {
            id v107 = objc_alloc(MEMORY[0x263F38368]);
            double v101 = (void *)[v107 initWithPixelWidth:v162 pixelHeight:HIDWORD(v162)];
            objc_msgSend(v101, "setAllowsMultiPassEncoding:", -[TDSimpleArtworkRenditionSpec allowsMultiPassEncoding](self, "allowsMultiPassEncoding"));
            objc_msgSend(v101, "setAllowsOptimalRowbytesPacking:", -[TDSimpleArtworkRenditionSpec allowsOptimalRowbytesPacking](self, "allowsOptimalRowbytesPacking"));
            objc_msgSend(v101, "setAllowsCompactCompression:", -[TDSimpleArtworkRenditionSpec allowsCompactCompression](self, "allowsCompactCompression"));
            objc_msgSend(v101, "setPixelFormat:", objc_msgSend(v76, "pixelFormat"));
            objc_msgSend(v101, "setColorSpaceID:", (int)objc_msgSend(v76, "colorSpaceID"));
            [v101 setSourceAlphaInfo:AlphaInfo];
            objc_msgSend(v101, "setTargetPlatform:", objc_msgSend(a5, "targetPlatform"));
            [v76 addBitmap:v101];
            double v108 = (CGContext *)[v101 bitmapContext];
            if (CGImageGetBitsPerComponent(v19) >= 9 && CGBitmapContextGetBitsPerComponent(v108) == 8)
            {
              double v109 = v19;
              CGColorSpaceRef v110 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x263F002D8]);
              uint64_t v111 = CUIConvertDeepImageTo8();
              if (v111)
              {
                double v112 = (CGImage *)v111;
                CFRelease(v109);
                imagea = v112;
              }
              CFRelease(v110);
              double v19 = imagea;
            }
            imagea = v19;
            if (v159)
            {
              if (v108 && [v48 count])
              {
                CGContextSaveGState(v108);
                CGContextSetBlendMode(v108, kCGBlendModeCopy);
                if ([v48 count])
                {
                  unint64_t v113 = 0;
                  do
                  {
                    objc_msgSend((id)objc_msgSend(v158, "objectAtIndex:", v113), "rectValue");
                    CGFloat v115 = v114;
                    CGFloat v117 = v116;
                    double v119 = v118;
                    double v121 = v120;
                    objc_msgSend((id)objc_msgSend(v48, "objectAtIndex:", v113), "rectValue");
                    if (v119 > 0.0 && v121 > 0.0)
                    {
                      CGFloat v126 = v122;
                      CGFloat v127 = v124;
                      CGFloat v128 = v125;
                      if ((v136 & 0xFFFFFFFE) == 2) {
                        double v129 = (double)SHIDWORD(v162) - (v123 + v125);
                      }
                      else {
                        double v129 = v123;
                      }
                      v169.origin.double x = v115;
                      v169.origin.double y = v117;
                      v169.size.double width = v119;
                      v169.size.double height = v121;
                      double v130 = CGImageCreateWithImageInRect(imagea, v169);
                      v170.origin.double x = v126;
                      v170.origin.double y = v129;
                      v170.size.double width = v127;
                      v170.size.double height = v128;
                      CGContextDrawImage(v108, v170, v130);
                      CGImageRelease(v130);
                    }
                    ++v113;
                  }
                  while (v113 < [v48 count]);
                }
                CGContextRestoreGState(v108);
              }
            }
            else if (v108)
            {
              v171.origin.double x = 0.0;
              v171.origin.double y = 0.0;
              v171.size.double width = Width;
              v171.size.double height = v17;
              CGContextDrawImage(v108, v171, v19);
            }
          }
          long long v150 = 0u;
          long long v151 = 0u;
          long long v148 = 0u;
          long long v149 = 0u;
          uint64_t v102 = [v48 countByEnumeratingWithState:&v148 objects:v163 count:16];
          if (v102)
          {
            uint64_t v103 = v102;
            uint64_t v104 = *(void *)v149;
            do
            {
              for (uint64_t i = 0; i != v103; ++i)
              {
                if (*(void *)v149 != v104) {
                  objc_enumerationMutation(v48);
                }
                [*(id *)(*((void *)&v148 + 1) + 8 * i) rectValue];
                objc_msgSend(v76, "addSliceRect:");
              }
              uint64_t v103 = [v48 countByEnumeratingWithState:&v148 objects:v163 count:16];
            }
            while (v103);
          }
          [(TDSimpleArtworkRenditionSpec *)self physicalSizeInMeters];
          objc_msgSend(v76, "setPhysicalSizeInMeters:");
          objc_msgSend(v76, "setTemplateRenderingMode:", objc_msgSend((id)objc_msgSend(v9, "templateRenderingMode"), "identifier"));
          objc_msgSend(v76, "setOptOutOfThinning:", objc_msgSend(v9, "optOutOfThinning"));
          objc_msgSend(v76, "setPreserveForArchiveOnly:", -[TDSimpleArtworkRenditionSpec preserveForArchiveOnly](self, "preserveForArchiveOnly"));
          objc_msgSend(v76, "setPreservedVectorRepresentation:", objc_msgSend(v9, "preservesVectorRepresentation"));
          objc_msgSend(v76, "setIsFlippable:", objc_msgSend(v9, "isFlippable"));
          objc_msgSend(v76, "setExcludedFromContrastFilter:", objc_msgSend((id)objc_msgSend(v9, "isExcludedFromFilter"), "BOOLValue"));
          objc_msgSend(v76, "setRenditionProperties:", -[TDRenditionSpec propertiesAsDictionary](self, "propertiesAsDictionary"));
          uint64_t v14 = (void *)[v76 CSIRepresentationWithCompression:v7];

          CGImageRelease(imagea);
          return v14;
        }
LABEL_84:
        __int16 v90 = v142;
        goto LABEL_101;
      }
      mediaBox.origin.double x = 0.0;
      CFDataRef v50 = (const __CFData *)[objc_alloc(MEMORY[0x263EFF8F8]) initWithContentsOfURL:v18 options:2 error:0];
      CFDataRef v51 = v50;
      if (v160 == 1246774599 || v160 == 1212500294)
      {
        double v52 = CGImageSourceCreateWithData(v50, 0);
        if (v52)
        {
          double v53 = v52;
          double v135 = v51;
          double v139 = v9;
          unsigned int v134 = v7;
          CGImageMetadataRef v54 = CGImageSourceCopyMetadataAtIndex(v52, 0, 0);
          id v55 = objc_alloc_init(MEMORY[0x263EFF9A0]);
          CGImageMetadataRef cf = v54;
          [v55 setObject:v54 forKey:*MEMORY[0x263F0F000]];
          double v56 = (__CFData *)objc_alloc_init(MEMORY[0x263EFF990]);
          CFStringRef Type = CGImageSourceGetType(v53);
          CGImageDestinationRef v58 = CGImageDestinationCreateWithData(v56, Type, 1uLL, 0);
          if (v58)
          {
            uint32_t v59 = v58;
            value[0] = 0;
            id v60 = a5;
            uint64_t v61 = *MEMORY[0x263EFFB40];
            [v55 setObject:*MEMORY[0x263EFFB40] forKey:*MEMORY[0x263F0F030]];
            uint64_t v62 = v61;
            a5 = v60;
            double v19 = imagea;
            [v55 setObject:v62 forKey:*MEMORY[0x263F0F028]];
            BOOL v63 = CGImageDestinationCopyImageSource(v59, v53, (CFDictionaryRef)v55, value);
            double v64 = v135;
            if (v63) {
              double v65 = v135;
            }
            else {
              double v65 = v56;
            }
            if (v63) {
              double v64 = v56;
            }
            double v135 = v64;

            CFRelease(v59);
          }
          else
          {
          }
          CFRelease(cf);
          CFRelease(v53);
          uint64_t v7 = v134;
          int v9 = v139;
          CFDataRef v51 = v135;
        }
        id v84 = objc_alloc(MEMORY[0x263F38370]);
        double v76 = (void *)[v84 initWithRawData:v51 pixelFormat:v160 layout:v49];
        objc_msgSend(v76, "setName:", objc_msgSend(v10, "name"));
        objc_msgSend(v76, "setAllowsPaletteImageCompression:", -[TDSimpleArtworkRenditionSpec allowsPaletteImageCompression](self, "allowsPaletteImageCompression"));
        objc_msgSend(v76, "setAllowsHevcCompression:", -[TDSimpleArtworkRenditionSpec allowsHevcCompression](self, "allowsHevcCompression"));
        objc_msgSend(v76, "setAllowsDeepmapImageCompression:", -[TDSimpleArtworkRenditionSpec allowsDeepmapCompression](self, "allowsDeepmapCompression"));
        objc_msgSend(v76, "setAllowsDeepmap2ImageCompression:", -[TDSimpleArtworkRenditionSpec allowsDeepmap2Compression](self, "allowsDeepmap2Compression"));
        objc_msgSend(v76, "setTargetPlatform:", objc_msgSend(a5, "targetPlatform"));
LABEL_75:

        if (!v19) {
          goto LABEL_84;
        }
        goto LABEL_76;
      }
      id v80 = objc_alloc(MEMORY[0x263F38370]);
      double v76 = (void *)[v80 initWithRawData:v51 pixelFormat:v160 layout:1000];
      objc_msgSend(v76, "setAllowsPaletteImageCompression:", -[TDSimpleArtworkRenditionSpec allowsPaletteImageCompression](self, "allowsPaletteImageCompression"));
      objc_msgSend(v76, "setAllowsHevcCompression:", -[TDSimpleArtworkRenditionSpec allowsHevcCompression](self, "allowsHevcCompression"));
      objc_msgSend(v76, "setAllowsDeepmapImageCompression:", -[TDSimpleArtworkRenditionSpec allowsDeepmapCompression](self, "allowsDeepmapCompression"));
      objc_msgSend(v76, "setAllowsDeepmap2ImageCompression:", -[TDSimpleArtworkRenditionSpec allowsDeepmap2Compression](self, "allowsDeepmap2Compression"));
      objc_msgSend(v76, "setTargetPlatform:", objc_msgSend(a5, "targetPlatform"));
      if (objc_msgSend((id)objc_msgSend((id)-[TDSimpleArtworkRenditionSpec production](self, "production"), "universalTypeIdentifier"), "length"))
      {
        CGFloat v81 = COERCE_DOUBLE(objc_msgSend((id)-[TDSimpleArtworkRenditionSpec production](self, "production"), "universalTypeIdentifier"));
      }
      else
      {
        if (![v18 getResourceValue:&mediaBox forKey:*MEMORY[0x263EFF780] error:0])
        {
          objc_msgSend(v76, "setName:", objc_msgSend(v10, "name"));
          goto LABEL_74;
        }
        CGFloat v81 = mediaBox.origin.x;
      }
      [v76 setUtiType:*(void *)&v81];
LABEL_74:
      __int16 v142 = 0;
      goto LABEL_75;
    }
    return 0;
  }
  if (v160 == 1398163232) {
    goto LABEL_64;
  }
  if (v160 != 1346651680) {
    goto LABEL_7;
  }
  CGPDFDocumentRef v21 = CGPDFDocumentCreateWithURL((CFURLRef)v18);
  if (!v21)
  {
LABEL_64:
    double v44 = (__CFData *)[objc_alloc(MEMORY[0x263EFF8F8]) initWithContentsOfURL:v18 options:2 error:0];
  }
  else
  {
    double v22 = v21;
    CGImageRef image = (CGImageRef)a5;
    id v23 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    uint64_t v24 = *MEMORY[0x263EFFD08];
    uint64_t v25 = *MEMORY[0x263F00450];
    [v23 setObject:*MEMORY[0x263EFFD08] forKeyedSubscript:*MEMORY[0x263F00450]];
    uint64_t v26 = *MEMORY[0x263F003D0];
    [v23 setObject:v24 forKeyedSubscript:*MEMORY[0x263F003D0]];
    uint64_t v27 = *MEMORY[0x263F003C8];
    [v23 setObject:v24 forKeyedSubscript:*MEMORY[0x263F003C8]];
    Info = CGPDFDocumentGetInfo(v22);
    if (Info)
    {
      double v29 = Info;
      value[0] = 0;
      if (CGPDFDictionaryGetString(Info, "Producer", value))
      {
        CFStringRef v30 = CGPDFStringCopyTextString(value[0]);
        if (v30)
        {
          CFStringRef v31 = v30;
          [v23 setObject:v30 forKeyedSubscript:v25];
          CFRelease(v31);
        }
      }
      if (CGPDFDictionaryGetString(v29, "CreationDate", value))
      {
        CFDateRef v32 = CGPDFStringCopyDate(value[0]);
        if (v32)
        {
          CFDateRef v33 = v32;
          [v23 setObject:v32 forKeyedSubscript:v27];
          CFRelease(v33);
        }
      }
      ID = CGPDFDocumentGetID(v22);
      size_t Count = CGPDFArrayGetCount(ID);
      if (Count)
      {
        size_t v36 = Count;
        uint64_t v145 = v26;
        id v37 = objc_alloc_init(MEMORY[0x263EFF980]);
        size_t v38 = 0;
        CFAllocatorRef v39 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
        do
        {
          if (CGPDFArrayGetString(ID, v38, value))
          {
            BytePtr = CGPDFStringGetBytePtr(value[0]);
            size_t Length = CGPDFStringGetLength(value[0]);
            if (Length)
            {
              CFDataRef v42 = CFDataCreate(v39, BytePtr, Length);
              [v37 addObject:v42];
              CFRelease(v42);
            }
          }
          ++v38;
        }
        while (v36 != v38);
        [v23 setObject:v37 forKeyedSubscript:v145];
      }
    }
    CGPDFDocumentEnableTaggedStructureSerialization();
    Page = CGPDFDocumentGetPage(v22, 1uLL);
    mediaBodouble x = CGPDFPageGetBoxRect(Page, kCGPDFCropBox);
    double v44 = (__CFData *)objc_alloc_init(MEMORY[0x263EFF990]);
    double v45 = CGDataConsumerCreateWithCFData(v44);
    double v46 = CGPDFContextCreate(v45, &mediaBox, (CFDictionaryRef)v23);
    CGDataConsumerRelease(v45);
    CGPDFContextBeginPage(v46, 0);
    CGContextDrawPDFPage(v46, Page);
    CGPDFContextEndPage(v46);
    CGPDFContextClose(v46);
    CGContextRelease(v46);
    CGPDFDocumentRelease(v22);

    a5 = image;
  }
  id v82 = objc_alloc(MEMORY[0x263F38370]);
  double v83 = (void *)[v82 initWithRawData:v44 pixelFormat:v160 layout:9];
  [v83 setIsVectorBased:1];
  objc_msgSend(v83, "setName:", objc_msgSend(v10, "name"));
  [v83 setColorSpaceID:0];
  [v83 setScaleFactor:0];
  [(TDSimpleArtworkRenditionSpec *)self physicalSizeInMeters];
  objc_msgSend(v83, "setPhysicalSizeInMeters:");
  objc_msgSend(v83, "setAllowsPaletteImageCompression:", -[TDSimpleArtworkRenditionSpec allowsPaletteImageCompression](self, "allowsPaletteImageCompression"));
  objc_msgSend(v83, "setAllowsHevcCompression:", -[TDSimpleArtworkRenditionSpec allowsHevcCompression](self, "allowsHevcCompression"));
  objc_msgSend(v83, "setAllowsDeepmapImageCompression:", -[TDSimpleArtworkRenditionSpec allowsDeepmapCompression](self, "allowsDeepmapCompression"));
  objc_msgSend(v83, "setAllowsDeepmap2ImageCompression:", -[TDSimpleArtworkRenditionSpec allowsDeepmap2Compression](self, "allowsDeepmap2Compression"));
  objc_msgSend(v83, "setTargetPlatform:", objc_msgSend(a5, "targetPlatform"));
  if (v160 == 1398163232) {
    [v83 setCompressionType:2];
  }
  uint64_t v14 = (void *)[v83 CSIRepresentationWithCompression:0];

  return v14;
}

- (CGSize)_scaleRecognitionImageFromSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  [(TDSimpleArtworkRenditionSpec *)self physicalSizeInMeters];
  if (v6 > 0.0 || ([(TDSimpleArtworkRenditionSpec *)self physicalSizeInMeters], v7 > 0.0))
  {
    if (width <= height)
    {
      if (height > 640.0)
      {
        double width = round(width * (640.0 / height));
        double height = 640.0;
      }
    }
    else if (width > 640.0)
    {
      double height = round(height * (640.0 / width));
      double width = 640.0;
    }
  }
  double v8 = width;
  double v9 = height;
  result.double height = v9;
  result.double width = v8;
  return result;
}

- (BOOL)updatePackingPropertiesWithDocument:(id)a3
{
  int v5 = (void *)[(TDSimpleArtworkRenditionSpec *)self asset];
  v82.receiver = self;
  v82.super_class = (Class)TDSimpleArtworkRenditionSpec;
  [(TDRenditionSpec *)&v82 updatePackingPropertiesWithDocument:a3];
  double v6 = (void *)[v5 fileURLWithDocument:a3];
  double v7 = (void *)[v6 pathExtension];
  uint64_t v8 = [v7 length];
  if (![v7 caseInsensitiveCompare:@"PDF"])
  {
    if (![v5 scaleFactor]) {
      return 1;
    }
    id v23 = CGPDFDocumentCreateWithURL((CFURLRef)v6);
    if (!v23) {
      return 1;
    }
    uint64_t v24 = v23;
    Page = CGPDFDocumentGetPage(v23, 1uLL);
    CGRect BoxRect = CGPDFPageGetBoxRect(Page, kCGPDFCropBox);
    double width = BoxRect.size.width;
    double height = BoxRect.size.height;
    double v28 = (double)objc_msgSend(v5, "scaleFactor", BoxRect.origin.x, BoxRect.origin.y);
    [(TDSimpleArtworkRenditionSpec *)self postScaleFactor];
    double v30 = v29 * v28;
    unsigned int v31 = [v5 fileScaleFactor];
    if (!v31) {
      unsigned int v31 = +[TDAsset scaleFactorFromImageFilename:](TDAsset, "scaleFactorFromImageFilename:", [v6 path]);
    }
    double v33 = (double)v31;
    LODWORD(v32) = llround(v30 * (width / (double)v31));
    [(TDSimpleArtworkRenditionSpec *)self setWidth:v32];
    LODWORD(v34) = llround(v30 * (height / v33));
    [(TDSimpleArtworkRenditionSpec *)self setHeight:v34];
    if (objc_msgSend((id)-[TDSimpleArtworkRenditionSpec production](self, "production"), "recognitionImage"))
    {
      [(TDSimpleArtworkRenditionSpec *)self setMonochrome:1];
    }
    else
    {
      LODWORD(v73) = 0;
      LOBYTE(v68) = 0;
      CFDataRef v42 = [(TDSimpleArtworkRenditionSpec *)self _createImageRefWithURL:v6 andDocument:a3 format:&v73 vectorBased:&v68];
      [(TDSimpleArtworkRenditionSpec *)self setMonochrome:CUIImageIsMonochrome()];
      CFRelease(v42);
    }
    v43 = v24;
LABEL_34:
    CFRelease(v43);
    return 1;
  }
  if (!objc_msgSend((id)objc_msgSend(v6, "pathExtension"), "caseInsensitiveCompare:", @"SVG"))
  {
    if (![v5 scaleFactor] || (objc_msgSend(v5, "rawData") & 1) != 0) {
      return 1;
    }
    LODWORD(v73) = 0;
    LOBYTE(v68) = 0;
    double v35 = [(TDSimpleArtworkRenditionSpec *)self _createImageRefWithURL:v6 andDocument:a3 format:&v73 vectorBased:&v68];
    [(TDSimpleArtworkRenditionSpec *)self setWidth:CGImageGetWidth(v35)];
    [(TDSimpleArtworkRenditionSpec *)self setHeight:CGImageGetHeight(v35)];
    if (objc_msgSend((id)-[TDSimpleArtworkRenditionSpec production](self, "production"), "recognitionImage")) {
      uint64_t IsMonochrome = 1;
    }
    else {
      uint64_t IsMonochrome = CUIImageIsMonochrome();
    }
    [(TDSimpleArtworkRenditionSpec *)self setMonochrome:IsMonochrome];
    v43 = v35;
    goto LABEL_34;
  }
  if (v8)
  {
    if ([v7 caseInsensitiveCompare:@"JPEG"]
      && [v7 caseInsensitiveCompare:@"JPG"])
    {
      if (![v7 caseInsensitiveCompare:@"PNG"])
      {
        uint64_t v9 = [v5 sourceImageWithDocument:a3];
        if (v9)
        {
          objc_super v10 = (void *)v9;
          uint64_t v81 = 0;
          char v80 = 0;
          uint64_t v79 = 0;
          uint64_t v73 = 0;
          double v74 = (NSRect *)&v73;
          uint64_t v75 = 0x4010000000;
          double v76 = "";
          long long v11 = *(_OWORD *)(MEMORY[0x263F001A8] + 16);
          long long v77 = *MEMORY[0x263F001A8];
          long long v78 = v11;
          uint64_t v68 = 0;
          double v69 = (NSSize *)&v68;
          double v71 = "";
          uint64_t v70 = 0x3010000000;
          long long v72 = *MEMORY[0x263F001B0];
          uint64_t v64 = 0;
          double v65 = &v64;
          uint64_t v66 = 0x2020000000;
          char v67 = 0;
          uint64_t v60 = 0;
          uint64_t v61 = &v60;
          uint64_t v62 = 0x2020000000;
          char v63 = 0;
          uint64_t v56 = 0;
          size_t v57 = &v56;
          uint64_t v58 = 0x2020000000;
          char v59 = 0;
          uint64_t v52 = 0;
          double v53 = &v52;
          uint64_t v54 = 0x2020000000;
          char v55 = 0;
          uint64_t v48 = 0;
          __int16 v49 = &v48;
          uint64_t v50 = 0x2020000000;
          uint64_t v51 = 0;
          int v12 = [(TDSimpleArtworkRenditionSpec *)self alphaCrop];
          unsigned int v13 = [(TDThemeConstant *)[(TDRenditionSpec *)self renditionType] identifier];
          v49[3] = v13;
          [v10 size];
          -[TDSimpleArtworkRenditionSpec _scaleRecognitionImageFromSize:](self, "_scaleRecognitionImageFromSize:");
          double v15 = v14;
          double v17 = v16;
          char v18 = objc_msgSend((id)-[TDSimpleArtworkRenditionSpec production](self, "production"), "makeOpaqueIfPossible");
          *((unsigned char *)v61 + 24) = v18;
          char v19 = objc_msgSend((id)-[TDSimpleArtworkRenditionSpec production](self, "production"), "recognitionImage");
          *((unsigned char *)v57 + 24) = v19;
          global_queue = dispatch_get_global_queue(0, 0);
          CGPDFDocumentRef v21 = dispatch_group_create();
          LODWORD(v81) = (int)v15;
          HIDWORD(v81) = (int)v17;
          [(TDSimpleArtworkRenditionSpec *)self _sliceRectanglesForRenditionSize:v81 unadjustedSliceRectangles:&v79 imageSlicesNeedAdjustment:&v80 newRenditionSize:&v81];
          [(TDSimpleArtworkRenditionSpec *)self setWidth:v81];
          [(TDSimpleArtworkRenditionSpec *)self setHeight:HIDWORD(v81)];
          block[0] = MEMORY[0x263EF8330];
          block[1] = 3221225472;
          block[2] = __68__TDSimpleArtworkRenditionSpec_updatePackingPropertiesWithDocument___block_invoke;
          block[3] = &unk_264C44EE0;
          block[4] = v10;
          block[5] = &v48;
          char v47 = v12;
          block[6] = &v68;
          block[7] = &v73;
          block[8] = &v60;
          block[9] = &v64;
          block[10] = v81;
          dispatch_group_async(v21, global_queue, block);
          v45[0] = MEMORY[0x263EF8330];
          v45[1] = 3221225472;
          v45[2] = __68__TDSimpleArtworkRenditionSpec_updatePackingPropertiesWithDocument___block_invoke_2;
          v45[3] = &unk_264C44F08;
          v45[6] = &v52;
          v45[4] = v10;
          v45[5] = &v56;
          dispatch_group_async(v21, global_queue, v45);
          dispatch_group_wait(v21, 0xFFFFFFFFFFFFFFFFLL);
          dispatch_release(v21);
          if (v49[3]) {
            int v22 = 0;
          }
          else {
            int v22 = v12;
          }
          if (v22 == 1)
          {
            if (!CGRectIsEmpty(v74[1]))
            {
              [(TDSimpleArtworkRenditionSpec *)self setWidth:(int)v74[1].size.width];
              [(TDSimpleArtworkRenditionSpec *)self setHeight:(int)v74[1].size.height];
            }
            [(TDSimpleArtworkRenditionSpec *)self setOriginalImageSizeString:NSStringFromSize(v69[2])];
            [(TDSimpleArtworkRenditionSpec *)self setNonAlphaImageAreaString:NSStringFromRect(v74[1])];
          }
          else
          {
            [(TDSimpleArtworkRenditionSpec *)self setOpaque:*((unsigned __int8 *)v65 + 24)];
          }
          [(TDSimpleArtworkRenditionSpec *)self setMonochrome:*((unsigned __int8 *)v53 + 24)];
          _Block_object_dispose(&v48, 8);
          _Block_object_dispose(&v52, 8);
          _Block_object_dispose(&v56, 8);
          _Block_object_dispose(&v60, 8);
          _Block_object_dispose(&v64, 8);
          _Block_object_dispose(&v68, 8);
          _Block_object_dispose(&v73, 8);
        }
      }
    }
    else if (([(TDSimpleArtworkRenditionSpec *)self alphaCrop] & 1) != 0 {
           || ([(TDSimpleArtworkRenditionSpec *)self physicalSizeInMeters], v37 > 0.0)
    }
           || ([(TDSimpleArtworkRenditionSpec *)self physicalSizeInMeters], v38 > 0.0))
    {
      CFAllocatorRef v39 = (void *)[v5 sourceImageWithDocument:a3];
      if (v39)
      {
        LOBYTE(v64) = 0;
        uint64_t v68 = 0;
        [v39 size];
        -[TDSimpleArtworkRenditionSpec _scaleRecognitionImageFromSize:](self, "_scaleRecognitionImageFromSize:");
        LODWORD(v73) = (int)v40;
        HIDWORD(v73) = (int)v41;
        [(TDSimpleArtworkRenditionSpec *)self _sliceRectanglesForRenditionSize:v73 unadjustedSliceRectangles:&v68 imageSlicesNeedAdjustment:&v64 newRenditionSize:&v73];
        [(TDSimpleArtworkRenditionSpec *)self setWidth:v73];
        [(TDSimpleArtworkRenditionSpec *)self setHeight:HIDWORD(v73)];
        [(TDSimpleArtworkRenditionSpec *)self setOpaque:1];
      }
    }
  }
  return 1;
}

__n128 __68__TDSimpleArtworkRenditionSpec_updatePackingPropertiesWithDocument___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) image])
  {
    if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) || !*(unsigned char *)(a1 + 88))
    {
      int v3 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 64) + 8) + 24);
      unsigned int v4 = (CGImage *)[*(id *)(a1 + 32) image];
      if (v3) {
        int AlphaInfo = CUICGImageGetAlphaInfo();
      }
      else {
        int AlphaInfo = CGImageGetAlphaInfo(v4);
      }
      if (AlphaInfo == 5 || AlphaInfo == 0) {
        *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = 1;
      }
    }
    else
    {
      uint64_t v6 = *(void *)(a1 + 80);
      v7.i64[0] = (int)v6;
      v7.i64[1] = SHIDWORD(v6);
      *(float64x2_t *)(*(void *)(*(void *)(a1 + 48) + 8) + 32) = vcvtq_f64_s64(v7);
      [*(id *)(a1 + 32) image];
      CUICalcNonAlphaAreaOfImage();
      uint64_t v8 = *(void **)(*(void *)(a1 + 56) + 8);
      v8[4] = v9;
      v8[5] = v10;
      v8[6] = v11;
      v8[7] = v12;
      IsEmptdouble y = CGRectIsEmpty(*(CGRect *)(*(void *)(*(void *)(a1 + 56) + 8) + 32));
      uint64_t v14 = *(void *)(a1 + 48);
      if (IsEmpty)
      {
        uint64_t v15 = *(void *)(v14 + 8);
LABEL_17:
        *(_OWORD *)(v15 + 32) = *MEMORY[0x263F001B0];
        uint64_t v18 = *(void *)(*(void *)(a1 + 56) + 8);
        __n128 result = *(__n128 *)(MEMORY[0x263F001A8] + 16);
        *(_OWORD *)(v18 + 32) = *MEMORY[0x263F001A8];
        *(__n128 *)(v18 + 48) = result;
        return result;
      }
      uint64_t v17 = *(void *)(*(void *)(a1 + 56) + 8);
      result.n128_u64[0] = *(void *)(v17 + 56);
      uint64_t v15 = *(void *)(v14 + 8);
      if (result.n128_f64[0] == *(double *)(v15 + 40))
      {
        result.n128_u64[0] = *(void *)(v17 + 48);
        if (result.n128_f64[0] == *(double *)(v15 + 32)) {
          goto LABEL_17;
        }
      }
    }
  }
  return result;
}

uint64_t __68__TDSimpleArtworkRenditionSpec_updatePackingPropertiesWithDocument___block_invoke_2(uint64_t result)
{
  uint64_t v1 = result;
  if (*(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24)
    || ([*(id *)(result + 32) image], __n128 result = CUIImageIsMonochrome(), result))
  {
    *(unsigned char *)(*(void *)(*(void *)(v1 + 48) + 8) + 24) = 1;
  }
  return result;
}

- (void)drawPackableRenditionInContext:(CGContext *)a3 withDocument:(id)a4
{
  char v57 = 0;
  int v56 = 1246774599;
  char v55 = 0;
  unint64_t v53 = 0;
  id v54 = 0;
  [(TDRenditionSpec *)self packedPoint];
  double v47 = v7;
  double v48 = v8;
  unsigned int v9 = [(TDThemeConstant *)[(TDRenditionSpec *)self renditionType] identifier];
  uint64_t v10 = -[TDSimpleArtworkRenditionSpec _createImageRefWithURL:andDocument:format:vectorBased:](self, "_createImageRefWithURL:andDocument:format:vectorBased:", objc_msgSend((id)-[TDSimpleArtworkRenditionSpec asset](self, "asset"), "fileURLWithDocument:", a4), a4, &v56, &v57);
  if (CGImageGetBitsPerComponent(v10) >= 9 && CGBitmapContextGetBitsPerComponent(a3) == 8)
  {
    CGColorSpaceRef v11 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x263F002D8]);
    uint64_t v12 = CUIConvertDeepImageTo8();
    if (v12)
    {
      unsigned int v13 = (CGImage *)v12;
      CFRelease(v10);
      uint64_t v10 = v13;
    }
    CFRelease(v11);
  }
  size_t Width = CGImageGetWidth(v10);
  size_t Height = CGImageGetHeight(v10);
  unint64_t v16 = Height;
  unint64_t v53 = __PAIR64__(Height, Width);
  id v17 = [(TDSimpleArtworkRenditionSpec *)self _sliceRectanglesForRenditionSize:__PAIR64__(Height, Width) unadjustedSliceRectangles:&v54 imageSlicesNeedAdjustment:&v55 newRenditionSize:&v53];
  if (v55)
  {
    if (a3)
    {
      uint64_t v18 = v17;
      if ([v54 count])
      {
        CGContextSaveGState(a3);
        CGFloat x = *MEMORY[0x263F001A0];
        CGFloat v51 = *(double *)(MEMORY[0x263F001A0] + 16);
        double y = *(double *)(MEMORY[0x263F001A0] + 8);
        double v50 = *(double *)(MEMORY[0x263F001A0] + 24);
        CGContextSetBlendMode(a3, kCGBlendModeCopy);
        if ([v18 count])
        {
          unint64_t v20 = 0;
          unsigned int v21 = v9 & 0xFFFFFFFE;
          do
          {
            objc_msgSend((id)objc_msgSend(v54, "objectAtIndex:", v20), "rectValue");
            CGFloat v23 = v22;
            CGFloat v25 = v24;
            double v27 = v26;
            double v29 = v28;
            objc_msgSend((id)objc_msgSend(v18, "objectAtIndex:", v20), "rectValue");
            if (v27 > 0.0 && v29 > 0.0)
            {
              double v34 = v30;
              CGFloat v35 = v32;
              CGFloat v36 = v33;
              CGFloat v49 = x;
              if (v21 == 2) {
                double v37 = (double)SHIDWORD(v53) - (v31 + v33);
              }
              else {
                double v37 = v31;
              }
              v58.origin.CGFloat x = v23;
              v58.origin.double y = v25;
              v58.size.double width = v27;
              v58.size.double height = v29;
              double v38 = CGImageCreateWithImageInRect(v10, v58);
              v59.origin.CGFloat x = v47 + v34;
              v59.origin.double y = v48 + v37;
              v59.size.double width = v35;
              v59.size.double height = v36;
              CGContextDrawImage(a3, v59, v38);
              CGImageRelease(v38);
              v60.origin.CGFloat x = v49;
              v60.size.double height = v50;
              v60.size.double width = v51;
              v60.origin.double y = y;
              v67.origin.CGFloat x = v47 + v34;
              v67.origin.double y = v48 + v37;
              v67.size.double width = v35;
              v67.size.double height = v36;
              CGRect v61 = CGRectUnion(v60, v67);
              CGFloat x = v61.origin.x;
              CGFloat v51 = v61.size.width;
              double y = v61.origin.y;
              double v50 = v61.size.height;
            }
            ++v20;
          }
          while (v20 < [v18 count]);
        }
        CGFloat v39 = (double)CGBitmapContextGetHeight(a3) - (v50 + y);
        CGImageRef Image = CGBitmapContextCreateImage(a3);
        v62.origin.CGFloat x = x;
        v62.origin.double y = v39;
        v62.size.double width = v51;
        v62.size.double height = v50;
        double v41 = CGImageCreateWithImageInRect(Image, v62);
        CUICalculateExtrusionMaskOfImage();
        CUIDrawExtrudedImageInContext();
        CGImageRelease(Image);
        CGImageRelease(v41);
        CGContextRestoreGState(a3);
      }
    }
  }
  else if (a3)
  {
    NSRect v63 = NSRectFromString((NSString *)[(TDSimpleArtworkRenditionSpec *)self nonAlphaImageAreaString]);
    CGFloat v42 = v63.origin.x;
    CGFloat v43 = v63.origin.y;
    CGFloat v44 = v63.size.width;
    CGFloat v45 = v63.size.height;
    if (CGRectIsEmpty(v63))
    {
      CUICalculateExtrusionMaskOfImage();
      v64.origin.CGFloat x = v47 + 0.0;
      v64.origin.double y = v48 + 0.0;
      v64.size.double width = (double)Width;
      v64.size.double height = (double)v16;
      CGContextDrawImage(a3, v64, v10);
      CUIDrawExtrudedImageInContext();
    }
    else
    {
      v65.origin.CGFloat x = v42;
      v65.origin.double y = v43;
      v65.size.double width = v44;
      v65.size.double height = v45;
      double v46 = CGImageCreateWithImageInRect(v10, v65);
      CUICalculateExtrusionMaskOfImage();
      v66.origin.CGFloat x = v47 + 0.0;
      v66.origin.double y = v48 + 0.0;
      v66.size.double width = v44;
      v66.size.double height = v45;
      CGContextDrawImage(a3, v66, v46);
      CUIDrawExtrudedImageInContext();
      CGImageRelease(v46);
    }
  }
  CGImageRelease(v10);
}

- (TDImageColorHistogram)histogram
{
  return self->_histogram;
}

- (void)setHistogram:(id)a3
{
}

- (BOOL)isBackstop
{
  return self->_isBackstop;
}

- (void)setIsBackstop:(BOOL)a3
{
  self->_isBackstop = a3;
}

@end