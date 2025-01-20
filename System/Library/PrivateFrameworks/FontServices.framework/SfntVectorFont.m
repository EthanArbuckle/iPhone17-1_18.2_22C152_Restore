@interface SfntVectorFont
- (BOOL)canCreatePostScriptSubsetWithFormat:(int64_t)a3;
- (BOOL)getTrueTypeEncodingWithPlatform:(unsigned __int16)a3 script:(unsigned __int16)a4 indexMap:(void *)a5;
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
- (_TtC10FontParserP33_BB7825F4A323BA870200AEF0918A19DC14SfntVectorFont)defaultInstance;
- (_TtC10FontParserP33_BB7825F4A323BA870200AEF0918A19DC14SfntVectorFont)init;
- (const)characterSet;
- (const)names;
- (double)variationScalarWithTupleIndex:(int64_t)a3;
- (id)controlPointsWithGlyph:(unsigned int)a3;
- (id)copyBitmapWithGlyph:(unsigned int)a3 transform:(const CGAffineTransform *)a4 options:(unsigned int)a5 bounds:(CGRect *)a6 bytesPerRow:(int64_t *)a7;
- (id)copyOriginalPathWithGlyph:(unsigned int)a3;
- (id)copyTableDataWithTag:(unsigned int)a3;
- (id)glyphNameWithGlyph:(unsigned __int16)a3;
- (id)variationWithPostScriptNameSuffix:(id)a3;
- (int64_t)dataResidence;
- (int64_t)encodingType;
- (unsigned)instanceNameID;
- (unsigned)protectionInfo;
- (unsigned)variationAxisFlagsWithTag:(unsigned int)a3;
- (unsigned)variationAxisNameIDWithTag:(unsigned int)a3;
@end

@implementation SfntVectorFont

- (BOOL)isSFNT
{
  return 1;
}

- (NSData)sfntData
{
  v2 = self;
  v3 = (void *)sub_1B520F790();

  return (NSData *)v3;
}

- (NSArray)tableTags
{
  v2 = self;
  uint64_t v3 = swift_bridgeObjectRetain();
  sub_1B520AF00(v3);

  swift_bridgeObjectRelease();
  v4 = (void *)sub_1B5372A18();
  swift_bridgeObjectRelease();
  return (NSArray *)v4;
}

- (id)copyTableDataWithTag:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  v4 = self;
  v5 = (void *)sub_1B520F9EC(v3);

  return v5;
}

- (NSDictionary)metadata
{
  v2 = self;
  uint64_t v3 = (void *)sub_1B520FAEC();

  return (NSDictionary *)v3;
}

- (NSString)postScriptName
{
  v2 = self;
  uint64_t v3 = (void *)sub_1B520FE54();

  return (NSString *)v3;
}

- (NSString)nameTablePostScriptName
{
  v2 = self;
  uint64_t v3 = (void *)sub_1B520FE54();

  return (NSString *)v3;
}

- (NSArray)additionalPostScriptNames
{
  return (NSArray *)sub_1B521018C(self, (uint64_t)a2, (void (*)(void))sub_1B52100C0, &qword_1E9D47DE0);
}

- (NSArray)allNames
{
  return (NSArray *)sub_1B521018C(self, (uint64_t)a2, (void (*)(void))sub_1B5210210, &qword_1E9D47DD8);
}

- (NSString)fullName
{
  v2 = self;
  uint64_t v3 = (void *)sub_1B5210720();

  return (NSString *)v3;
}

- (NSString)familyName
{
  v2 = self;
  uint64_t v3 = (void *)sub_1B5210874();

  return (NSString *)v3;
}

- (const)names
{
  v2 = self;
  uint64_t v3 = (void *)sub_1B52109C8();

  return (const __CFDictionary *)v3;
}

- (BOOL)isBitmapOnly
{
  return 0;
}

- (BOOL)isSuitcase
{
  return 0;
}

- (const)characterSet
{
  v2 = self;
  uint64_t v3 = (void *)sub_1B521110C();

  return (const __CFCharacterSet *)v3;
}

- (OS2UnicodeRanges)getOS2UnicodeRangesWithMinCoveragePercent:(float)a3
{
  uint64_t v3 = self;
  uint64_t v4 = sub_1B5216E78();
  uint64_t v6 = v5;

  uint64_t v7 = v4;
  uint64_t v8 = v6;
  result.var2 = v8;
  result.var3 = HIDWORD(v8);
  result.var0 = v7;
  result.var1 = HIDWORD(v7);
  return result;
}

