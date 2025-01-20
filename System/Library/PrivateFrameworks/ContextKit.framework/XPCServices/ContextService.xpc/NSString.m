@interface NSString
+ (J2ObjcClassInfo)__metadata;
+ (NSString)stringWithBytes:(id)a3;
+ (NSString)stringWithBytes:(id)a3 charset:(id)a4;
+ (NSString)stringWithBytes:(id)a3 charsetName:(id)a4;
+ (NSString)stringWithBytes:(id)a3 hibyte:(int)a4;
+ (NSString)stringWithBytes:(id)a3 hibyte:(unint64_t)a4 offset:(unint64_t)a5 length:(unint64_t)a6;
+ (NSString)stringWithBytes:(id)a3 offset:(int)a4 length:(int)a5;
+ (NSString)stringWithBytes:(id)a3 offset:(int)a4 length:(int)a5 charset:(id)a6;
+ (NSString)stringWithBytes:(id)a3 offset:(int)a4 length:(int)a5 charsetName:(id)a6;
+ (NSString)stringWithBytes:(id)a3 offset:(int)a4 length:(int)a5 encoding:(unint64_t)a6;
+ (NSString)stringWithCharacters:(id)a3;
+ (NSString)stringWithCharacters:(id)a3 offset:(int)a4 length:(int)a5;
+ (NSString)stringWithInts:(id)a3 offset:(int)a4 length:(int)a5;
+ (NSString)stringWithJavaLangStringBuffer:(id)a3;
+ (NSString)stringWithJavaLangStringBuilder:(id)a3;
+ (NSString)stringWithOffset:(int)a3 length:(int)a4 characters:(id)a5;
+ (id)formatWithJavaUtilLocale:(id)a3 withNSString:(id)a4 withNSObjectArray:(id)a5;
+ (id)formatWithNSString:(id)a3 withNSObjectArray:(id)a4;
+ (id)valueOf:(id)a3;
+ (id)valueOfBool:(BOOL)a3;
+ (id)valueOfChar:(unsigned __int16)a3;
+ (id)valueOfChars:(id)a3;
+ (id)valueOfChars:(id)a3 offset:(int)a4 count:(int)a5;
+ (id)valueOfDouble:(double)a3;
+ (id)valueOfFloat:(float)a3;
+ (id)valueOfInt:(int)a3;
+ (id)valueOfLong:(int64_t)a3;
- (BOOL)contains:(id)a3;
- (BOOL)contentEqualsCharSequence:(id)a3;
- (BOOL)contentEqualsStringBuffer:(id)a3;
- (BOOL)equalsIgnoreCase:(id)a3;
- (BOOL)hasPrefix:(id)a3 offset:(int)a4;
- (BOOL)isEmpty;
- (BOOL)matches:(id)a3;
- (BOOL)regionMatches:(BOOL)a3 thisOffset:(int)a4 aString:(id)a5 otherOffset:(int)a6 count:(int)a7;
- (BOOL)regionMatches:(int)a3 aString:(id)a4 otherOffset:(int)a5 count:(int)a6;
- (id)concat:(id)a3;
- (id)getBytes;
- (id)getBytesWithCharset:(id)a3;
- (id)getBytesWithCharsetName:(id)a3;
- (id)getBytesWithEncoding:(unint64_t)a3;
- (id)lowercaseStringWithJRELocale:(id)a3;
- (id)replace:(id)a3 withSequence:(id)a4;
- (id)replace:(unsigned __int16)a3 withChar:(unsigned __int16)a4;
- (id)replaceAll:(id)a3 withReplacement:(id)a4;
- (id)replaceFirst:(id)a3 withReplacement:(id)a4;
- (id)split:(id)a3;
- (id)split:(id)a3 limit:(int)a4;
- (id)subSequenceFrom:(int)a3 to:(int)a4;
- (id)substring:(int)a3;
- (id)substring:(int)a3 endIndex:(int)a4;
- (id)toCharArray;
- (id)trim;
- (id)uppercaseStringWithJRELocale:(id)a3;
- (int)codePointAt:(int)a3;
- (int)codePointBefore:(int)a3;
- (int)codePointCount:(int)a3 endIndex:(int)a4;
- (int)compareToIgnoreCase:(id)a3;
- (int)compareToWithId:(id)a3;
- (int)indexOf:(int)a3;
- (int)indexOf:(int)a3 fromIndex:(int)a4;
- (int)indexOfString:(id)a3;
- (int)indexOfString:(id)a3 fromIndex:(int)a4;
- (int)lastIndexOf:(int)a3;
- (int)lastIndexOf:(int)a3 fromIndex:(int)a4;
- (int)lastIndexOfString:(id)a3;
- (int)lastIndexOfString:(id)a3 fromIndex:(int)a4;
- (int)offsetByCodePoints:(int)a3 codePointOffset:(int)a4;
- (unsigned)charAtWithInt:(int)a3;
- (void)getBytesWithSrcBegin:(int)a3 withSrcEnd:(int)a4 withDst:(id)a5 withDstBegin:(int)a6;
- (void)getChars:(int)a3 sourceEnd:(int)a4 destination:(id)a5 destinationBegin:(int)a6;
@end

