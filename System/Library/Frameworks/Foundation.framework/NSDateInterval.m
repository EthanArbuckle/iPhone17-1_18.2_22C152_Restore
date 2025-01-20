@interface NSDateInterval
+ (BOOL)supportsSecureCoding;
+ (NSDateInterval)allocWithZone:(_NSZone *)a3;
- (BOOL)containsDate:(NSDate *)date;
- (BOOL)intersectsDateInterval:(NSDateInterval *)dateInterval;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToDateInterval:(NSDateInterval *)dateInterval;
- (NSComparisonResult)compare:(NSDateInterval *)dateInterval;
- (NSDate)endDate;
- (NSDate)startDate;
- (NSDateInterval)init;
- (NSDateInterval)initWithCoder:(NSCoder *)coder;
- (NSDateInterval)initWithStartDate:(NSDate *)startDate duration:(NSTimeInterval)duration;
- (NSDateInterval)initWithStartDate:(NSDate *)startDate endDate:(NSDate *)endDate;
- (NSDateInterval)intersectionWithDateInterval:(NSDateInterval *)dateInterval;
- (NSTimeInterval)duration;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation NSDateInterval

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  if (![a3 allowsKeyedCoding]) {
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"Encoder does not allow keyed coding!" userInfo:0]);
  }
  objc_msgSend(a3, "encodeObject:forKey:", -[NSDateInterval startDate](self, "startDate"), @"NS.startDate");
  objc_msgSend(a3, "encodeObject:forKey:", -[NSDateInterval endDate](self, "endDate"), @"NS.endDate");
  [(NSDateInterval *)self duration];

  objc_msgSend(a3, "encodeDouble:forKey:", @"NS.duration");
}

- (BOOL)containsDate:(NSDate *)date
{
  if (!date) {
    return 0;
  }
  [(NSDate *)date timeIntervalSinceReferenceDate];
  double v5 = v4;
  [[(NSDateInterval *)self startDate] timeIntervalSinceReferenceDate];
  double v7 = v6;
  [(NSDateInterval *)self duration];
  return v5 <= v7 + v8 && v5 >= v7;
}

+ (NSDateInterval)allocWithZone:(_NSZone *)a3
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  if (NSDateInterval == a1)
  {
    return (NSDateInterval *)+[NSDateInterval allocWithZone:a3];
  }
  else
  {
    v4.receiver = a1;
    v4.super_class = (Class)&OBJC_METACLASS___NSDateInterval;
    return (NSDateInterval *)objc_msgSendSuper2(&v4, sel_allocWithZone_, a3);
  }
}

- (NSDateInterval)init
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  v3.receiver = self;
  v3.super_class = (Class)NSDateInterval;
  return [(NSDateInterval *)&v3 init];
}

- (NSDateInterval)initWithCoder:(NSCoder *)coder
{
  if (![(NSCoder *)coder allowsKeyedCoding])
  {

    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"NSDateInterval cannot be decoded by non-keyed archivers" userInfo:0]);
  }
  id v5 = [(NSCoder *)coder decodeObjectOfClass:objc_opt_class() forKey:@"NS.startDate"];
  if (!v5) {
    goto LABEL_8;
  }
  id v6 = v5;
  [(NSCoder *)coder decodeDoubleForKey:@"NS.duration"];
  double v8 = v7;
  if ([(NSCoder *)coder containsValueForKey:@"NS.duration"])
  {
LABEL_4:
    return [(NSDateInterval *)self initWithStartDate:v6 duration:v8];
  }
  id v10 = [(NSCoder *)coder decodeObjectOfClass:objc_opt_class() forKey:@"NS.endDate"];
  if ([(NSCoder *)coder error])
  {
LABEL_8:

    [(NSCoder *)coder failWithError:+[NSError errorWithDomain:@"NSCocoaErrorDomain" code:4865 userInfo:0]];
    return 0;
  }
  if (!v10) {
    goto LABEL_4;
  }

  return [(NSDateInterval *)self initWithStartDate:v6 endDate:v10];
}

- (NSDateInterval)initWithStartDate:(NSDate *)startDate duration:(NSTimeInterval)duration
{
  id v6 = NSClassFromString((NSString *)@"NSDateInterval");
  NSRequestConcreteImplementation((uint64_t)self, a2, v6);
}

- (NSDateInterval)initWithStartDate:(NSDate *)startDate endDate:(NSDate *)endDate
{
  id v6 = NSClassFromString((NSString *)@"NSDateInterval");
  NSRequestConcreteImplementation((uint64_t)self, a2, v6);
}

- (NSDate)startDate
{
  uint64_t v4 = NSClassFromString((NSString *)@"NSDateInterval");
  NSRequestConcreteImplementation((uint64_t)self, a2, v4);
}

