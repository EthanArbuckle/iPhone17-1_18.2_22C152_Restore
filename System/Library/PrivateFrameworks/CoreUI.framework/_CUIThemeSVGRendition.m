@interface _CUIThemeSVGRendition
- ($01BB1521EC52D44A8E7628F5261DCEC8)vectorGlyphAlignmentRectInsets;
- (BOOL)isInterpolatable;
- (CGSVGDocument)svgDocument;
- (CGSize)canvasSize;
- (double)vectorGlyphBaseline;
- (double)vectorGlyphCapLine;
- (double)vectorGlyphReferencePointSize;
- (float)vectorGlyphTemplateVersion;
- (id)_initWithCSIHeader:(const _csiheader *)a3 version:(unsigned int)a4;
- (id)metrics;
- (id)rawData;
- (id)vectorGlyphAvailableSizes;
- (int)pixelFormat;
- (int64_t)vectorGlyphRenderingMode;
- (signed)containsHierarchicalLayers;
- (signed)containsMulticolorLayers;
- (void)_initalizeMetadataFromCSIData:(const _csiheader *)a3 version:(unsigned int)a4;
- (void)dealloc;
- (void)lock;
- (void)unlock;
@end

@implementation _CUIThemeSVGRendition

- (BOOL)isInterpolatable
{
  return self->_templateVersion >= 3.0 && self->_isInterpolatable;
}

- (id)vectorGlyphAvailableSizes
{
  return self->_vectorSizes;
}

- (double)vectorGlyphCapLine
{
  return self->_capline;
}

- (double)vectorGlyphBaseline
{
  return self->_baseline;
}

- (double)vectorGlyphReferencePointSize
{
  LODWORD(v2) = self->_standardPointSize;
  return (double)v2;
}

- ($01BB1521EC52D44A8E7628F5261DCEC8)vectorGlyphAlignmentRectInsets
{
  if (self->_isAlignmentRect)
  {
    [(_CUIThemeSVGRendition *)self canvasSize];
    double right = (self->_alignmentRectInsets.right - v3) * 0.5;
    double bottom = (self->_alignmentRectInsets.top - v5) * 0.5;
    double left = right;
    double top = bottom;
  }
  else
  {
    double top = self->_alignmentRectInsets.top;
    double left = self->_alignmentRectInsets.left;
    double bottom = self->_alignmentRectInsets.bottom;
    double right = self->_alignmentRectInsets.right;
  }
  result.var3 = right;
  result.var2 = bottom;
  result.var1 = left;
  result.var0 = top;
  return result;
}

- (CGSize)canvasSize
{
  p_canvasSize = &self->_canvasSize;
  double width = self->_canvasSize.width;
  if (width == 0.0 || (double height = self->_canvasSize.height, height == 0.0))
  {
    [(_CUIThemeSVGRendition *)self svgDocument];
    CGSVGDocumentGetCanvasSize();
    p_canvasSize->double width = width;
    p_canvasSize->double height = height;
  }
  result.double height = height;
  result.double width = width;
  return result;
}

- (int64_t)vectorGlyphRenderingMode
{
  return self->_renderingMode;
}

- (void)unlock
{
}

- (void)lock
{
}

- (CGSVGDocument)svgDocument
{
  svgDocument = self->_svgDocument;
  if (svgDocument) {
    goto LABEL_2;
  }
  if ([(_CUIThemeSVGRendition *)self rawData])
  {
    svgDocument = (CGSVGDocument *)CGSVGDocumentCreateFromData();
    self->_svgDocument = svgDocument;
    if (!svgDocument)
    {
      [(CUIThemeRendition *)self name];
      _CUILog(4, (uint64_t)"CoreUI: %s '%@' couldn't create SVGDocument (%f) from data", v5, v6, v7, v8, v9, v10, (uint64_t)"-[_CUIThemeSVGRendition svgDocument]");
      return self->_svgDocument;
    }
LABEL_2:
    CFRetain(svgDocument);
    CFAutorelease(self->_svgDocument);
    return self->_svgDocument;
  }
  [(CUIThemeRendition *)self name];
  _CUILog(4, (uint64_t)"CoreUI: %s '%@' couldn't create SVGDocument from null data", v11, v12, v13, v14, v15, v16, (uint64_t)"-[_CUIThemeSVGRendition svgDocument]");
  return 0;
}

- (float)vectorGlyphTemplateVersion
{
  return self->_templateVersion;
}