@implementation NSString

+ (id)valueOf:(id)a3
{
  if (a3) {
    return [a3 description];
  }
  else {
    return @"null";
  }
}

+ (id)valueOfBool:(BOOL)a3
{
  if (a3) {
    return @"true";
  }
  else {
    return @"false";
  }
}

+ (id)valueOfChar:(unsigned __int16)a3
{
  unsigned __int16 v4 = a3;
  return +[NSString stringWithCharacters:&v4 length:1];
}

+ (id)valueOfChars:(id)a3
{
  return NSString_valueOfChars_offset_count_((uint64_t)a3, 0, *((unsigned int *)a3 + 2));
}

+ (id)valueOfChars:(id)a3 offset:(int)a4 count:(int)a5
{
  return NSString_valueOfChars_offset_count_((uint64_t)a3, *(uint64_t *)&a4, *(uint64_t *)&a5);
}

+ (id)valueOfDouble:(double)a3
{
  return (id)RealToString_convertDouble(0, a3);
}

+ (id)valueOfFloat:(float)a3
{
  return (id)RealToString_convertFloat(0, a3);
}

+ (id)valueOfInt:(int)a3
{
  return IntegralToString_convertInt(0, a3);
}

+ (id)valueOfLong:(int64_t)a3
{
  return (id)IntegralToString_convertLong(0, a3);
}

- (void)getChars:(int)a3 sourceEnd:(int)a4 destination:(id)a5 destinationBegin:(int)a6
{
  uint64_t v8 = *(void *)&a4;
  if (a3 < 0)
  {
    v11 = [[JavaLangStringIndexOutOfBoundsException alloc] initWithInt:*(void *)&a3];
    v12 = v11;
  }
  else
  {
    v11 = 0;
  }
  if ((int)[(NSString *)self length] < (int)v8)
  {
    v11 = [[JavaLangStringIndexOutOfBoundsException alloc] initWithInt:v8];
    v13 = v11;
  }
  BOOL v14 = __OFSUB__(v8, a3);
  uint64_t v15 = (v8 - a3);
  if ((int)v15 < 0 != v14)
  {
    v11 = [[JavaLangStringIndexOutOfBoundsException alloc] initWithInt:v15];
    v16 = v11;
  }
  if (v11
    || (int)v15 + a6 > *((_DWORD *)a5 + 2)
    && (v11 = [[JavaLangStringIndexOutOfBoundsException alloc] initWithInt:(v15 + a6)], v17 = v11, v11))
  {
    objc_exception_throw(v11);
  }
  -[NSString getCharacters:range:](self, "getCharacters:range:", (char *)a5 + 2 * a6 + 12, a3, (int)v15);
}

+ (NSString)stringWithCharacters:(id)a3
{
  return +[NSString stringWithCharacters:a3 offset:0 length:*((unsigned int *)a3 + 2)];
}

