@interface AMPLanguageAwareString
+ (AMPLanguageAwareString)AMPLanguageAwareStringEmpty;
+ (AMPLanguageAwareStringPreprocessor)delegate;
+ (BOOL)alwaysGenerateAttributedString;
+ (BOOL)keepStatisticsOnLanguageComponents;
+ (void)setAlwaysGenerateAttributedString:(BOOL)a3;
+ (void)setDelegate:(id)a3;
+ (void)setKeepStatisticsOnLanguageComponents:(BOOL)a3;
- (AMPLanguageAwareString)init;
- (AMPLanguageAwareString)initWithAttributedString:(id)a3 baseParagraphStyle:(id)a4 keepStatisticsOnLanguageComponents:(BOOL)a5;
- (AMPLanguageAwareString)initWithLanguageAwareString:(id)a3 attributes:(id)a4 keepStatisticsOnLanguageComponents:(BOOL)a5;
- (AMPLanguageAwareString)initWithString:(id)a3 attributes:(id)a4 baseParagraphStyle:(id)a5 keepStatisticsOnLanguageComponents:(BOOL)a6;
- (AMPLanguageAwareString)initWithString:(id)a3 baseParagraphStyle:(id)a4 generateAttributedString:(BOOL)a5 keepStatisticsOnLanguageComponents:(BOOL)a6;
- (AMPLanguageAwareString)localizedLowercase;
- (AMPLanguageAwareString)localizedUppercase;
- (AMPLanguageAwareString)newlinesCollapsedToSpace;
- (AMPLanguageAwareString)trimmed;
- (BOOL)isEmpty;
- (NSArray)numbers;
- (NSArray)paragraphs;
- (NSArray)words;
- (NSAttributedString)attributedString;
- (NSString)string;
- (_NSRange)fullRange;
- (id)writingDirectionsQuantities;
- (int64_t)baseWritingDirectionForCharacterAtLocation:(int64_t)a3;
- (int64_t)length;
- (int64_t)numberOfCharacters;
- (int64_t)thresholdBaseWritingDirection;
- (int64_t)utf32Length;
- (int64_t)writingDirectionOfLine:(int64_t)a3 maximumLinesShown:(int64_t)a4 withWidth:(double)a5 lineBreakMode:(int64_t)a6 cacheLayoutInfo:(BOOL)a7;
- (void)setAttributedString:(id)a3;
- (void)setFullRange:(_NSRange)a3;
- (void)setIsEmpty:(BOOL)a3;
- (void)setLength:(int64_t)a3;
- (void)setLocalizedLowercase:(id)a3;
- (void)setLocalizedUppercase:(id)a3;
- (void)setNewlinesCollapsedToSpace:(id)a3;
- (void)setNumberOfCharacters:(int64_t)a3;
- (void)setThresholdBaseWritingDirection:(int64_t)a3;
- (void)setTrimmed:(id)a3;
- (void)setUtf32Length:(int64_t)a3;
@end

@implementation AMPLanguageAwareString

- (NSAttributedString)attributedString
{
  v2 = self;
  id v3 = sub_1E1C073C0();

  return (NSAttributedString *)v3;
}

- (void)setAttributedString:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___AMPLanguageAwareString____lazy_storage___attributedString);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___AMPLanguageAwareString____lazy_storage___attributedString) = (Class)a3;
  id v3 = a3;
}

- (NSString)string
{
  swift_bridgeObjectRetain();
  v2 = (void *)sub_1E1D5BE18();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (AMPLanguageAwareString)localizedLowercase
{
  v2 = self;
  id v3 = sub_1E1C07B30();

  return (AMPLanguageAwareString *)v3;
}

- (void)setLocalizedLowercase:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___AMPLanguageAwareString____lazy_storage___localizedLowercase);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___AMPLanguageAwareString____lazy_storage___localizedLowercase) = (Class)a3;
  id v3 = a3;
}

- (AMPLanguageAwareString)localizedUppercase
{
  v2 = self;
  id v3 = sub_1E1C07CB4();

  return (AMPLanguageAwareString *)v3;
}

- (void)setLocalizedUppercase:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___AMPLanguageAwareString____lazy_storage___localizedUppercase);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___AMPLanguageAwareString____lazy_storage___localizedUppercase) = (Class)a3;
  id v3 = a3;
}

