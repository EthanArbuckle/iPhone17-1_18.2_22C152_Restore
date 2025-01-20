@interface AnyVectorFont
+ (id)anyVectorFontsWithData:(id)a3 path:(id)a4;
- (BOOL)canCreatePostScriptSubsetWithFormat:(int64_t)a3;
- (BOOL)getCIDsWithGlyphs:(const unsigned __int16 *)a3 cids:(unsigned __int16 *)a4 count:(int64_t)a5;
- (BOOL)getGlyphsWithCharacterRange:(id)a3 glyphs:(unsigned __int16 *)a4;
- (BOOL)getGlyphsWithCharacterRange:(id)a3 longGlyphs:(unsigned int *)a4;
- (BOOL)getGlyphsWithCids:(const unsigned __int16 *)a3 glyphs:(unsigned __int16 *)a4 count:(int64_t)a5;
- (BOOL)getRegistryOrderingSupplement:(id *)a3 :(id *)a4 :(int *)a5;
- (BOOL)getStemsInto:(CGFloat2 *)a3;
- (BOOL)getStrikeoutInto:(CGFloat2 *)a3;
- (BOOL)getSubscriptInto:(CGRect *)a3;
- (BOOL)getSuperscriptInto:(CGRect *)a3;
- (BOOL)getTrueTypeEncodingWithPlatform:(unsigned __int16)a3 script:(unsigned __int16)a4 indexMap:(void *)a5;
- (BOOL)getTypoMetricsInto:(CGFloat3 *)a3;
- (BOOL)getWindowsMetricsInto:(CGFloat2 *)a3;
- (BOOL)hasNamedInstanceWithOpticalSize;
- (BOOL)isBitmapOnly;
- (BOOL)isNamedInstance;
- (BOOL)isSFNT;
- (BOOL)isSuitcase;
- (CGFloat2)getIdealAdvanceAndSideBearingWithGlyph:(unsigned int)a3 vertical:(BOOL)a4;
- (CGRect)getDeviceBoundsWithGlyph:(unsigned int)a3 transform:(const CGAffineTransform *)a4;
- (CGRect)getIdealBoundsWithGlyph:(unsigned int)a3;
- (CGRect)getIdealVerticalBoundsWithGlyph:(unsigned int)a3;
- (CGRect)getVerticalDeviceBoundsWithGlyph:(unsigned int)a3 transform:(const CGAffineTransform *)a4;
- (CGSize)getDeviceAdvanceWithGlyph:(unsigned int)a3 transform:(const CGAffineTransform *)a4;
- (CGSize)getVerticalDeviceAdvanceWithGlyph:(unsigned int)a3 transform:(const CGAffineTransform *)a4;
- (CGSize)getVerticalTranslateWithGlyph:(unsigned int)a3;
- (FPFontInfo)fontInfo;
- (FPFontVMetrics)vMetrics;
- (NSArray)additionalPostScriptNames;
- (NSArray)allNames;
- (NSArray)tableTags;
- (NSArray)type1Encoding;
- (NSArray)variationScalars;
- (NSData)sfntData;
- (NSDictionary)metadata;
- (NSDictionary)splicedStash;
- (NSString)familyName;
- (NSString)fullName;
- (NSString)instanceName;
- (NSString)nameTablePostScriptName;
- (NSString)postScriptName;
- (NSString)variationPostScriptNamePrefix;
- (OS2UnicodeRanges)getOS2UnicodeRangesWithMinCoveragePercent:(float)a3;
- (_TtC10FontParser13AnyVectorFont)defaultInstance;
- (_TtC10FontParser13AnyVectorFont)init;
- (const)characterSet;
- (const)names;
- (double)variationScalarWithTupleIndex:(int64_t)a3;
- (id)controlPointsWithGlyph:(unsigned int)a3;
- (id)copyBitmapWithGlyph:(unsigned int)a3 transform:(const CGAffineTransform *)a4 options:(unsigned int)a5 bounds:(CGRect *)a6 bytesPerRow:(int64_t *)a7;
- (id)copyOriginalPathWithGlyph:(unsigned int)a3;
- (id)copyTableDataWithTag:(unsigned int)a3;
- (id)createPostScriptEncoding:(const unsigned __int16 *)a3;
- (id)createPostScriptSubsetWithFormat:(int64_t)a3 name:(id)a4 glyphs:(const unsigned __int16 *)a5 glyphCount:(int64_t)a6 encoding:(const unsigned __int16 *)a7;
- (id)glyphNameWithGlyph:(unsigned __int16)a3;
- (id)variationWithPostScriptNameSuffix:(id)a3;
- (int64_t)dataResidence;
- (int64_t)encodingType;
- (int64_t)getGlyphsWithCharacters:(const unsigned __int16 *)a3 glyphs:(unsigned __int16 *)a4 count:(int64_t)a5;
- (int64_t)getGlyphsWithCharacters:(const unsigned __int16 *)a3 longGlyphs:(unsigned int *)a4 count:(int64_t)a5;
- (int64_t)getGlyphsWithEncoding:(FPEncoding)a3 text:(const char *)a4 glyphs:(unsigned __int16 *)a5 count:(int64_t)a6;
- (int64_t)getUnicharsWithGlyph:(unsigned __int16)a3 unicodes:(unsigned __int16 *)a4 count:(int64_t)a5;
- (unsigned)instanceNameID;
- (unsigned)numberOfGlyphs;
- (unsigned)protectionInfo;
- (unsigned)unitsPerEm;
- (unsigned)variationAxisFlagsWithTag:(unsigned int)a3;
- (unsigned)variationAxisNameIDWithTag:(unsigned int)a3;
- (void)createSubsetWithName:(const char *)a3 glyphBits:(unsigned int *)a4 glyphBitsSize:(int64_t)a5 cmap_1_0:(const unsigned __int16 *)a6 remapArray:(id *)a7 data:(id *)a8;
- (void)getGlyphIdealAdvanceWidthsWithGlyphs:(const unsigned __int16 *)a3 advances:(double *)a4 count:(int64_t)a5;
- (void)getGlyphX:(unsigned __int16 *)a3 o:(unsigned __int16 *)a4;
- (void)getGlyphsWithGlyphNames:(const char *)a3 glyphs:(unsigned __int16 *)a4 count:(int64_t)a5;
@end

