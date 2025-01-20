@interface AVPlayerRateState
- (AVPlayerRateState)initWithAutomaticallyWaitsToMinimizeStalling:(BOOL)a3 usesLegacyAutomaticWaitingBehavior:(BOOL)a4 timeControlStatus:(int64_t)a5;
- (BOOL)automaticallyWaitsToMinimizeStalling;
- (BOOL)usesLegacyAutomaticWaitingBehavior;
- (NSString)reasonForWaitingToPlay;
- (float)rate;
- (id)copyWithZone:(_NSZone *)a3;
- (id)rateStateByInferringTimeControlStatusAndWaitingReasonBasedOnPresenceOfCurrentItem:(BOOL)a3 hasCurrentInterstitialEvent:(BOOL)a4 nameForLogging:(id)a5;
- (id)rateStateBySettingAutomaticallyWaitsToMinimizeStalling:(BOOL)a3;
- (id)rateStateBySettingRate:(float)a3 nameForLogging:(id)a4;
- (id)rateStateBySettingTimeControlStatus:(int64_t)a3 reasonForWaitingToPlay:(id)a4 nameForLogging:(id)a5;
- (id)rateStateBySettingUsesLegacyAutomaticWaitingBehavior:(BOOL)a3;
- (id)rateStateByUpdatingBasedOnFigPlayer:(OpaqueFigPlayer *)a3 hasCurrentItem:(BOOL)a4 hasCurrentInterstitialEvent:(BOOL)a5 nameForLogging:(id)a6;
- (id)rateStateByUpdatingBasedOnFigPlayerPlaybackState:(int)a3 hasCurrentInterstitialEvent:(BOOL)a4 nameForLogging:(id)a5;
- (id)rateStateByUpdatingBasedOnPresenceOfCurrentInterstitialEvent:(BOOL)a3 nameForLogging:(id)a4;
- (int64_t)timeControlStatus;
- (void)dealloc;
@end

@implementation AVPlayerRateState

- (AVPlayerRateState)initWithAutomaticallyWaitsToMinimizeStalling:(BOOL)a3 usesLegacyAutomaticWaitingBehavior:(BOOL)a4 timeControlStatus:(int64_t)a5
{
  v12.receiver = self;
  v12.super_class = (Class)AVPlayerRateState;
  v8 = [(AVPlayerRateState *)&v12 init];
  v9 = v8;
  if (v8)
  {
    v8->_automaticallyWaitsToMinimizeStalling = a3;
    v8->_usesLegacyAutomaticWaitingBehavior = a4;
    v8->_timeControlStatus = a5;
    v10 = v8;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)AVPlayerRateState;
  [(AVPlayerRateState *)&v3 dealloc];
}

- (id)rateStateBySettingAutomaticallyWaitsToMinimizeStalling:(BOOL)a3
{
  id result = (id)[(AVPlayerRateState *)self copy];
  *((unsigned char *)result + 12) = a3;
  *((unsigned char *)result + 13) = 0;
  return result;
}

- (id)rateStateByInferringTimeControlStatusAndWaitingReasonBasedOnPresenceOfCurrentItem:(BOOL)a3 hasCurrentInterstitialEvent:(BOOL)a4 nameForLogging:(id)a5
{
  BOOL v6 = a4;
  BOOL v7 = a3;
  int64_t v9 = [(AVPlayerRateState *)self timeControlStatus];
  v10 = [(AVPlayerRateState *)self reasonForWaitingToPlay];
  [(AVPlayerRateState *)self rate];
  uint64_t v12 = v11 != 0.0;
  if (v11 == 0.0) {
    v13 = 0;
  }
  else {
    v13 = @"AVPlayerWaitingWithNoItemToPlayReason";
  }
  if (v11 != 0.0 && v7)
  {
    if ([(AVPlayerRateState *)self automaticallyWaitsToMinimizeStalling])
    {
      if (v9 == 2)
      {
        v13 = 0;
        uint64_t v12 = 2;
        goto LABEL_17;
      }
    }
    else
    {
      BOOL v15 = [(AVPlayerRateState *)self usesLegacyAutomaticWaitingBehavior];
      v13 = 0;
      uint64_t v12 = 2;
      if (!v15 || v9 == 2) {
        goto LABEL_17;
      }
    }
    v13 = @"AVPlayerWaitingWhileEvaluatingBufferingRateReason";
    if (v10 && ![(NSString *)v10 isEqualToString:@"AVPlayerWaitingWithNoItemToPlayReason"]) {
      v13 = (__CFString *)v10;
    }
    uint64_t v12 = 1;
  }
LABEL_17:
  id v16 = [(AVPlayerRateState *)self rateStateBySettingTimeControlStatus:v12 reasonForWaitingToPlay:v13 nameForLogging:a5];
  return (id)[v16 rateStateByUpdatingBasedOnPresenceOfCurrentInterstitialEvent:v6 nameForLogging:a5];
}

