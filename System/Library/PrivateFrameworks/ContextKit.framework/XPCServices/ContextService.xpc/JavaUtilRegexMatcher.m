@interface JavaUtilRegexMatcher
+ (BOOL)findImplWithLong:(int64_t)a3 withInt:(int)a4 withIntArray:(id)a5;
+ (BOOL)findNextImplWithLong:(int64_t)a3 withIntArray:(id)a4;
+ (BOOL)hitEndImplWithLong:(int64_t)a3;
+ (BOOL)lookingAtImplWithLong:(int64_t)a3 withIntArray:(id)a4;
+ (BOOL)matchesImplWithLong:(int64_t)a3 withIntArray:(id)a4;
+ (BOOL)requireEndImplWithLong:(int64_t)a3;
+ (const)__metadata;
+ (id)quoteReplacementWithNSString:(id)a3;
+ (int)groupCountImplWithLong:(int64_t)a3;
+ (int64_t)openImplWithLong:(int64_t)a3;
+ (void)closeImplWithLong:(int64_t)a3;
+ (void)setInputImplWithLong:(int64_t)a3 withCharArray:(id)a4 withInt:(int)a5 withInt:(int)a6;
+ (void)useAnchoringBoundsImplWithLong:(int64_t)a3 withBoolean:(BOOL)a4;
+ (void)useTransparentBoundsImplWithLong:(int64_t)a3 withBoolean:(BOOL)a4;
- (BOOL)find;
- (BOOL)findWithInt:(int)a3;
- (BOOL)hasAnchoringBounds;
- (BOOL)hasTransparentBounds;
- (BOOL)hitEnd;
- (BOOL)lookingAt;
- (BOOL)matches;
- (BOOL)requireEnd;
- (JavaUtilRegexMatcher)initWithJavaUtilRegexPattern:(id)a3 withJavaLangCharSequence:(id)a4;
- (NSString)description;
- (id)appendReplacementWithJavaLangStringBuffer:(id)a3 withNSString:(id)a4;
- (id)appendTailWithJavaLangStringBuffer:(id)a3;
- (id)group;
- (id)groupWithInt:(int)a3;
- (id)pattern;
- (id)regionWithInt:(int)a3 withInt:(int)a4;
- (id)replaceAllWithNSString:(id)a3;
- (id)replaceFirstWithNSString:(id)a3;
- (id)reset;
- (id)resetWithJavaLangCharSequence:(id)a3;
- (id)resetWithJavaLangCharSequence:(id)a3 withInt:(int)a4 withInt:(int)a5;
- (id)toMatchResult;
- (id)useAnchoringBoundsWithBoolean:(BOOL)a3;
- (id)usePatternWithJavaUtilRegexPattern:(id)a3;
- (id)useTransparentBoundsWithBoolean:(BOOL)a3;
- (int)end;
- (int)endWithInt:(int)a3;
- (int)groupCount;
- (int)regionEnd;
- (int)regionStart;
- (int)start;
- (int)startWithInt:(int)a3;
- (uint64_t)ensureMatch;
- (uint64_t)resetForInput;
- (void)appendEvaluatedWithJavaLangStringBuffer:(id)a3 withNSString:(id)a4;
- (void)dealloc;
@end

@implementation JavaUtilRegexMatcher

- (JavaUtilRegexMatcher)initWithJavaUtilRegexPattern:(id)a3 withJavaLangCharSequence:(id)a4
{
  self->anchoringBounds_ = 1;
  [(JavaUtilRegexMatcher *)self usePatternWithJavaUtilRegexPattern:a3];
  [(JavaUtilRegexMatcher *)self resetWithJavaLangCharSequence:a4];
  return self;
}

- (id)appendReplacementWithJavaLangStringBuffer:(id)a3 withNSString:(id)a4
{
  if (!a3 || (input = self->input_) == 0) {
    JreThrowNullPointerException();
  }
  objc_msgSend(a3, "appendWithNSString:", -[NSString substring:endIndex:](input, "substring:endIndex:", self->appendPos_, -[JavaUtilRegexMatcher start](self, "start")));
  sub_100154F78(self, a3, a4);
  self->appendPos_ = [(JavaUtilRegexMatcher *)self end];
  return self;
}

- (void)appendEvaluatedWithJavaLangStringBuffer:(id)a3 withNSString:(id)a4
{
}

- (id)reset
{
  input = self->input_;
  if (!input) {
    JreThrowNullPointerException();
  }
  int v4 = [(NSString *)self->input_ length];
  return (id)sub_1001550EC((uint64_t)self, input, 0, v4);
}

