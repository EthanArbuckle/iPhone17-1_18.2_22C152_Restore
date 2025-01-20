@interface JavaUtilRegexPatternSyntaxException
+ (const)__metadata;
- (JavaUtilRegexPatternSyntaxException)initWithNSString:(id)a3 withNSString:(id)a4 withInt:(int)a5;
- (id)getDescription;
- (id)getMessage;
- (id)getPattern;
- (int)getIndex;
- (void)dealloc;
@end

@implementation JavaUtilRegexPatternSyntaxException

- (JavaUtilRegexPatternSyntaxException)initWithNSString:(id)a3 withNSString:(id)a4 withInt:(int)a5
{
  return self;
}

- (id)getPattern
{
  return self->pattern_;
}

- (id)getMessage
{
  v3 = new_JavaLangStringBuilder_init();
  v4 = v3;
  if (self->desc_) {
    -[JavaLangStringBuilder appendWithNSString:](v3, "appendWithNSString:");
  }
  if ((self->index_ & 0x80000000) == 0)
  {
    if (self->desc_) {
      [(JavaLangStringBuilder *)v4 appendWithChar:32];
    }
    [(JavaLangStringBuilder *)v4 appendWithNSString:@"near index "];
    [(JavaLangStringBuilder *)v4 appendWithInt:self->index_];
    [(JavaLangStringBuilder *)v4 appendWithChar:58];
  }
  if (self->pattern_)
  {
    [(JavaLangStringBuilder *)v4 appendWithChar:10];
    [(JavaLangStringBuilder *)v4 appendWithNSString:self->pattern_];
    if ((self->index_ & 0x80000000) == 0)
    {
      v5 = +[IOSCharArray arrayWithLength:](IOSCharArray, "arrayWithLength:");
      JavaUtilArrays_fillWithCharArray_withChar_((uint64_t)v5, 32);
      [(JavaLangStringBuilder *)v4 appendWithChar:10];
      [(JavaLangStringBuilder *)v4 appendWithCharArray:v5];
      [(JavaLangStringBuilder *)v4 appendWithChar:94];
    }
  }
  return [(JavaLangStringBuilder *)v4 description];
}

- (id)getDescription
{
  return self->desc_;
}

- (int)getIndex
{
  return self->index_;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)JavaUtilRegexPatternSyntaxException;
  [(JavaLangThrowable *)&v3 dealloc];
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_1003FC560;
}

@end