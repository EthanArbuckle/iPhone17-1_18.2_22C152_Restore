@interface CNObservedResult
+ (BOOL)rangeWouldOverflowWithTime:(unint64_t)a3 tolerance:(unint64_t)a4;
+ (BOOL)rangeWouldUnderflowWithTime:(unint64_t)a3 tolerance:(unint64_t)a4;
+ (_NSRange)overflowSafeRangeWithTime:(unint64_t)a3 tolerance:(unint64_t)a4;
+ (_NSRange)rangeWithExactTime:(unint64_t)a3;
+ (_NSRange)rangeWithTime:(unint64_t)a3 tolerance:(unint64_t)a4;
+ (_NSRange)underflowSafeRangeWithTime:(unint64_t)a3 tolerance:(unint64_t)a4;
+ (id)completionResultWithTime:(unint64_t)a3;
+ (id)completionResultWithTime:(unint64_t)a3 tolerance:(unint64_t)a4;
+ (id)completionResultWithTimeInterval:(double)a3 tolerance:(double)a4;
+ (id)failureWithError:(id)a3 time:(unint64_t)a4;
+ (id)failureWithError:(id)a3 time:(unint64_t)a4 tolerance:(unint64_t)a5;
+ (id)failureWithError:(id)a3 timeInterval:(double)a4 tolerance:(double)a5;
+ (id)resultWithTime:(unint64_t)a3 tolerance:(unint64_t)a4 value:(id)a5;
+ (id)resultWithTime:(unint64_t)a3 value:(id)a4;
+ (id)resultWithTimeInterval:(double)a3 tolerance:(double)a4 value:(id)a5;
- (BOOL)isEqual:(id)a3;
- (BOOL)isResultEvent;
- (CNObservedResult)initWithValue:(id)a3 time:(unint64_t)a4 tolerance:(unint64_t)a5;
- (_NSRange)timeRange;
- (id)description;
- (id)formattedTimeString;
- (id)logValue;
- (id)value;
- (unint64_t)hash;
- (unint64_t)logTime;
- (unint64_t)time;
- (unint64_t)tolerance;
@end

@implementation CNObservedResult

+ (id)resultWithTime:(unint64_t)a3 value:(id)a4
{
  return (id)[a1 resultWithTime:a3 tolerance:0 value:a4];
}

+ (id)resultWithTime:(unint64_t)a3 tolerance:(unint64_t)a4 value:(id)a5
{
  id v7 = a5;
  v8 = [[CNObservedResult alloc] initWithValue:v7 time:a3 tolerance:a4];

  return v8;
}

+ (id)resultWithTimeInterval:(double)a3 tolerance:(double)a4 value:(id)a5
{
  return (id)[a1 resultWithTime:(unint64_t)((double)0x2710uLL * a3) tolerance:(unint64_t)((double)0x2710uLL * a4) value:a5];
}

+ (id)completionResultWithTime:(unint64_t)a3
{
  return (id)[a1 completionResultWithTime:a3 tolerance:0];
}

+ (id)completionResultWithTime:(unint64_t)a3 tolerance:(unint64_t)a4
{
  v4 = [(CNObservedResult *)[CNObservedCompletionResult alloc] initWithValue:0 time:a3 tolerance:a4];

  return v4;
}

+ (id)completionResultWithTimeInterval:(double)a3 tolerance:(double)a4
{
  return (id)[a1 completionResultWithTime:(unint64_t)((double)0x2710uLL * a3) tolerance:(unint64_t)((double)0x2710uLL * a4)];
}

+ (id)failureWithError:(id)a3 time:(unint64_t)a4
{
  return (id)[a1 failureWithError:a3 time:a4 tolerance:0];
}

+ (id)failureWithError:(id)a3 time:(unint64_t)a4 tolerance:(unint64_t)a5
{
  id v7 = a3;
  v8 = [(CNObservedResult *)[CNObservedFailureResult alloc] initWithValue:v7 time:a4 tolerance:a5];

  return v8;
}

+ (id)failureWithError:(id)a3 timeInterval:(double)a4 tolerance:(double)a5
{
  return (id)[a1 failureWithError:a3 time:(unint64_t)((double)0x2710uLL * a4) tolerance:(unint64_t)((double)0x2710uLL * a5)];
}

- (CNObservedResult)initWithValue:(id)a3 time:(unint64_t)a4 tolerance:(unint64_t)a5
{
  id v9 = a3;
  v14.receiver = self;
  v14.super_class = (Class)CNObservedResult;
  v10 = [(CNObservedResult *)&v14 init];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong(&v10->_value, a3);
    v11->_time = a4;
    v11->_tolerance = a5;
    v12 = v11;
  }

  return v11;
}

- (id)logValue
{
  return self->_value;
}

- (id)formattedTimeString
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F28EE0]);
  [v3 setPaddingPosition:1];
  [v3 setFormatWidth:6];
  v4 = [MEMORY[0x1E4F28E78] stringWithString:@"@ "];
  v5 = [NSNumber numberWithUnsignedInteger:self->_time];
  v6 = [v3 stringFromNumber:v5];
  [v4 appendString:v6];

  if ([(CNObservedResult *)self tolerance])
  {
    id v7 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[CNObservedResult tolerance](self, "tolerance"));
    [v4 appendFormat:@" +/- %@", v7];
  }

  return v4;
}