- (id)_initWithCSIHeader:(const _csiheader *)a3 version:(unsigned int)a4
{
  v17.receiver = self;
  v17.super_class = (Class)_CUIThemeSVGRendition;
  uint64_t v5 = [(CUIThemeRendition *)&v17 _initWithCSIHeader:a3 version:*(void *)&a4];
  uint64_t v6 = v5;
  v5[85] = 0;
  uint64_t v7 = (char *)&a3->var0 + 4 * a3->var11.var0 + a3->var10;
  int v9 = *((_DWORD *)v7 + 45);
  uint64_t v8 = v7 + 180;
  unsigned int v10 = *((_DWORD *)v8 + 2);
  unsigned int v11 = bswap32(v10);
  if (v9 == 1146569042) {
    uint64_t v12 = v11;
  }
  else {
    uint64_t v12 = v10;
  }
  uint64_t v13 = v8 - (unsigned char *)objc_msgSend(objc_msgSend(v5, "srcData"), "bytes") + 12;
  BOOL v14 = *((_DWORD *)v8 + 1) != 0;
  uint64_t v15 = (unsigned int *)[v6 renditionFlags];
  *uint64_t v15 = *v15 & 0xFFFFFFC3 | (16 * v14);
  v6[28] = -[_CUISubrangeData initWithData:range:]([_CUISubrangeData alloc], "initWithData:range:", [v6 srcData], v13, v12);
  return v6;
}

- (void)_initalizeMetadataFromCSIData:(const _csiheader *)a3 version:(unsigned int)a4
{
  v25.receiver = self;
  v25.super_class = (Class)_CUIThemeSVGRendition;
  -[CUIThemeRendition _initalizeMetadataFromCSIData:version:](&v25, sel__initalizeMetadataFromCSIData_version_);
  uint64_t var10 = a3->var10;
  uint64_t var0 = a3->var11.var0;
  self->_containsMulticolorLayers = -1;
  self->_containsHierarchicalLayers = -1;
  if (var10)
  {
    uint64_t v8 = &a3->var11.var1[var0 + 1];
    int v9 = (unsigned int *)((char *)v8 + var10);
    do
    {
      unsigned int v10 = v8[1];
      if (*v8 == 1019)
      {
        unsigned int v16 = v8[2];
        self->_renderingMode = v8[3];
        if (v16)
        {
          self->_containsMulticolorLayers = v8[4] & 1;
          int v17 = (*((unsigned __int16 *)v8 + 8) >> 1) & 1;
        }
        else
        {
          LOWORD(v17) = -1;
          self->_containsMulticolorLayers = -1;
        }
        BOOL v23 = v10 == 12 || a4 >= 0x34F;
        self->_containsHierarchicalLayers = v17;
        if (!v23) {
          unsigned int v10 = 12;
        }
      }
      else if (*v8 == 1018)
      {
        self->_standardPointSize = v8[3];
        float v11 = *((float *)v8 + 5);
        self->_baseline = *((float *)v8 + 4);
        self->_capline = v11;
        *(float64x2_t *)&self->_alignmentRectInsets.double left = vcvtq_f64_f32(*(float32x2_t *)(v8 + 7));
        float v12 = *((float *)v8 + 10);
        self->_alignmentRectInsets.double right = *((float *)v8 + 9);
        self->_alignmentRectInsets.double top = v12;
        self->_isAlignmentRect = (v8[2] & 1) == 0;
        uint64_t v13 = (NSArray *)objc_alloc_init((Class)NSMutableArray);
        unsigned int v14 = v8[2];
        if ((v14 & 0x12) != 0)
        {
          float v15 = *((float *)v8 + 6);
          self->_templateVersion = v15;
          if (v15 >= 3.0) {
            self->_isInterpolatable = (v14 & 4) != 0;
          }
        }
        else
        {
          self->_templateVersion = 1.0;
        }
        if (v8[11])
        {
          unint64_t v18 = 0;
          v19 = v8 + 13;
          do
          {
            id v20 = objc_alloc((Class)NSNumber);
            unsigned int v21 = *v19;
            v19 += 2;
            id v22 = [v20 initWithInt:v21];
            [(NSArray *)v13 addObject:v22];

            ++v18;
          }
          while (v18 < v8[11]);
        }
        self->_vectorSizes = v13;
      }
      uint64_t v8 = (unsigned int *)((char *)v8 + v10 + 8);
    }
    while (v8 < v9);
  }
}

- (id)rawData
{
  if ((*(_DWORD *)[(CUIThemeRendition *)self renditionFlags] & 0x3C) == 0x10)
  {
    fileData = self->_fileData;
    self->_fileData = (NSData *)CUIUncompressDataWithLZFSE((const __CFData *)fileData);
    v4 = fileData;
    uint64_t v5 = [(CUIThemeRendition *)self renditionFlags];
    *(_DWORD *)v5 &= 0xFFFFFFC3;
  }
  uint64_t v6 = self->_fileData;
  return v6;
}

- (signed)containsMulticolorLayers
{
  return self->_containsMulticolorLayers;
}

- (void)dealloc
{
  if (self->_svgDocument)
  {
    CGSVGDocumentRelease();
    self->_svgDocument = 0;
  }

  v3.receiver = self;
  v3.super_class = (Class)_CUIThemeSVGRendition;
  [(CUIThemeRendition *)&v3 dealloc];
}

- (int)pixelFormat
{
  return 1398163232;
}

- (id)metrics
{
  return 0;
}

- (signed)containsHierarchicalLayers
{
  return self->_containsHierarchicalLayers;
}

@end