- (id)resetWithJavaLangCharSequence:(id)a3
{
  if (!a3) {
    JreThrowNullPointerException();
  }
  int v5 = [a3 length];
  return (id)sub_1001550EC((uint64_t)self, a3, 0, v5);
}

- (id)resetWithJavaLangCharSequence:(id)a3 withInt:(int)a4 withInt:(int)a5
{
  return (id)sub_1001550EC((uint64_t)self, a3, a4, a5);
}

- (id)usePatternWithJavaUtilRegexPattern:(id)a3
{
  if (!a3)
  {
    v7 = new_JavaLangIllegalArgumentException_initWithNSString_(@"pattern == null");
    objc_exception_throw(v7);
  }
  JreStrongAssign((id *)&self->pattern_, a3);
  address = (URegularExpression *)self->address_;
  if (address)
  {
    JavaUtilRegexMatcher_closeImplWithLong_(address);
    self->address_ = 0;
  }
  self->address_ = (int64_t)JavaUtilRegexMatcher_openImplWithLong_(*((URegularExpression **)a3 + 1));
  if (self->input_) {
    -[JavaUtilRegexMatcher resetForInput]_0((uint64_t)self);
  }
  JreStrongAssignAndConsume((id *)&self->matchOffsets_, +[IOSIntArray newArrayWithLength:2 * [(JavaUtilRegexMatcher *)self groupCount] + 2]);
  self->matchFound_ = 0;
  return self;
}

- (uint64_t)resetForInput
{
  JavaUtilRegexMatcher_setInputImplWithLong_withCharArray_withInt_withInt_(*(URegularExpression **)(a1 + 16), *(void *)(a1 + 32), *(_DWORD *)(a1 + 40), *(_DWORD *)(a1 + 44));
  JavaUtilRegexMatcher_useAnchoringBoundsImplWithLong_withBoolean_(*(URegularExpression **)(a1 + 16), *(unsigned char *)(a1 + 64));
  v2 = *(URegularExpression **)(a1 + 16);
  UBool v3 = *(unsigned char *)(a1 + 65);
  return JavaUtilRegexMatcher_useTransparentBoundsImplWithLong_withBoolean_(v2, v3);
}

- (id)regionWithInt:(int)a3 withInt:(int)a4
{
  return (id)sub_1001550EC((uint64_t)self, self->input_, a3, a4);
}

- (id)appendTailWithJavaLangStringBuffer:(id)a3
{
  if (self->appendPos_ < self->regionEnd_)
  {
    if (!a3 || (input = self->input_) == 0) {
      JreThrowNullPointerException();
    }
    objc_msgSend(a3, "appendWithNSString:", -[NSString substring:endIndex:](input, "substring:endIndex:"));
  }
  return a3;
}

- (id)replaceFirstWithNSString:(id)a3
{
  [(JavaUtilRegexMatcher *)self reset];
  input = self->input_;
  if (!input) {
    goto LABEL_8;
  }
  v6 = new_JavaLangStringBuffer_initWithInt_([(NSString *)input length]);
  if ([(JavaUtilRegexMatcher *)self find]) {
    [(JavaUtilRegexMatcher *)self appendReplacementWithJavaLangStringBuffer:v6 withNSString:a3];
  }
  id v7 = [(JavaUtilRegexMatcher *)self appendTailWithJavaLangStringBuffer:v6];
  if (!v7) {
LABEL_8:
  }
    JreThrowNullPointerException();
  return [v7 description];
}

- (id)replaceAllWithNSString:(id)a3
{
  [(JavaUtilRegexMatcher *)self reset];
  input = self->input_;
  if (!input) {
    goto LABEL_8;
  }
  v6 = new_JavaLangStringBuffer_initWithInt_([(NSString *)input length]);
  if ([(JavaUtilRegexMatcher *)self find])
  {
    do
      [(JavaUtilRegexMatcher *)self appendReplacementWithJavaLangStringBuffer:v6 withNSString:a3];
    while ([(JavaUtilRegexMatcher *)self find]);
  }
  id v7 = [(JavaUtilRegexMatcher *)self appendTailWithJavaLangStringBuffer:v6];
  if (!v7) {
LABEL_8:
  }
    JreThrowNullPointerException();
  return [v7 description];
}

- (id)pattern
{
  return self->pattern_;
}