- (id)description
{
  id v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = [(CNObservedResult *)self formattedTimeString];
  id v7 = [(CNObservedResult *)self logValue];
  v8 = [v3 stringWithFormat:@"<%@ %p: %@ Observed: %@>", v5, self, v6, v7];

  return v8;
}

- (BOOL)isResultEvent
{
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_8;
  }
  v5 = (objc_class *)objc_opt_class();
  v6 = NSStringFromClass(v5);
  id v7 = (objc_class *)objc_opt_class();
  v8 = NSStringFromClass(v7);
  int v9 = [v6 isEqual:v8];

  if (!v9) {
    goto LABEL_8;
  }
  NSUInteger v10 = [(CNObservedResult *)self timeRange];
  NSUInteger v12 = v11;
  v19.location = [v4 timeRange];
  v19.length = v13;
  v18.location = v10;
  v18.length = v12;
  if (NSIntersectionRange(v18, v19).length)
  {
    objc_super v14 = [(CNObservedResult *)self value];
    if (v14 || v4[2])
    {
      v15 = [(CNObservedResult *)self value];
      char v16 = [v15 isEqual:v4[2]];
    }
    else
    {
      char v16 = 1;
    }
  }
  else
  {
LABEL_8:
    char v16 = 0;
  }

  return v16;
}

- (unint64_t)hash
{
  aBlock[4] = self;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __24__CNObservedResult_hash__block_invoke;
  v6[3] = &unk_1E56A0070;
  v6[4] = self;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __24__CNObservedResult_hash__block_invoke_2;
  aBlock[3] = &unk_1E56A0070;
  v2 = _Block_copy(aBlock);
  unint64_t v3 = +[CNHashBuilder hashWithBlocks:](CNHashBuilder, "hashWithBlocks:", v6, v2, 0);

  return v3;
}

unint64_t __24__CNObservedResult_hash__block_invoke()
{
  v0 = (objc_class *)objc_opt_class();
  v1 = NSStringFromClass(v0);
  unint64_t v2 = +[CNHashBuilder objectHash:v1];

  return v2;
}

unint64_t __24__CNObservedResult_hash__block_invoke_2(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) value];
  unint64_t v2 = +[CNHashBuilder objectHash:v1];

  return v2;
}

- (_NSRange)timeRange
{
  unint64_t tolerance = self->_tolerance;
  v4 = objc_opt_class();
  unint64_t time = self->_time;
  if (tolerance)
  {
    unint64_t v6 = self->_tolerance;
    NSUInteger v7 = [v4 rangeWithTime:time tolerance:v6];
  }
  else
  {
    NSUInteger v7 = [v4 rangeWithExactTime:time];
  }
  result.length = v8;
  result.location = v7;
  return result;
}

+ (_NSRange)rangeWithExactTime:(unint64_t)a3
{
  NSUInteger v4 = 1;
  result.length = v4;
  result.location = a3;
  return result;
}

+ (_NSRange)rangeWithTime:(unint64_t)a3 tolerance:(unint64_t)a4
{
  if (objc_msgSend(a1, "rangeWouldUnderflowWithTime:tolerance:"))
  {
    NSUInteger v7 = [a1 underflowSafeRangeWithTime:a3 tolerance:a4];
  }
  else if ([a1 rangeWouldOverflowWithTime:a3 tolerance:a4])
  {
    NSUInteger v7 = [a1 overflowSafeRangeWithTime:a3 tolerance:a4];
  }
  else
  {
    NSUInteger v7 = a3 - a4;
    NSUInteger v8 = (2 * a4) | 1;
  }
  result.length = v8;
  result.location = v7;
  return result;
}

+ (BOOL)rangeWouldUnderflowWithTime:(unint64_t)a3 tolerance:(unint64_t)a4
{
  return a3 < a4;
}

+ (_NSRange)underflowSafeRangeWithTime:(unint64_t)a3 tolerance:(unint64_t)a4
{
  NSUInteger v4 = a4 + a3;
  NSUInteger v5 = 0;
  result.length = v4;
  result.location = v5;
  return result;
}

+ (BOOL)rangeWouldOverflowWithTime:(unint64_t)a3 tolerance:(unint64_t)a4
{
  return -2 - a4 < a3;
}

+ (_NSRange)overflowSafeRangeWithTime:(unint64_t)a3 tolerance:(unint64_t)a4
{
  NSUInteger v4 = a3 - a4;
  NSUInteger v5 = ~a3 + a4;
  result.length = v5;
  result.location = v4;
  return result;
}

- (unint64_t)time
{
  return self->_time;
}

- (id)value
{
  return objc_getProperty(self, a2, 16, 1);
}

- (unint64_t)tolerance
{
  return self->_tolerance;
}

- (unint64_t)logTime
{
  return self->_logTime;
}

- (void).cxx_destruct
{
}

@end