- (AMPLanguageAwareString)newlinesCollapsedToSpace
{
  v2 = self;
  id v3 = sub_1E1C07ED8();

  return (AMPLanguageAwareString *)v3;
}

- (void)setNewlinesCollapsedToSpace:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR___AMPLanguageAwareString____lazy_storage___newlinesCollapsedToSpace);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___AMPLanguageAwareString____lazy_storage___newlinesCollapsedToSpace) = (Class)a3;
  id v3 = a3;
}

- (AMPLanguageAwareString)trimmed
{
  v2 = self;
  id v3 = sub_1E1C0811C();

  return (AMPLanguageAwareString *)v3;
}

- (void)setTrimmed:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___AMPLanguageAwareString____lazy_storage___trimmed);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___AMPLanguageAwareString____lazy_storage___trimmed) = (Class)a3;
  id v3 = a3;
}

- (NSArray)numbers
{
  type metadata accessor for _NSRange(0);
  swift_bridgeObjectRetain();
  v2 = (void *)sub_1E1D5C238();
  swift_bridgeObjectRelease();
  return (NSArray *)v2;
}

- (NSArray)paragraphs
{
  return (NSArray *)sub_1E1C0841C();
}

- (NSArray)words
{
  return (NSArray *)sub_1E1C0841C();
}

- (_NSRange)fullRange
{
  v2 = self;
  uint64_t v3 = sub_1E1C084FC();
  NSUInteger v5 = v4;

  NSUInteger v6 = v3;
  NSUInteger v7 = v5;
  result.length = v7;
  result.location = v6;
  return result;
}

- (void)setFullRange:(_NSRange)a3
{
  uint64_t v3 = (_NSRange *)((char *)self + OBJC_IVAR___AMPLanguageAwareString____lazy_storage___fullRange);
  *uint64_t v3 = a3;
  LOBYTE(v3[1].location) = 0;
}

- (BOOL)isEmpty
{
  return sub_1E1C0860C();
}

- (void)setIsEmpty:(BOOL)a3
{
  *((unsigned char *)&self->super.isa + OBJC_IVAR___AMPLanguageAwareString____lazy_storage___isEmpty) = a3;
}

- (int64_t)length
{
  v2 = self;
  int64_t v3 = sub_1E1C08710();

  return v3;
}

- (void)setLength:(int64_t)a3
{
  int64_t v3 = (char *)self + OBJC_IVAR___AMPLanguageAwareString____lazy_storage___utf16Count;
  *(void *)int64_t v3 = a3;
  v3[8] = 0;
}

- (int64_t)utf32Length
{
  return sub_1E1C08848();
}

- (void)setUtf32Length:(int64_t)a3
{
  int64_t v3 = (char *)self + OBJC_IVAR___AMPLanguageAwareString____lazy_storage___utf32Count;
  *(void *)int64_t v3 = a3;
  v3[8] = 0;
}

- (int64_t)numberOfCharacters
{
  v2 = self;
  int64_t v3 = sub_1E1C08998();

  return v3;
}

- (void)setNumberOfCharacters:(int64_t)a3
{
  int64_t v3 = (char *)self + OBJC_IVAR___AMPLanguageAwareString____lazy_storage___characterCount;
  *(void *)int64_t v3 = a3;
  v3[8] = 0;
}

+ (BOOL)alwaysGenerateAttributedString
{
  return byte_1EAD89748;
}

+ (void)setAlwaysGenerateAttributedString:(BOOL)a3
{
  byte_1EAD89748 = a3;
}

+ (BOOL)keepStatisticsOnLanguageComponents
{
  return byte_1EAD89749;
}

+ (void)setKeepStatisticsOnLanguageComponents:(BOOL)a3
{
  byte_1EAD89749 = a3;
}

+ (AMPLanguageAwareStringPreprocessor)delegate
{
  swift_beginAccess();
  v2 = (void *)swift_unknownObjectRetain();
  return (AMPLanguageAwareStringPreprocessor *)v2;
}

+ (void)setDelegate:(id)a3
{
  qword_1EAD816E0 = (uint64_t)a3;
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
}

