@interface AVSpeechSynthesisMarker
+ (BOOL)supportsSecureCoding;
+ (void)initialize;
- (AVSpeechSynthesisMarker)initWithBookmarkName:(NSString *)mark atByteSampleOffset:(NSInteger)byteSampleOffset;
- (AVSpeechSynthesisMarker)initWithCoder:(id)a3;
- (AVSpeechSynthesisMarker)initWithMarkerType:(AVSpeechSynthesisMarkerMark)type forTextRange:(NSRange)range atByteSampleOffset:(NSUInteger)byteSampleOffset;
- (AVSpeechSynthesisMarker)initWithMarkerType:(int64_t)a3 name:(id)a4 forTextRange:(_NSRange)a5 atByteSampleOffset:(unint64_t)a6;
- (AVSpeechSynthesisMarker)initWithParagraphRange:(NSRange)range atByteSampleOffset:(NSInteger)byteSampleOffset;
- (AVSpeechSynthesisMarker)initWithPhonemeString:(NSString *)phoneme atByteSampleOffset:(NSInteger)byteSampleOffset;
- (AVSpeechSynthesisMarker)initWithSentenceRange:(NSRange)range atByteSampleOffset:(NSInteger)byteSampleOffset;
- (AVSpeechSynthesisMarker)initWithWordRange:(NSRange)range atByteSampleOffset:(NSInteger)byteSampleOffset;
- (AVSpeechSynthesisMarkerMark)mark;
- (NSRange)textRange;
- (NSString)bookmarkName;
- (NSString)phoneme;
- (NSUInteger)byteSampleOffset;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setBookmarkName:(NSString *)bookmarkName;
- (void)setByteSampleOffset:(NSUInteger)byteSampleOffset;
- (void)setMark:(AVSpeechSynthesisMarkerMark)mark;
- (void)setPhoneme:(NSString *)phoneme;
- (void)setTextRange:(NSRange)textRange;
@end

@implementation AVSpeechSynthesisMarker

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_phoneme, 0);

  objc_storeStrong((id *)&self->_bookmarkName, 0);
}

- (void)setPhoneme:(NSString *)phoneme
{
}

- (NSString)phoneme
{
  return self->_phoneme;
}

- (void)setBookmarkName:(NSString *)bookmarkName
{
}

- (NSString)bookmarkName
{
  return self->_bookmarkName;
}

- (void)setTextRange:(NSRange)textRange
{
  self->_textRange = textRange;
}

- (NSRange)textRange
{
  NSUInteger length = self->_textRange.length;
  NSUInteger location = self->_textRange.location;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (void)setByteSampleOffset:(NSUInteger)byteSampleOffset
{
  self->_byteSampleOffset = byteSampleOffset;
}

- (NSUInteger)byteSampleOffset
{
  return self->_byteSampleOffset;
}

- (void)setMark:(AVSpeechSynthesisMarkerMark)mark
{
  self->_mark = mark;
}

- (AVSpeechSynthesisMarkerMark)mark
{
  return self->_mark;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v4, "setMark:", -[AVSpeechSynthesisMarker mark](self, "mark"));
  objc_msgSend(v4, "setByteSampleOffset:", -[AVSpeechSynthesisMarker byteSampleOffset](self, "byteSampleOffset"));
  uint64_t v5 = [(AVSpeechSynthesisMarker *)self textRange];
  objc_msgSend(v4, "setTextRange:", v5, v6);
  v7 = [(AVSpeechSynthesisMarker *)self bookmarkName];
  [v4 setBookmarkName:v7];

  v8 = [(AVSpeechSynthesisMarker *)self phoneme];
  [v4 setPhoneme:v8];

  return v4;
}

- (AVSpeechSynthesisMarker)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)AVSpeechSynthesisMarker;
  uint64_t v5 = [(AVSpeechSynthesisMarker *)&v15 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"mark"];
    -[AVSpeechSynthesisMarker setMark:](v5, "setMark:", [v6 integerValue]);

    v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"byteSampleOffset"];
    -[AVSpeechSynthesisMarker setByteSampleOffset:](v5, "setByteSampleOffset:", [v7 unsignedIntegerValue]);

    v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"textRange"];
    uint64_t v9 = [v8 rangeValue];
    -[AVSpeechSynthesisMarker setTextRange:](v5, "setTextRange:", v9, v10);

    v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"bookmarkName"];
    [(AVSpeechSynthesisMarker *)v5 setBookmarkName:v11];

    v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"phoneme"];
    [(AVSpeechSynthesisMarker *)v5 setPhoneme:v12];

    v13 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v10 = a3;
  objc_msgSend(v10, "encodeInteger:forKey:", -[AVSpeechSynthesisMarker mark](self, "mark"), @"mark");
  objc_msgSend(v10, "encodeInteger:forKey:", -[AVSpeechSynthesisMarker byteSampleOffset](self, "byteSampleOffset"), @"byteSampleOffset");
  id v4 = (void *)MEMORY[0x1E4F29238];
  uint64_t v5 = [(AVSpeechSynthesisMarker *)self textRange];
  v7 = objc_msgSend(v4, "valueWithRange:", v5, v6);
  [v10 encodeObject:v7 forKey:@"textRange"];

  v8 = [(AVSpeechSynthesisMarker *)self phoneme];
  [v10 encodeObject:v8 forKey:@"phoneme"];

  uint64_t v9 = [(AVSpeechSynthesisMarker *)self bookmarkName];
  [v10 encodeObject:v9 forKey:@"bookmarkName"];
}

- (AVSpeechSynthesisMarker)initWithWordRange:(NSRange)range atByteSampleOffset:(NSInteger)byteSampleOffset
{
  return 0;
}

- (AVSpeechSynthesisMarker)initWithSentenceRange:(NSRange)range atByteSampleOffset:(NSInteger)byteSampleOffset
{
  return 0;
}

- (AVSpeechSynthesisMarker)initWithPhonemeString:(NSString *)phoneme atByteSampleOffset:(NSInteger)byteSampleOffset
{
  return 0;
}

- (AVSpeechSynthesisMarker)initWithParagraphRange:(NSRange)range atByteSampleOffset:(NSInteger)byteSampleOffset
{
  return 0;
}

- (AVSpeechSynthesisMarker)initWithBookmarkName:(NSString *)mark atByteSampleOffset:(NSInteger)byteSampleOffset
{
  return 0;
}

- (AVSpeechSynthesisMarker)initWithMarkerType:(int64_t)a3 name:(id)a4 forTextRange:(_NSRange)a5 atByteSampleOffset:(unint64_t)a6
{
  return 0;
}

- (AVSpeechSynthesisMarker)initWithMarkerType:(AVSpeechSynthesisMarkerMark)type forTextRange:(NSRange)range atByteSampleOffset:(NSUInteger)byteSampleOffset
{
  return 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (void)initialize
{
  if (_AVLoadSpeechSynthesisImplementation(void)::onceToken != -1) {
    dispatch_once(&_AVLoadSpeechSynthesisImplementation(void)::onceToken, &__block_literal_global_5009);
  }
}

@end