@interface JULanguageAwareString
+ (BOOL)alwaysGenerateAttributedString;
+ (BOOL)keepStatisticsOnLanguageComponents;
+ (JULanguageAwareString)JULanguageAwareStringEmpty;
+ (JULanguageAwareStringPreprocessor)delegate;
+ (void)setAlwaysGenerateAttributedString:(BOOL)a3;
+ (void)setDelegate:(id)a3;
+ (void)setKeepStatisticsOnLanguageComponents:(BOOL)a3;
- (BOOL)isEmpty;
- (JULanguageAwareString)init;
- (JULanguageAwareString)initWithAttributedString:(id)a3 baseParagraphStyle:(id)a4 keepStatisticsOnLanguageComponents:(BOOL)a5;
- (JULanguageAwareString)initWithLanguageAwareString:(id)a3 attributes:(id)a4 keepStatisticsOnLanguageComponents:(BOOL)a5;
- (JULanguageAwareString)initWithString:(id)a3 attributes:(id)a4 baseParagraphStyle:(id)a5 keepStatisticsOnLanguageComponents:(BOOL)a6;
- (JULanguageAwareString)initWithString:(id)a3 baseParagraphStyle:(id)a4 generateAttributedString:(BOOL)a5 keepStatisticsOnLanguageComponents:(BOOL)a6;
- (JULanguageAwareString)localizedLowercase;
- (JULanguageAwareString)localizedUppercase;
- (JULanguageAwareString)newlinesCollapsedToSpace;
- (JULanguageAwareString)trimmed;
- (NSArray)numbers;
- (NSArray)paragraphs;
- (NSArray)words;
- (NSAttributedString)attributedString;
- (NSString)string;
- (_NSRange)juFullRange;
- (id)writingDirectionsQuantities;
- (int64_t)baseWritingDirectionForCharacterAtLocation:(int64_t)a3;
- (int64_t)length;
- (int64_t)numberOfCharacters;
- (int64_t)thresholdBaseWritingDirection;
- (int64_t)utf32Length;
- (int64_t)writingDirectionOfLine:(int64_t)a3 maximumLinesShown:(int64_t)a4 withWidth:(double)a5 lineBreakMode:(int64_t)a6 cacheLayoutInfo:(BOOL)a7;
- (void)setAttributedString:(id)a3;
- (void)setIsEmpty:(BOOL)a3;
- (void)setJuFullRange:(_NSRange)a3;
- (void)setLength:(int64_t)a3;
- (void)setLocalizedLowercase:(id)a3;
- (void)setLocalizedUppercase:(id)a3;
- (void)setNewlinesCollapsedToSpace:(id)a3;
- (void)setNumberOfCharacters:(int64_t)a3;
- (void)setThresholdBaseWritingDirection:(int64_t)a3;
- (void)setTrimmed:(id)a3;
- (void)setUtf32Length:(int64_t)a3;
@end

@implementation JULanguageAwareString

- (NSAttributedString)attributedString
{
  v2 = self;
  id v3 = sub_1B0850AF8();

  return (NSAttributedString *)v3;
}

- (void)setAttributedString:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___JULanguageAwareString____lazy_storage___attributedString);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___JULanguageAwareString____lazy_storage___attributedString) = (Class)a3;
  id v3 = a3;
}

- (NSString)string
{
  swift_bridgeObjectRetain();
  v2 = (void *)sub_1B0869D68();
  swift_bridgeObjectRelease();

  return (NSString *)v2;
}

- (JULanguageAwareString)localizedLowercase
{
  v2 = self;
  id v3 = sub_1B0851200();

  return (JULanguageAwareString *)v3;
}

- (void)setLocalizedLowercase:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___JULanguageAwareString____lazy_storage___localizedLowercase);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___JULanguageAwareString____lazy_storage___localizedLowercase) = (Class)a3;
  id v3 = a3;
}

- (JULanguageAwareString)localizedUppercase
{
  v2 = self;
  id v3 = sub_1B085131C();

  return (JULanguageAwareString *)v3;
}