- (BOOL)findWithInt:(int)a3
{
  if (a3 < 0) {
    goto LABEL_5;
  }
  input = self->input_;
  if (!input) {
    goto LABEL_7;
  }
  if ((int)[(NSString *)input length] < a3)
  {
LABEL_5:
    id v7 = self->input_;
    if (v7)
    {
      [(NSString *)v7 length];
      CFStringRef v15 = JreStrcat("$I$I", v8, v9, v10, v11, v12, v13, v14, @"start=");
      v16 = new_JavaLangIndexOutOfBoundsException_initWithNSString_((uint64_t)v15);
      objc_exception_throw(v16);
    }
LABEL_7:
    JreThrowNullPointerException();
  }
  BOOL result = JavaUtilRegexMatcher_findImplWithLong_withInt_withIntArray_((URegularExpression *)self->address_, a3, (uint64_t)self->matchOffsets_);
  self->matchFound_ = result;
  return result;
}

- (BOOL)find
{
  BOOL result = JavaUtilRegexMatcher_findNextImplWithLong_withIntArray_((URegularExpression *)self->address_, (uint64_t)self->matchOffsets_);
  self->matchFound_ = result;
  return result;
}

- (BOOL)lookingAt
{
  BOOL result = JavaUtilRegexMatcher_lookingAtImplWithLong_withIntArray_((URegularExpression *)self->address_, (uint64_t)self->matchOffsets_);
  self->matchFound_ = result;
  return result;
}

- (BOOL)matches
{
  BOOL result = JavaUtilRegexMatcher_matchesImplWithLong_withIntArray_((URegularExpression *)self->address_, (uint64_t)self->matchOffsets_);
  self->matchFound_ = result;
  return result;
}

+ (id)quoteReplacementWithNSString:(id)a3
{
  return JavaUtilRegexMatcher_quoteReplacementWithNSString_(a3);
}

- (id)toMatchResult
{
  -[JavaUtilRegexMatcher ensureMatch]_0((uint64_t)self);
  matched = new_JavaUtilRegexMatchResultImpl_initWithNSString_withIntArray_(self->input_, self->matchOffsets_);
  return matched;
}

- (uint64_t)ensureMatch
{
  if (!*(unsigned char *)(result + 52))
  {
    v1 = new_JavaLangIllegalStateException_initWithNSString_(@"No successful match so far");
    objc_exception_throw(v1);
  }
  return result;
}

- (id)useAnchoringBoundsWithBoolean:(BOOL)a3
{
  self->anchoringBounds_ = a3;
  JavaUtilRegexMatcher_useAnchoringBoundsImplWithLong_withBoolean_((URegularExpression *)self->address_, a3);
  return self;
}

- (BOOL)hasAnchoringBounds
{
  return self->anchoringBounds_;
}

- (id)useTransparentBoundsWithBoolean:(BOOL)a3
{
  self->transparentBounds_ = a3;
  JavaUtilRegexMatcher_useTransparentBoundsImplWithLong_withBoolean_((URegularExpression *)self->address_, a3);
  return self;
}

- (BOOL)hasTransparentBounds
{
  return self->transparentBounds_;
}

- (int)regionStart
{
  return self->regionStart_;
}

- (int)regionEnd
{
  return self->regionEnd_;
}

- (BOOL)requireEnd
{
  return JavaUtilRegexMatcher_requireEndImplWithLong_((URegularExpression *)self->address_);
}

- (BOOL)hitEnd
{
  return JavaUtilRegexMatcher_hitEndImplWithLong_((URegularExpression *)self->address_);
}

- (void)dealloc
{
  JavaUtilRegexMatcher_closeImplWithLong_((URegularExpression *)self->address_);

  v3.receiver = self;
  v3.super_class = (Class)JavaUtilRegexMatcher;
  [(JavaUtilRegexMatcher *)&v3 dealloc];
}

- (NSString)description
{
  id v3 = objc_msgSend(-[JavaUtilRegexMatcher getClass](self, "getClass"), "getName");
  [(JavaUtilRegexMatcher *)self pattern];
  [(JavaUtilRegexMatcher *)self regionStart];
  [(JavaUtilRegexMatcher *)self regionEnd];
  if (self->matchFound_) {
    [(JavaUtilRegexMatcher *)self group];
  }
  return (NSString *)JreStrcat("$$@$ICI$$C", v4, v5, v6, v7, v8, v9, v10, v3);
}

- (int)end
{
  return [(JavaUtilRegexMatcher *)self endWithInt:0];
}

- (int)endWithInt:(int)a3
{
  -[JavaUtilRegexMatcher ensureMatch]_0((uint64_t)self);
  matchOffsets = self->matchOffsets_;
  if (!matchOffsets) {
    JreThrowNullPointerException();
  }
  int v6 = 2 * a3;
  uint64_t v7 = (2 * a3) | 1;
  uint64_t size = matchOffsets->super.size_;
  if (v6 < 0 || (int)v7 >= (int)size) {
    IOSArray_throwOutOfBoundsWithMsg(size, v6 | 1);
  }
  return *(&matchOffsets->super.size_ + v7 + 1);
}

