@interface __NSPlaceholderDate
+ (void)initialize;
- (__NSPlaceholderDate)init;
- (__NSPlaceholderDate)initWithTimeIntervalSinceReferenceDate:(double)a3;
- (double)timeIntervalSinceReferenceDate;
- (unint64_t)retainCount;
@end

@implementation __NSPlaceholderDate

- (__NSPlaceholderDate)init
{
  uint64_t v5 = *(void *)off_1ECE0A5B0;
  __tp.tv_sec = 0;
  __tp.tv_nsec = 0;
  clock_gettime(_CLOCK_REALTIME, &__tp);
  return [(__NSPlaceholderDate *)self initWithTimeIntervalSinceReferenceDate:(double)__tp.tv_sec + -978307200.0 + (double)__tp.tv_nsec * 0.000000001];
}

- (__NSPlaceholderDate)initWithTimeIntervalSinceReferenceDate:(double)a3
{
  if (self != (__NSPlaceholderDate *)&___immutablePlaceholderDate) {
    return 0;
  }
  if (a3 == 6.3113904e10)
  {
    result = (__NSPlaceholderDate *)&_NSConstantDateDistantFuture;
    goto LABEL_7;
  }
  if (a3 == -6.31140768e10)
  {
    result = (__NSPlaceholderDate *)&_NSConstantDateDistantPast;
    goto LABEL_7;
  }
  if ((_NSDateTaggedPointersDisabled & 1) == 0)
  {
    double v6 = a3;
    if (a3 == 0.0)
    {
LABEL_19:
      if (decodeTaggedTimeInterval(*(unint64_t *)&v6) != a3) {
        -[__NSPlaceholderDate initWithTimeIntervalSinceReferenceDate:]();
      }
      result = (__NSPlaceholderDate *)((8 * *(void *)&v6) | 0x8000000000000006);
      unint64_t v8 = *(void *)off_1ECE0A6F0 ^ (unint64_t)result;
      if ((~v8 & 0xC000000000000007) != 0) {
        result = (__NSPlaceholderDate *)(v8 & 0xFFFFFFFFFFFFFFF8 | *((unsigned __int8 *)off_1ECE0A6E0 + (v8 & 7)));
      }
LABEL_7:
      if (result) {
        return result;
      }
      goto LABEL_8;
    }
    if (a3 == -0.0)
    {
      double v6 = NAN;
      goto LABEL_19;
    }
    if (a3 == 0.0) {
      -[__NSPlaceholderDate initWithTimeIntervalSinceReferenceDate:]();
    }
    *(void *)&double v6 = *(void *)&a3 & 0xFFFFFFFFFFFFFLL | (*(void *)&a3 >> 63 << 59) | ((unint64_t)(((*(void *)&a3 >> 52) + 17) & 0x7F) << 52);
    if (((uint64_t)((unint64_t)((*(void *)&a3 >> 52) + 17) << 57) >> 57) + 1007 == ((*(void *)&a3 >> 52) & 0x7FFLL)
      && *(void *)&v6 != 0)
    {
      goto LABEL_19;
    }
  }
LABEL_8:
  uint64_t v5 = (objc_class *)self;
  result = (__NSPlaceholderDate *)__CFAllocateObject(v5, 0);
  *(double *)&result[1].super.super.isa = a3;
  return result;
}

+ (void)initialize
{
  if (initialize_static_init != -1) {
    dispatch_once(&initialize_static_init, &__block_literal_global_27);
  }
}

- (unint64_t)retainCount
{
  return -1;
}

- (double)timeIntervalSinceReferenceDate
{
  v4 = __CFLookUpClass("NSDate");
  uint64_t v5 = __CFFullMethodName(v4, (objc_class *)self, a2);
  CFStringRef v6 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %@: method sent to an uninitialized date object", v5);
  v7 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v6) userInfo:0];
  objc_exception_throw(v7);
}

- (void)initWithTimeIntervalSinceReferenceDate:.cold.1()
{
  __assert_rtn("encodeTaggedTimeInterval", "NSDate.m", 204, "timeInterval != 0");
}

- (void)initWithTimeIntervalSinceReferenceDate:.cold.2()
{
  __assert_rtn("__NSTaggedDate_new", "NSDate.m", 268, "ti == decodeTaggedTimeInterval(encodedBits)");
}

@end