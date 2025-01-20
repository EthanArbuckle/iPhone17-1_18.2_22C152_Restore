@interface CPFont
- (BOOL)getGlyphs:(unsigned __int16 *)a3 forCodes:(const unsigned __int16 *)a4 count:(unsigned int)a5;
- (BOOL)isHorizontal;
- (BOOL)isSameFontAs:(id)a3;
- (CGFont)cgFont;
- (CGPDFFont)cgPDFFont;
- (CGRect)fontBBox;
- (CPFont)initWith:(CGPDFDictionary *)a3;
- (double)ascent;
- (double)avgWidth;
- (double)capHeight;
- (double)descent;
- (double)fontStretch;
- (double)fontWeight;
- (double)italicAngle;
- (double)kernBetweenUnicode:(unsigned __int16)a3 andUnicode:(unsigned __int16)a4;
- (double)leading;
- (double)maxWidth;
- (double)missingWidth;
- (double)spaceWidth;
- (double)stemH;
- (double)stemV;
- (double)underlinePosition;
- (double)underlineThickness;
- (double)xHeight;
- (id)fontName;
- (id)matchingFontName;
- (unsigned)flags;
- (void)dealloc;
- (void)dispose;
- (void)finalize;
- (void)getFontName;
- (void)loadEmbeddedFontInfo;
- (void)loadExternalFontInfoFor:(id)a3;
- (void)uniCharsFor:(unint64_t)a3 count:(unint64_t *)a4 toArray:(unsigned __int16 *)a5 maxChars:(unsigned int)a6;
@end

@implementation CPFont

- (void)uniCharsFor:(unint64_t)a3 count:(unint64_t *)a4 toArray:(unsigned __int16 *)a5 maxChars:(unsigned int)a6
{
  *a4 = 0;
  cgPDFFont = self->cgPDFFont;
  if (!cgPDFFont) {
    return;
  }
  LODWORD(v8) = a6;
  Encoding = CGPDFFontGetEncoding((atomic_ullong *)cgPDFFont);
  if (!Encoding)
  {
    uint64_t v16 = CGPDFFontGetToUnicodeCMap((uint64_t)self->cgPDFFont);
    if (!v16) {
      return;
    }
    if (a3 >> 16)
    {
      unint64_t v8 = v8;
    }
    else
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)(v16 + 16);
      uint64_t v19 = cmap_vtable;
      if (cmap_vtable && (v20 = *(uint64_t (**)(uint64_t, void, void))(cmap_vtable + 64)) != 0)
      {
        unint64_t v21 = v20(v18, (unsigned __int16)a3, 0);
        unint64_t v22 = 0;
        *a4 = v21;
        if (v21 > v8)
        {
LABEL_21:
          *a4 = v22;
          return;
        }
        unint64_t v8 = v8;
        uint64_t v18 = *(void *)(v17 + 16);
        uint64_t v19 = cmap_vtable;
      }
      else
      {
        *a4 = 0;
        unint64_t v8 = v8;
      }
      if (v19)
      {
        v23 = *(uint64_t (**)(uint64_t, void, unsigned __int16 *))(v19 + 64);
        if (v23)
        {
          unint64_t v24 = v23(v18, (unsigned __int16)a3, a5);
          *a4 = v24;
          if (v24) {
            return;
          }
          goto LABEL_19;
        }
      }
    }
    *a4 = 0;
LABEL_19:
    unint64_t v25 = CGPDFGetUnicharGuessForCID((unsigned __int16)a3, 0);
    unint64_t v22 = 0;
    *a4 = v25;
    if (v25 <= v8) {
      unint64_t v22 = CGPDFGetUnicharGuessForCID((unsigned __int16)a3, a5);
    }
    goto LABEL_21;
  }
  UnicodesForIndex = (unsigned __int16 *)CGPDFEncodingGetUnicodesForIndex((uint64_t)Encoding, a3, a4);
  unint64_t v14 = *a4;
  if (*a4 - 1 < v8)
  {
    do
    {
      unsigned __int16 v15 = *UnicodesForIndex++;
      *a5++ = v15;
      --v14;
    }
    while (v14);
  }
}