- (NSDate)endDate
{
  uint64_t v4 = NSClassFromString((NSString *)@"NSDateInterval");
  NSRequestConcreteImplementation((uint64_t)self, a2, v4);
}

- (NSTimeInterval)duration
{
  uint64_t v4 = NSClassFromString((NSString *)@"NSDateInterval");
  NSRequestConcreteImplementation((uint64_t)self, a2, v4);
}

- (NSComparisonResult)compare:(NSDateInterval *)dateInterval
{
  if (self == dateInterval) {
    return 0;
  }
  if (!dateInterval) {
    return 1;
  }
  NSComparisonResult result = [[(NSDateInterval *)self startDate] compare:[(NSDateInterval *)dateInterval startDate]];
  if (result == NSOrderedSame)
  {
    [(NSDateInterval *)self duration];
    double v7 = v6;
    [(NSDateInterval *)dateInterval duration];
    if (v7 >= v8)
    {
      [(NSDateInterval *)self duration];
      double v10 = v9;
      [(NSDateInterval *)dateInterval duration];
      return (unint64_t)(v10 > v11);
    }
    else
    {
      return -1;
    }
  }
  return result;
}

- (id)description
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v7.receiver = self;
  v7.super_class = (Class)NSDateInterval;
  id v3 = [(NSDateInterval *)&v7 description];
  uint64_t v4 = [(NSDateInterval *)self startDate];
  [(NSDateInterval *)self duration];
  return +[NSString stringWithFormat:@"%@ (Start Date) %@ + (Duration) %f seconds = (End Date) %@", v3, v4, v5, [(NSDateInterval *)self endDate]];
}

- (unint64_t)hash
{
  return CFHashBytes();
}

- (BOOL)isEqual:(id)a3
{
  if (a3 == self) {
    return 1;
  }
  if (!a3) {
    return 0;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }

  return [(NSDateInterval *)self isEqualToDateInterval:a3];
}

- (BOOL)isEqualToDateInterval:(NSDateInterval *)dateInterval
{
  if (!dateInterval) {
    return 0;
  }
  if ([[(NSDateInterval *)self startDate] isEqualToDate:[(NSDateInterval *)dateInterval startDate]])
  {
    [(NSDateInterval *)self duration];
    double v6 = v5;
    [(NSDateInterval *)dateInterval duration];
    if (v6 == v7) {
      return 1;
    }
  }
  return 0;
}

- (BOOL)intersectsDateInterval:(NSDateInterval *)dateInterval
{
  if (!dateInterval) {
    return 0;
  }
  if ([(NSDateInterval *)self containsDate:[(NSDateInterval *)dateInterval startDate]]
    || [(NSDateInterval *)dateInterval containsDate:[(NSDateInterval *)self startDate]])
  {
    return 1;
  }
  [[(NSDateInterval *)dateInterval startDate] timeIntervalSinceReferenceDate];
  double v6 = v5;
  [(NSDateInterval *)dateInterval duration];
  double v8 = v6 + v7;
  [[(NSDateInterval *)self startDate] timeIntervalSinceReferenceDate];
  double v10 = v9;
  [(NSDateInterval *)self duration];
  double v12 = v10 + v11;
  if (v8 >= v10 && v8 <= v12) {
    return 1;
  }
  if (v12 <= v8) {
    return v12 >= v6;
  }
  return 0;
}

- (NSDateInterval)intersectionWithDateInterval:(NSDateInterval *)dateInterval
{
  if (!dateInterval || !-[NSDateInterval intersectsDateInterval:](self, "intersectsDateInterval:")) {
    return 0;
  }
  if ([(NSDateInterval *)self isEqualToDateInterval:dateInterval])
  {
    double v5 = (NSDateInterval *)[(NSDateInterval *)self copy];
  }
  else
  {
    [[(NSDateInterval *)self startDate] timeIntervalSinceReferenceDate];
    double v8 = v7;
    [(NSDateInterval *)self duration];
    double v10 = v8 + v9;
    [[(NSDateInterval *)dateInterval startDate] timeIntervalSinceReferenceDate];
    double v12 = v11;
    [(NSDateInterval *)dateInterval duration];
    double v14 = v12 + v13;
    if (v12 >= v8)
    {
      v15 = [(NSDateInterval *)dateInterval startDate];
    }
    else
    {
      v15 = [(NSDateInterval *)self startDate];
      double v12 = v8;
    }
    if (v14 < v10) {
      double v16 = v14;
    }
    else {
      double v16 = v10;
    }
    double v5 = [[NSDateInterval alloc] initWithStartDate:v15 duration:v16 - v12];
  }

  return v5;
}

@end