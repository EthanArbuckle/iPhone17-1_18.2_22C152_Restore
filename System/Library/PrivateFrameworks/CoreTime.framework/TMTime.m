@interface TMTime
+ (BOOL)supportsSecureCoding;
+ (id)timeWithDictionary:(id)a3;
+ (id)timeWithUtc_s:(double)a3 utcUnc_s:(double)a4 rtc_s:(double)a5 sf:(double)a6 source:(id)a7;
- (BOOL)isEquivalent:(id)a3;
- (BOOL)isSynthesized;
- (BOOL)reliability;
- (NSString)source;
- (TMTime)init;
- (TMTime)initWithCoder:(id)a3;
- (TMTime)initWithUtc_ns:(int64_t)a3 utcUnc_s:(double)a4 rtc_ns:(int64_t)a5 sf:(double)a6 sfUnc:(double)a7 source:(id)a8;
- (double)propagatedTimeAtRTC:(double)a3;
- (double)propagatedUncertaintyAtRTC:(double)a3;
- (double)rtc_s;
- (double)sf;
- (double)sfUnc;
- (double)utcUnc_s;
- (double)utc_s;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionary;
- (int64_t)rtc_ns;
- (int64_t)utc_ns;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setReliability:(BOOL)a3;
- (void)setRtc_ns:(int64_t)a3;
- (void)setRtc_s:(double)a3;
- (void)setSf:(double)a3;
- (void)setSfUnc:(double)a3;
- (void)setSource:(id)a3;
- (void)setSynthesized:(BOOL)a3;
- (void)setUtcUnc_s:(double)a3;
- (void)setUtc_ns:(int64_t)a3;
- (void)setUtc_s:(double)a3;
@end

@implementation TMTime

- (TMTime)init
{
  return [(TMTime *)self initWithUtc_ns:0 utcUnc_s:0 rtc_ns:0 sf:0.0 sfUnc:0.0 source:0.0];
}

- (TMTime)initWithUtc_ns:(int64_t)a3 utcUnc_s:(double)a4 rtc_ns:(int64_t)a5 sf:(double)a6 sfUnc:(double)a7 source:(id)a8
{
  v17.receiver = self;
  v17.super_class = (Class)TMTime;
  v14 = [(TMTime *)&v17 init];
  v15 = v14;
  if (v14)
  {
    v14->_rtc_ns = a5;
    v14->_utc_ns = a3;
    v14->_utcUnc_s = a4;
    v14->_sf = a6;
    v14->_sfUnc = a7;
    v14->_source = (NSString *)[a8 copy];
    v15->_reliability = 1;
  }
  return v15;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)TMTime;
  [(TMTime *)&v3 dealloc];
}

+ (id)timeWithUtc_s:(double)a3 utcUnc_s:(double)a4 rtc_s:(double)a5 sf:(double)a6 source:(id)a7
{
  if (a3 >= 9223372040.0)
  {
    objc_super v17 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v17, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(NSString, "stringWithUTF8String:", "TMNanoTimeInterval TMNanoTimeIntervalFromCF(CFTimeInterval)"), @"TMUtilities_Private.h", 56, @"CFTimeInterval too large for TMNanoTimeInterval: %lf", *(void *)&a3);
  }
  if (a3 <= -9223372040.0)
  {
    v18 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v18, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(NSString, "stringWithUTF8String:", "TMNanoTimeInterval TMNanoTimeIntervalFromCF(CFTimeInterval)"), @"TMUtilities_Private.h", 57, @"CFTimeInterval too small for TMNanoTimeInterval: %lf", *(void *)&a3);
  }
  double __y = 0.0;
  double v12 = modf(a3, &__y);
  double v13 = __y;
  if (a5 >= 9223372040.0)
  {
    v19 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v19, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(NSString, "stringWithUTF8String:", "TMNanoTimeInterval TMNanoTimeIntervalFromCF(CFTimeInterval)"), @"TMUtilities_Private.h", 56, @"CFTimeInterval too large for TMNanoTimeInterval: %lf", *(void *)&a5);
  }
  if (a5 <= -9223372040.0)
  {
    v20 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v20, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(NSString, "stringWithUTF8String:", "TMNanoTimeInterval TMNanoTimeIntervalFromCF(CFTimeInterval)"), @"TMUtilities_Private.h", 57, @"CFTimeInterval too small for TMNanoTimeInterval: %lf", *(void *)&a5);
  }
  double __y = 0.0;
  long double v14 = modf(a5, &__y);
  v15 = objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithUtc_ns:utcUnc_s:rtc_ns:sf:sfUnc:source:", llround(v12 * 1000000000.0) + 1000000000 * (uint64_t)v13, llround(v14 * 1000000000.0) + 1000000000 * (uint64_t)__y, a7, a4, a6, 0.00002);

  return v15;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithUtc_ns:utcUnc_s:rtc_ns:sf:sfUnc:source:", self->_utc_ns, self->_rtc_ns, self->_source, self->_utcUnc_s, self->_sf, self->_sfUnc);
  *((unsigned char *)result + 8) = self->_synthesized;
  *((unsigned char *)result + 9) = self->_reliability;
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  [a3 encodeInt64:self->_rtc_ns forKey:@"rtc_ns"];
  [a3 encodeInt64:self->_utc_ns forKey:@"utc_ns"];
  [a3 encodeDouble:@"utcUnc_s" forKey:self->_utcUnc_s];
  [a3 encodeDouble:@"sf" forKey:self->_sf];
  [a3 encodeDouble:@"sfUnc" forKey:self->_sfUnc];
  [a3 encodeObject:self->_source forKey:@"source"];
  [a3 encodeBool:self->_synthesized forKey:@"synthesized"];
  BOOL reliability = self->_reliability;

  [a3 encodeBool:reliability forKey:@"reliability"];
}

