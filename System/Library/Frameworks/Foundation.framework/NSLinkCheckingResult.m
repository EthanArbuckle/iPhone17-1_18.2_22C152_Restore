@interface NSLinkCheckingResult
+ (BOOL)supportsSecureCoding;
- (BOOL)_adjustRangesWithOffset:(int64_t)a3;
- (NSLinkCheckingResult)initWithCoder:(id)a3;
- (NSLinkCheckingResult)initWithRange:(_NSRange)a3 URL:(id)a4;
- (_NSRange)range;
- (id)URL;
- (id)description;
- (id)resultByAdjustingRangesWithOffset:(int64_t)a3;
- (unint64_t)resultType;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation NSLinkCheckingResult

- (NSLinkCheckingResult)initWithRange:(_NSRange)a3 URL:(id)a4
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v10.receiver = self;
  v10.super_class = (Class)NSLinkCheckingResult;
  v7 = [(NSLinkCheckingResult *)&v10 init];
  v8 = v7;
  if (v7)
  {
    v7->_range.NSUInteger location = location;
    v7->_range.NSUInteger length = length;
    v7->_url = (NSURL *)[a4 copy];
  }
  return v8;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];

  v3.receiver = self;
  v3.super_class = (Class)NSLinkCheckingResult;
  [(NSLinkCheckingResult *)&v3 dealloc];
}

- (id)description
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  v3.receiver = self;
  v3.super_class = (Class)NSLinkCheckingResult;
  return +[NSString stringWithFormat:@"%@{%@}", [(NSTextCheckingResult *)&v3 description], [(NSLinkCheckingResult *)self URL]];
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = [(NSLinkCheckingResult *)self URL];
  char v6 = [a3 allowsKeyedCoding];
  [(NSTextCheckingResult *)self encodeRangeWithCoder:a3];
  if (v6)
  {
    [a3 encodeObject:v5 forKey:@"NSURL"];
  }
  else
  {
    [a3 encodeObject:v5];
  }
}

- (NSLinkCheckingResult)initWithCoder:(id)a3
{
  if ([a3 allowsKeyedCoding])
  {
    uint64_t v6 = [(NSTextCheckingResult *)self decodeRangeWithCoder:a3];
    uint64_t v8 = v7;
    uint64_t v9 = [a3 decodeObjectOfClass:objc_opt_class() forKey:@"NSURL"];
  }
  else
  {
    uint64_t v10 = [a3 versionForClassName:@"NSTextCheckingResult"];
    if (v10 != 1)
    {
      uint64_t v13 = v10;
      v14 = _NSFullMethodName((objc_class *)self, a2);
      NSLog((NSString *)@"%@: class version %ld cannot read instances archived with version %ld", v14, 1, v13);
      [(NSLinkCheckingResult *)self dealloc];
      return 0;
    }
    uint64_t v6 = [(NSTextCheckingResult *)self decodeRangeWithCoder:a3];
    uint64_t v8 = v11;
    uint64_t v9 = [a3 decodeObject];
  }

  return -[NSLinkCheckingResult initWithRange:URL:](self, "initWithRange:URL:", v6, v8, v9);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (unint64_t)resultType
{
  return 32;
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
  unint64_t v6 = [(NSLinkCheckingResult *)self range];
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
  uint64_t v10 = objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithRange:URL:", v9, v7, -[NSLinkCheckingResult URL](self, "URL"));

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

- (id)URL
{
  return self->_url;
}

@end