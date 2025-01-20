@interface NSTextCheckingResult
+ (BOOL)supportsSecureCoding;
+ (NSTextCheckingResult)addressCheckingResultWithRange:(NSRange)range components:(NSDictionary *)components;
+ (NSTextCheckingResult)correctionCheckingResultWithRange:(NSRange)range replacementString:(NSString *)replacementString;
+ (NSTextCheckingResult)correctionCheckingResultWithRange:(NSRange)range replacementString:(NSString *)replacementString alternativeStrings:(NSArray *)alternativeStrings;
+ (NSTextCheckingResult)dashCheckingResultWithRange:(NSRange)range replacementString:(NSString *)replacementString;
+ (NSTextCheckingResult)dateCheckingResultWithRange:(NSRange)range date:(NSDate *)date;
+ (NSTextCheckingResult)dateCheckingResultWithRange:(NSRange)range date:(NSDate *)date timeZone:(NSTimeZone *)timeZone duration:(NSTimeInterval)duration;
+ (NSTextCheckingResult)grammarCheckingResultWithRange:(NSRange)range details:(NSArray *)details;
+ (NSTextCheckingResult)linkCheckingResultWithRange:(NSRange)range URL:(NSURL *)url;
+ (NSTextCheckingResult)orthographyCheckingResultWithRange:(NSRange)range orthography:(NSOrthography *)orthography;
+ (NSTextCheckingResult)phoneNumberCheckingResultWithRange:(NSRange)range phoneNumber:(NSString *)phoneNumber;
+ (NSTextCheckingResult)quoteCheckingResultWithRange:(NSRange)range replacementString:(NSString *)replacementString;
+ (NSTextCheckingResult)regularExpressionCheckingResultWithRanges:(NSRangePointer)ranges count:(NSUInteger)count regularExpression:(NSRegularExpression *)regularExpression;
+ (NSTextCheckingResult)replacementCheckingResultWithRange:(NSRange)range replacementString:(NSString *)replacementString;
+ (NSTextCheckingResult)spellCheckingResultWithRange:(NSRange)range;
+ (NSTextCheckingResult)transitInformationCheckingResultWithRange:(NSRange)range components:(NSDictionary *)components;
+ (void)initialize;
- (BOOL)_adjustRangesWithOffset:(int64_t)a3;
- (BOOL)timeIsApproximate;
- (BOOL)timeIsPast;
- (BOOL)timeIsSignificant;
- (NSArray)alternativeStrings;
- (NSArray)grammarDetails;
- (NSDate)date;
- (NSDictionary)components;
- (NSOrthography)orthography;
- (NSRange)range;
- (NSRange)rangeAtIndex:(NSUInteger)idx;
- (NSRange)rangeWithName:(NSString *)name;
- (NSRegularExpression)regularExpression;
- (NSString)phoneNumber;
- (NSString)replacementString;
- (NSTextCheckingResult)resultByAdjustingRangesWithOffset:(NSInteger)offset;
- (NSTextCheckingType)resultType;
- (NSTimeInterval)duration;
- (NSTimeZone)timeZone;
- (NSUInteger)numberOfRanges;
- (NSURL)URL;
- (_NSRange)decodeRangeWithCoder:(id)a3;
- (id)description;
- (id)leadingText;
- (id)referenceDate;
- (id)trailingText;
- (void)encodeRangeWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)underlyingResult;
@end

@implementation NSTextCheckingResult

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    [a1 setVersion:1];
  }
}

- (id)description
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v5.receiver = self;
  v5.super_class = (Class)NSTextCheckingResult;
  id v3 = [(NSTextCheckingResult *)&v5 description];
  v7.location = [(NSTextCheckingResult *)self range];
  return +[NSString stringWithFormat:@"%@%@", v3, NSStringFromRange(v7)];
}