- (TMTime)initWithCoder:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)TMTime;
  v4 = [(TMTime *)&v9 init];
  if (v4)
  {
    v4->_rtc_ns = [a3 decodeInt64ForKey:@"rtc_ns"];
    v4->_utc_ns = [a3 decodeInt64ForKey:@"utc_ns"];
    [a3 decodeDoubleForKey:@"utcUnc_s"];
    v4->_utcUnc_s = v5;
    [a3 decodeDoubleForKey:@"sf"];
    v4->_sf = v6;
    [a3 decodeDoubleForKey:@"sfUnc"];
    v4->_sfUnc = v7;
    v4->_source = (NSString *)(id)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"source"];
    v4->_synthesized = [a3 decodeBoolForKey:@"synthesized"];
    v4->_BOOL reliability = [a3 decodeBoolForKey:@"reliability"];
  }
  return v4;
}

- (id)description
{
  objc_super v3 = NSString;
  [(TMTime *)self utc_s];
  uint64_t v5 = v4;
  [(TMTime *)self utcUnc_s];
  uint64_t v7 = v6;
  [(TMTime *)self rtc_s];
  return (id)[v3 stringWithFormat:@"%f±%f at %f from '%@'", v5, v7, v8, -[TMTime source](self, "source")];
}

- (BOOL)isEquivalent:(id)a3
{
  [(TMTime *)self utc_s];
  double v6 = v5;
  objc_msgSend(a3, "utc_s");
  if (v6 >= v7) {
    double v8 = v6;
  }
  else {
    double v8 = v7;
  }
  if (v6 < v7) {
    double v7 = v6;
  }
  if (v8 - v7 > 0.000001) {
    return 0;
  }
  [(TMTime *)self utcUnc_s];
  double v10 = v9;
  objc_msgSend(a3, "utcUnc_s");
  if (v10 >= v11) {
    double v12 = v10;
  }
  else {
    double v12 = v11;
  }
  if (v10 < v11) {
    double v11 = v10;
  }
  if (v12 - v11 > 0.000001) {
    return 0;
  }
  [(TMTime *)self rtc_s];
  double v15 = v14;
  objc_msgSend(a3, "rtc_s");
  if (v15 >= v16) {
    double v17 = v15;
  }
  else {
    double v17 = v16;
  }
  if (v15 < v16) {
    double v16 = v15;
  }
  return v17 - v16 <= 0.000001;
}

- (double)propagatedTimeAtRTC:(double)a3
{
  [(TMTime *)self rtc_s];
  double v6 = (a3 - v5) * self->_sf;
  [(TMTime *)self utc_s];
  return v7 + v6;
}

- (double)propagatedUncertaintyAtRTC:(double)a3
{
  [(TMTime *)self rtc_s];
  double v6 = a3 - v5;
  double utcUnc_s = self->_utcUnc_s;

  return TMPropagateError(utcUnc_s, v6);
}

- (int64_t)rtc_ns
{
  return self->_rtc_ns;
}

- (void)setRtc_ns:(int64_t)a3
{
  self->_rtc_ns = a3;
}

- (int64_t)utc_ns
{
  return self->_utc_ns;
}

- (void)setUtc_ns:(int64_t)a3
{
  self->_utc_ns = a3;
}

- (double)utcUnc_s
{
  return self->_utcUnc_s;
}

- (void)setUtcUnc_s:(double)a3
{
  self->_double utcUnc_s = a3;
}

- (double)sf
{
  return self->_sf;
}

- (void)setSf:(double)a3
{
  self->_sf = a3;
}

- (double)sfUnc
{
  return self->_sfUnc;
}

- (void)setSfUnc:(double)a3
{
  self->_sfUnc = a3;
}

- (NSString)source
{
  return self->_source;
}

- (void)setSource:(id)a3
{
}

- (BOOL)isSynthesized
{
  return self->_synthesized;
}

