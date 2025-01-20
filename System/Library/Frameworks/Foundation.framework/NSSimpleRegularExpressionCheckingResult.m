@interface NSSimpleRegularExpressionCheckingResult
- (BOOL)_adjustRangesWithOffset:(int64_t)a3;
- (NSSimpleRegularExpressionCheckingResult)initWithRangeArray:(id)a3 regularExpression:(id)a4;
- (NSSimpleRegularExpressionCheckingResult)initWithRanges:(_NSRange *)a3 count:(unint64_t)a4 regularExpression:(id)a5;
- (_NSRange)range;
- (_NSRange)rangeAtIndex:(unint64_t)a3;
- (id)rangeArray;
- (id)regularExpression;
- (unint64_t)numberOfRanges;
- (void)dealloc;
@end

@implementation NSSimpleRegularExpressionCheckingResult

- (NSSimpleRegularExpressionCheckingResult)initWithRanges:(_NSRange *)a3 count:(unint64_t)a4 regularExpression:(id)a5
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (a4 - 4 <= 0xFFFFFFFFFFFFFFFCLL)
  {
    v13 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@: must have 1-3 ranges", _NSFullMethodName((objc_class *)self, a2)), 0 reason userInfo];
    objc_exception_throw(v13);
  }
  v14.receiver = self;
  v14.super_class = (Class)NSSimpleRegularExpressionCheckingResult;
  v8 = [(NSSimpleRegularExpressionCheckingResult *)&v14 init];
  if (v8)
  {
    v8->_regularExpression = (NSRegularExpression *)[a5 copy];
    ranges = v8->_ranges;
    unint64_t v10 = a4;
    do
    {
      _NSRange v11 = *a3++;
      *ranges++ = v11;
      --v10;
    }
    while (v10);
    if (a4 <= 2) {
      memset_pattern16(&v8->_ranges[a4], &unk_182371600, 48 - 16 * a4);
    }
  }
  return v8;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];

  v3.receiver = self;
  v3.super_class = (Class)NSSimpleRegularExpressionCheckingResult;
  [(NSSimpleRegularExpressionCheckingResult *)&v3 dealloc];
}

- (_NSRange)range
{
  ranges = self->_ranges;
  NSUInteger location = self->_ranges[0].location;
  NSUInteger length = ranges->length;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (unint64_t)numberOfRanges
{
  char v2 = 0;
  ranges = self->_ranges;
  uint64_t v4 = 1;
  unint64_t result = 3;
  do
  {
    while (1)
    {
      char v6 = v2;
      if (ranges[v4].location == 0x7FFFFFFFFFFFFFFFLL) {
        break;
      }
      char v2 = 1;
      uint64_t v4 = 2;
      if (v6) {
        return result;
      }
    }
    unint64_t v7 = v4;
    NSUInteger length = ranges[v4].length;
    char v2 = 1;
    uint64_t v4 = 2;
  }
  while (!(v6 & 1 | (length == 0x7FFFFFFFFFFFFFFFLL)));
  if (length == 0x7FFFFFFFFFFFFFFFLL) {
    return v7;
  }
  else {
    return 3;
  }
}

- (NSSimpleRegularExpressionCheckingResult)initWithRangeArray:(id)a3 regularExpression:(id)a4
{
  v15[5] = *MEMORY[0x1E4F143B8];
  unint64_t v7 = [a3 count];
  unint64_t v8 = v7;
  if (v7 >= 3) {
    uint64_t v9 = 3;
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    uint64_t v10 = 0;
    _NSRange v11 = v15;
    do
    {
      *(v11 - 1) = objc_msgSend((id)objc_msgSend(a3, "objectAtIndex:", v10), "rangeValue");
      *_NSRange v11 = v12;
      ++v10;
      v11 += 2;
    }
    while (v9 != v10);
  }
  return [(NSSimpleRegularExpressionCheckingResult *)self initWithRanges:v14 count:v8 regularExpression:a4];
}

- (id)regularExpression
{
  return self->_regularExpression;
}

- (BOOL)_adjustRangesWithOffset:(int64_t)a3
{
  unint64_t v3 = 0;
  for (i = self->_ranges; ; ++i)
  {
    unint64_t location = i->location;
    if (i->location != 0x7FFFFFFFFFFFFFFFLL) {
      break;
    }
    if (v3 > 1 || i->length == 0x7FFFFFFFFFFFFFFFLL) {
      return 1;
    }
LABEL_9:
    ++v3;
  }
  if (a3 < 0 && location < -a3)
  {
    unint64_t v8 = i;
    uint64_t v9 = _NSFullMethodName((objc_class *)self, a2);
    uint64_t v10 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@: %ld invalid offset for range %@", v9, a3, NSStringFromRange(*v8)), 0 reason userInfo];
    objc_exception_throw(v10);
  }
  i->unint64_t location = location + a3;
  if (v3 <= 1) {
    goto LABEL_9;
  }
  return 1;
}

- (_NSRange)rangeAtIndex:(unint64_t)a3
{
  uint64_t length = 0x7FFFFFFFFFFFFFFFLL;
  uint64_t location = 0x7FFFFFFFFFFFFFFFLL;
  if (a3 <= 2)
  {
    v5 = &self->_ranges[a3];
    uint64_t location = v5->location;
    uint64_t length = v5->length;
  }
  if (location == 0x7FFFFFFFFFFFFFFFLL && length == 0x7FFFFFFFFFFFFFFFLL)
  {
    unint64_t v8 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@: index %lu out of range", _NSFullMethodName((objc_class *)self, a2), a3), 0 reason userInfo];
    objc_exception_throw(v8);
  }
  NSUInteger v6 = location;
  NSUInteger v7 = length;
  result.uint64_t length = v7;
  result.uint64_t location = v6;
  return result;
}

- (id)rangeArray
{
  unint64_t v3 = (void *)[MEMORY[0x1E4F1CA48] array];
  uint64_t v4 = 0;
  ranges = self->_ranges;
  do
  {
    if (ranges[v4].location == 0x7FFFFFFFFFFFFFFFLL && ranges[v4].length == 0x7FFFFFFFFFFFFFFFLL) {
      break;
    }
    objc_msgSend(v3, "addObject:", +[NSValue valueWithRange:](NSValue, "valueWithRange:"));
    ++v4;
  }
  while (v4 != 3);
  return v3;
}

@end