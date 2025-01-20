@interface CAMAnalyticsEvent
+ (double)bucketedPowerOf2ForValue:(double)a3 allowZero:(BOOL)a4 minPositiveValue:(double)a5 maxValue:(double)a6;
+ (double)gigabytesForBytes:(int64_t)a3;
+ (id)bucketedGigabytesStringForBytes:(int64_t)a3;
+ (id)bucketedGigabytesStringForBytes:(int64_t)a3 allowZero:(BOOL)a4 minPositiveValue:(double)a5 maxValue:(double)a6;
+ (id)durationRangeStringForDuration:(double)a3;
- (CAMAnalyticsEvent)init;
- (CAMAnalyticsEvent)initWithEvent:(id)a3;
- (NSMutableDictionary)_eventMap;
- (NSString)eventName;
- (NSString)uuid;
- (void)publish;
@end

@implementation CAMAnalyticsEvent

- (CAMAnalyticsEvent)init
{
  v10.receiver = self;
  v10.super_class = (Class)CAMAnalyticsEvent;
  v2 = [(CAMAnalyticsEvent *)&v10 init];
  if (v2)
  {
    v3 = [MEMORY[0x263F08C38] UUID];
    uint64_t v4 = [v3 UUIDString];
    uuid = v2->_uuid;
    v2->_uuid = (NSString *)v4;

    v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    eventMap = v2->__eventMap;
    v2->__eventMap = v6;

    v8 = v2;
  }

  return v2;
}

- (CAMAnalyticsEvent)initWithEvent:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)CAMAnalyticsEvent;
  v5 = [(CAMAnalyticsEvent *)&v14 init];
  if (v5)
  {
    v6 = [MEMORY[0x263F08C38] UUID];
    uint64_t v7 = [v6 UUIDString];
    uuid = v5->_uuid;
    v5->_uuid = (NSString *)v7;

    v9 = [v4 _eventMap];
    uint64_t v10 = [v9 mutableCopy];
    eventMap = v5->__eventMap;
    v5->__eventMap = (NSMutableDictionary *)v10;

    v12 = v5;
  }

  return v5;
}

- (void)publish
{
  v2 = NSString;
  v3 = [(CAMAnalyticsEvent *)self eventName];
  id v4 = [v2 stringWithFormat:@"com.apple.cameraui.%@", v3];

  AnalyticsSendEventLazy();
}

uint64_t __28__CAMAnalyticsEvent_publish__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _eventMap];
}

- (NSString)eventName
{
  return (NSString *)&stru_26BD78BA0;
}

+ (id)durationRangeStringForDuration:(double)a3
{
  [a1 bucketedPowerOf2ForValue:1 allowZero:a3 minPositiveValue:0.125 maxValue:65536.0];
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"%g", v3);
}

+ (id)bucketedGigabytesStringForBytes:(int64_t)a3
{
  return (id)[a1 bucketedGigabytesStringForBytes:a3 allowZero:1 minPositiveValue:0.125 maxValue:4096.0];
}

+ (double)gigabytesForBytes:(int64_t)a3
{
  return (double)(a3 / 0x100000) * 0.0009765625;
}

+ (id)bucketedGigabytesStringForBytes:(int64_t)a3 allowZero:(BOOL)a4 minPositiveValue:(double)a5 maxValue:(double)a6
{
  BOOL v6 = a4;
  [a1 gigabytesForBytes:a3];
  objc_msgSend(a1, "bucketedPowerOf2ForValue:allowZero:minPositiveValue:maxValue:", v6);
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"%g", v8);
}

+ (double)bucketedPowerOf2ForValue:(double)a3 allowZero:(BOOL)a4 minPositiveValue:(double)a5 maxValue:(double)a6
{
  if (a3 <= 0.0 && a4) {
    return 0.0;
  }
  if (a3 < a5) {
    a3 = a5;
  }
  if (a3 > a6) {
    a3 = a6;
  }
  double v8 = ceil(log2(a3));
  return exp2(v8);
}

- (NSString)uuid
{
  return self->_uuid;
}

- (NSMutableDictionary)_eventMap
{
  return self->__eventMap;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__eventMap, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
}

@end