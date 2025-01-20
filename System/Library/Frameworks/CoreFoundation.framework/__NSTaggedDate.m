@interface __NSTaggedDate
+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3;
+ (id)allocWithZone:(_NSZone *)a3;
- (__NSTaggedDate)initWithTimeIntervalSinceReferenceDate:(double)a3;
- (double)timeIntervalSinceReferenceDate;
- (void)dealloc;
@end

@implementation __NSTaggedDate

- (double)timeIntervalSinceReferenceDate
{
  if (((unint64_t)self & 0x8000000000000000) != 0)
  {
    uint64_t v3 = 0;
    uint64_t v5 = *(void *)off_1ECE0A6F0;
    if ((~(unint64_t)self & 0xC000000000000007) == 0) {
      uint64_t v5 = 0;
    }
    unint64_t v2 = v5 ^ (unint64_t)self;
    unint64_t v4 = v2 & 7;
    do
    {
      if (v4 == *((unsigned __int8 *)off_1ECE0A6E0 + v3)) {
        goto LABEL_8;
      }
      ++v3;
    }
    while (v3 != 7);
  }
  do
  {
    __break(1u);
LABEL_8:
    ;
  }
  while (v3 != 6);
  uint64_t v6 = 0xFFFFFFFFFFFFFFFLL;
  if (v4 == 7) {
    uint64_t v6 = 0xFFFFFFFFFFFFFLL;
  }
  return decodeTaggedTimeInterval(v6 & (v2 >> 3));
}

+ (id)allocWithZone:(_NSZone *)a3
{
  return &___immutablePlaceholderDate;
}

- (void)dealloc
{
  uint64_t v3 = *(void *)off_1ECE0A5B0;
  v2.receiver = self;
  v2.super_class = (Class)__NSTaggedDate;
  [(__NSTaggedDate *)&v2 dealloc];
}

+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3
{
  return 0;
}

- (__NSTaggedDate)initWithTimeIntervalSinceReferenceDate:(double)a3
{
  unint64_t v4 = [NSDate alloc];

  return (__NSTaggedDate *)[(NSDate *)v4 initWithTimeIntervalSinceReferenceDate:a3];
}

@end