- (id)group
{
  return [(JavaUtilRegexMatcher *)self groupWithInt:0];
}

- (id)groupWithInt:(int)a3
{
  -[JavaUtilRegexMatcher ensureMatch]_0((uint64_t)self);
  matchOffsets = self->matchOffsets_;
  if (!matchOffsets) {
    goto LABEL_16;
  }
  int v6 = 2 * a3;
  uint64_t v7 = 2 * a3;
  uint64_t size = matchOffsets->super.size_;
  if (v6 < 0 || v6 >= (int)size) {
    IOSArray_throwOutOfBoundsWithMsg(size, v6);
  }
  uint64_t v9 = *((unsigned int *)&matchOffsets->super.size_ + v7 + 1);
  uint64_t v10 = v7 | 1;
  if ((v7 & 0x80000000) != 0 || (int)v10 >= (int)size) {
    IOSArray_throwOutOfBoundsWithMsg(size, v7 | 1);
  }
  if (v9 == -1 || *(&self->matchOffsets_->super.size_ + v10 + 1) == -1) {
    return 0;
  }
  input = self->input_;
  if (!input) {
LABEL_16:
  }
    JreThrowNullPointerException();
  return -[NSString substring:endIndex:](input, "substring:endIndex:", v9);
}

- (int)groupCount
{
  return JavaUtilRegexMatcher_groupCountImplWithLong_((URegularExpression *)self->address_);
}

- (int)start
{
  return [(JavaUtilRegexMatcher *)self startWithInt:0];
}

- (int)startWithInt:(int)a3
{
  -[JavaUtilRegexMatcher ensureMatch]_0((uint64_t)self);
  matchOffsets = self->matchOffsets_;
  if (!matchOffsets) {
    JreThrowNullPointerException();
  }
  uint64_t v6 = (2 * a3);
  uint64_t size = matchOffsets->super.size_;
  if ((v6 & 0x80000000) != 0 || (int)v6 >= (int)size) {
    IOSArray_throwOutOfBoundsWithMsg(size, v6);
  }
  return *(&matchOffsets->super.size_ + (int)v6 + 1);
}

+ (void)closeImplWithLong:(int64_t)a3
{
}

+ (BOOL)findImplWithLong:(int64_t)a3 withInt:(int)a4 withIntArray:(id)a5
{
  return JavaUtilRegexMatcher_findImplWithLong_withInt_withIntArray_((URegularExpression *)a3, a4, (uint64_t)a5);
}

+ (BOOL)findNextImplWithLong:(int64_t)a3 withIntArray:(id)a4
{
  return JavaUtilRegexMatcher_findNextImplWithLong_withIntArray_((URegularExpression *)a3, (uint64_t)a4);
}

+ (int)groupCountImplWithLong:(int64_t)a3
{
  return JavaUtilRegexMatcher_groupCountImplWithLong_((URegularExpression *)a3);
}

+ (BOOL)hitEndImplWithLong:(int64_t)a3
{
  return JavaUtilRegexMatcher_hitEndImplWithLong_((URegularExpression *)a3);
}

+ (BOOL)lookingAtImplWithLong:(int64_t)a3 withIntArray:(id)a4
{
  return JavaUtilRegexMatcher_lookingAtImplWithLong_withIntArray_((URegularExpression *)a3, (uint64_t)a4);
}

+ (BOOL)matchesImplWithLong:(int64_t)a3 withIntArray:(id)a4
{
  return JavaUtilRegexMatcher_matchesImplWithLong_withIntArray_((URegularExpression *)a3, (uint64_t)a4);
}

+ (int64_t)openImplWithLong:(int64_t)a3
{
  return (int64_t)JavaUtilRegexMatcher_openImplWithLong_((URegularExpression *)a3);
}

+ (BOOL)requireEndImplWithLong:(int64_t)a3
{
  return JavaUtilRegexMatcher_requireEndImplWithLong_((URegularExpression *)a3);
}

+ (void)setInputImplWithLong:(int64_t)a3 withCharArray:(id)a4 withInt:(int)a5 withInt:(int)a6
{
}

+ (void)useAnchoringBoundsImplWithLong:(int64_t)a3 withBoolean:(BOOL)a4
{
}

+ (void)useTransparentBoundsImplWithLong:(int64_t)a3 withBoolean:(BOOL)a4
{
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_1003F7A08;
}

@end