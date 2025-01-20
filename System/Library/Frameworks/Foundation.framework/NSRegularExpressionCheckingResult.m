@interface NSRegularExpressionCheckingResult
+ (BOOL)supportsSecureCoding;
- (NSArray)rangeArray;
- (NSRegularExpression)regularExpression;
- (NSRegularExpressionCheckingResult)initWithCoder:(id)a3;
- (NSRegularExpressionCheckingResult)initWithRangeArray:(id)a3 regularExpression:(id)a4;
- (NSRegularExpressionCheckingResult)initWithRanges:(_NSRange *)a3 count:(unint64_t)a4 regularExpression:(id)a5;
- (_NSRange)rangeWithName:(id)a3;
- (id)description;
- (id)resultByAdjustingRangesWithOffset:(int64_t)a3;
- (unint64_t)resultType;
- (void)encodeWithCoder:(id)a3;
@end

@implementation NSRegularExpressionCheckingResult

- (NSRegularExpressionCheckingResult)initWithRanges:(_NSRange *)a3 count:(unint64_t)a4 regularExpression:(id)a5
{
  v7 = NSClassFromString((NSString *)@"NSRegularExpressionCheckingResult");
  NSRequestConcreteImplementation((uint64_t)self, a2, v7);
}

- (NSRegularExpressionCheckingResult)initWithRangeArray:(id)a3 regularExpression:(id)a4
{
  v6 = NSClassFromString((NSString *)@"NSRegularExpressionCheckingResult");
  NSRequestConcreteImplementation((uint64_t)self, a2, v6);
}

- (NSRegularExpression)regularExpression
{
  return 0;
}

- (NSArray)rangeArray
{
  return 0;
}

- (_NSRange)rangeWithName:(id)a3
{
  v5 = [(NSRegularExpressionCheckingResult *)self regularExpression];
  if (v5
    && (v6 = v5,
        NSUInteger v7 = [(NSTextCheckingResult *)self numberOfRanges],
        unint64_t v8 = [(NSRegularExpression *)v6 _captureGroupNumberWithName:a3],
        v8 < v7))
  {
    NSUInteger v9 = [(NSTextCheckingResult *)self rangeAtIndex:v8];
  }
  else
  {
    NSUInteger v10 = 0;
    NSUInteger v9 = 0x7FFFFFFFFFFFFFFFLL;
  }
  result.length = v10;
  result.location = v9;
  return result;
}

- (id)description
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  v3.receiver = self;
  v3.super_class = (Class)NSRegularExpressionCheckingResult;
  return +[NSString stringWithFormat:@"%@{%@}", [(NSTextCheckingResult *)&v3 description], [(NSRegularExpressionCheckingResult *)self regularExpression]];
}

- (void)encodeWithCoder:(id)a3
{
  v5 = [(NSRegularExpressionCheckingResult *)self regularExpression];
  v6 = [(NSRegularExpressionCheckingResult *)self rangeArray];
  if ([a3 allowsKeyedCoding])
  {
    [(NSTextCheckingResult *)self encodeRangeWithCoder:a3];
    [a3 encodeObject:v5 forKey:@"NSRegularExpression"];
    [a3 encodeObject:v6 forKey:@"NSRangeArray"];
  }
  else
  {
    [a3 encodeObject:v5];
    [a3 encodeObject:v6];
  }
}

- (NSRegularExpressionCheckingResult)initWithCoder:(id)a3
{
  if ([a3 allowsKeyedCoding])
  {
    uint64_t v6 = [a3 decodeObjectOfClass:objc_opt_class() forKey:@"NSRegularExpression"];
    NSUInteger v7 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v7, "setWithObjects:", v8, objc_opt_class(), 0), @"NSRangeArray");
  }
  else
  {
    uint64_t v10 = [a3 versionForClassName:@"NSTextCheckingResult"];
    if (v10 != 1)
    {
      uint64_t v12 = v10;
      v13 = _NSFullMethodName((objc_class *)self, a2);
      NSLog((NSString *)@"%@: class version %ld cannot read instances archived with version %ld", v13, 1, v12);
      [(NSRegularExpressionCheckingResult *)self dealloc];
      return 0;
    }
    uint64_t v6 = [a3 decodeObject];
    uint64_t v9 = [a3 decodeObject];
  }

  return [(NSRegularExpressionCheckingResult *)self initWithRangeArray:v9 regularExpression:v6];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (unint64_t)resultType
{
  return 1024;
}

- (id)resultByAdjustingRangesWithOffset:(int64_t)a3
{
  uint64_t v6 = [(NSRegularExpressionCheckingResult *)self rangeArray];
  NSUInteger v7 = (void *)[MEMORY[0x1E4F1CA48] array];
  NSUInteger v8 = [(NSTextCheckingResult *)self numberOfRanges];
  if (v8)
  {
    NSUInteger v9 = v8;
    for (uint64_t i = 0; i != v9; ++i)
    {
      unint64_t v11 = objc_msgSend(-[NSArray objectAtIndex:](v6, "objectAtIndex:", i), "rangeValue");
      uint64_t v13 = 0x7FFFFFFFFFFFFFFFLL;
      if (v11 != 0x7FFFFFFFFFFFFFFFLL)
      {
        if (a3 < 0 && v11 < -a3)
        {
          NSUInteger v16 = v11;
          v17 = (objc_class *)self;
          NSUInteger v18 = v12;
          v19 = _NSFullMethodName(v17, a2);
          v22.location = v16;
          v22.length = v18;
          v20 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@: %ld invalid offset for range %@", v19, a3, NSStringFromRange(v22)), 0 reason userInfo];
          objc_exception_throw(v20);
        }
        uint64_t v13 = v11 + a3;
      }
      objc_msgSend(v7, "addObject:", +[NSValue valueWithRange:](NSValue, "valueWithRange:", v13, v12));
    }
  }
  v14 = objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithRangeArray:regularExpression:", v7, -[NSRegularExpressionCheckingResult regularExpression](self, "regularExpression"));

  return v14;
}

@end