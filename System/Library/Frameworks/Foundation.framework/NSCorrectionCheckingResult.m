@interface NSCorrectionCheckingResult
+ (BOOL)supportsSecureCoding;
- (NSCorrectionCheckingResult)initWithCoder:(id)a3;
- (NSCorrectionCheckingResult)initWithRange:(_NSRange)a3 replacementString:(id)a4 alternativeStrings:(id)a5;
- (id)alternativeStrings;
- (id)description;
- (id)resultByAdjustingRangesWithOffset:(int64_t)a3;
- (unint64_t)resultType;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation NSCorrectionCheckingResult

- (NSCorrectionCheckingResult)initWithRange:(_NSRange)a3 replacementString:(id)a4 alternativeStrings:(id)a5
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v8.receiver = self;
  v8.super_class = (Class)NSCorrectionCheckingResult;
  v6 = -[NSSubstitutionCheckingResult initWithRange:replacementString:](&v8, sel_initWithRange_replacementString_, a3.location, a3.length, a4);
  if (v6) {
    v6->_alternativeStrings = (NSArray *)[a5 copy];
  }
  return v6;
}

- (id)alternativeStrings
{
  return self->_alternativeStrings;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];

  v3.receiver = self;
  v3.super_class = (Class)NSCorrectionCheckingResult;
  [(NSSubstitutionCheckingResult *)&v3 dealloc];
}

- (id)description
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  v3.receiver = self;
  v3.super_class = (Class)NSCorrectionCheckingResult;
  return +[NSString stringWithFormat:@"%@{%@}", [(NSSubstitutionCheckingResult *)&v3 description], [(NSCorrectionCheckingResult *)self alternativeStrings]];
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = [(NSSubstitutionCheckingResult *)self replacementString];
  id v6 = [(NSCorrectionCheckingResult *)self alternativeStrings];
  char v7 = [a3 allowsKeyedCoding];
  [(NSTextCheckingResult *)self encodeRangeWithCoder:a3];
  if (v7)
  {
    [a3 encodeObject:v5 forKey:@"NSReplacementString"];
    [a3 encodeObject:v6 forKey:@"NSAlternativeStrings"];
  }
  else
  {
    [a3 encodeObject:v5];
  }
}

- (NSCorrectionCheckingResult)initWithCoder:(id)a3
{
  if ([a3 allowsKeyedCoding])
  {
    uint64_t v6 = [(NSTextCheckingResult *)self decodeRangeWithCoder:a3];
    uint64_t v8 = v7;
    uint64_t v9 = [a3 decodeObjectOfClass:objc_opt_class() forKey:@"NSReplacementString"];
    v10 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v11 = objc_opt_class();
    uint64_t v12 = objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v10, "setWithObjects:", v11, objc_opt_class(), 0), @"NSAlternativeStrings");
  }
  else
  {
    uint64_t v13 = [a3 versionForClassName:@"NSTextCheckingResult"];
    if (v13 != 1)
    {
      uint64_t v16 = v13;
      v17 = _NSFullMethodName((objc_class *)self, a2);
      NSLog((NSString *)@"%@: class version %ld cannot read instances archived with version %ld", v17, 1, v16);
      [(NSCorrectionCheckingResult *)self dealloc];
      return 0;
    }
    uint64_t v6 = [(NSTextCheckingResult *)self decodeRangeWithCoder:a3];
    uint64_t v8 = v14;
    uint64_t v9 = [a3 decodeObject];
    uint64_t v12 = 0;
  }

  return -[NSCorrectionCheckingResult initWithRange:replacementString:alternativeStrings:](self, "initWithRange:replacementString:alternativeStrings:", v6, v8, v9, v12);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)resultByAdjustingRangesWithOffset:(int64_t)a3
{
  unint64_t v6 = [(NSSubstitutionCheckingResult *)self range];
  NSUInteger v8 = v7;
  uint64_t v9 = 0x7FFFFFFFFFFFFFFFLL;
  if (v6 != 0x7FFFFFFFFFFFFFFFLL)
  {
    if (a3 < 0 && v6 < -a3)
    {
      NSUInteger v12 = v6;
      uint64_t v13 = _NSFullMethodName((objc_class *)self, a2);
      v16.location = v12;
      v16.length = v8;
      uint64_t v14 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@: %ld invalid offset for range %@", v13, a3, NSStringFromRange(v16)), 0 reason userInfo];
      objc_exception_throw(v14);
    }
    uint64_t v9 = v6 + a3;
  }
  v10 = objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithRange:replacementString:alternativeStrings:", v9, v7, -[NSSubstitutionCheckingResult replacementString](self, "replacementString"), -[NSCorrectionCheckingResult alternativeStrings](self, "alternativeStrings"));

  return v10;
}

- (unint64_t)resultType
{
  return 512;
}

@end