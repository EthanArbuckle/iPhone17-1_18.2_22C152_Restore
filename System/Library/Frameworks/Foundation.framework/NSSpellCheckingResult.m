@interface NSSpellCheckingResult
+ (BOOL)supportsSecureCoding;
- (BOOL)_adjustRangesWithOffset:(int64_t)a3;
- (NSSpellCheckingResult)initWithCoder:(id)a3;
- (NSSpellCheckingResult)initWithRange:(_NSRange)a3;
- (_NSRange)range;
- (id)resultByAdjustingRangesWithOffset:(int64_t)a3;
- (unint64_t)resultType;
@end

@implementation NSSpellCheckingResult

- (NSSpellCheckingResult)initWithRange:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v6.receiver = self;
  v6.super_class = (Class)NSSpellCheckingResult;
  result = [(NSSpellCheckingResult *)&v6 init];
  if (result)
  {
    result->_range.NSUInteger location = location;
    result->_range.NSUInteger length = length;
  }
  return result;
}

- (NSSpellCheckingResult)initWithCoder:(id)a3
{
  if (([a3 allowsKeyedCoding] & 1) != 0
    || (uint64_t v6 = [a3 versionForClassName:@"NSTextCheckingResult"], v6 == 1))
  {
    uint64_t v8 = [(NSTextCheckingResult *)self decodeRangeWithCoder:a3];
    return -[NSSpellCheckingResult initWithRange:](self, "initWithRange:", v8, v7);
  }
  else
  {
    uint64_t v10 = v6;
    v11 = _NSFullMethodName((objc_class *)self, a2);
    NSLog((NSString *)@"%@: class version %ld cannot read instances archived with version %ld", v11, 1, v10);
    [(NSSpellCheckingResult *)self dealloc];
    return 0;
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (unint64_t)resultType
{
  return 2;
}

- (_NSRange)range
{
  p_range = &self->_range;
  NSUInteger location = self->_range.location;
  NSUInteger length = p_range->length;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (id)resultByAdjustingRangesWithOffset:(int64_t)a3
{
  unint64_t v6 = [(NSSpellCheckingResult *)self range];
  NSUInteger v8 = v7;
  uint64_t v9 = 0x7FFFFFFFFFFFFFFFLL;
  if (v6 != 0x7FFFFFFFFFFFFFFFLL)
  {
    if (a3 < 0 && v6 < -a3)
    {
      NSUInteger v12 = v6;
      v13 = _NSFullMethodName((objc_class *)self, a2);
      v16.NSUInteger location = v12;
      v16.NSUInteger length = v8;
      v14 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@: %ld invalid offset for range %@", v13, a3, NSStringFromRange(v16)), 0 reason userInfo];
      objc_exception_throw(v14);
    }
    uint64_t v9 = v6 + a3;
  }
  uint64_t v10 = objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithRange:", v9, v7);

  return v10;
}

- (BOOL)_adjustRangesWithOffset:(int64_t)a3
{
  NSUInteger location = self->_range.location;
  if (location != 0x7FFFFFFFFFFFFFFFLL)
  {
    if (a3 < 0 && location < -a3)
    {
      p_range = &self->_range;
      NSUInteger v7 = _NSFullMethodName((objc_class *)self, a2);
      NSUInteger v8 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@: %ld invalid offset for range %@", v7, a3, NSStringFromRange(*p_range)), 0 reason userInfo];
      objc_exception_throw(v8);
    }
    self->_range.NSUInteger location = location + a3;
  }
  return 1;
}

@end