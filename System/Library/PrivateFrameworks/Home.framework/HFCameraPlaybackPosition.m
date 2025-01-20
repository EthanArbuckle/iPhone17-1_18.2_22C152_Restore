@interface HFCameraPlaybackPosition
+ (NAIdentity)na_identity;
+ (id)clipPositionWithDate:(id)a3;
+ (id)clipPositionWithDate:(id)a3 inClip:(id)a4;
+ (id)livePosition;
- (BOOL)clipIncludesPlaybackDate;
- (BOOL)isEqual:(id)a3;
- (HFCameraPlaybackPosition)initWithClipPlaybackDate:(id)a3 inClip:(id)a4;
- (HFCameraPlaybackPosition)initWithContentType:(unint64_t)a3 clipPlaybackDate:(id)a4;
- (HMCameraClip)clip;
- (NSDate)clipPlaybackDate;
- (NSString)description;
- (unint64_t)contentType;
- (unint64_t)hash;
- (void)setClip:(id)a3;
@end

@implementation HFCameraPlaybackPosition

+ (id)livePosition
{
  v2 = (void *)[objc_alloc((Class)a1) initWithContentType:0 clipPlaybackDate:0];
  return v2;
}

+ (id)clipPositionWithDate:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v8 = [MEMORY[0x263F08690] currentHandler];
    [v8 handleFailureInMethod:a2, a1, @"HFCameraPlaybackPosition.m", 21, @"Invalid parameter not satisfying: %@", @"playbackDate != nil" object file lineNumber description];
  }
  v6 = (void *)[objc_alloc((Class)a1) initWithContentType:1 clipPlaybackDate:v5];

  return v6;
}

+ (id)clipPositionWithDate:(id)a3 inClip:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = v8;
  if (v7)
  {
    if (v8) {
      goto LABEL_3;
    }
  }
  else
  {
    v12 = [MEMORY[0x263F08690] currentHandler];
    [v12 handleFailureInMethod:a2, a1, @"HFCameraPlaybackPosition.m", 27, @"Invalid parameter not satisfying: %@", @"playbackDate != nil" object file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
  }
  v13 = [MEMORY[0x263F08690] currentHandler];
  [v13 handleFailureInMethod:a2, a1, @"HFCameraPlaybackPosition.m", 28, @"Invalid parameter not satisfying: %@", @"clip != nil" object file lineNumber description];

LABEL_3:
  v10 = (void *)[objc_alloc((Class)a1) initWithClipPlaybackDate:v7 inClip:v9];

  return v10;
}

- (HFCameraPlaybackPosition)initWithContentType:(unint64_t)a3 clipPlaybackDate:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)HFCameraPlaybackPosition;
  id v8 = [(HFCameraPlaybackPosition *)&v11 init];
  v9 = v8;
  if (v8)
  {
    v8->_contentType = a3;
    objc_storeStrong((id *)&v8->_clipPlaybackDate, a4);
  }

  return v9;
}

- (HFCameraPlaybackPosition)initWithClipPlaybackDate:(id)a3 inClip:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HFCameraPlaybackPosition;
  v9 = [(HFCameraPlaybackPosition *)&v12 init];
  v10 = v9;
  if (v9)
  {
    v9->_contentType = 1;
    objc_storeStrong((id *)&v9->_clipPlaybackDate, a3);
    objc_storeStrong((id *)&v10->_clip, a4);
  }

  return v10;
}

- (BOOL)clipIncludesPlaybackDate
{
  v3 = [(HFCameraPlaybackPosition *)self clipPlaybackDate];
  v4 = [(HFCameraPlaybackPosition *)self clip];
  id v5 = [v4 dateOfOccurrence];
  [v3 timeIntervalSinceDate:v5];
  double v7 = v6;

  id v8 = [(HFCameraPlaybackPosition *)self clip];
  [v8 duration];
  LOBYTE(v3) = v9 - v7 > 0.00000011920929;

  return (char)v3;
}

+ (NAIdentity)na_identity
{
  if (_MergedGlobals_221 != -1) {
    dispatch_once(&_MergedGlobals_221, &__block_literal_global_13_0);
  }
  v2 = (void *)qword_26AB2EDA8;
  return (NAIdentity *)v2;
}

void __39__HFCameraPlaybackPosition_na_identity__block_invoke_2()
{
  v0 = [MEMORY[0x263F58198] builder];
  id v1 = (id)[v0 appendCharacteristic:&__block_literal_global_20_0];
  id v2 = (id)[v0 appendCharacteristic:&__block_literal_global_24];
  uint64_t v3 = [v0 build];

  v4 = (void *)qword_26AB2EDA8;
  qword_26AB2EDA8 = v3;
}

uint64_t __39__HFCameraPlaybackPosition_na_identity__block_invoke_4(uint64_t a1, void *a2)
{
  id v2 = NSNumber;
  uint64_t v3 = [a2 contentType];
  return [v2 numberWithUnsignedInteger:v3];
}

uint64_t __39__HFCameraPlaybackPosition_na_identity__block_invoke_5(uint64_t a1, void *a2)
{
  return [a2 clipPlaybackDate];
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
  id v5 = objc_msgSend((id)objc_opt_class(), "na_identity");
  LOBYTE(self) = [v5 isObject:self equalToObject:v4];

  return (char)self;
}

- (NSString)description
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  unint64_t v3 = [(HFCameraPlaybackPosition *)self contentType];
  if (v3)
  {
    if (v3 == 1)
    {
      id v4 = [MEMORY[0x263F58188] builderWithObject:self];
      id v5 = [(HFCameraPlaybackPosition *)self clipPlaybackDate];
      id v6 = (id)[v4 appendObject:v5 withName:@"clipPlaybackDate"];

      double v7 = [(HFCameraPlaybackPosition *)self clipPlaybackDate];
      id v8 = +[HFCameraUtilities fullTimeStringFromDate:v7];
      [v4 appendString:v8 withName:@"date"];

      double v9 = [(HFCameraPlaybackPosition *)self clip];
      v10 = [v9 uniqueIdentifier];
      id v11 = (id)[v4 appendObject:v10 withName:@"clipUUID"];

      objc_super v12 = [v4 build];
    }
    else
    {
      v13 = HFLogForCategory(0x17uLL);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        v17 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HFCameraPlaybackPosition contentType](self, "contentType"));
        *(_DWORD *)buf = 138412290;
        v19 = v17;
        _os_log_error_impl(&dword_20B986000, v13, OS_LOG_TYPE_ERROR, "Unknown content type %@", buf, 0xCu);
      }
      v14 = NSString;
      v15 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HFCameraPlaybackPosition contentType](self, "contentType"));
      objc_super v12 = [v14 stringWithFormat:@"[Unknown content type %@]", v15];
    }
  }
  else
  {
    objc_super v12 = @"[Live]";
  }
  return (NSString *)v12;
}

- (unint64_t)contentType
{
  return self->_contentType;
}

- (NSDate)clipPlaybackDate
{
  return self->_clipPlaybackDate;
}

- (HMCameraClip)clip
{
  return self->_clip;
}

- (void)setClip:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clip, 0);
  objc_storeStrong((id *)&self->_clipPlaybackDate, 0);
}

@end