- (unsigned)protectionInfo
{
  return 0;
}

- (NSArray)type1Encoding
{
  v2 = (void *)sub_1B5372A18();
  return (NSArray *)v2;
}

- (BOOL)getTrueTypeEncodingWithPlatform:(unsigned __int16)a3 script:(unsigned __int16)a4 indexMap:(void *)a5
{
  uint64_t v7 = self;
  char v8 = sub_1B5211338(a3, a4);

  return v8 & 1;
}

- (id)glyphNameWithGlyph:(unsigned __int16)a3
{
  return 0;
}

- (CGFloat2)getIdealAdvanceAndSideBearingWithGlyph:(unsigned int)a3 vertical:(BOOL)a4
{
  uint64_t v6 = self;
  double v7 = sub_1B5212FB8(a3, a4);
  double v9 = v8;

  double v10 = v7;
  double v11 = v9;
  result.var1 = v11;
  result.var0 = v10;
  return result;
}

- (CGRect)getIdealBoundsWithGlyph:(unsigned int)a3
{
  memcpy(__dst, (char *)self + OBJC_IVAR____TtC10FontParserP33_BB7825F4A323BA870200AEF0918A19DC14SfntVectorFont_font, 0x1A4uLL);
  uint64_t v5 = self;
  sub_1B51DD4E8(__dst);
  SfntTrueTypeFont.getBoundingBox(glyphID:)(&v14, a3);
  double x = v14.value.origin.x;
  double y = v14.value.origin.y;
  double width = v14.value.size.width;
  double height = v14.value.size.height;
  sub_1B51DD650(__dst);

  sub_1B5201994((uint64_t)&v14, (uint64_t)v15, &qword_1E9D47D68);
  double v10 = 0.0;
  if (v16) {
    double v11 = 0.0;
  }
  else {
    double v11 = x;
  }
  if (v16) {
    double v12 = 0.0;
  }
  else {
    double v12 = y;
  }
  if (v16) {
    double v13 = 0.0;
  }
  else {
    double v13 = width;
  }
  if ((v16 & 1) == 0) {
    double v10 = height;
  }
  result.size.double height = v10;
  result.size.double width = v13;
  result.origin.double y = v12;
  result.origin.double x = v11;
  return result;
}

- (CGRect)getIdealVerticalBoundsWithGlyph:(unsigned int)a3
{
  uint64_t v4 = self;
  double v5 = sub_1B5213560(a3);
  double v7 = v6;
  memcpy(__dst, (char *)v4 + OBJC_IVAR____TtC10FontParserP33_BB7825F4A323BA870200AEF0918A19DC14SfntVectorFont_font, 0x1A4uLL);
  sub_1B51DD4E8(__dst);
  SfntTrueTypeFont.getBoundingBox(glyphID:)(&v18, a3);
  double x = v18.value.origin.x;
  double y = v18.value.origin.y;
  double width = v18.value.size.width;
  double height = v18.value.size.height;
  sub_1B51DD650(__dst);

  sub_1B5201994((uint64_t)&v18, (uint64_t)v19, &qword_1E9D47D68);
  if (v20) {
    double v12 = 0.0;
  }
  else {
    double v12 = x;
  }
  if (v20) {
    double v13 = 0.0;
  }
  else {
    double v13 = y;
  }
  if (v20) {
    double v14 = 0.0;
  }
  else {
    double v14 = width;
  }
  if (v20) {
    double v15 = 0.0;
  }
  else {
    double v15 = height;
  }
  double v16 = v5 + v12;
  double v17 = v7 + v13;
  result.size.double height = v15;
  result.size.double width = v14;
  result.origin.double y = v17;
  result.origin.double x = v16;
  return result;
}

- (CGSize)getDeviceAdvanceWithGlyph:(unsigned int)a3 transform:(const CGAffineTransform *)a4
{
  memcpy(__dst, (char *)self + OBJC_IVAR____TtC10FontParserP33_BB7825F4A323BA870200AEF0918A19DC14SfntVectorFont_font, 0x1A4uLL);
  double v6 = self;
  sub_1B51DD4E8(__dst);
  sub_1B52AEDE8(a3, 0);
  LOBYTE(a3) = v7;
  double v9 = v8;
  sub_1B51DD650(__dst);

  double v10 = v9;
  double v11 = 0.0;
  if (a3 == 2) {
    double v10 = 0.0;
  }
  result.double height = v11;
  result.double width = v10;
  return result;
}