- (void)setLocalizedUppercase:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___JULanguageAwareString____lazy_storage___localizedUppercase);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___JULanguageAwareString____lazy_storage___localizedUppercase) = (Class)a3;
  id v3 = a3;
}

- (JULanguageAwareString)newlinesCollapsedToSpace
{
  v2 = self;
  id v3 = sub_1B08514D8();

  return (JULanguageAwareString *)v3;
}

- (void)setNewlinesCollapsedToSpace:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___JULanguageAwareString____lazy_storage___newlinesCollapsedToSpace);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___JULanguageAwareString____lazy_storage___newlinesCollapsedToSpace) = (Class)a3;
  id v3 = a3;
}

- (JULanguageAwareString)trimmed
{
  v2 = self;
  id v3 = sub_1B08516B4();

  return (JULanguageAwareString *)v3;
}

- (void)setTrimmed:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___JULanguageAwareString____lazy_storage___trimmed);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___JULanguageAwareString____lazy_storage___trimmed) = (Class)a3;
  id v3 = a3;
}

- (NSArray)numbers
{
  type metadata accessor for _NSRange(0);
  swift_bridgeObjectRetain();
  v2 = (void *)sub_1B0869F78();
  swift_bridgeObjectRelease();

  return (NSArray *)v2;
}

- (NSArray)paragraphs
{
  return (NSArray *)sub_1B0851938();
}

- (NSArray)words
{
  return (NSArray *)sub_1B0851938();
}

- (_NSRange)juFullRange
{
  v2 = self;
  uint64_t v3 = sub_1B0851A18();
  NSUInteger v5 = v4;

  NSUInteger v6 = v3;
  NSUInteger v7 = v5;
  result.length = v7;
  result.location = v6;
  return result;
}

- (void)setJuFullRange:(_NSRange)a3
{
  uint64_t v3 = (_NSRange *)((char *)self + OBJC_IVAR___JULanguageAwareString____lazy_storage___juFullRange);
  *uint64_t v3 = a3;
  LOBYTE(v3[1].location) = 0;
}

- (BOOL)isEmpty
{
  return sub_1B0851AA8();
}

- (void)setIsEmpty:(BOOL)a3
{
  *((unsigned char *)&self->super.isa + OBJC_IVAR___JULanguageAwareString____lazy_storage___isEmpty) = a3;
}

- (int64_t)length
{
  v2 = self;
  int64_t v3 = sub_1B0851B38();

  return v3;
}

- (void)setLength:(int64_t)a3
{
  int64_t v3 = (char *)self + OBJC_IVAR___JULanguageAwareString____lazy_storage___utf16Count;
  *(void *)int64_t v3 = a3;
  v3[8] = 0;
}

- (int64_t)utf32Length
{
  return sub_1B0851BF4();
}

- (void)setUtf32Length:(int64_t)a3
{
  int64_t v3 = (char *)self + OBJC_IVAR___JULanguageAwareString____lazy_storage___utf32Count;
  *(void *)int64_t v3 = a3;
  v3[8] = 0;
}

- (int64_t)numberOfCharacters
{
  v2 = self;
  int64_t v3 = sub_1B0851CC8();

  return v3;
}

- (void)setNumberOfCharacters:(int64_t)a3
{
  int64_t v3 = (char *)self + OBJC_IVAR___JULanguageAwareString____lazy_storage___characterCount;
  *(void *)int64_t v3 = a3;
  v3[8] = 0;
}

+ (BOOL)alwaysGenerateAttributedString
{
  return byte_1E9B3BBE0;
}

+ (void)setAlwaysGenerateAttributedString:(BOOL)a3
{
  byte_1E9B3BBE0 = a3;
}

+ (BOOL)keepStatisticsOnLanguageComponents
{
  return byte_1E9B3BBE1;
}

+ (void)setKeepStatisticsOnLanguageComponents:(BOOL)a3
{
  byte_1E9B3BBE1 = a3;
}