+ (AMPLanguageAwareString)AMPLanguageAwareStringEmpty
{
  if (qword_1EAD82098 != -1) {
    swift_once();
  }
  v2 = (void *)qword_1EAD89750;
  return (AMPLanguageAwareString *)v2;
}

- (AMPLanguageAwareString)initWithAttributedString:(id)a3 baseParagraphStyle:(id)a4 keepStatisticsOnLanguageComponents:(BOOL)a5
{
  id v7 = a3;
  id v8 = a4;
  v9 = (AMPLanguageAwareString *)sub_1E1C0AE20(v7, a4, a5);

  return v9;
}

- (AMPLanguageAwareString)initWithString:(id)a3 attributes:(id)a4 baseParagraphStyle:(id)a5 keepStatisticsOnLanguageComponents:(BOOL)a6
{
  uint64_t v9 = sub_1E1D5BE58();
  uint64_t v11 = v10;
  if (a4)
  {
    type metadata accessor for Key(0);
    sub_1E19EA238();
    a4 = (id)sub_1E1D5BCB8();
  }
  id v12 = a5;
  v13 = (AMPLanguageAwareString *)sub_1E1C0BC2C(v9, v11, (uint64_t)a4, a5, a6);

  return v13;
}

- (AMPLanguageAwareString)initWithString:(id)a3 baseParagraphStyle:(id)a4 generateAttributedString:(BOOL)a5 keepStatisticsOnLanguageComponents:(BOOL)a6
{
  if (a3)
  {
    BOOL v6 = a5;
    uint64_t v8 = sub_1E1D5BE58();
    uint64_t v10 = v9;
    uint64_t ObjectType = swift_getObjectType();
    swift_beginAccess();
    uint64_t v12 = byte_1EAD89749;
    v13 = *(uint64_t (**)(uint64_t, uint64_t, id, BOOL, uint64_t))(ObjectType + 504);
    id v14 = a4;
    v15 = (AMPLanguageAwareString *)v13(v8, v10, a4, v6, v12);
    swift_deallocPartialClassInstance();
  }
  else
  {
    swift_getObjectType();
    swift_deallocPartialClassInstance();
    return 0;
  }
  return v15;
}

- (AMPLanguageAwareString)initWithLanguageAwareString:(id)a3 attributes:(id)a4 keepStatisticsOnLanguageComponents:(BOOL)a5
{
  uint64_t v6 = (uint64_t)a4;
  if (a4)
  {
    type metadata accessor for Key(0);
    sub_1E19EA238();
    uint64_t v6 = sub_1E1D5BCB8();
  }
  id v8 = a3;
  uint64_t v9 = (AMPLanguageAwareString *)sub_1E1C0C020((uint64_t)v8, v6, a5);

  return v9;
}

- (int64_t)baseWritingDirectionForCharacterAtLocation:(int64_t)a3
{
  NSUInteger v4 = self;
  id v5 = sub_1E1C073C0();
  id v6 = NSAttributedString.baseWritingDirection(forCharacterAt:)(a3);
  char v8 = v7;

  if (v8) {
    return -1;
  }
  else {
    return (int64_t)v6;
  }
}

- (int64_t)thresholdBaseWritingDirection
{
  return sub_1E1C09F84();
}

- (void)setThresholdBaseWritingDirection:(int64_t)a3
{
  int64_t v3 = (char *)self + OBJC_IVAR___AMPLanguageAwareString____lazy_storage___thresholdBaseWritingDirection;
  *(void *)int64_t v3 = a3;
  v3[8] = 0;
}

- (int64_t)writingDirectionOfLine:(int64_t)a3 maximumLinesShown:(int64_t)a4 withWidth:(double)a5 lineBreakMode:(int64_t)a6 cacheLayoutInfo:(BOOL)a7
{
  uint64_t v12 = self;
  sub_1E1C0A080(a3, (id)a4, (id)a6, a7, a5);
  int64_t v14 = v13;

  return v14;
}

- (id)writingDirectionsQuantities
{
  return objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                 + OBJC_IVAR___AMPLanguageAwareString_knownBaseWritingDirections));
}

- (AMPLanguageAwareString)init
{
  _NSRange result = (AMPLanguageAwareString *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR___AMPLanguageAwareString____lazy_storage___newlinesCollapsedToSpace));

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end