+ (NSString)stringWithCharacters:(id)a3 offset:(int)a4 length:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  uint64_t v6 = *(void *)&a4;
  if ((a4 & 0x80000000) == 0)
  {
    v9 = 0;
    if ((a5 & 0x80000000) == 0) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  v9 = [[JavaLangStringIndexOutOfBoundsException alloc] initWithInt:*(void *)&a4];
  v12 = v9;
  if ((v5 & 0x80000000) != 0)
  {
LABEL_3:
    v9 = [[JavaLangStringIndexOutOfBoundsException alloc] initWithInt:v6];
    v10 = v9;
  }
LABEL_4:
  if (*((_DWORD *)a3 + 2) - (int)v5 < (int)v6)
  {
    v9 = [[JavaLangStringIndexOutOfBoundsException alloc] initWithInt:(v5 + v6)];
    v11 = v9;
  }
  if (v9) {
    objc_exception_throw(v9);
  }
  return (NSString *)[a1 stringWithOffset:v6 length:v5 characters:a3];
}

+ (NSString)stringWithOffset:(int)a3 length:(int)a4 characters:(id)a5
{
  if (a4) {
    return +[NSString stringWithCharacters:(char *)a5 + 2 * a3 + 12 length:a4];
  }
  else {
    return +[NSString string];
  }
}

+ (NSString)stringWithJavaLangStringBuffer:(id)a3
{
  return (NSString *)[a3 description];
}

+ (NSString)stringWithJavaLangStringBuilder:(id)a3
{
  if (!a3)
  {
    uint64_t v5 = (objc_class *)objc_opt_class();
    id Exception = makeException(v5);
    objc_exception_throw(Exception);
  }
  return (NSString *)[a3 description];
}

- (int)compareToWithId:(id)a3
{
  if (!a3 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    uint64_t v6 = (objc_class *)objc_opt_class();
    id Exception = makeException(v6);
    objc_exception_throw(Exception);
  }
  return [(NSString *)self compare:a3 options:2];
}

- (int)compareToIgnoreCase:(id)a3
{
  if (!a3)
  {
    unsigned __int16 v4 = (objc_class *)objc_opt_class();
    id Exception = makeException(v4);
    objc_exception_throw(Exception);
  }
  return -[NSString caseInsensitiveCompare:](self, "caseInsensitiveCompare:");
}

- (id)substring:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  if (a3 < 0 || (int)[(NSString *)self length] < a3) {
    objc_exception_throw([[JavaLangStringIndexOutOfBoundsException alloc] initWithInt:v3]);
  }
  return [(NSString *)self substringFromIndex:v3];
}

- (id)substring:(int)a3 endIndex:(int)a4
{
  uint64_t v4 = *(void *)&a3;
  if (a3 < 0)
  {
    v9 = [JavaLangStringIndexOutOfBoundsException alloc];
    uint64_t v10 = v4;
    goto LABEL_10;
  }
  uint64_t v5 = *(void *)&a4;
  uint64_t v6 = (a4 - a3);
  if (a4 < a3)
  {
    v9 = [JavaLangStringIndexOutOfBoundsException alloc];
    uint64_t v10 = v6;
    goto LABEL_10;
  }
  if ((int)[(NSString *)self length] < a4)
  {
    v9 = [JavaLangStringIndexOutOfBoundsException alloc];
    uint64_t v10 = v5;
LABEL_10:
    objc_exception_throw([(JavaLangStringIndexOutOfBoundsException *)v9 initWithInt:v10]);
  }
  return -[NSString substringWithRange:](self, "substringWithRange:", v4, (int)v6);
}

- (int)indexOf:(int)a3
{
  return [(NSString *)self indexOf:*(void *)&a3 fromIndex:0];
}

- (int)indexOf:(int)a3 fromIndex:(int)a4
{
  __int16 v5 = a3;
  return [(NSString *)self indexOfString:+[NSString stringWithCharacters:&v5 length:1] fromIndex:*(void *)&a4];
}

- (int)indexOfString:(id)a3
{
  if (!a3)
  {
    uint64_t v6 = (objc_class *)objc_opt_class();
    id Exception = makeException(v6);
    objc_exception_throw(Exception);
  }
  id v5 = [a3 length];
  if (v5) {
    LODWORD(v5) = [(NSString *)self rangeOfString:a3];
  }
  return (int)v5;
}

- (int)indexOfString:(id)a3 fromIndex:(int)a4
{
  if (!a3)
  {
    v9 = (objc_class *)objc_opt_class();
    id Exception = makeException(v9);
    objc_exception_throw(Exception);
  }
  id v7 = [a3 length];
  if (v7)
  {
    unint64_t v8 = [(NSString *)self length];
    if (v8 <= a4) {
      LODWORD(v7) = -1;
    }
    else {
      LODWORD(v7) = -[NSString rangeOfString:options:range:](self, "rangeOfString:options:range:", a3, 2, a4 & ~(a4 >> 31), v8 - (a4 & ~(a4 >> 31)));
    }
  }
  return (int)v7;
}

