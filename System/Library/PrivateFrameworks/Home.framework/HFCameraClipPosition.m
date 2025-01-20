@interface HFCameraClipPosition
+ (HFCameraClipPosition)positionWithClip:(id)a3 offset:(double)a4;
+ (HFCameraClipPosition)positionWithEvent:(id)a3 offset:(double)a4;
+ (NAIdentity)na_identity;
- (BOOL)isEqual:(id)a3;
- (HFCameraClipPosition)initWithEvent:(id)a3 offset:(double)a4;
- (HFCameraRecordingEvent)event;
- (NSDate)date;
- (NSString)description;
- (double)offset;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
@end

@implementation HFCameraClipPosition

+ (HFCameraClipPosition)positionWithClip:(id)a3 offset:(double)a4
{
  id v6 = a3;
  v7 = (void *)[objc_alloc((Class)a1) initWithEvent:v6 offset:a4];

  return (HFCameraClipPosition *)v7;
}

+ (HFCameraClipPosition)positionWithEvent:(id)a3 offset:(double)a4
{
  id v6 = a3;
  v7 = (void *)[objc_alloc((Class)a1) initWithEvent:v6 offset:a4];

  return (HFCameraClipPosition *)v7;
}

- (HFCameraClipPosition)initWithEvent:(id)a3 offset:(double)a4
{
  id v8 = a3;
  if (!v8)
  {
    v12 = [MEMORY[0x263F08690] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"HMCameraClipManager+HFAdditions.m", 35, @"Invalid parameter not satisfying: %@", @"event != nil" object file lineNumber description];
  }
  v13.receiver = self;
  v13.super_class = (Class)HFCameraClipPosition;
  v9 = [(HFCameraClipPosition *)&v13 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_event, a3);
    v10->_offset = a4;
  }

  return v10;
}

- (NSDate)date
{
  v3 = [(HFCameraClipPosition *)self event];
  v4 = [v3 dateOfOccurrence];
  [(HFCameraClipPosition *)self offset];
  v5 = objc_msgSend(v4, "dateByAddingTimeInterval:");

  return (NSDate *)v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  v5 = [(HFCameraClipPosition *)self event];
  [(HFCameraClipPosition *)self offset];
  id v6 = objc_msgSend(v4, "initWithEvent:offset:", v5);

  return v6;
}

+ (NAIdentity)na_identity
{
  if (_MergedGlobals_323 != -1) {
    dispatch_once(&_MergedGlobals_323, &__block_literal_global_10_13);
  }
  v2 = (void *)qword_26AB2FE60;
  return (NAIdentity *)v2;
}

void __35__HFCameraClipPosition_na_identity__block_invoke_2()
{
  v0 = [MEMORY[0x263F58198] builder];
  id v1 = (id)[v0 appendCharacteristic:&__block_literal_global_17_11];
  id v2 = (id)[v0 appendDoubleCharacteristic:&__block_literal_global_20_10];
  uint64_t v3 = [v0 build];

  id v4 = (void *)qword_26AB2FE60;
  qword_26AB2FE60 = v3;
}

uint64_t __35__HFCameraClipPosition_na_identity__block_invoke_4(uint64_t a1, void *a2)
{
  return [a2 clip];
}

uint64_t __35__HFCameraClipPosition_na_identity__block_invoke_5(uint64_t a1, void *a2)
{
  return [a2 offset];
}

- (unint64_t)hash
{
  uint64_t v3 = objc_msgSend((id)objc_opt_class(), "na_identity");
  unint64_t v4 = [v3 hashOfObject:self];

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v5 = objc_msgSend((id)objc_opt_class(), "na_identity");
  LOBYTE(self) = [v5 isObject:self equalToObject:v4];

  return (char)self;
}

- (NSString)description
{
  uint64_t v3 = [MEMORY[0x263F58188] builderWithObject:self];
  id v4 = [(HFCameraClipPosition *)self event];
  v5 = objc_msgSend(v4, "hf_prettyDescription");
  id v6 = (id)[v3 appendObject:v5 withName:@"clip"];

  [(HFCameraClipPosition *)self offset];
  id v7 = (id)objc_msgSend(v3, "appendDouble:withName:decimalPrecision:", @"offset", 3);
  id v8 = [v3 build];

  return (NSString *)v8;
}

- (double)offset
{
  return self->_offset;
}

- (HFCameraRecordingEvent)event
{
  return self->_event;
}

- (void).cxx_destruct
{
}

@end