- (id)rateStateByUpdatingBasedOnPresenceOfCurrentInterstitialEvent:(BOOL)a3 nameForLogging:(id)a4
{
  BOOL v5 = a3;
  int64_t v7 = [(AVPlayerRateState *)self timeControlStatus];
  v8 = [(AVPlayerRateState *)self reasonForWaitingToPlay];
  if ([(AVPlayerRateState *)self timeControlStatus] != 2
    && ![(NSString *)[(AVPlayerRateState *)self reasonForWaitingToPlay] isEqualToString:@"AVPlayerWaitingWithNoItemToPlayReason"]&& v5)
  {
    int64_t v7 = 1;
    v8 = @"AVPlayerWaitingDuringInterstitialEventReason";
  }
  return [(AVPlayerRateState *)self rateStateBySettingTimeControlStatus:v7 reasonForWaitingToPlay:v8 nameForLogging:a4];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(AVPlayerRateState);
  [(AVPlayerRateState *)self rate];
  v4->_rate = v5;
  v4->_automaticallyWaitsToMinimizeStalling = [(AVPlayerRateState *)self automaticallyWaitsToMinimizeStalling];
  v4->_usesLegacyAutomaticWaitingBehavior = [(AVPlayerRateState *)self usesLegacyAutomaticWaitingBehavior];
  v4->_timeControlStatus = [(AVPlayerRateState *)self timeControlStatus];
  v4->_reasonForWaitingToPlay = (NSString *)[(NSString *)[(AVPlayerRateState *)self reasonForWaitingToPlay] copy];
  return v4;
}

- (int64_t)timeControlStatus
{
  return self->_timeControlStatus;
}

- (NSString)reasonForWaitingToPlay
{
  return self->_reasonForWaitingToPlay;
}

- (float)rate
{
  return self->_rate;
}

- (BOOL)automaticallyWaitsToMinimizeStalling
{
  return self->_automaticallyWaitsToMinimizeStalling;
}

- (BOOL)usesLegacyAutomaticWaitingBehavior
{
  return self->_usesLegacyAutomaticWaitingBehavior;
}

- (id)rateStateBySettingTimeControlStatus:(int64_t)a3 reasonForWaitingToPlay:(id)a4 nameForLogging:(id)a5
{
  int64_t v7 = (void *)[(AVPlayerRateState *)self copy];
  v7[2] = a3;
  id v8 = (id)v7[3];
  if (v8 != a4)
  {

    v7[3] = [a4 copy];
  }
  return v7;
}

- (id)rateStateBySettingRate:(float)a3 nameForLogging:(id)a4
{
  float v5 = (float *)[(AVPlayerRateState *)self copy];
  v5[2] = a3;
  return v5;
}

- (id)rateStateByUpdatingBasedOnFigPlayerPlaybackState:(int)a3 hasCurrentInterstitialEvent:(BOOL)a4 nameForLogging:(id)a5
{
  BOOL v6 = a4;
  switch(a3)
  {
    case 1:
      int64_t v7 = @"AVPlayerWaitingWhileEvaluatingBufferingRateReason";
      goto LABEL_9;
    case 2:
      int64_t v7 = @"AVPlayerWaitingToMinimizeStallsReason";
      goto LABEL_9;
    case 3:
      int64_t v7 = @"AVPlayerWaitingWithNoItemToPlayReason";
      goto LABEL_9;
    case 4:
      int64_t v7 = 0;
      uint64_t v8 = 2;
      break;
    case 5:
      int64_t v7 = @"AVPlayerWaitingForCoordinatedPlaybackReason";
      goto LABEL_9;
    case 6:
      int64_t v7 = @"AVPlayerWaitingDuringInterstitialEventReason";
LABEL_9:
      uint64_t v8 = 1;
      break;
    default:
      uint64_t v8 = 0;
      int64_t v7 = 0;
      break;
  }
  id v9 = [(AVPlayerRateState *)self rateStateBySettingTimeControlStatus:v8 reasonForWaitingToPlay:v7 nameForLogging:a5];
  return (id)[v9 rateStateByUpdatingBasedOnPresenceOfCurrentInterstitialEvent:v6 nameForLogging:a5];
}

- (id)rateStateBySettingUsesLegacyAutomaticWaitingBehavior:(BOOL)a3
{
  v4 = (unsigned char *)[(AVPlayerRateState *)self copy];
  v4[13] = a3;
  return v4;
}

- (id)rateStateByUpdatingBasedOnFigPlayer:(OpaqueFigPlayer *)a3 hasCurrentItem:(BOOL)a4 hasCurrentInterstitialEvent:(BOOL)a5 nameForLogging:(id)a6
{
  BOOL v7 = a5;
  if (a3)
  {
    CFNumberRef number = 0;
    unsigned int valuePtr = 0;
    uint64_t FigBaseObject = FigPlayerGetFigBaseObject();
    uint64_t v10 = *(void *)(CMBaseObjectGetVTable() + 8);
    if (v10) {
      uint64_t v11 = v10;
    }
    else {
      uint64_t v11 = 0;
    }
    v13 = *(void (**)(uint64_t, void, void, CFNumberRef *))(v11 + 48);
    if (!v13) {
      return 0;
    }
    v13(FigBaseObject, *MEMORY[0x1E4F34340], *MEMORY[0x1E4F1CF80], &number);
    if (!number) {
      return 0;
    }
    CFNumberGetValue(number, kCFNumberSInt32Type, &valuePtr);
    id v14 = [(AVPlayerRateState *)self rateStateByUpdatingBasedOnFigPlayerPlaybackState:valuePtr hasCurrentInterstitialEvent:v7 nameForLogging:a6];
    if (number) {
      CFRelease(number);
    }
    return v14;
  }
  else
  {
    return [(AVPlayerRateState *)self rateStateByInferringTimeControlStatusAndWaitingReasonBasedOnPresenceOfCurrentItem:a4 hasCurrentInterstitialEvent:a5 nameForLogging:a6];
  }
}

@end