- (CGSize)getVerticalDeviceAdvanceWithGlyph:(unsigned int)a3 transform:(const CGAffineTransform *)a4
{
  memcpy(__dst, (char *)self + OBJC_IVAR____TtC10FontParserP33_BB7825F4A323BA870200AEF0918A19DC14SfntVectorFont_font, 0x1A4uLL);
  double v6 = self;
  sub_1B51DD4E8(__dst);
  sub_1B52AEDE8(a3, 1);
  LOBYTE(a3) = v7;
  double v9 = v8;
  sub_1B51DD650(__dst);

  double v10 = v9;
  double v11 = 0.0;
  if (a3 == 2) {
    double v10 = 0.0;
  }
  result.double height = v11;
  result.double width = v10;
  return result;
}

- (CGRect)getDeviceBoundsWithGlyph:(unsigned int)a3 transform:(const CGAffineTransform *)a4
{
  memcpy(__dst, (char *)self + OBJC_IVAR____TtC10FontParserP33_BB7825F4A323BA870200AEF0918A19DC14SfntVectorFont_font, 0x1A4uLL);
  double v6 = self;
  sub_1B51DD4E8(__dst);
  SfntTrueTypeFont.getBoundingBox(glyphID:)(&v15, a3);
  double x = v15.value.origin.x;
  double y = v15.value.origin.y;
  double width = v15.value.size.width;
  double height = v15.value.size.height;
  sub_1B51DD650(__dst);

  sub_1B5201994((uint64_t)&v15, (uint64_t)v16, &qword_1E9D47D68);
  double v11 = 0.0;
  if (v17) {
    double v12 = 0.0;
  }
  else {
    double v12 = x;
  }
  if (v17) {
    double v13 = 0.0;
  }
  else {
    double v13 = y;
  }
  if (v17) {
    double v14 = 0.0;
  }
  else {
    double v14 = width;
  }
  if ((v17 & 1) == 0) {
    double v11 = height;
  }
  result.size.double height = v11;
  result.size.double width = v14;
  result.origin.double y = v13;
  result.origin.double x = v12;
  return result;
}

- (CGRect)getVerticalDeviceBoundsWithGlyph:(unsigned int)a3 transform:(const CGAffineTransform *)a4
{
  double v5 = self;
  double v6 = sub_1B5213560(a3);
  double v8 = v7;
  memcpy(__dst, (char *)v5 + OBJC_IVAR____TtC10FontParserP33_BB7825F4A323BA870200AEF0918A19DC14SfntVectorFont_font, 0x1A4uLL);
  sub_1B51DD4E8(__dst);
  SfntTrueTypeFont.getBoundingBox(glyphID:)(&v19, a3);
  double x = v19.value.origin.x;
  double y = v19.value.origin.y;
  double width = v19.value.size.width;
  double height = v19.value.size.height;
  sub_1B51DD650(__dst);

  sub_1B5201994((uint64_t)&v19, (uint64_t)v20, &qword_1E9D47D68);
  if (v21) {
    double v13 = 0.0;
  }
  else {
    double v13 = x;
  }
  if (v21) {
    double v14 = 0.0;
  }
  else {
    double v14 = y;
  }
  if (v21) {
    double v15 = 0.0;
  }
  else {
    double v15 = width;
  }
  if (v21) {
    double v16 = 0.0;
  }
  else {
    double v16 = height;
  }
  double v17 = v6 + v13;
  double v18 = v8 + v14;
  result.size.double height = v16;
  result.size.double width = v15;
  result.origin.double y = v18;
  result.origin.double x = v17;
  return result;
}

- (id)copyBitmapWithGlyph:(unsigned int)a3 transform:(const CGAffineTransform *)a4 options:(unsigned int)a5 bounds:(CGRect *)a6 bytesPerRow:(int64_t *)a7
{
  return 0;
}

- (CGSize)getVerticalTranslateWithGlyph:(unsigned int)a3
{
  uint64_t v4 = self;
  double v5 = sub_1B5213560(a3);
  double v7 = v6;

  double v8 = v5;
  double v9 = v7;
  result.double height = v9;
  result.double width = v8;
  return result;
}

- (id)copyOriginalPathWithGlyph:(unsigned int)a3
{
  uint64_t v4 = self;
  id v5 = sub_1B5213710(a3);

  return v5;
}