- (void)encodeWithCoder:(id)a3
{
  objc_super v5 = NSClassFromString((NSString *)@"NSTextCheckingResult");

  NSRequestConcreteImplementation((uint64_t)self, a2, v5);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeRangeWithCoder:(id)a3
{
  v8[1] = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [(NSTextCheckingResult *)self range];
  uint64_t v6 = v5;
  if ([a3 allowsKeyedCoding])
  {
    [a3 encodeInteger:v4 forKey:@"NSRangeLocation"];
    [a3 encodeInteger:v6 forKey:@"NSRangeLength"];
  }
  else
  {
    uint64_t v7 = v6;
    v8[0] = v4;
    objc_msgSend(a3, "encodeValuesOfObjCTypes:", "QQ", v8, &v7);
  }
}

- (_NSRange)decodeRangeWithCoder:(id)a3
{
  v8[1] = *MEMORY[0x1E4F143B8];
  if ([a3 allowsKeyedCoding])
  {
    uint64_t v4 = [a3 decodeIntegerForKey:@"NSRangeLocation"];
    NSUInteger v5 = [a3 decodeIntegerForKey:@"NSRangeLength"];
  }
  else
  {
    NSUInteger v7 = 0;
    v8[0] = 0;
    objc_msgSend(a3, "decodeValuesOfObjCTypes:", "QQ", v8, &v7);
    NSUInteger v5 = v7;
    uint64_t v4 = v8[0];
  }
  NSUInteger v6 = v4;
  result.length = v5;
  result.location = v6;
  return result;
}

- (NSTextCheckingType)resultType
{
  uint64_t v4 = NSClassFromString((NSString *)@"NSTextCheckingResult");
  NSRequestConcreteImplementation((uint64_t)self, a2, v4);
}

- (NSRange)range
{
  uint64_t v4 = NSClassFromString((NSString *)@"NSTextCheckingResult");
  NSRequestConcreteImplementation((uint64_t)self, a2, v4);
}

- (NSTextCheckingResult)resultByAdjustingRangesWithOffset:(NSInteger)offset
{
  NSUInteger v5 = NSClassFromString((NSString *)@"NSTextCheckingResult");
  NSRequestConcreteImplementation((uint64_t)self, a2, v5);
}

- (BOOL)_adjustRangesWithOffset:(int64_t)a3
{
  return 0;
}

- (NSUInteger)numberOfRanges
{
  return 1;
}

- (NSRange)rangeAtIndex:(NSUInteger)idx
{
  NSUInteger v6 = [(NSTextCheckingResult *)self numberOfRanges];
  if (v6 <= idx)
  {
    v9 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C4A8], +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@: range index (%lu) >= number of ranges (%lu)", _NSFullMethodName((objc_class *)self, a2), idx, v6), 0 reason userInfo];
    objc_exception_throw(v9);
  }

  NSUInteger v7 = [(NSTextCheckingResult *)self range];
  result.length = v8;
  result.location = v7;
  return result;
}

- (NSRange)rangeWithName:(NSString *)name
{
  NSUInteger v3 = 0x7FFFFFFFFFFFFFFFLL;
  NSUInteger v4 = 0;
  result.length = v4;
  result.location = v3;
  return result;
}

- (NSOrthography)orthography
{
  return 0;
}

- (NSArray)grammarDetails
{
  return 0;
}

- (NSDate)date
{
  return 0;
}

- (NSTimeZone)timeZone
{
  return 0;
}

- (NSTimeInterval)duration
{
  return 0.0;
}

- (id)referenceDate
{
  return 0;
}

- (id)leadingText
{
  return 0;
}

- (id)trailingText
{
  return 0;
}

- (NSDictionary)components
{
  return 0;
}

- (NSURL)URL
{
  return 0;
}

- (NSString)replacementString
{
  return 0;
}

- (NSArray)alternativeStrings
{
  return 0;
}

- (NSRegularExpression)regularExpression
{
  return 0;
}

- (NSString)phoneNumber
{
  return 0;
}

- (void)underlyingResult
{
  return 0;
}

- (BOOL)timeIsSignificant
{
  return 0;
}

- (BOOL)timeIsApproximate
{
  return 0;
}

- (BOOL)timeIsPast
{
  return 0;
}

+ (NSTextCheckingResult)orthographyCheckingResultWithRange:(NSRange)range orthography:(NSOrthography *)orthography
{
  NSUInteger v4 = -[NSOrthographyCheckingResult initWithRange:orthography:]([NSOrthographyCheckingResult alloc], "initWithRange:orthography:", range.location, range.length, orthography);

  return (NSTextCheckingResult *)v4;
}

+ (NSTextCheckingResult)spellCheckingResultWithRange:(NSRange)range
{
  NSUInteger v3 = -[NSSpellCheckingResult initWithRange:]([NSSpellCheckingResult alloc], "initWithRange:", range.location, range.length);

  return (NSTextCheckingResult *)v3;
}

+ (NSTextCheckingResult)grammarCheckingResultWithRange:(NSRange)range details:(NSArray *)details
{
  NSUInteger v4 = -[NSGrammarCheckingResult initWithRange:details:]([NSGrammarCheckingResult alloc], "initWithRange:details:", range.location, range.length, details);

  return (NSTextCheckingResult *)v4;
}

+ (NSTextCheckingResult)dateCheckingResultWithRange:(NSRange)range date:(NSDate *)date
{
  NSUInteger v4 = -[NSDateCheckingResult initWithRange:date:]([NSDateCheckingResult alloc], "initWithRange:date:", range.location, range.length, date);

  return (NSTextCheckingResult *)v4;
}