- (void)setSynthesized:(BOOL)a3
{
  self->_synthesized = a3;
}

- (BOOL)reliability
{
  return self->_reliability;
}

- (void)setReliability:(BOOL)a3
{
  self->_BOOL reliability = a3;
}

+ (id)timeWithDictionary:(id)a3
{
  uint64_t v4 = (void *)[a3 objectForKeyedSubscript:@"TMScaleFactor"];
  double v5 = objc_opt_class();
  objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"TMCurrentTime"), "doubleValue");
  double v7 = v6;
  objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"TMTimeError"), "doubleValue");
  double v9 = v8;
  objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"TMRtcTime"), "doubleValue");
  double v11 = v10;
  if (v4)
  {
    [v4 doubleValue];
    double v13 = v12;
  }
  else
  {
    double v13 = 1.0;
  }
  uint64_t v14 = [a3 objectForKeyedSubscript:@"TMSource"];

  return (id)objc_msgSend(v5, "timeWithUtc_s:utcUnc_s:rtc_s:sf:source:", v14, v7, v9, v11, v13);
}

- (id)dictionary
{
  v10[7] = *MEMORY[0x1E4F143B8];
  v9[0] = @"TMCurrentTime";
  objc_super v3 = NSNumber;
  [(TMTime *)self utc_s];
  v10[0] = objc_msgSend(v3, "numberWithDouble:");
  v9[1] = @"TMTimeError";
  uint64_t v4 = NSNumber;
  [(TMTime *)self utcUnc_s];
  v10[1] = objc_msgSend(v4, "numberWithDouble:");
  v9[2] = @"TMRtcTime";
  double v5 = NSNumber;
  [(TMTime *)self rtc_s];
  v10[2] = objc_msgSend(v5, "numberWithDouble:");
  v9[3] = @"TMSource";
  v10[3] = [(TMTime *)self source];
  v9[4] = @"TMScaleFactor";
  double v6 = NSNumber;
  [(TMTime *)self sf];
  v10[4] = objc_msgSend(v6, "numberWithDouble:");
  v9[5] = @"TMScaleFactorError";
  double v7 = NSNumber;
  [(TMTime *)self sfUnc];
  v10[5] = objc_msgSend(v7, "numberWithDouble:");
  v9[6] = @"TMReliability";
  v10[6] = objc_msgSend(NSNumber, "numberWithBool:", -[TMTime reliability](self, "reliability"));
  return (id)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:7];
}

- (double)rtc_s
{
  int64_t v2 = [(TMTime *)self rtc_ns];
  return (double)(v2 % 1000000000) / 1000000000.0 + (double)(v2 / 1000000000);
}

- (void)setRtc_s:(double)a3
{
  if (a3 >= 9223372040.0)
  {
    double v7 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(NSString, "stringWithUTF8String:", "TMNanoTimeInterval TMNanoTimeIntervalFromCF(CFTimeInterval)"), @"TMUtilities_Private.h", 56, @"CFTimeInterval too large for TMNanoTimeInterval: %lf", *(void *)&a3);
  }
  if (a3 <= -9223372040.0)
  {
    double v8 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(NSString, "stringWithUTF8String:", "TMNanoTimeInterval TMNanoTimeIntervalFromCF(CFTimeInterval)"), @"TMUtilities_Private.h", 57, @"CFTimeInterval too small for TMNanoTimeInterval: %lf", *(void *)&a3);
  }
  double __y = 0.0;
  long double v5 = modf(a3, &__y);
  unint64_t v6 = llround(v5 * 1000000000.0) + 1000000000 * (uint64_t)__y;

  [(TMTime *)self setRtc_ns:v6];
}

- (double)utc_s
{
  int64_t v2 = [(TMTime *)self utc_ns];
  return (double)(v2 % 1000000000) / 1000000000.0 + (double)(v2 / 1000000000);
}

- (void)setUtc_s:(double)a3
{
  if (a3 >= 9223372040.0)
  {
    double v7 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(NSString, "stringWithUTF8String:", "TMNanoTimeInterval TMNanoTimeIntervalFromCF(CFTimeInterval)"), @"TMUtilities_Private.h", 56, @"CFTimeInterval too large for TMNanoTimeInterval: %lf", *(void *)&a3);
  }
  if (a3 <= -9223372040.0)
  {
    double v8 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(NSString, "stringWithUTF8String:", "TMNanoTimeInterval TMNanoTimeIntervalFromCF(CFTimeInterval)"), @"TMUtilities_Private.h", 57, @"CFTimeInterval too small for TMNanoTimeInterval: %lf", *(void *)&a3);
  }
  double __y = 0.0;
  long double v5 = modf(a3, &__y);
  unint64_t v6 = llround(v5 * 1000000000.0) + 1000000000 * (uint64_t)__y;

  [(TMTime *)self setUtc_ns:v6];
}

@end