@implementation AnyVectorFont

+ (id)anyVectorFontsWithData:(id)a3 path:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  sub_1B5216A80((uint64_t)v5, (uint64_t)a4);

  type metadata accessor for AnyVectorFont();
  v7 = (void *)sub_1B5372A18();
  swift_bridgeObjectRelease();
  return v7;
}

- (id)variationWithPostScriptNameSuffix:(id)a3
{
  id result = (id)sub_1B53730C8();
  __break(1u);
  return result;
}

- (BOOL)isSFNT
{
  BOOL result = sub_1B53730C8();
  __break(1u);
  return result;
}

- (NSData)sfntData
{
  BOOL result = (NSData *)sub_1B53730C8();
  __break(1u);
  return result;
}

- (NSArray)tableTags
{
  BOOL result = (NSArray *)sub_1B53730C8();
  __break(1u);
  return result;
}

- (id)copyTableDataWithTag:(unsigned int)a3
{
  id result = (id)sub_1B53730C8();
  __break(1u);
  return result;
}

- (NSDictionary)metadata
{
  id result = (NSDictionary *)sub_1B53730C8();
  __break(1u);
  return result;
}

- (NSString)postScriptName
{
  id result = (NSString *)sub_1B53730C8();
  __break(1u);
  return result;
}

- (NSString)nameTablePostScriptName
{
  id result = (NSString *)sub_1B53730C8();
  __break(1u);
  return result;
}

- (NSString)variationPostScriptNamePrefix
{
  id result = (NSString *)sub_1B53730C8();
  __break(1u);
  return result;
}