+ (NSTextCheckingResult)dateCheckingResultWithRange:(NSRange)range date:(NSDate *)date timeZone:(NSTimeZone *)timeZone duration:(NSTimeInterval)duration
{
  NSUInteger v6 = -[NSDateCheckingResult initWithRange:date:timeZone:duration:]([NSDateCheckingResult alloc], "initWithRange:date:timeZone:duration:", range.location, range.length, date, timeZone, duration);

  return (NSTextCheckingResult *)v6;
}

+ (NSTextCheckingResult)addressCheckingResultWithRange:(NSRange)range components:(NSDictionary *)components
{
  NSUInteger v4 = -[NSAddressCheckingResult initWithRange:components:]([NSAddressCheckingResult alloc], "initWithRange:components:", range.location, range.length, components);

  return (NSTextCheckingResult *)v4;
}

+ (NSTextCheckingResult)linkCheckingResultWithRange:(NSRange)range URL:(NSURL *)url
{
  NSUInteger v4 = -[NSLinkCheckingResult initWithRange:URL:]([NSLinkCheckingResult alloc], "initWithRange:URL:", range.location, range.length, url);

  return (NSTextCheckingResult *)v4;
}

+ (NSTextCheckingResult)quoteCheckingResultWithRange:(NSRange)range replacementString:(NSString *)replacementString
{
  NSUInteger v4 = -[NSSubstitutionCheckingResult initWithRange:replacementString:]([NSQuoteCheckingResult alloc], "initWithRange:replacementString:", range.location, range.length, replacementString);

  return (NSTextCheckingResult *)v4;
}

+ (NSTextCheckingResult)dashCheckingResultWithRange:(NSRange)range replacementString:(NSString *)replacementString
{
  NSUInteger v4 = -[NSSubstitutionCheckingResult initWithRange:replacementString:]([NSDashCheckingResult alloc], "initWithRange:replacementString:", range.location, range.length, replacementString);

  return (NSTextCheckingResult *)v4;
}

+ (NSTextCheckingResult)replacementCheckingResultWithRange:(NSRange)range replacementString:(NSString *)replacementString
{
  NSUInteger v4 = -[NSSubstitutionCheckingResult initWithRange:replacementString:]([NSReplacementCheckingResult alloc], "initWithRange:replacementString:", range.location, range.length, replacementString);

  return (NSTextCheckingResult *)v4;
}

+ (NSTextCheckingResult)correctionCheckingResultWithRange:(NSRange)range replacementString:(NSString *)replacementString
{
  NSUInteger v4 = -[NSSubstitutionCheckingResult initWithRange:replacementString:]([NSCorrectionCheckingResult alloc], "initWithRange:replacementString:", range.location, range.length, replacementString);

  return (NSTextCheckingResult *)v4;
}

+ (NSTextCheckingResult)correctionCheckingResultWithRange:(NSRange)range replacementString:(NSString *)replacementString alternativeStrings:(NSArray *)alternativeStrings
{
  NSUInteger v5 = -[NSCorrectionCheckingResult initWithRange:replacementString:alternativeStrings:]([NSCorrectionCheckingResult alloc], "initWithRange:replacementString:alternativeStrings:", range.location, range.length, replacementString, alternativeStrings);

  return (NSTextCheckingResult *)v5;
}

+ (NSTextCheckingResult)regularExpressionCheckingResultWithRanges:(NSRangePointer)ranges count:(NSUInteger)count regularExpression:(NSRegularExpression *)regularExpression
{
  NSUInteger v5 = off_1E51F3C78;
  if ((count & 0xFFFFFFFFFFFFFFFCLL) != 4) {
    NSUInteger v5 = off_1E51F3AF8;
  }
  if (count - 1 >= 3) {
    NSUInteger v6 = (Class *)v5;
  }
  else {
    NSUInteger v6 = (Class *)off_1E51F42A0;
  }
  NSUInteger v7 = (void *)[objc_alloc(*v6) initWithRanges:ranges count:count regularExpression:regularExpression];

  return (NSTextCheckingResult *)v7;
}

+ (NSTextCheckingResult)phoneNumberCheckingResultWithRange:(NSRange)range phoneNumber:(NSString *)phoneNumber
{
  NSUInteger v4 = -[NSPhoneNumberCheckingResult initWithRange:phoneNumber:]([NSPhoneNumberCheckingResult alloc], "initWithRange:phoneNumber:", range.location, range.length, phoneNumber);

  return (NSTextCheckingResult *)v4;
}

+ (NSTextCheckingResult)transitInformationCheckingResultWithRange:(NSRange)range components:(NSDictionary *)components
{
  NSUInteger v4 = -[NSTransitInformationCheckingResult initWithRange:components:]([NSTransitInformationCheckingResult alloc], "initWithRange:components:", range.location, range.length, components);

  return (NSTextCheckingResult *)v4;
}

@end