- (BOOL)isEmpty
{
  return [(NSString *)self length] == 0;
}

- (int)lastIndexOf:(int)a3
{
  __int16 v4 = a3;
  return [(NSString *)self lastIndexOfString:+[NSString stringWithCharacters:&v4 length:1]];
}

- (int)lastIndexOf:(int)a3 fromIndex:(int)a4
{
  __int16 v5 = a3;
  return [(NSString *)self lastIndexOfString:+[NSString stringWithCharacters:&v5 length:1] fromIndex:*(void *)&a4];
}

- (int)lastIndexOfString:(id)a3
{
  if (!a3)
  {
    uint64_t v6 = (objc_class *)objc_opt_class();
    id Exception = makeException(v6);
    objc_exception_throw(Exception);
  }
  if ([a3 length]) {
    return [(NSString *)self rangeOfString:a3 options:4];
  }
  else {
    return [(NSString *)self length];
  }
}

- (int)lastIndexOfString:(id)a3 fromIndex:(int)a4
{
  if (!a3)
  {
    v12 = (objc_class *)objc_opt_class();
    id Exception = makeException(v12);
    objc_exception_throw(Exception);
  }
  unsigned int v7 = [(NSString *)self length];
  if (a4 < 0) {
    return -1;
  }
  signed int v8 = v7;
  if (!v7) {
    return 0;
  }
  unsigned int v9 = [a3 length];
  if (v9)
  {
    signed int v10 = v9 + a4;
    if ((int)(v9 + a4) >= v8) {
      signed int v10 = v8;
    }
    return -[NSString rangeOfString:options:range:](self, "rangeOfString:options:range:", a3, 4, 0, v10);
  }
  return a4;
}

- (id)toCharArray
{
  return +[IOSCharArray arrayWithNSString:self];
}

- (unsigned)charAtWithInt:(int)a3
{
  if (a3 < 0 || (int)[(NSString *)self length] <= a3)
  {
    uint64_t v6 = (objc_class *)objc_opt_class();
    id Exception = makeException(v6);
    objc_exception_throw(Exception);
  }
  return [(NSString *)self characterAtIndex:a3];
}

- (id)subSequenceFrom:(int)a3 to:(int)a4
{
  unint64_t v7 = [(NSString *)self length];
  if (a3 < 0 || (int v8 = a4 - a3, a4 < a3) || v7 < a4)
  {
    v13 = (objc_class *)objc_opt_class();
    id Exception = makeException(v13);
    objc_exception_throw(Exception);
  }
  uint64_t v9 = v8;
  signed int v10 = malloc_type_calloc(v8, 2uLL, 0x1000040BDFB0063uLL);
  -[NSString getCharacters:range:](self, "getCharacters:range:", v10, a3, v9);
  v11 = +[NSString stringWithCharacters:v10 length:v9];
  free(v10);
  return v11;
}

- (id)replace:(unsigned __int16)a3 withChar:(unsigned __int16)a4
{
  unsigned __int16 v6 = a3;
  unsigned __int16 v5 = a4;
  return [(NSString *)self replace:+[NSString stringWithCharacters:length:](NSString, "stringWithCharacters:length:", &v6, 1) withSequence:+[NSString stringWithCharacters:&v5 length:1]];
}

- (id)replace:(id)a3 withSequence:(id)a4
{
  id v6 = [a3 description];
  id v7 = [a4 description];
  return [(NSString *)self stringByReplacingOccurrencesOfString:v6 withString:v7];
}

- (id)replaceAll:(id)a3 withReplacement:(id)a4
{
  NSUInteger v7 = [(NSString *)self length];
  return -[NSString stringByReplacingOccurrencesOfString:withString:options:range:](self, "stringByReplacingOccurrencesOfString:withString:options:range:", a3, a4, 1024, 0, v7);
}