- (BOOL)getGlyphs:(unsigned __int16 *)a3 forCodes:(const unsigned __int16 *)a4 count:(unsigned int)a5
{
  cgPDFFont = self->cgPDFFont;
  if (cgPDFFont)
  {
    Encoding = CGPDFFontGetEncoding((atomic_ullong *)self->cgPDFFont);
    if (Encoding)
    {
      GlyphVector = CGPDFEncodingGetGlyphVector(Encoding);
      if (a5)
      {
        uint64_t v12 = a5;
        do
        {
          unsigned int v13 = *a4++;
          *a3++ = *((_WORD *)GlyphVector + v13);
          --v12;
        }
        while (v12);
      }
    }
    else
    {
      CIDToGlyphMap = (__int16 *)CGPDFFontGetCIDToGlyphMap((uint64_t)self->cgPDFFont);
      if (CIDToGlyphMap)
      {
        CGFontIndexMapGetValues(CIDToGlyphMap, (unsigned __int16 *)a4, a5, a3);
      }
      else
      {
        [(CPFont *)self cgFont];
        cgFont = self->cgFont;
        if (cgFont && (uint64_t v16 = a5, CGFontGetGlyphsForCIDs(cgFont, (unsigned __int16 *)a4, a5, a3)))
        {
          if (!CGPDFFontIsEmbedded((uint64_t)self->cgPDFFont))
          {
            unsigned __int16 v23 = 1;
            unsigned __int16 v22 = 0;
            if ((CGFontGetGlyphsForCIDs((void *)self->cgFont, &v23, 1, &v22) & 1) == 0) {
              unsigned __int16 v22 = 0;
            }
            if (a5)
            {
              unsigned __int16 v17 = v22;
              do
              {
                if (!*a4++) {
                  *a3 = v17;
                }
                ++a3;
                --v16;
              }
              while (v16);
            }
          }
        }
        else if (a5)
        {
          uint64_t v19 = a5;
          do
          {
            unsigned __int16 v20 = *a4++;
            *a3++ = v20;
            --v19;
          }
          while (v19);
        }
      }
    }
  }
  return cgPDFFont != 0;
}

- (double)kernBetweenUnicode:(unsigned __int16)a3 andUnicode:(unsigned __int16)a4
{
  kernDictionary = self->kernDictionary;
  double v6 = 0.0;
  if (kernDictionary)
  {
    unsigned int v7 = a4;
    unsigned int v8 = a3;
    if (CFDictionaryGetCount(kernDictionary))
    {
      if (self->kernUnitsPerEm != 0.0) {
        return (double)(__int16)CFDictionaryGetValue(self->kernDictionary, (const void *)(v7 | ((unint64_t)v8 << 16)))/ self->kernUnitsPerEm;
      }
    }
  }
  return v6;
}

- (BOOL)isHorizontal
{
  return self->isHorizontal;
}

- (double)underlineThickness
{
  return self->descriptor.underlineThickness;
}

- (double)underlinePosition
{
  return self->descriptor.underlinePosition;
}

- (double)spaceWidth
{
  return self->descriptor.spaceWidth;
}

- (double)missingWidth
{
  return self->descriptor.missingWidth;
}

- (double)maxWidth
{
  return self->descriptor.maxWidth;
}

- (double)avgWidth
{
  return self->descriptor.avgWidth;
}

- (double)stemH
{
  return self->descriptor.stemH;
}

- (double)stemV
{
  return self->descriptor.stemV;
}

- (double)xHeight
{
  return self->descriptor.xHeight;
}

- (double)capHeight
{
  return self->descriptor.capHeight;
}

- (double)leading
{
  return self->descriptor.leading;
}

- (double)descent
{
  if (self->isHorizontal) {
    return self->descriptor.descent;
  }
  else {
    return self->defaultWidth * -0.5;
  }
}

- (double)ascent
{
  if (self->isHorizontal) {
    return self->descriptor.ascent;
  }
  else {
    return self->defaultWidth * 0.5;
  }
}

- (double)italicAngle
{
  return self->descriptor.italicAngle;
}