- (NSArray)additionalPostScriptNames
{
  id result = (NSArray *)sub_1B53730C8();
  __break(1u);
  return result;
}

- (NSArray)allNames
{
  id result = (NSArray *)sub_1B53730C8();
  __break(1u);
  return result;
}

- (NSString)fullName
{
  id result = (NSString *)sub_1B53730C8();
  __break(1u);
  return result;
}

- (NSString)familyName
{
  id result = (NSString *)sub_1B53730C8();
  __break(1u);
  return result;
}

- (const)names
{
  CFDictionaryRef result = (const __CFDictionary *)sub_1B53730C8();
  __break(1u);
  return result;
}

- (_TtC10FontParser13AnyVectorFont)defaultInstance
{
  CFDictionaryRef result = (_TtC10FontParser13AnyVectorFont *)sub_1B53730C8();
  __break(1u);
  return result;
}

- (BOOL)isNamedInstance
{
  BOOL result = sub_1B53730C8();
  __break(1u);
  return result;
}

- (NSString)instanceName
{
  BOOL result = (NSString *)sub_1B53730C8();
  __break(1u);
  return result;
}

- (unsigned)instanceNameID
{
  unsigned __int16 result = sub_1B53730C8();
  __break(1u);
  return result;
}

- (BOOL)hasNamedInstanceWithOpticalSize
{
  BOOL result = sub_1B53730C8();
  __break(1u);
  return result;
}

- (unsigned)variationAxisFlagsWithTag:(unsigned int)a3
{
  unsigned __int16 result = sub_1B53730C8();
  __break(1u);
  return result;
}

- (unsigned)variationAxisNameIDWithTag:(unsigned int)a3
{
  unsigned __int16 result = sub_1B53730C8();
  __break(1u);
  return result;
}

- (BOOL)isBitmapOnly
{
  BOOL result = sub_1B53730C8();
  __break(1u);
  return result;
}

- (BOOL)isSuitcase
{
  BOOL result = sub_1B53730C8();
  __break(1u);
  return result;
}

- (const)characterSet
{
  CFCharacterSetRef result = (const __CFCharacterSet *)sub_1B53730C8();
  __break(1u);
  return result;
}

- (OS2UnicodeRanges)getOS2UnicodeRangesWithMinCoveragePercent:(float)a3
{
  uint64_t v3 = sub_1B53730C8();
  __break(1u);
  result.var2 = v4;
  result.var3 = HIDWORD(v4);
  result.var0 = v3;
  result.var1 = HIDWORD(v3);
  return result;
}

- (unsigned)protectionInfo
{
  unsigned int result = sub_1B53730C8();
  __break(1u);
  return result;
}

- (NSArray)type1Encoding
{
  unsigned int result = (NSArray *)sub_1B53730C8();
  __break(1u);
  return result;
}

- (BOOL)getTrueTypeEncodingWithPlatform:(unsigned __int16)a3 script:(unsigned __int16)a4 indexMap:(void *)a5
{
  BOOL result = sub_1B53730C8();
  __break(1u);
  return result;
}

- (id)glyphNameWithGlyph:(unsigned __int16)a3
{
  id result = (id)sub_1B53730C8();
  __break(1u);
  return result;
}

- (CGFloat2)getIdealAdvanceAndSideBearingWithGlyph:(unsigned int)a3 vertical:(BOOL)a4
{
  sub_1B53730C8();
  __break(1u);
  result.var1 = v5;
  result.var0 = v4;
  return result;
}