+ (JULanguageAwareStringPreprocessor)delegate
{
  swift_beginAccess();
  v2 = (void *)swift_unknownObjectRetain();

  return (JULanguageAwareStringPreprocessor *)v2;
}

+ (void)setDelegate:(id)a3
{
  qword_1E9B3BBE8 = (uint64_t)a3;
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
}

+ (JULanguageAwareString)JULanguageAwareStringEmpty
{
  if (qword_1E9B3A6E0 != -1) {
    swift_once();
  }
  v2 = (void *)qword_1E9B3BBF0;

  return (JULanguageAwareString *)v2;
}

- (JULanguageAwareString)initWithAttributedString:(id)a3 baseParagraphStyle:(id)a4 keepStatisticsOnLanguageComponents:(BOOL)a5
{
  id v7 = a3;
  id v8 = a4;
  v9 = (JULanguageAwareString *)sub_1B0854E38(v7, a4, a5);

  return v9;
}

- (JULanguageAwareString)initWithString:(id)a3 attributes:(id)a4 baseParagraphStyle:(id)a5 keepStatisticsOnLanguageComponents:(BOOL)a6
{
  uint64_t v9 = sub_1B0869D98();
  uint64_t v11 = v10;
  if (a4)
  {
    type metadata accessor for Key(0);
    sub_1B07BE6C4();
    a4 = (id)sub_1B0869CB8();
  }
  id v12 = a5;
  v13 = (JULanguageAwareString *)sub_1B085524C(v9, v11, (uint64_t)a4, a5, a6);

  return v13;
}

- (JULanguageAwareString)initWithString:(id)a3 baseParagraphStyle:(id)a4 generateAttributedString:(BOOL)a5 keepStatisticsOnLanguageComponents:(BOOL)a6
{
  if (a3)
  {
    BOOL v6 = a5;
    uint64_t v8 = sub_1B0869D98();
    uint64_t v10 = v9;
    uint64_t ObjectType = swift_getObjectType();
    swift_beginAccess();
    uint64_t v12 = byte_1E9B3BBE1;
    v13 = *(uint64_t (**)(uint64_t, uint64_t, id, BOOL, uint64_t))(ObjectType + 504);
    id v14 = a4;
    v15 = (JULanguageAwareString *)v13(v8, v10, a4, v6, v12);
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

- (JULanguageAwareString)initWithLanguageAwareString:(id)a3 attributes:(id)a4 keepStatisticsOnLanguageComponents:(BOOL)a5
{
  uint64_t v6 = (uint64_t)a4;
  if (a4)
  {
    type metadata accessor for Key(0);
    sub_1B07BE6C4();
    uint64_t v6 = sub_1B0869CB8();
  }
  id v8 = a3;
  uint64_t v9 = (JULanguageAwareString *)sub_1B08556E8((uint64_t)v8, v6, a5);

  return v9;
}

- (int64_t)baseWritingDirectionForCharacterAtLocation:(int64_t)a3
{
  NSUInteger v4 = self;
  id v5 = sub_1B0850AF8();
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
  return sub_1B08534B0();
}

- (void)setThresholdBaseWritingDirection:(int64_t)a3
{
  int64_t v3 = (char *)self + OBJC_IVAR___JULanguageAwareString____lazy_storage___thresholdBaseWritingDirection;
  *(void *)int64_t v3 = a3;
  v3[8] = 0;
}

- (int64_t)writingDirectionOfLine:(int64_t)a3 maximumLinesShown:(int64_t)a4 withWidth:(double)a5 lineBreakMode:(int64_t)a6 cacheLayoutInfo:(BOOL)a7
{
  uint64_t v12 = self;
  sub_1B0853530(a3, (id)a4, (id)a6, a7, a5);
  int64_t v14 = v13;

  return v14;
}

- (id)writingDirectionsQuantities
{
  return objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                 + OBJC_IVAR___JULanguageAwareString_knownBaseWritingDirections));
}

- (JULanguageAwareString)init
{
  _NSRange result = (JULanguageAwareString *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR___JULanguageAwareString____lazy_storage___newlinesCollapsedToSpace));

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end