@interface JavaUtilRegexPattern
+ (BOOL)matchesWithNSString:(id)a3 withJavaLangCharSequence:(id)a4;
+ (const)__metadata;
+ (id)compileWithNSString:(id)a3;
+ (id)compileWithNSString:(id)a3 withInt:(int)a4;
+ (id)quoteWithNSString:(id)a3;
+ (int64_t)compileImplWithNSString:(id)a3 withInt:(int)a4;
+ (void)closeImplWithLong:(int64_t)a3;
- (JavaUtilRegexPattern)initWithNSString:(id)a3 withInt:(int)a4;
- (NSString)description;
- (id)matcherWithJavaLangCharSequence:(id)a3;
- (id)pattern;
- (id)splitWithJavaLangCharSequence:(id)a3;
- (id)splitWithJavaLangCharSequence:(id)a3 withInt:(int)a4;
- (int)flags;
- (void)dealloc;
- (void)readObjectWithJavaIoObjectInputStream:(id)a3;
@end

@implementation JavaUtilRegexPattern

- (id)matcherWithJavaLangCharSequence:(id)a3
{
  v3 = new_JavaUtilRegexMatcher_initWithJavaUtilRegexPattern_withJavaLangCharSequence_((uint64_t)self, (uint64_t)a3);
  return v3;
}

- (id)splitWithJavaLangCharSequence:(id)a3 withInt:(int)a4
{
  if (!a3) {
    JreThrowNullPointerException();
  }
  pattern = self->pattern_;
  id v7 = [a3 description];
  return JavaUtilRegexSplitter_splitWithJavaUtilRegexPattern_withNSString_withNSString_withInt_((uint64_t)self, pattern, v7, a4);
}

- (id)splitWithJavaLangCharSequence:(id)a3
{
  return [(JavaUtilRegexPattern *)self splitWithJavaLangCharSequence:a3 withInt:0];
}

- (id)pattern
{
  return self->pattern_;
}

- (NSString)description
{
  return self->pattern_;
}

- (int)flags
{
  return self->flags_;
}

+ (id)compileWithNSString:(id)a3 withInt:(int)a4
{
  return JavaUtilRegexPattern_compileWithNSString_withInt_(a3, *(uint64_t *)&a4);
}

+ (id)compileWithNSString:(id)a3
{
  return JavaUtilRegexPattern_compileWithNSString_(a3);
}

- (JavaUtilRegexPattern)initWithNSString:(id)a3 withInt:(int)a4
{
  sub_100293974((uint64_t)self, a3, *(uint64_t *)&a4, *(uint64_t *)&a4, v4, v5, v6, v7);
  return self;
}

+ (BOOL)matchesWithNSString:(id)a3 withJavaLangCharSequence:(id)a4
{
  return JavaUtilRegexPattern_matchesWithNSString_withJavaLangCharSequence_(a3, (uint64_t)a4);
}

+ (id)quoteWithNSString:(id)a3
{
  return JavaUtilRegexPattern_quoteWithNSString_(a3);
}

- (void)dealloc
{
  JavaUtilRegexPattern_closeImplWithLong_((URegularExpression *)self->address_);

  v3.receiver = self;
  v3.super_class = (Class)JavaUtilRegexPattern;
  [(JavaUtilRegexPattern *)&v3 dealloc];
}

- (void)readObjectWithJavaIoObjectInputStream:(id)a3
{
  if (!a3) {
    JreThrowNullPointerException();
  }
  [a3 defaultReadObject];
  sub_100293A04((uint64_t)self);
}

+ (void)closeImplWithLong:(int64_t)a3
{
}

+ (int64_t)compileImplWithNSString:(id)a3 withInt:(int)a4
{
  return (int64_t)JavaUtilRegexPattern_compileImplWithNSString_withInt_(a3, a4);
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_100484D90;
}

@end