- (CGRect)getIdealBoundsWithGlyph:(unsigned int)a3
{
  sub_1B53730C8();
  __break(1u);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (CGRect)getIdealVerticalBoundsWithGlyph:(unsigned int)a3
{
  sub_1B53730C8();
  __break(1u);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (CGSize)getDeviceAdvanceWithGlyph:(unsigned int)a3 transform:(const CGAffineTransform *)a4
{
  sub_1B53730C8();
  __break(1u);
  result.height = v5;
  result.width = v4;
  return result;
}

- (CGSize)getVerticalDeviceAdvanceWithGlyph:(unsigned int)a3 transform:(const CGAffineTransform *)a4
{
  sub_1B53730C8();
  __break(1u);
  result.height = v5;
  result.width = v4;
  return result;
}

- (CGRect)getDeviceBoundsWithGlyph:(unsigned int)a3 transform:(const CGAffineTransform *)a4
{
  sub_1B53730C8();
  __break(1u);
  result.size.height = v7;
  result.size.width = v6;
  result.origin.y = v5;
  result.origin.x = v4;
  return result;
}

- (CGRect)getVerticalDeviceBoundsWithGlyph:(unsigned int)a3 transform:(const CGAffineTransform *)a4
{
  sub_1B53730C8();
  __break(1u);
  result.size.height = v7;
  result.size.width = v6;
  result.origin.y = v5;
  result.origin.x = v4;
  return result;
}

- (id)copyBitmapWithGlyph:(unsigned int)a3 transform:(const CGAffineTransform *)a4 options:(unsigned int)a5 bounds:(CGRect *)a6 bytesPerRow:(int64_t *)a7
{
  id result = (id)sub_1B53730C8();
  __break(1u);
  return result;
}

- (CGSize)getVerticalTranslateWithGlyph:(unsigned int)a3
{
  sub_1B53730C8();
  __break(1u);
  result.height = v4;
  result.width = v3;
  return result;
}

- (id)copyOriginalPathWithGlyph:(unsigned int)a3
{
  id result = (id)sub_1B53730C8();
  __break(1u);
  return result;
}

- (int64_t)dataResidence
{
  int64_t result = sub_1B53730C8();
  __break(1u);
  return result;
}

- (int64_t)encodingType
{
  int64_t result = sub_1B53730C8();
  __break(1u);
  return result;
}

- (NSDictionary)splicedStash
{
  int64_t result = (NSDictionary *)sub_1B53730C8();
  __break(1u);
  return result;
}

- (double)variationScalarWithTupleIndex:(int64_t)a3
{
  sub_1B53730C8();
  __break(1u);
  return result;
}

- (NSArray)variationScalars
{
  double result = (NSArray *)sub_1B53730C8();
  __break(1u);
  return result;
}

- (id)controlPointsWithGlyph:(unsigned int)a3
{
  id result = (id)sub_1B53730C8();
  __break(1u);
  return result;
}

- (BOOL)canCreatePostScriptSubsetWithFormat:(int64_t)a3
{
  BOOL result = sub_1B53730C8();
  __break(1u);
  return result;
}

- (_TtC10FontParser13AnyVectorFont)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for AnyVectorFont();
  return [(AnyVectorFont *)&v3 init];
}

- (int64_t)getUnicharsWithGlyph:(unsigned __int16)a3 unicodes:(unsigned __int16 *)a4 count:(int64_t)a5
{
  uint64_t v5 = a3;
  *(void *)&long long v9 = a4;
  *((void *)&v9 + 1) = a5;
  double v6 = self;
  int64_t v7 = sub_1B5243DA0(&v9, v6, v5);

  return v7;
}

- (int64_t)getGlyphsWithEncoding:(FPEncoding)a3 text:(const char *)a4 glyphs:(unsigned __int16 *)a5 count:(int64_t)a6
{
  v7[2] = a5;
  v7[3] = a6;
  v7[4] = self;
  FPEncoding v8 = a3;
  v9[0] = a4;
  v9[1] = a6;
  return sub_1B5243EC4((uint64_t)v9, (void (*)(uint64_t *__return_ptr))sub_1B5217504, (uint64_t)v7);
}

- (int64_t)getGlyphsWithCharacters:(const unsigned __int16 *)a3 glyphs:(unsigned __int16 *)a4 count:(int64_t)a5
{
  v6[2] = a4;
  v6[3] = a5;
  v6[4] = self;
  v7[0] = a3;
  v7[1] = a5;
  return sub_1B5243EC4((uint64_t)v7, (void (*)(uint64_t *__return_ptr))sub_1B52174E4, (uint64_t)v6);
}

- (int64_t)getGlyphsWithCharacters:(const unsigned __int16 *)a3 longGlyphs:(unsigned int *)a4 count:(int64_t)a5
{
  v6[2] = a4;
  v6[3] = a5;
  v6[4] = self;
  v7[0] = a3;
  v7[1] = a5;
  return sub_1B5243EC4((uint64_t)v7, (void (*)(uint64_t *__return_ptr))sub_1B52174C4, (uint64_t)v6);
}

- (BOOL)getGlyphsWithCharacterRange:(id)a3 glyphs:(unsigned __int16 *)a4
{
  int64_t var1 = a3.var1;
  unint64_t var0 = a3.var0;
  int64_t v7 = self;
  sub_1B520CF54(var0, var1, (uint64_t)a4);

  return 1;
}

- (BOOL)getGlyphsWithCharacterRange:(id)a3 longGlyphs:(unsigned int *)a4
{
  int64_t var1 = a3.var1;
  unint64_t var0 = a3.var0;
  int64_t v7 = self;
  sub_1B520D0E4(var0, var1, (uint64_t)a4);

  return 1;
}

- (BOOL)getGlyphsWithCids:(const unsigned __int16 *)a3 glyphs:(unsigned __int16 *)a4 count:(int64_t)a5
{
  v6[2] = a4;
  v6[3] = a5;
  v6[4] = self;
  v7[0] = a3;
  v7[1] = a5;
  return sub_1B5243FDC((uint64_t)v7, (void (*)(uint64_t *__return_ptr))sub_1B52174A4, (char)v6) & 1;
}

- (BOOL)getCIDsWithGlyphs:(const unsigned __int16 *)a3 cids:(unsigned __int16 *)a4 count:(int64_t)a5
{
  v6[2] = a4;
  v6[3] = a5;
  v6[4] = self;
  v7[0] = a3;
  v7[1] = a5;
  return sub_1B5243FDC((uint64_t)v7, (void (*)(uint64_t *__return_ptr))sub_1B5217484, (char)v6) & 1;
}

- (id)createPostScriptEncoding:(const unsigned __int16 *)a3
{
  v5[2] = self;
  v6[0] = a3;
  v6[1] = (unint64_t)(a3 != 0) << 8;
  objc_super v3 = (void *)sub_1B5243EDC((uint64_t)v6, (void (*)(uint64_t *__return_ptr))sub_1B5217468, (uint64_t)v5);
  return v3;
}

- (void)getGlyphX:(unsigned __int16 *)a3 o:(unsigned __int16 *)a4
{
  double v6 = *(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & (uint64_t)self->super.isa) + 0x188);
  FPEncoding v8 = self;
  int v7 = v6();
  if (a3) {
    *a3 = v7;
  }
  if (a4) {
    *a4 = HIWORD(v7);
  }
}

