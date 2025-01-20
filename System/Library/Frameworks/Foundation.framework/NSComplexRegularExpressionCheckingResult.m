@interface NSComplexRegularExpressionCheckingResult
- (BOOL)_adjustRangesWithOffset:(int64_t)a3;
- (NSComplexRegularExpressionCheckingResult)initWithRangeArray:(id)a3 regularExpression:(id)a4;
- (NSComplexRegularExpressionCheckingResult)initWithRanges:(_NSRange *)a3 count:(unint64_t)a4 regularExpression:(id)a5;
- (_NSRange)range;
- (_NSRange)rangeAtIndex:(unint64_t)a3;
- (id)rangeArray;
- (id)regularExpression;
- (unint64_t)numberOfRanges;
- (void)dealloc;
@end

@implementation NSComplexRegularExpressionCheckingResult

- (unint64_t)numberOfRanges
{
  return [(NSArray *)self->_rangeArray count];
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];

  v3.receiver = self;
  v3.super_class = (Class)NSComplexRegularExpressionCheckingResult;
  [(NSComplexRegularExpressionCheckingResult *)&v3 dealloc];
}

- (_NSRange)rangeAtIndex:(unint64_t)a3
{
  id v3 = [(NSArray *)self->_rangeArray objectAtIndex:a3];

  NSUInteger v4 = [v3 rangeValue];
  result.length = v5;
  result.location = v4;
  return result;
}

- (NSComplexRegularExpressionCheckingResult)initWithRangeArray:(id)a3 regularExpression:(id)a4
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (![a3 count])
  {
    v10 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@: must have at least one range", _NSFullMethodName((objc_class *)self, a2)), 0 reason userInfo];
    objc_exception_throw(v10);
  }
  v11.receiver = self;
  v11.super_class = (Class)NSComplexRegularExpressionCheckingResult;
  v8 = [(NSComplexRegularExpressionCheckingResult *)&v11 init];
  if (v8)
  {
    v8->_regularExpression = (NSRegularExpression *)[a4 copy];
    v8->_rangeArray = (NSArray *)[a3 copy];
  }
  return v8;
}

- (NSComplexRegularExpressionCheckingResult)initWithRanges:(_NSRange *)a3 count:(unint64_t)a4 regularExpression:(id)a5
{
  v9 = (void *)[MEMORY[0x1E4F1CA48] array];
  if (a4)
  {
    p_length = &a3->length;
    do
    {
      objc_msgSend(v9, "addObject:", +[NSValue valueWithRange:](NSValue, "valueWithRange:", *(p_length - 1), *p_length));
      p_length += 2;
      --a4;
    }
    while (a4);
  }

  return [(NSComplexRegularExpressionCheckingResult *)self initWithRangeArray:v9 regularExpression:a5];
}

- (id)regularExpression
{
  return self->_regularExpression;
}

- (_NSRange)range
{
  id v2 = [(NSArray *)self->_rangeArray objectAtIndex:0];

  NSUInteger v3 = [v2 rangeValue];
  result.length = v4;
  result.location = v3;
  return result;
}

- (BOOL)_adjustRangesWithOffset:(int64_t)a3
{
  v6 = (void *)[MEMORY[0x1E4F1CA48] array];
  unint64_t v7 = [(NSComplexRegularExpressionCheckingResult *)self numberOfRanges];
  if (v7)
  {
    unint64_t v8 = v7;
    for (uint64_t i = 0; i != v8; ++i)
    {
      unint64_t v10 = [(NSComplexRegularExpressionCheckingResult *)self rangeAtIndex:i];
      if (v10 != 0x7FFFFFFFFFFFFFFFLL)
      {
        if (a3 < 0 && v10 < -a3)
        {
          NSUInteger v13 = v10;
          v14 = (objc_class *)self;
          NSUInteger v15 = v11;
          v16 = _NSFullMethodName(v14, a2);
          v18.location = v13;
          v18.length = v15;
          v17 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@: %ld invalid offset for range %@", v16, a3, NSStringFromRange(v18)), 0 reason userInfo];
          objc_exception_throw(v17);
        }
        objc_msgSend(v6, "addObject:", +[NSValue valueWithRange:](NSValue, "valueWithRange:", v10 + a3, v11));
      }
    }
  }

  self->_rangeArray = (NSArray *)v6;
  return 1;
}

- (id)rangeArray
{
  return self->_rangeArray;
}

@end