- (id)replaceFirst:(id)a3 withReplacement:(id)a4
{
  id v7 = [(NSString *)self rangeOfString:a3 options:1024];
  if (v7 == (id)0x7FFFFFFFFFFFFFFFLL) {
    return self;
  }
  return -[NSString stringByReplacingOccurrencesOfString:withString:options:range:](self, "stringByReplacingOccurrencesOfString:withString:options:range:", a3, a4, 1024, v7, v8);
}

+ (NSString)stringWithBytes:(id)a3
{
  NSStringEncoding v5 = +[NSString defaultCStringEncoding];
  uint64_t v6 = *((unsigned int *)a3 + 2);
  return (NSString *)[a1 stringWithBytes:a3 offset:0 length:v6 encoding:v5];
}

+ (NSString)stringWithBytes:(id)a3 charsetName:(id)a4
{
  return (NSString *)[a1 stringWithBytes:a3 offset:0 length:*((unsigned int *)a3 + 2) charsetName:a4];
}

+ (NSString)stringWithBytes:(id)a3 charset:(id)a4
{
  return (NSString *)[a1 stringWithBytes:a3 offset:0 length:*((unsigned int *)a3 + 2) charset:a4];
}

+ (NSString)stringWithBytes:(id)a3 hibyte:(int)a4
{
  return +[NSString stringWithBytes:hibyte:offset:length:](NSString, "stringWithBytes:hibyte:offset:length:");
}

+ (NSString)stringWithBytes:(id)a3 offset:(int)a4 length:(int)a5
{
  return +[NSString stringWithBytes:a3 offset:*(void *)&a4 length:*(void *)&a5 encoding:4];
}

+ (NSString)stringWithBytes:(id)a3 offset:(int)a4 length:(int)a5 charsetName:(id)a6
{
  uint64_t v6 = *(void *)&a5;
  uint64_t v7 = *(void *)&a4;
  id v9 = [JavaNioCharsetCharset_forNameUEEWithNSString_((__CFString *)a6) nsEncoding];
  return +[NSString stringWithBytes:a3 offset:v7 length:v6 encoding:v9];
}

+ (NSString)stringWithBytes:(id)a3 offset:(int)a4 length:(int)a5 charset:(id)a6
{
  uint64_t v7 = *(void *)&a5;
  uint64_t v8 = *(void *)&a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    objc_exception_throw(-[JavaNioCharsetUnsupportedCharsetException initWithNSString:]([JavaNioCharsetUnsupportedCharsetException alloc], "initWithNSString:", [a6 description]));
  }
  id v10 = [a6 nsEncoding];
  return +[NSString stringWithBytes:a3 offset:v8 length:v7 encoding:v10];
}

+ (NSString)stringWithBytes:(id)a3 hibyte:(unint64_t)a4 offset:(unint64_t)a5 length:(unint64_t)a6
{
  __int16 v8 = a4;
  id v10 = malloc_type_calloc(a6, 2uLL, 0x1000040BDFB0063uLL);
  v11 = v10;
  if (a6)
  {
    v12 = (unsigned __int8 *)a3 + a5 + 12;
    v13 = v10;
    unint64_t v14 = a6;
    do
    {
      __int16 v15 = *v12++;
      *v13++ = (v8 << 8) | v15;
      --v14;
    }
    while (v14);
  }
  v16 = +[NSString stringWithCharacters:v10 length:a6];
  free(v11);
  return v16;
}

