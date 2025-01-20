@interface JavaUtilFormatter_FormatSpecifierParser
+ (const)__metadata;
- (JavaUtilFormatter_FormatSpecifierParser)initWithNSString:(id)a3;
- (id)getFormatSpecifierText;
- (id)parseArgumentIndexAndFlagsWithJavaUtilFormatter_FormatToken:(id)a3;
- (id)parseConversionTypeWithJavaUtilFormatter_FormatToken:(id)a3;
- (id)parseFormatTokenWithInt:(int)a3;
- (id)parsePrecisionWithJavaUtilFormatter_FormatToken:(id)a3;
- (id)parseWidthWithJavaUtilFormatter_FormatToken:(id)a3 withInt:(int)a4;
- (id)unknownFormatConversionException;
- (int)failNextInt;
- (int)peek;
- (void)dealloc;
@end

@implementation JavaUtilFormatter_FormatSpecifierParser

- (JavaUtilFormatter_FormatSpecifierParser)initWithNSString:(id)a3
{
  if (!a3) {
    JreThrowNullPointerException();
  }
  self->length_ = [a3 length];
  return self;
}

- (id)parseFormatTokenWithInt:(int)a3
{
  self->startIndex_ = a3;
  self->i_ = a3;
  v4 = [JavaUtilFormatter_FormatToken alloc];
  v4->argIndex_ = -1;
  v4->conversionType_ = -1;
  *(void *)&v4->precision_ = -1;
  v5 = v4;
  return sub_10014F868((uint64_t)self, v5);
}

- (id)getFormatSpecifierText
{
  if (!self->format_) {
    JreThrowNullPointerException();
  }
  uint64_t startIndex = self->startIndex_;
  uint64_t i = self->i_;
  format = self->format_;
  return [(NSString *)format substring:startIndex endIndex:i];
}

- (int)peek
{
  if (self->i_ >= self->length_) {
    return -1;
  }
  format = self->format_;
  if (!format) {
    JreThrowNullPointerException();
  }
  return -[NSString charAtWithInt:](format, "charAtWithInt:");
}

- (id)unknownFormatConversionException
{
}

- (id)parseArgumentIndexAndFlagsWithJavaUtilFormatter_FormatToken:(id)a3
{
  return sub_10014F868((uint64_t)self, a3);
}

- (id)parseWidthWithJavaUtilFormatter_FormatToken:(id)a3 withInt:(int)a4
{
  return sub_10014FB50((uint64_t)self, a3);
}

- (id)parsePrecisionWithJavaUtilFormatter_FormatToken:(id)a3
{
  return sub_10014FBD0((uint64_t)self, a3);
}

- (id)parseConversionTypeWithJavaUtilFormatter_FormatToken:(id)a3
{
  return sub_10014FC68((uint64_t)self, a3);
}

- (int)failNextInt
{
  return -1;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)JavaUtilFormatter_FormatSpecifierParser;
  [(JavaUtilFormatter_FormatSpecifierParser *)&v3 dealloc];
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_1003F4078;
}

@end