- (void)getGlyphsWithGlyphNames:(const char *)a3 glyphs:(unsigned __int16 *)a4 count:(int64_t)a5
{
}

- (void)getGlyphIdealAdvanceWidthsWithGlyphs:(const unsigned __int16 *)a3 advances:(double *)a4 count:(int64_t)a5
{
}

- (unsigned)numberOfGlyphs
{
  (*(void (**)(void *__return_ptr))((*MEMORY[0x1E4FBC8C8] & (uint64_t)self->super.isa) + 0x50))(v3);
  sub_1B5216D50(v3, (void (*)(void, void, void, void, void))sub_1B51DD6D8);
  unsigned int result = v3[0];
  if ((v3[0] & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_5;
  }
  if (HIDWORD(v3[0])) {
LABEL_5:
  }
    __break(1u);
  return result;
}

- (unsigned)unitsPerEm
{
  (*(void (**)(uint64_t *__return_ptr))((*MEMORY[0x1E4FBC8C8] & (uint64_t)self->super.isa) + 0x50))(&v3);
  unsigned __int16 result = (unsigned __int16)sub_1B5216D50(&v3, (void (*)(void, void, void, void, void))sub_1B51DD6D8);
  if ((v4 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (!(v4 >> 16))
  {
    return v4;
  }
  __break(1u);
  return result;
}

- (FPFontVMetrics)vMetrics
{
  unint64_t v4 = self;
  sub_1B520DA20((uint64_t)&v10);

  long long v6 = v12;
  CGPoint v7 = v13;
  CGSize v8 = v14;
  uint64_t v9 = v11;
  *(_OWORD *)&retstr->unint64_t var0 = v10;
  *(void *)&retstr->var4 = v9;
  *(_OWORD *)&retstr->var6 = v6;
  retstr->var8.origin = v7;
  retstr->var8.size = v8;
  return result;
}

- (FPFontInfo)fontInfo
{
  unint64_t v4 = self;
  sub_1B520DDD8((uint64_t)v4);

  retstr->unint64_t var0 = v6;
  *(_OWORD *)&retstr->int64_t var1 = v7;
  *(_OWORD *)&retstr->var5 = v8;
  *(void *)&retstr->var9 = v9;
  retstr->var11 = v10 & 1;
  retstr->var12 = v11 & 1;
  *(_OWORD *)&retstr->var13 = v12;
  *(_OWORD *)&retstr->var15 = v13;
  *(_OWORD *)&retstr->var17 = v14;
  *(_OWORD *)&retstr->var18.origin.y = v15;
  retstr->var18.size.height = v16;
  retstr->var19 = v17 & 1;
  return result;
}

- (BOOL)getTypoMetricsInto:(CGFloat3 *)a3
{
  (*(void (**)(void *__return_ptr))((*MEMORY[0x1E4FBC8C8] & (uint64_t)self->super.isa) + 0x50))(v9);
  uint64_t v5 = self;
  sub_1B5216D50(v9, (void (*)(void, void, void, void, void))sub_1B51DD6D8);
  sub_1B5201994((uint64_t)&v10, (uint64_t)v11, &qword_1E9D47E00);
  sub_1B5201994((uint64_t)v11, (uint64_t)&v12, &qword_1E9D47E00);
  char v6 = v14;
  if ((v14 & 1) == 0)
  {
    double v7 = (double)v13;
    *(float64x2_t *)&a3->unint64_t var0 = vcvtq_f64_s64(v12);
    a3->var2 = v7;
  }

  return v6 ^ 1;
}

- (BOOL)getWindowsMetricsInto:(CGFloat2 *)a3
{
  (*(void (**)(void *__return_ptr))((*MEMORY[0x1E4FBC8C8] & (uint64_t)self->super.isa) + 0x50))(v8);
  uint64_t v5 = self;
  sub_1B5216D50(v8, (void (*)(void, void, void, void, void))sub_1B51DD6D8);
  sub_1B5201994((uint64_t)&v9, (uint64_t)v10, &qword_1E9D47DF8);
  sub_1B5201994((uint64_t)v10, (uint64_t)&v11, &qword_1E9D47DF8);
  char v6 = v12;
  if ((v12 & 1) == 0) {
    *(float64x2_t *)a3 = vcvtq_f64_s64(v11);
  }

  return v6 ^ 1;
}

- (BOOL)getSubscriptInto:(CGRect *)a3
{
  (*(void (**)(void *__return_ptr))((*MEMORY[0x1E4FBC8C8] & (uint64_t)self->super.isa) + 0x50))(v9);
  uint64_t v5 = self;
  sub_1B5216D50(v9, (void (*)(void, void, void, void, void))sub_1B51DD6D8);
  sub_1B5201994((uint64_t)&v10, (uint64_t)v11, &qword_1E9D47D68);
  sub_1B5201994((uint64_t)v11, (uint64_t)v12, &qword_1E9D47D68);
  char v6 = v13;
  if ((v13 & 1) == 0)
  {
    CGSize v7 = (CGSize)v12[1];
    a3->origin = (CGPoint)v12[0];
    a3->size = v7;
  }

  return v6 ^ 1;
}

- (BOOL)getSuperscriptInto:(CGRect *)a3
{
  (*(void (**)(void *__return_ptr))((*MEMORY[0x1E4FBC8C8] & (uint64_t)self->super.isa) + 0x50))(v9);
  uint64_t v5 = self;
  sub_1B5216D50(v9, (void (*)(void, void, void, void, void))sub_1B51DD6D8);
  sub_1B5201994((uint64_t)&v10, (uint64_t)v11, &qword_1E9D47D68);
  sub_1B5201994((uint64_t)v11, (uint64_t)v12, &qword_1E9D47D68);
  char v6 = v13;
  if ((v13 & 1) == 0)
  {
    CGSize v7 = (CGSize)v12[1];
    a3->origin = (CGPoint)v12[0];
    a3->size = v7;
  }

  return v6 ^ 1;
}

- (BOOL)getStrikeoutInto:(CGFloat2 *)a3
{
  (*(void (**)(void *__return_ptr))((*MEMORY[0x1E4FBC8C8] & (uint64_t)self->super.isa) + 0x50))(v8);
  uint64_t v5 = self;
  sub_1B5216D50(v8, (void (*)(void, void, void, void, void))sub_1B51DD6D8);
  sub_1B5201994((uint64_t)&v9, (uint64_t)v10, &qword_1E9D47DF0);
  sub_1B5201994((uint64_t)v10, (uint64_t)&v11, &qword_1E9D47DF0);
  char v6 = v12;
  if ((v12 & 1) == 0) {
    *a3 = v11;
  }

  return v6 ^ 1;
}

- (BOOL)getStemsInto:(CGFloat2 *)a3
{
  void (*v5)(void *__return_ptr);
  _TtC10FontParser13AnyVectorFont *v6;
  void *v7;
  double v8;
  double v9;
  void v11[48];
  void v12[48];

  uint64_t v5 = *(void (**)(void *__return_ptr))((*MEMORY[0x1E4FBC8C8] & (uint64_t)self->super.isa) + 0x50);
  v5(v11);
  char v6 = self;
  CGSize v7 = sub_1B5216D50(v11, (void (*)(void, void, void, void, void))sub_1B51DD6D8);
  long long v8 = *(double *)&v11[46];
  ((void (*)(void *__return_ptr, void *))v5)(v12, v7);
  sub_1B5216D50(v12, (void (*)(void, void, void, void, void))sub_1B51DD6D8);
  uint64_t v9 = *(double *)&v12[45];
  a3->unint64_t var0 = v8;
  a3->int64_t var1 = v9;

  return 1;
}

- (BOOL)getRegistryOrderingSupplement:(id *)a3 :(id *)a4 :(int *)a5
{
  long long v8 = self;
  LOBYTE(a5) = sub_1B520E94C(a3, a4, a5);

  return a5 & 1;
}

- (id)createPostScriptSubsetWithFormat:(int64_t)a3 name:(id)a4 glyphs:(const unsigned __int16 *)a5 glyphCount:(int64_t)a6 encoding:(const unsigned __int16 *)a7
{
  void v9[2] = a7;
  v9[3] = self;
  v9[4] = a3;
  void v9[5] = a4;
  v9[6] = a5;
  v10[0] = a5;
  v10[1] = a6;
  CGSize v7 = (void *)sub_1B5243EDC((uint64_t)v10, (void (*)(uint64_t *__return_ptr))sub_1B5217320, (uint64_t)v9);
  return v7;
}

- (void)createSubsetWithName:(const char *)a3 glyphBits:(unsigned int *)a4 glyphBitsSize:(int64_t)a5 cmap_1_0:(const unsigned __int16 *)a6 remapArray:(id *)a7 data:(id *)a8
{
  char v12 = self;
  sub_1B520ECF0((uint64_t)a3, (uint64_t)a4, a5, (uint64_t)a6);
}

@end