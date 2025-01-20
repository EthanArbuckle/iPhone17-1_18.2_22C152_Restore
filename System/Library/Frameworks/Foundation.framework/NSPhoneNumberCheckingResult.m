@interface NSPhoneNumberCheckingResult
+ (BOOL)supportsSecureCoding;
- (BOOL)_adjustRangesWithOffset:(int64_t)a3;
- (NSPhoneNumberCheckingResult)initWithCoder:(id)a3;
- (NSPhoneNumberCheckingResult)initWithRange:(_NSRange)a3 phoneNumber:(id)a4;
- (NSPhoneNumberCheckingResult)initWithRange:(_NSRange)a3 phoneNumber:(id)a4 underlyingResult:(void *)a5;
- (_NSRange)range;
- (id)description;
- (id)phoneNumber;
- (id)resultByAdjustingRangesWithOffset:(int64_t)a3;
- (unint64_t)resultType;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)underlyingResult;
@end

@implementation NSPhoneNumberCheckingResult

- (NSPhoneNumberCheckingResult)initWithRange:(_NSRange)a3 phoneNumber:(id)a4 underlyingResult:(void *)a5
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v12.receiver = self;
  v12.super_class = (Class)NSPhoneNumberCheckingResult;
  v9 = [(NSPhoneNumberCheckingResult *)&v12 init];
  v10 = v9;
  if (v9)
  {
    v9->_range.NSUInteger location = location;
    v9->_range.NSUInteger length = length;
    v9->_phoneNumber = (NSString *)[a4 copy];
    v10->_underlyingResult = a5;
  }
  return v10;
}

- (NSPhoneNumberCheckingResult)initWithRange:(_NSRange)a3 phoneNumber:(id)a4
{
  return -[NSPhoneNumberCheckingResult initWithRange:phoneNumber:underlyingResult:](self, "initWithRange:phoneNumber:underlyingResult:", a3.location, a3.length, a4, 0);
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];

  v3.receiver = self;
  v3.super_class = (Class)NSPhoneNumberCheckingResult;
  [(NSPhoneNumberCheckingResult *)&v3 dealloc];
}

- (id)description
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  v3.receiver = self;
  v3.super_class = (Class)NSPhoneNumberCheckingResult;
  return +[NSString stringWithFormat:@"%@{%@}", [(NSTextCheckingResult *)&v3 description], [(NSPhoneNumberCheckingResult *)self phoneNumber]];
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = [(NSPhoneNumberCheckingResult *)self phoneNumber];
  char v6 = [a3 allowsKeyedCoding];
  [(NSTextCheckingResult *)self encodeRangeWithCoder:a3];
  if (v6)
  {
    [a3 encodeObject:v5 forKey:@"NSPhoneNumber"];
  }
  else
  {
    [a3 encodeObject:v5];
  }
}

- (NSPhoneNumberCheckingResult)initWithCoder:(id)a3
{
  if ([a3 allowsKeyedCoding])
  {
    uint64_t v6 = [(NSTextCheckingResult *)self decodeRangeWithCoder:a3];
    uint64_t v8 = v7;
    uint64_t v9 = [a3 decodeObjectOfClass:objc_opt_class() forKey:@"NSPhoneNumber"];
  }
  else
  {
    uint64_t v10 = [a3 versionForClassName:@"NSTextCheckingResult"];
    if (v10 != 1)
    {
      uint64_t v13 = v10;
      v14 = _NSFullMethodName((objc_class *)self, a2);
      NSLog((NSString *)@"%@: class version %ld cannot read instances archived with version %ld", v14, 1, v13);
      [(NSPhoneNumberCheckingResult *)self dealloc];
      return 0;
    }
    uint64_t v6 = [(NSTextCheckingResult *)self decodeRangeWithCoder:a3];
    uint64_t v8 = v11;
    uint64_t v9 = [a3 decodeObject];
  }

  return -[NSPhoneNumberCheckingResult initWithRange:phoneNumber:](self, "initWithRange:phoneNumber:", v6, v8, v9);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (unint64_t)resultType
{
  return 2048;
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
  unint64_t v6 = [(NSPhoneNumberCheckingResult *)self range];
  NSUInteger v8 = v7;
  uint64_t v9 = 0x7FFFFFFFFFFFFFFFLL;
  if (v6 != 0x7FFFFFFFFFFFFFFFLL)
  {
    if (a3 < 0 && v6 < -a3)
    {
      NSUInteger v12 = v6;
      uint64_t v13 = _NSFullMethodName((objc_class *)self, a2);
      v16.NSUInteger location = v12;
      v16.NSUInteger length = v8;
      v14 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@: %ld invalid offset for range %@", v13, a3, NSStringFromRange(v16)), 0 reason userInfo];
      objc_exception_throw(v14);
    }
    uint64_t v9 = v6 + a3;
  }
  uint64_t v10 = objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithRange:phoneNumber:", v9, v7, -[NSPhoneNumberCheckingResult phoneNumber](self, "phoneNumber"));

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

- (id)phoneNumber
{
  return self->_phoneNumber;
}

- (void)underlyingResult
{
  return self->_underlyingResult;
}

@end