+ (NSString)stringWithBytes:(id)a3 offset:(int)a4 length:(int)a5 encoding:(unint64_t)a6
{
  uint64_t v8 = *(void *)&a4;
  if ((a4 & 0x80000000) == 0)
  {
    id v10 = 0;
    if ((a5 & 0x80000000) == 0) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  id v10 = [[JavaLangStringIndexOutOfBoundsException alloc] initWithInt:*(void *)&a4];
  if (a5 < 0) {
LABEL_3:
  }
    id v10 = [[JavaLangStringIndexOutOfBoundsException alloc] initWithInt:v8];
LABEL_4:
  if (*((_DWORD *)a3 + 2) - a5 < (int)v8) {
    id v10 = [[JavaLangStringIndexOutOfBoundsException alloc] initWithInt:(a5 + v8)];
  }
  if (v10) {
    objc_exception_throw(v10);
  }
  id v11 = [objc_alloc((Class)NSString) initWithBytes:(char *)a3 + (int)v8 + 12 length:a5 encoding:a6];
  return (NSString *)v11;
}

+ (NSString)stringWithInts:(id)a3 offset:(int)a4 length:(int)a5
{
  uint64_t v8 = *((int *)a3 + 2);
  id v9 = malloc_type_malloc(4 * v8, 0x100004052888210uLL);
  [a3 getInts:v9 length:v8];
  id v10 = malloc_type_malloc(a5, 0xE810FAB0uLL);
  id v11 = v10;
  if (a5 >= 1)
  {
    uint64_t v12 = a5;
    v13 = v10;
    do
    {
      *v13++ = v9[a4++];
      --v12;
    }
    while (v12);
  }
  unint64_t v14 = +[NSString stringWithCharacters:v10 length:a5];
  free(v11);
  free(v9);
  return v14;
}

- (id)getBytes
{
  id v3 = [(id)JavaNioCharsetCharset_defaultCharset() nsEncoding];
  return [(NSString *)self getBytesWithEncoding:v3];
}

- (id)getBytesWithCharsetName:(id)a3
{
  if (!a3)
  {
    NSStringEncoding v5 = (objc_class *)objc_opt_class();
    id Exception = makeException(v5);
    objc_exception_throw(Exception);
  }
  id v4 = [JavaNioCharsetCharset_forNameUEEWithNSString_((__CFString *)a3) nsEncoding];
  return [(NSString *)self getBytesWithEncoding:v4];
}

- (id)getBytesWithCharset:(id)a3
{
  if (!a3) {
    JreThrowNullPointerException();
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    objc_exception_throw(-[JavaNioCharsetUnsupportedCharsetException initWithNSString:]([JavaNioCharsetUnsupportedCharsetException alloc], "initWithNSString:", [a3 description]));
  }
  id v5 = [a3 nsEncoding];
  return [(NSString *)self getBytesWithEncoding:v5];
}

- (id)getBytesWithEncoding:(unint64_t)a3
{
  if (!a3)
  {
    unint64_t v14 = (objc_class *)objc_opt_class();
    id Exception = makeException(v14);
    objc_exception_throw(Exception);
  }
  NSUInteger v5 = -[NSString maximumLengthOfBytesUsingEncoding:](self, "maximumLengthOfBytesUsingEncoding:");
  uint64_t v6 = v5 << 32;
  uint64_t v7 = (v5 << 32) + 0x200000000;
  if (a3 != 10) {
    uint64_t v7 = v5 << 32;
  }
  uint64_t v8 = v7 >> 32;
  id v9 = malloc_type_malloc(v7 >> 32, 0x100004077774924uLL);
  id v10 = v9;
  if (a3 == 10)
  {
    _WORD *v9 = -2;
    uint64_t v16 = 0;
    -[NSString getBytes:maxLength:usedLength:encoding:options:range:remainingRange:](self, "getBytes:maxLength:usedLength:encoding:options:range:remainingRange:", v9 + 1, v6 >> 32, &v16, 2415919360, 0, 0, [(NSString *)self length], 0);
    int v11 = v16 + 2;
    v16 += 2;
  }
  else
  {
    uint64_t v16 = 0;
    -[NSString getBytes:maxLength:usedLength:encoding:options:range:remainingRange:](self, "getBytes:maxLength:usedLength:encoding:options:range:remainingRange:", v9, v8, &v16, a3, 0, 0, [(NSString *)self length], 0);
    int v11 = v16;
  }
  uint64_t v12 = +[IOSByteArray arrayWithBytes:v10 count:v11];
  free(v10);
  return v12;
}

- (void)getBytesWithSrcBegin:(int)a3 withSrcEnd:(int)a4 withDst:(id)a5 withDstBegin:(int)a6
{
  if (a3 < 0)
  {
    CFStringRef v14 = @"srcBegin < 0";
LABEL_12:
    __int16 v15 = [JavaLangStringIndexOutOfBoundsException alloc];
    CFStringRef v16 = v14;
    goto LABEL_15;
  }
  if (a4 < a3)
  {
    CFStringRef v14 = @"srcBegin > srcEnd";
    goto LABEL_12;
  }
  if ((int)[(NSString *)self length] < a4)
  {
    CFStringRef v14 = @"srcEnd > string length";
    goto LABEL_12;
  }
  int v11 = a4 - a3;
  if (a4 - a3 > (int)[(NSString *)self length])
  {
    CFStringRef v14 = @"dstBegin+(srcEnd-srcBegin) > dst.length";
    goto LABEL_12;
  }
  if (!a5)
  {
    v17 = (objc_class *)objc_opt_class();
    id Exception = makeException(v17);
    objc_exception_throw(Exception);
  }
  size_t v12 = [(NSString *)self maximumLengthOfBytesUsingEncoding:4];
  v13 = malloc_type_malloc(v12, 0xCBBC82ADuLL);
  uint64_t v19 = 0;
  -[NSString getBytes:maxLength:usedLength:encoding:options:range:remainingRange:](self, "getBytes:maxLength:usedLength:encoding:options:range:remainingRange:", v13, v12, &v19, 4, 0, a3, v11, 0);
  if (*((_DWORD *)a5 + 2) - a6 < (int)v19)
  {
    free(v13);
    __int16 v15 = [JavaLangStringIndexOutOfBoundsException alloc];
    CFStringRef v16 = @"dstBegin+(srcEnd-srcBegin) > dst.length";
LABEL_15:
    objc_exception_throw([(JavaLangStringIndexOutOfBoundsException *)v15 initWithNSString:v16]);
  }
  objc_msgSend(a5, "replaceBytes:length:offset:", v13);
  free(v13);
}

+ (id)formatWithNSString:(id)a3 withNSObjectArray:(id)a4
{
  return NSString_formatWithNSString_withNSObjectArray_((uint64_t)a3, (uint64_t)a4);
}

+ (id)formatWithJavaUtilLocale:(id)a3 withNSString:(id)a4 withNSObjectArray:(id)a5
{
  return NSString_formatWithJavaUtilLocale_withNSString_withNSObjectArray_((uint64_t)a3, (uint64_t)a4, (uint64_t)a5);
}

- (BOOL)hasPrefix:(id)a3 offset:(int)a4
{
  if (!a3)
  {
    NSUInteger v5 = (objc_class *)objc_opt_class();
    id Exception = makeException(v5);
    objc_exception_throw(Exception);
  }
  return -[NSString compare:options:range:](self, "compare:options:range:", a3, 2, a4, [a3 length]) == NSOrderedSame;
}

- (id)trim
{
  id v3 = +[NSCharacterSet characterSetWithRange:](NSCharacterSet, "characterSetWithRange:", 0, 33);
  return [(NSString *)self stringByTrimmingCharactersInSet:v3];
}

- (id)split:(id)a3
{
  if (!a3)
  {
    id v4 = (objc_class *)objc_opt_class();
    id Exception = makeException(v4);
    objc_exception_throw(Exception);
  }
  return -[NSString split:limit:](self, "split:limit:");
}

- (id)split:(id)a3 limit:(int)a4
{
  if (!a3)
  {
    uint64_t v7 = (objc_class *)objc_opt_class();
    id Exception = makeException(v7);
    objc_exception_throw(Exception);
  }
  uint64_t v4 = *(void *)&a4;
  uint64_t v6 = JavaUtilRegexPattern_compileWithNSString_(a3);
  return [(JavaUtilRegexPattern *)v6 splitWithJavaLangCharSequence:self withInt:v4];
}

- (BOOL)equalsIgnoreCase:(id)a3
{
  return [(NSString *)self compare:a3 options:1] == NSOrderedSame;
}

- (id)lowercaseStringWithJRELocale:(id)a3
{
  if (!a3)
  {
    id v10 = (objc_class *)objc_opt_class();
    id Exception = makeException(v10);
    objc_exception_throw(Exception);
  }
  id v4 = objc_msgSend(objc_alloc((Class)NSLocale), "initWithLocaleIdentifier:", objc_msgSend(a3, "description"));
  id v5 = v4;
  MutableCopy = CFStringCreateMutableCopy(0, 0, (CFStringRef)self);
  CFStringLowercase(MutableCopy, (CFLocaleRef)v4);
  id v7 = [(__CFString *)MutableCopy copy];
  CFRelease(MutableCopy);
  id v8 = v7;
  return v7;
}

- (id)uppercaseStringWithJRELocale:(id)a3
{
  if (!a3)
  {
    id v10 = (objc_class *)objc_opt_class();
    id Exception = makeException(v10);
    objc_exception_throw(Exception);
  }
  id v4 = objc_msgSend(objc_alloc((Class)NSLocale), "initWithLocaleIdentifier:", objc_msgSend(a3, "description"));
  id v5 = v4;
  MutableCopy = CFStringCreateMutableCopy(0, 0, (CFStringRef)self);
  CFStringUppercase(MutableCopy, (CFLocaleRef)v4);
  id v7 = [(__CFString *)MutableCopy copy];
  CFRelease(MutableCopy);
  id v8 = v7;
  return v7;
}

- (BOOL)regionMatches:(int)a3 aString:(id)a4 otherOffset:(int)a5 count:(int)a6
{
  return [(NSString *)self regionMatches:0 thisOffset:*(void *)&a3 aString:a4 otherOffset:*(void *)&a5 count:*(void *)&a6];
}

- (BOOL)regionMatches:(BOOL)a3 thisOffset:(int)a4 aString:(id)a5 otherOffset:(int)a6 count:(int)a7
{
  if (a4 < 0) {
    return 0;
  }
  BOOL v11 = a3;
  size_t v12 = self;
  unsigned int v13 = [(NSString *)self length];
  BOOL result = 0;
  if ((a6 & 0x80000000) == 0 && (int)(v13 - a4) >= a7)
  {
    if ((int)([a5 length] - a6) < a7) {
      return 0;
    }
    if (!a5)
    {
      CFStringRef v16 = (objc_class *)objc_opt_class();
      id Exception = makeException(v16);
      objc_exception_throw(Exception);
    }
    if (a4 || [(NSString *)v12 length] != a7) {
      size_t v12 = -[NSString substringWithRange:](v12, "substringWithRange:", a4, a7);
    }
    if (a6 || [a5 length] != a7) {
      a5 = objc_msgSend(a5, "substringWithRange:", a6, a7);
    }
    if (v11) {
      uint64_t v15 = 3;
    }
    else {
      uint64_t v15 = 2;
    }
    return [(NSString *)v12 compare:a5 options:v15] == NSOrderedSame;
  }
  return result;
}

- (id)concat:(id)a3
{
  if (!a3)
  {
    id v5 = (objc_class *)objc_opt_class();
    id Exception = makeException(v5);
    objc_exception_throw(Exception);
  }
  return -[NSString stringByAppendingString:](self, "stringByAppendingString:");
}

- (BOOL)contains:(id)a3
{
  if (!a3)
  {
    uint64_t v6 = (objc_class *)objc_opt_class();
    id Exception = makeException(v6);
    objc_exception_throw(Exception);
  }
  return ![a3 length]
      || -[NSString rangeOfString:](self, "rangeOfString:", [a3 description]) != (id)0x7FFFFFFFFFFFFFFFLL;
}

- (int)codePointAt:(int)a3
{
  return JavaLangCharacter_codePointAtWithJavaLangCharSequence_withInt_(self, *(uint64_t *)&a3);
}

- (int)codePointBefore:(int)a3
{
  return JavaLangCharacter_codePointBeforeWithJavaLangCharSequence_withInt_(self, a3);
}

- (int)codePointCount:(int)a3 endIndex:(int)a4
{
  return JavaLangCharacter_codePointCountWithJavaLangCharSequence_withInt_withInt_(self, *(uint64_t *)&a3, a4);
}

- (int)offsetByCodePoints:(int)a3 codePointOffset:(int)a4
{
  return JavaLangCharacter_offsetByCodePointsWithJavaLangCharSequence_withInt_withInt_(self, *(uint64_t *)&a3, a4);
}

- (BOOL)matches:(id)a3
{
  return JavaUtilRegexPattern_matchesWithNSString_withJavaLangCharSequence_(a3, (uint64_t)self);
}

- (BOOL)contentEqualsCharSequence:(id)a3
{
  id v4 = [a3 description];
  return [(NSString *)self isEqualToString:v4];
}

- (BOOL)contentEqualsStringBuffer:(id)a3
{
  id v4 = [a3 description];
  return [(NSString *)self isEqualToString:v4];
}

+ (J2ObjcClassInfo)__metadata
{
  return (J2ObjcClassInfo *)&unk_10055F1B0;
}

@end