- (CGRect)fontBBox
{
  double x = self->descriptor.fontBBox.origin.x;
  double y = self->descriptor.fontBBox.origin.y;
  double width = self->descriptor.fontBBox.size.width;
  double height = self->descriptor.fontBBox.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (unsigned)flags
{
  return self->descriptor.flags;
}

- (double)fontWeight
{
  return self->descriptor.fontWeight;
}

- (double)fontStretch
{
  return self->descriptor.fontStretch;
}

- (BOOL)isSameFontAs:(id)a3
{
  return self == a3 || [(NSString *)self->fontName isEqualToString:*((void *)a3 + 3)];
}

- (id)fontName
{
  return self->fontName;
}

- (CGFont)cgFont
{
  CGRect result = self->cgFont;
  if (!result)
  {
    CGRect result = (CGFont *)self->cgPDFFont;
    if (result)
    {
      CGRect result = (CGFont *)CGPDFFontGetFont((uint64_t)result);
      self->cgFont = result;
    }
  }
  return result;
}

- (CGPDFFont)cgPDFFont
{
  return self->cgPDFFont;
}

- (void)dealloc
{
  [(CPFont *)self dispose];

  v3.receiver = self;
  v3.super_class = (Class)CPFont;
  [(CPFont *)&v3 dealloc];
}

- (void)finalize
{
  [(CPFont *)self dispose];
  v3.receiver = self;
  v3.super_class = (Class)CPFont;
  [(CPFont *)&v3 finalize];
}

- (void)dispose
{
  if (!self->disposed)
  {
    kernDictionardouble y = self->kernDictionary;
    if (kernDictionary) {
      CFRelease(kernDictionary);
    }
    cgPDFFont = self->cgPDFFont;
    if (cgPDFFont) {
      CFRelease(cgPDFFont);
    }
    self->disposed = 1;
  }
}

- (CPFont)initWith:(CGPDFDictionary *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CPFont;
  v4 = [(CPFont *)&v6 init];
  if (v4)
  {
    v4->cgPDFFont = (CGPDFFont *)CGPDFFontCreate(a3);
    [(CPFont *)v4 getFontName];
    [(CPFont *)v4 loadExternalFontInfoFor:v4->fontName];
    [(CPFont *)v4 loadEmbeddedFontInfo];
  }
  return v4;
}

- (void)loadEmbeddedFontInfo
{
  self->isHorizontal = 1;
  self->defaultWidth = 1.0;
  cgPDFFont = self->cgPDFFont;
  if (cgPDFFont)
  {
    double v4 = *((double *)cgPDFFont + 7);
    double v5 = *((double *)cgPDFFont + 10);
    double v6 = fabs(v4);
    double v7 = fabs(v5);
    BOOL v12 = v4 == 0.0;
    double v8 = 0.001;
    if (v12) {
      double v6 = 0.001;
    }
    if (v5 != 0.0) {
      double v8 = v7;
    }
    double v34 = v6;
    double v35 = v8;
    unint64_t FontDescriptor = CGPDFFontGetFontDescriptor((uint64_t)cgPDFFont);
    if (!FontDescriptor) {
      goto LABEL_56;
    }
    unsigned int v10 = *(_DWORD *)(FontDescriptor + 40);
    if (v10) {
      self->descriptor.flags = v10;
    }
    v11 = *(CGPDFDictionary **)(FontDescriptor + 32);
    if (v11)
    {
      CGRect v37 = CGRectNull;
      if (CGPDFDictionaryGetRect(v11, "FontBBox", &v37.origin.x))
      {
        BOOL v12 = v37.origin.x == INFINITY || v37.origin.y == INFINITY;
        if (!v12 && v37.size.width != 0.0 && v37.size.height != 0.0)
        {
          v13.f64[0] = v34;
          v13.f64[1] = v35;
          CGPoint v14 = (CGPoint)vmulq_f64(v13, (float64x2_t)v37.origin);
          CGSize v15 = (CGSize)vmulq_f64(v13, (float64x2_t)v37.size);
          self->descriptor.fontBBox.origin = v14;
          self->descriptor.fontBBox.size = v15;
        }
      }
      CGPDFReal value = 0.0;
      if (CGPDFDictionaryGetNumber(v11, "FontWeight", &value) && value != 0.0) {
        self->descriptor.fontWeight = (value + -400.0) / dbl_1850CDF30[value < 400.0];
      }
      if (CGPDFDictionaryGetNumber(v11, "ItalicAngle", &value) && value != 0.0) {
        self->descriptor.italicAngle = value;
      }
      if (CGPDFDictionaryGetNumber(v11, "Ascent", &value) && value != 0.0) {
        self->descriptor.ascent = v35 * value;
      }
      if (CGPDFDictionaryGetNumber(v11, "Descent", &value))
      {
        double v16 = value;
        if (value != 0.0)
        {
          if (value > 0.0)
          {
            double v16 = -value;
            CGPDFReal value = -value;
          }
          self->descriptor.descent = v35 * v16;
        }
      }
      if (CGPDFDictionaryGetNumber(v11, "Leading", &value) && value != 0.0) {
        self->descriptor.leading = v35 * value;
      }
      if (CGPDFDictionaryGetNumber(v11, "CapHeight", &value) && value != 0.0) {
        self->descriptor.capHeight = v35 * value;
      }
      if (CGPDFDictionaryGetNumber(v11, "XHeight", &value) && value != 0.0) {
        self->descriptor.xHeight = v35 * value;
      }
      if (CGPDFDictionaryGetNumber(v11, "StemV", &value) && value != 0.0) {
        self->descriptor.stemV = v35 * value;
      }
      if (CGPDFDictionaryGetNumber(v11, "StemH", &value) && value != 0.0) {
        self->descriptor.stemH = v34 * value;
      }
      if (CGPDFDictionaryGetNumber(v11, "AvgWidth", &value) && value != 0.0) {
        self->descriptor.avgWidth = v34 * value;
      }
      if (CGPDFDictionaryGetNumber(v11, "MaxWidth", &value) && value != 0.0) {
        self->descriptor.maxWidth = v34 * value;
      }
      if (CGPDFDictionaryGetNumber(v11, "MissingWidth", &value) && value != 0.0) {
        self->descriptor.missingWidth = v34 * value;
      }
    }
    else
    {
LABEL_56:
      FontBBodouble x = CGPDFFontGetFontBBox((uint64_t)self->cgPDFFont);
      BOOL v21 = FontBBox == INFINITY || v18 == INFINITY;
      if (!v21 && v19 != 0.0 && v20 != 0.0)
      {
        double width = self->descriptor.fontBBox.size.width;
        double height = self->descriptor.fontBBox.size.height;
        if (width == 0.0) {
          double width = 2.39648438;
        }
        if (height == 0.0) {
          double height = 1.60253906;
        }
        CGFloat v24 = v34 * v19;
        double v25 = v24 / width;
        CGFloat v26 = v35 * v20;
        double v27 = v26 / height;
        self->descriptor.fontBBox.origin.double x = v34 * FontBBox;
        self->descriptor.fontBBox.origin.double y = v35 * v18;
        self->descriptor.fontBBox.size.double width = v24;
        self->descriptor.fontBBox.size.double height = v26;
        *(float64x2_t *)&self->descriptor.ascent = vmulq_n_f64(*(float64x2_t *)&self->descriptor.ascent, v27);
        *(float64x2_t *)&self->descriptor.leading = vmulq_n_f64(*(float64x2_t *)&self->descriptor.leading, v27);
        *(float64x2_t *)&self->descriptor.xHeight = vmulq_n_f64(*(float64x2_t *)&self->descriptor.xHeight, v27);
        *(float64x2_t *)&self->descriptor.stemH = vmulq_n_f64(*(float64x2_t *)&self->descriptor.stemH, v25);
        *(float64x2_t *)&self->descriptor.maxWidth = vmulq_n_f64(*(float64x2_t *)&self->descriptor.maxWidth, v25);
      }
    }
    v28 = self->cgPDFFont;
    if (v28 && *((_DWORD *)v28 + 50) == 1)
    {
      unint64_t CMap = CGPDFFontGetCMap((unint64_t)v28);
      BOOL v31 = !CMap
         || !cmap_vtable
         || (v30 = *(unsigned int (**)(void))(cmap_vtable + 40)) == 0
         || v30(*(void *)(CMap + 16)) == 0;
      self->isHorizontal = v31;
      v32 = self->cgPDFFont;
      if (v32)
      {
        if (*((void *)v32 + 6))
        {
          v33 = (CGPDFDictionary *)*((void *)v32 + 2);
          v37.origin.double x = 0.0;
          if (CGPDFDictionaryGetNumber(v33, "DW", &v37.origin.x)) {
            self->defaultWidth = v34 * fabs(v37.origin.x);
          }
        }
      }
    }
  }
  if (self->descriptor.leading == 0.0) {
    self->descriptor.leading = 0.2;
  }
  if (self->descriptor.spaceWidth == 0.0) {
    self->descriptor.spaceWidth = 0.277832031;
  }
}

- (void)loadExternalFontInfoFor:(id)a3
{
  fontName = self->fontName;
  uint64_t v56 = 0;
  v57 = &v56;
  uint64_t v58 = 0x2020000000;
  double v5 = (uint64_t (*)(NSString *, void, double))getCTFontCreateWithNameSymbolLoc_ptr;
  v59 = getCTFontCreateWithNameSymbolLoc_ptr;
  if (!getCTFontCreateWithNameSymbolLoc_ptr)
  {
    uint64_t v51 = MEMORY[0x1E4F143A8];
    uint64_t v52 = 3221225472;
    v53 = __getCTFontCreateWithNameSymbolLoc_block_invoke;
    v54 = &unk_1E52CD918;
    v55 = &v56;
    double v6 = (void *)CoreTextLibrary();
    v57[3] = (uint64_t)dlsym(v6, "CTFontCreateWithName");
    getCTFontCreateWithNameSymbolLoc_ptr = *(_UNKNOWN **)(v55[1] + 24);
    double v5 = (uint64_t (*)(NSString *, void, double))v57[3];
  }
  _Block_object_dispose(&v56, 8);
  if (!v5) {
    goto LABEL_51;
  }
  uint64_t v7 = v5(fontName, 0, 1.0);
  if (!v7)
  {
    *(_OWORD *)&self->descriptor.stemH = unk_185294180;
    *(_OWORD *)&self->descriptor.maxWidth = xmmword_185294190;
    *(_OWORD *)&self->descriptor.spaceWidth = unk_1852941A0;
    *(_OWORD *)&self->descriptor.fontBBox.size.double height = unk_185294140;
    *(_OWORD *)&self->descriptor.ascent = xmmword_185294150;
    *(_OWORD *)&self->descriptor.leading = unk_185294160;
    *(_OWORD *)&self->descriptor.xHeight = xmmword_185294170;
    *(_OWORD *)&self->descriptor.fontStretch = kCPFontDescriptorDefault;
    *(_OWORD *)&self->descriptor.flags = unk_185294120;
    self->descriptor.underlineThickness = 0.0493164062;
    *(_OWORD *)&self->descriptor.fontBBox.origin.double y = xmmword_185294130;
    self->exactMatch = 0;
    return;
  }
  double v8 = (const void *)v7;
  uint64_t v56 = 0;
  v57 = &v56;
  uint64_t v58 = 0x2020000000;
  v9 = (double (*)(const void *))getCTFontGetWeightSymbolLoc_ptr;
  v59 = getCTFontGetWeightSymbolLoc_ptr;
  if (!getCTFontGetWeightSymbolLoc_ptr)
  {
    uint64_t v51 = MEMORY[0x1E4F143A8];
    uint64_t v52 = 3221225472;
    v53 = __getCTFontGetWeightSymbolLoc_block_invoke;
    v54 = &unk_1E52CD918;
    v55 = &v56;
    unsigned int v10 = (void *)CoreTextLibrary();
    v57[3] = (uint64_t)dlsym(v10, "CTFontGetWeight");
    getCTFontGetWeightSymbolLoc_ptr = *(_UNKNOWN **)(v55[1] + 24);
    v9 = (double (*)(const void *))v57[3];
  }
  _Block_object_dispose(&v56, 8);
  if (!v9) {
    goto LABEL_51;
  }
  self->descriptor.fontWeight = v9(v8);
  uint64_t v56 = 0;
  v57 = &v56;
  uint64_t v58 = 0x2020000000;
  v11 = (double (*)(const void *))getCTFontGetBoundingBoxSymbolLoc_ptr;
  v59 = getCTFontGetBoundingBoxSymbolLoc_ptr;
  if (!getCTFontGetBoundingBoxSymbolLoc_ptr)
  {
    uint64_t v51 = MEMORY[0x1E4F143A8];
    uint64_t v52 = 3221225472;
    v53 = __getCTFontGetBoundingBoxSymbolLoc_block_invoke;
    v54 = &unk_1E52CD918;
    v55 = &v56;
    BOOL v12 = (void *)CoreTextLibrary();
    v57[3] = (uint64_t)dlsym(v12, "CTFontGetBoundingBox");
    getCTFontGetBoundingBoxSymbolLoc_ptr = *(_UNKNOWN **)(v55[1] + 24);
    v11 = (double (*)(const void *))v57[3];
  }
  _Block_object_dispose(&v56, 8);
  if (!v11) {
    goto LABEL_51;
  }
  self->descriptor.fontBBox.origin.double x = v11(v8);
  self->descriptor.fontBBox.origin.double y = v13;
  self->descriptor.fontBBox.size.double width = v14;
  self->descriptor.fontBBox.size.double height = v15;
  uint64_t v56 = 0;
  v57 = &v56;
  uint64_t v58 = 0x2020000000;
  double v16 = (double (*)(const void *))getCTFontGetSlantAngleSymbolLoc_ptr;
  v59 = getCTFontGetSlantAngleSymbolLoc_ptr;
  if (!getCTFontGetSlantAngleSymbolLoc_ptr)
  {
    uint64_t v51 = MEMORY[0x1E4F143A8];
    uint64_t v52 = 3221225472;
    v53 = __getCTFontGetSlantAngleSymbolLoc_block_invoke;
    v54 = &unk_1E52CD918;
    v55 = &v56;
    unsigned __int16 v17 = (void *)CoreTextLibrary();
    v57[3] = (uint64_t)dlsym(v17, "CTFontGetSlantAngle");
    getCTFontGetSlantAngleSymbolLoc_ptr = *(_UNKNOWN **)(v55[1] + 24);
    double v16 = (double (*)(const void *))v57[3];
  }
  _Block_object_dispose(&v56, 8);
  if (!v16) {
    goto LABEL_51;
  }
  self->descriptor.italicAngle = v16(v8);
  uint64_t v56 = 0;
  v57 = &v56;
  uint64_t v58 = 0x2020000000;
  double v18 = (double (*)(const void *))getCTFontGetAscentSymbolLoc_ptr;
  v59 = getCTFontGetAscentSymbolLoc_ptr;
  if (!getCTFontGetAscentSymbolLoc_ptr)
  {
    uint64_t v51 = MEMORY[0x1E4F143A8];
    uint64_t v52 = 3221225472;
    v53 = __getCTFontGetAscentSymbolLoc_block_invoke;
    v54 = &unk_1E52CD918;
    v55 = &v56;
    double v19 = (void *)CoreTextLibrary();
    v57[3] = (uint64_t)dlsym(v19, "CTFontGetAscent");
    getCTFontGetAscentSymbolLoc_ptr = *(_UNKNOWN **)(v55[1] + 24);
    double v18 = (double (*)(const void *))v57[3];
  }
  _Block_object_dispose(&v56, 8);
  if (!v18) {
    goto LABEL_51;
  }
  self->descriptor.ascent = v18(v8);
  uint64_t v56 = 0;
  v57 = &v56;
  uint64_t v58 = 0x2020000000;
  double v20 = (double (*)(const void *))getCTFontGetDescentSymbolLoc_ptr;
  v59 = getCTFontGetDescentSymbolLoc_ptr;
  if (!getCTFontGetDescentSymbolLoc_ptr)
  {
    uint64_t v51 = MEMORY[0x1E4F143A8];
    uint64_t v52 = 3221225472;
    v53 = __getCTFontGetDescentSymbolLoc_block_invoke;
    v54 = &unk_1E52CD918;
    v55 = &v56;
    BOOL v21 = (void *)CoreTextLibrary();
    v57[3] = (uint64_t)dlsym(v21, "CTFontGetDescent");
    getCTFontGetDescentSymbolLoc_ptr = *(_UNKNOWN **)(v55[1] + 24);
    double v20 = (double (*)(const void *))v57[3];
  }
  _Block_object_dispose(&v56, 8);
  if (!v20) {
    goto LABEL_51;
  }
  self->descriptor.descent = v20(v8);
  uint64_t v56 = 0;
  v57 = &v56;
  uint64_t v58 = 0x2020000000;
  unsigned __int16 v22 = (double (*)(const void *))getCTFontGetLeadingSymbolLoc_ptr;
  v59 = getCTFontGetLeadingSymbolLoc_ptr;
  if (!getCTFontGetLeadingSymbolLoc_ptr)
  {
    uint64_t v51 = MEMORY[0x1E4F143A8];
    uint64_t v52 = 3221225472;
    v53 = __getCTFontGetLeadingSymbolLoc_block_invoke;
    v54 = &unk_1E52CD918;
    v55 = &v56;
    unsigned __int16 v23 = (void *)CoreTextLibrary();
    v57[3] = (uint64_t)dlsym(v23, "CTFontGetLeading");
    getCTFontGetLeadingSymbolLoc_ptr = *(_UNKNOWN **)(v55[1] + 24);
    unsigned __int16 v22 = (double (*)(const void *))v57[3];
  }
  _Block_object_dispose(&v56, 8);
  if (!v22) {
    goto LABEL_51;
  }
  self->descriptor.leading = v22(v8);
  uint64_t v56 = 0;
  v57 = &v56;
  uint64_t v58 = 0x2020000000;
  CGFloat v24 = (double (*)(const void *))getCTFontGetCapHeightSymbolLoc_ptr;
  v59 = getCTFontGetCapHeightSymbolLoc_ptr;
  if (!getCTFontGetCapHeightSymbolLoc_ptr)
  {
    uint64_t v51 = MEMORY[0x1E4F143A8];
    uint64_t v52 = 3221225472;
    v53 = __getCTFontGetCapHeightSymbolLoc_block_invoke;
    v54 = &unk_1E52CD918;
    v55 = &v56;
    double v25 = (void *)CoreTextLibrary();
    v57[3] = (uint64_t)dlsym(v25, "CTFontGetCapHeight");
    getCTFontGetCapHeightSymbolLoc_ptr = *(_UNKNOWN **)(v55[1] + 24);
    CGFloat v24 = (double (*)(const void *))v57[3];
  }
  _Block_object_dispose(&v56, 8);
  if (!v24) {
    goto LABEL_51;
  }
  self->descriptor.capHeight = v24(v8);
  uint64_t v56 = 0;
  v57 = &v56;
  uint64_t v58 = 0x2020000000;
  CGFloat v26 = (double (*)(const void *))getCTFontGetXHeightSymbolLoc_ptr;
  v59 = getCTFontGetXHeightSymbolLoc_ptr;
  if (!getCTFontGetXHeightSymbolLoc_ptr)
  {
    uint64_t v51 = MEMORY[0x1E4F143A8];
    uint64_t v52 = 3221225472;
    v53 = __getCTFontGetXHeightSymbolLoc_block_invoke;
    v54 = &unk_1E52CD918;
    v55 = &v56;
    double v27 = (void *)CoreTextLibrary();
    v57[3] = (uint64_t)dlsym(v27, "CTFontGetXHeight");
    getCTFontGetXHeightSymbolLoc_ptr = *(_UNKNOWN **)(v55[1] + 24);
    CGFloat v26 = (double (*)(const void *))v57[3];
  }
  _Block_object_dispose(&v56, 8);
  if (!v26) {
    goto LABEL_51;
  }
  self->descriptor.xHeight = v26(v8);
  __int16 v50 = 0;
  __int16 v49 = 32;
  uint64_t v56 = 0;
  v57 = &v56;
  uint64_t v58 = 0x2020000000;
  v28 = (void (*)(const void *, __int16 *, __int16 *, uint64_t))getCTFontGetGlyphsForCharactersSymbolLoc_ptr;
  v59 = getCTFontGetGlyphsForCharactersSymbolLoc_ptr;
  if (!getCTFontGetGlyphsForCharactersSymbolLoc_ptr)
  {
    uint64_t v51 = MEMORY[0x1E4F143A8];
    uint64_t v52 = 3221225472;
    v53 = __getCTFontGetGlyphsForCharactersSymbolLoc_block_invoke;
    v54 = &unk_1E52CD918;
    v55 = &v56;
    v29 = (void *)CoreTextLibrary();
    v57[3] = (uint64_t)dlsym(v29, "CTFontGetGlyphsForCharacters");
    getCTFontGetGlyphsForCharactersSymbolLoc_ptr = *(_UNKNOWN **)(v55[1] + 24);
    v28 = (void (*)(const void *, __int16 *, __int16 *, uint64_t))v57[3];
  }
  _Block_object_dispose(&v56, 8);
  if (!v28) {
    goto LABEL_51;
  }
  v28(v8, &v49, &v50, 1);
  uint64_t v56 = 0;
  v57 = &v56;
  uint64_t v58 = 0x2020000000;
  v30 = getCTFontGetAdvancesForGlyphsSymbolLoc_ptr;
  v59 = getCTFontGetAdvancesForGlyphsSymbolLoc_ptr;
  if (!getCTFontGetAdvancesForGlyphsSymbolLoc_ptr)
  {
    uint64_t v51 = MEMORY[0x1E4F143A8];
    uint64_t v52 = 3221225472;
    v53 = __getCTFontGetAdvancesForGlyphsSymbolLoc_block_invoke;
    v54 = &unk_1E52CD918;
    v55 = &v56;
    BOOL v31 = (void *)CoreTextLibrary();
    v32 = dlsym(v31, "CTFontGetAdvancesForGlyphs");
    *(void *)(v55[1] + 24) = v32;
    getCTFontGetAdvancesForGlyphsSymbolLoc_ptr = *(_UNKNOWN **)(v55[1] + 24);
    v30 = (void *)v57[3];
  }
  _Block_object_dispose(&v56, 8);
  if (!v30) {
    goto LABEL_51;
  }
  self->descriptor.spaceWidth = ((double (*)(const void *, void, __int16 *, void, uint64_t))v30)(v8, 0, &v50, 0, 1);
  uint64_t v56 = 0;
  v57 = &v56;
  uint64_t v58 = 0x2020000000;
  v33 = (double (*)(const void *))getCTFontGetUnderlinePositionSymbolLoc_ptr;
  v59 = getCTFontGetUnderlinePositionSymbolLoc_ptr;
  if (!getCTFontGetUnderlinePositionSymbolLoc_ptr)
  {
    uint64_t v51 = MEMORY[0x1E4F143A8];
    uint64_t v52 = 3221225472;
    v53 = __getCTFontGetUnderlinePositionSymbolLoc_block_invoke;
    v54 = &unk_1E52CD918;
    v55 = &v56;
    double v34 = (void *)CoreTextLibrary();
    double v35 = dlsym(v34, "CTFontGetUnderlinePosition");
    *(void *)(v55[1] + 24) = v35;
    getCTFontGetUnderlinePositionSymbolLoc_ptr = *(_UNKNOWN **)(v55[1] + 24);
    v33 = (double (*)(const void *))v57[3];
  }
  _Block_object_dispose(&v56, 8);
  if (!v33) {
    goto LABEL_51;
  }
  self->descriptor.underlinePosition = v33(v8);
  uint64_t v56 = 0;
  v57 = &v56;
  uint64_t v58 = 0x2020000000;
  v36 = (double (*)(const void *))getCTFontGetUnderlineThicknessSymbolLoc_ptr;
  v59 = getCTFontGetUnderlineThicknessSymbolLoc_ptr;
  if (!getCTFontGetUnderlineThicknessSymbolLoc_ptr)
  {
    uint64_t v51 = MEMORY[0x1E4F143A8];
    uint64_t v52 = 3221225472;
    v53 = __getCTFontGetUnderlineThicknessSymbolLoc_block_invoke;
    v54 = &unk_1E52CD918;
    v55 = &v56;
    CGRect v37 = (void *)CoreTextLibrary();
    v38 = dlsym(v37, "CTFontGetUnderlineThickness");
    *(void *)(v55[1] + 24) = v38;
    getCTFontGetUnderlineThicknessSymbolLoc_ptr = *(_UNKNOWN **)(v55[1] + 24);
    v36 = (double (*)(const void *))v57[3];
  }
  _Block_object_dispose(&v56, 8);
  if (!v36) {
    goto LABEL_51;
  }
  self->descriptor.underlineThickness = v36(v8);
  uint64_t v56 = 0;
  v57 = &v56;
  uint64_t v58 = 0x2020000000;
  v39 = (unsigned int (*)(const void *))getCTFontGetUnitsPerEmSymbolLoc_ptr;
  v59 = getCTFontGetUnitsPerEmSymbolLoc_ptr;
  if (!getCTFontGetUnitsPerEmSymbolLoc_ptr)
  {
    uint64_t v51 = MEMORY[0x1E4F143A8];
    uint64_t v52 = 3221225472;
    v53 = __getCTFontGetUnitsPerEmSymbolLoc_block_invoke;
    v54 = &unk_1E52CD918;
    v55 = &v56;
    v40 = (void *)CoreTextLibrary();
    v41 = dlsym(v40, "CTFontGetUnitsPerEm");
    *(void *)(v55[1] + 24) = v41;
    getCTFontGetUnitsPerEmSymbolLoc_ptr = *(_UNKNOWN **)(v55[1] + 24);
    v39 = (unsigned int (*)(const void *))v57[3];
  }
  _Block_object_dispose(&v56, 8);
  if (!v39) {
    goto LABEL_51;
  }
  self->kernUnitsPerEm = (double)v39(v8);
  uint64_t v56 = 0;
  v57 = &v56;
  uint64_t v58 = 0x2020000000;
  v42 = (uint64_t (*)(const void *, uint64_t, void))getCTFontCopyTableSymbolLoc_ptr;
  v59 = getCTFontCopyTableSymbolLoc_ptr;
  if (!getCTFontCopyTableSymbolLoc_ptr)
  {
    uint64_t v51 = MEMORY[0x1E4F143A8];
    uint64_t v52 = 3221225472;
    v53 = __getCTFontCopyTableSymbolLoc_block_invoke;
    v54 = &unk_1E52CD918;
    v55 = &v56;
    v43 = (void *)CoreTextLibrary();
    v44 = dlsym(v43, "CTFontCopyTable");
    *(void *)(v55[1] + 24) = v44;
    getCTFontCopyTableSymbolLoc_ptr = *(_UNKNOWN **)(v55[1] + 24);
    v42 = (uint64_t (*)(const void *, uint64_t, void))v57[3];
  }
  _Block_object_dispose(&v56, 8);
  if (!v42)
  {
LABEL_51:
    dlerror();
    v48 = (_Unwind_Exception *)abort_report_np();
    _Block_object_dispose(&v56, 8);
    _Unwind_Resume(v48);
  }
  uint64_t v45 = v42(v8, 1801810542, 0);
  if (v45)
  {
    v46 = (const void *)v45;
    v47 = [[CPFontKerning alloc] initWithKernData:v45];
    self->kernDictionardouble y = [(CPFontKerning *)v47 createKernTable];
    [(CPFontKerning *)v47 dispose];

    CFRelease(v46);
  }
  CFRelease(v8);
  self->exactMatch = 1;
}

- (void)getFontName
{
  cgPDFFont = self->cgPDFFont;
  if (cgPDFFont)
  {
    uint64_t v4 = *((void *)cgPDFFont + 4);
    if (v4)
    {
      if (strlen(*((const char **)cgPDFFont + 4)) >= 8 && *(unsigned char *)(v4 + 6) == 43)
      {
        uint64_t v5 = 0;
        uint64_t v6 = MEMORY[0x1E4F14390];
        uint64_t v7 = 7;
        do
        {
          unsigned int v8 = *(char *)(v4 + v5);
          if ((v8 & 0x80000000) != 0)
          {
            if (!__maskrune(v8, 0x8000uLL)) {
              goto LABEL_12;
            }
          }
          else if ((*(_DWORD *)(v6 + 4 * v8 + 60) & 0x8000) == 0)
          {
            goto LABEL_12;
          }
          ++v5;
        }
        while (v5 != 6);
      }
      else
      {
LABEL_12:
        uint64_t v7 = 0;
      }
      self->fontName = (NSString *)[NSString stringWithCString:v4 + v7 encoding:1];
      self->exactMatch = 1;
    }
  }
  fontName = self->fontName;
  if (fontName && [(NSString *)fontName length])
  {
    unsigned int v10 = self->fontName;
  }
  else
  {
    unsigned int v10 = [(CPFont *)self matchingFontName];
    self->fontName = v10;
    self->exactMatch = 0;
  }

  v11 = v10;
}

- (id)matchingFontName
{
  objc_super v3 = (void *)[MEMORY[0x1E4F28E78] stringWithCapacity:21];
  cgPDFFont = self->cgPDFFont;
  if (!cgPDFFont || (unint64_t FontDescriptor = CGPDFFontGetFontDescriptor((uint64_t)cgPDFFont)) == 0)
  {
    int v8 = 0;
    int v9 = 0;
    int v10 = 0;
    goto LABEL_8;
  }
  unsigned int v7 = *(_DWORD *)(FontDescriptor + 40);
  int v8 = (v7 >> 1) & 1;
  int v9 = v7 & 1;
  int v10 = (v7 >> 6) & 1;
  v11 = *(CGPDFDictionary **)(FontDescriptor + 32);
  if (!v11)
  {
LABEL_8:
    int v13 = 0;
    goto LABEL_9;
  }
  CGPDFReal value = 0.0;
  BOOL Number = CGPDFDictionaryGetNumber(v11, "FontWeight", &value);
  double v4 = value;
  int v13 = value >= 600.0 && Number;
LABEL_9:
  fontName = self->fontName;
  if (!fontName) {
    goto LABEL_18;
  }
  if ((v10 & 1) != 0
    || [(NSString *)fontName hasSuffix:@"Italic", v4]
    || [(NSString *)self->fontName hasSuffix:@"Oblique"])
  {
    int v10 = 1;
    if (v13) {
      goto LABEL_27;
    }
  }
  else
  {
    int v10 = 0;
    if (v13) {
      goto LABEL_27;
    }
  }
  if (![(NSString *)self->fontName hasSuffix:@"Bold", v4]
    && ![(NSString *)self->fontName hasSuffix:@"BoldItalic"]
    && ![(NSString *)self->fontName hasSuffix:@"BoldOblique"])
  {
    int v13 = 0;
LABEL_18:
    if (v8) {
      goto LABEL_19;
    }
LABEL_28:
    if (v9)
    {
      objc_msgSend(v3, "setString:", @"Monaco", v4);
      return v3;
    }
    CGFloat v15 = @"Helvetica";
    goto LABEL_31;
  }
LABEL_27:
  int v13 = 1;
  if (!v8) {
    goto LABEL_28;
  }
LABEL_19:
  if (v9)
  {
    CGFloat v15 = @"Courier";
LABEL_31:
    objc_msgSend(v3, "setString:", v15, v4);
    if (v13)
    {
      [v3 appendString:@"-Bold"];
      if (v10)
      {
        double v16 = @"Oblique";
        goto LABEL_37;
      }
    }
    else if (v10)
    {
      double v16 = @"-Oblique";
      goto LABEL_37;
    }
    return v3;
  }
  objc_msgSend(v3, "setString:", @"Times", v4);
  if (!v13)
  {
    if (v10) {
      double v16 = @"-Italic";
    }
    else {
      double v16 = @"-Roman";
    }
    goto LABEL_37;
  }
  [v3 appendString:@"-Bold"];
  if (v10)
  {
    double v16 = @"Italic";
LABEL_37:
    [v3 appendString:v16];
  }
  return v3;
}

@end