- (int64_t)dataResidence
{
  return self->font[OBJC_IVAR____TtC10FontParserP33_BB7825F4A323BA870200AEF0918A19DC14SfntVectorFont_font + 410];
}

- (int64_t)encodingType
{
  return 0;
}

- (NSDictionary)splicedStash
{
  return (NSDictionary *)0;
}

- (id)controlPointsWithGlyph:(unsigned int)a3
{
  type metadata accessor for CGPoint(0);
  uint64_t v3 = (void *)sub_1B5372A18();
  return v3;
}

- (BOOL)canCreatePostScriptSubsetWithFormat:(int64_t)a3
{
  return a3 == 42;
}

- (id)variationWithPostScriptNameSuffix:(id)a3
{
  return 0;
}

- (NSString)variationPostScriptNamePrefix
{
  return (NSString *)0;
}

- (_TtC10FontParserP33_BB7825F4A323BA870200AEF0918A19DC14SfntVectorFont)defaultInstance
{
  return (_TtC10FontParserP33_BB7825F4A323BA870200AEF0918A19DC14SfntVectorFont *)0;
}

- (BOOL)isNamedInstance
{
  return 0;
}

- (NSString)instanceName
{
  return (NSString *)0;
}

- (unsigned)instanceNameID
{
  return 0;
}

- (BOOL)hasNamedInstanceWithOpticalSize
{
  return 0;
}

- (unsigned)variationAxisFlagsWithTag:(unsigned int)a3
{
  return 0;
}

- (unsigned)variationAxisNameIDWithTag:(unsigned int)a3
{
  return 0;
}

- (double)variationScalarWithTupleIndex:(int64_t)a3
{
  return 0.0;
}

- (NSArray)variationScalars
{
  v2 = (void *)sub_1B5372A18();
  return (NSArray *)v2;
}

- (_TtC10FontParserP33_BB7825F4A323BA870200AEF0918A19DC14SfntVectorFont)init
{
  CGSize result = (_TtC10FontParserP33_BB7825F4A323BA870200AEF0918A19DC14SfntVectorFont *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  memcpy(__dst, (char *)self + OBJC_IVAR____TtC10FontParserP33_BB7825F4A323BA870200AEF0918A19DC14SfntVectorFont_font, 0x1A4uLL);
  sub_1B51DD650(__dst);
  sub_1B51DFF28((uint64_t)self + OBJC_IVAR____TtC10FontParserP33_BB7825F4A323BA870200AEF0918A19DC14SfntVectorFont_characterMap);
  memcpy(v4, (char *)self + OBJC_IVAR____TtC10FontParserP33_BB7825F4A323BA870200AEF0918A19DC14SfntVectorFont__info, 0x179uLL);
  sub_1B5216D50(v4, (void (*)(void, void, void, void, void))sub_1B51DD6D8);
  sub_1B5201994((uint64_t)self + OBJC_IVAR____TtC10FontParserP33_BB7825F4A323BA870200AEF0918A19DC14SfntVectorFont_glyphMap, (uint64_t)v5, &qword_1E9D47D48);
  sub_1B5216DFC((uint64_t)v5, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, char))sub_1B5214F2C);
  sub_1B5214F64(*(uint64_t *)((char *)&self->super.super.isa+ OBJC_IVAR____TtC10FontParserP33_BB7825F4A323BA870200AEF0918A19DC14SfntVectorFont_postTable), *(void *)&self->font[OBJC_IVAR____TtC10FontParserP33_BB7825F4A323BA870200AEF0918A19DC14SfntVectorFont_postTable], *(void *)&self->font[OBJC_IVAR____TtC10FontParserP33_BB7825F4A323BA870200AEF0918A19DC14SfntVectorFont_postTable+ 8], *(void *)&self->font[OBJC_IVAR____TtC10FontParserP33_BB7825F4A323BA870200AEF0918A19DC14SfntVectorFont_postTable+ 16], *(void *)&self->font[OBJC_IVAR____TtC10FontParserP33_BB7825F4A323BA870200AEF0918A19DC14SfntVectorFont_postTable+ 24], *(void *)&self->font[OBJC_IVAR____TtC10FontParserP33_BB7825F4A323BA870200AEF0918A19DC14SfntVectorFont_postTable+ 32], *(void *)&self->font[OBJC_IVAR____TtC10FontParserP33_BB7825F4A323BA870200AEF0918A19DC14SfntVectorFont_postTable+ 40]);
}

@end