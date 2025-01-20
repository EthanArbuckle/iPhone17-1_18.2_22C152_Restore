@interface AVAudioTime
+ (AVAudioTime)timeWithAudioTimeStamp:(const AudioTimeStamp *)ts sampleRate:(double)sampleRate;
+ (AVAudioTime)timeWithHostTime:(uint64_t)hostTime;
+ (AVAudioTime)timeWithHostTime:(uint64_t)hostTime sampleTime:(AVAudioFramePosition)sampleTime atRate:(double)sampleRate;
+ (AVAudioTime)timeWithSampleTime:(AVAudioFramePosition)sampleTime atRate:(double)sampleRate;
+ (NSTimeInterval)secondsForHostTime:(uint64_t)hostTime;
+ (uint64_t)hostTimeForSeconds:(NSTimeInterval)seconds;
- (AVAudioFramePosition)sampleTime;
- (AVAudioTime)extrapolateTimeFromAnchor:(AVAudioTime *)anchorTime;
- (AVAudioTime)init;
- (AVAudioTime)initWithAudioTimeStamp:(const AudioTimeStamp *)ts sampleRate:(double)sampleRate;
- (AVAudioTime)initWithHostTime:(uint64_t)hostTime;
- (AVAudioTime)initWithHostTime:(uint64_t)hostTime sampleTime:(AVAudioFramePosition)sampleTime atRate:(double)sampleRate;
- (AVAudioTime)initWithSampleTime:(AVAudioFramePosition)sampleTime atRate:(double)sampleRate;
- (AudioTimeStamp)audioTimeStamp;
- (BOOL)isHostTimeValid;
- (BOOL)isSampleTimeValid;
- (double)sampleRate;
- (id)description;
- (uint64_t)hostTime;
@end

@implementation AVAudioTime

- (id)description
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  AudioTimeStampFlags mFlags = self->_ats.mFlags;
  if ((mFlags & 2) == 0)
  {
    v8[0] = 0;
    if (mFlags) {
      goto LABEL_3;
    }
LABEL_6:
    __str[0] = 0;
    if ((mFlags & 4) != 0) {
      goto LABEL_4;
    }
LABEL_7:
    v6[0] = 0;
    return (id)objc_msgSend(NSString, "stringWithFormat:", @"<AVAudioTime %p: %s %s %s>", self, v8, __str, v6);
  }
  +[AVAudioTime secondsForHostTime:self->_ats.mHostTime];
  snprintf(v8, 0x20uLL, "%.6f s", v4);
  AudioTimeStampFlags mFlags = self->_ats.mFlags;
  if ((mFlags & 1) == 0) {
    goto LABEL_6;
  }
LABEL_3:
  snprintf(__str, 0x30uLL, "%ld fr (/%.f Hz)", (uint64_t)self->_ats.mSampleTime, self->_sampleRate);
  if ((self->_ats.mFlags & 4) == 0) {
    goto LABEL_7;
  }
LABEL_4:
  snprintf(v6, 0x20uLL, "%.6f rs", self->_ats.mRateScalar);
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"<AVAudioTime %p: %s %s %s>", self, v8, __str, v6);
}

- (AudioTimeStamp)audioTimeStamp
{
  long long v3 = *(_OWORD *)&self->mWordClockTime;
  *(_OWORD *)&retstr->mSampleTime = *(_OWORD *)&self->mHostTime;
  *(_OWORD *)&retstr->mRateScalar = v3;
  long long v4 = *(_OWORD *)&self->mFlags;
  *(_OWORD *)&retstr->mSMPTETime.mSubframes = *(_OWORD *)&self->mSMPTETime.mType;
  *(_OWORD *)&retstr->mSMPTETime.mHours = v4;
  return self;
}

- (AVAudioTime)initWithAudioTimeStamp:(const AudioTimeStamp *)ts sampleRate:(double)sampleRate
{
  v10.receiver = self;
  v10.super_class = (Class)AVAudioTime;
  result = [(AVAudioTime *)&v10 init];
  if (result)
  {
    long long v7 = *(_OWORD *)&ts->mSampleTime;
    long long v8 = *(_OWORD *)&ts->mRateScalar;
    long long v9 = *(_OWORD *)&ts->mSMPTETime.mSubframes;
    *(_OWORD *)&result->_ats.mSMPTETime.mHours = *(_OWORD *)&ts->mSMPTETime.mHours;
    *(_OWORD *)&result->_ats.mSMPTETime.mSubframes = v9;
    *(_OWORD *)&result->_ats.mRateScalar = v8;
    *(_OWORD *)&result->_ats.mSampleTime = v7;
    result->_sampleRate = sampleRate;
  }
  return result;
}

- (AVAudioTime)extrapolateTimeFromAnchor:(AVAudioTime *)anchorTime
{
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  if (anchorTime) {
    [(AVAudioTime *)anchorTime audioTimeStamp];
  }
  double sampleRate = self->_sampleRate;
  if (sampleRate == 0.0) {
    return 0;
  }
  long long v6 = *(_OWORD *)&self->_ats.mSMPTETime.mHours;
  long long v7 = *(_OWORD *)&self->_ats.mRateScalar;
  long long v9 = *(_OWORD *)&self->_ats.mSampleTime;
  long long v10 = v7;
  long long v11 = *(_OWORD *)&self->_ats.mSMPTETime.mSubframes;
  long long v12 = v6;
  int v8 = DWORD2(v6);
  if ((~DWORD2(v6) & 7) == 0) {
    return +[AVAudioTime timeWithAudioTimeStamp:sampleRate:](AVAudioTime, "timeWithAudioTimeStamp:sampleRate:", &v9, sampleRate, *(double *)&v6);
  }
  result = 0;
  if ((BYTE8(v6) & 3) != 0 && (BYTE8(v16) & 3) == 3)
  {
    if ((BYTE8(v6) & 4) != 0)
    {
      *(void *)&long long v6 = v10;
      if ((BYTE8(v6) & 2) == 0) {
        goto LABEL_19;
      }
    }
    else
    {
      *(void *)&long long v6 = 1.0;
      if ((BYTE8(v16) & 4) == 0)
      {
        if ((BYTE8(v6) & 2) != 0) {
          goto LABEL_11;
        }
LABEL_19:
        *((void *)&v9 + 1) = (unint64_t)((double)*((uint64_t *)&v13 + 1)
                                                + (*(double *)&v9 - *(double *)&v13)
                                                * (*(double *)&v6
                                                 * 24000000.0
                                                 / sampleRate));
        if (v8) {
          goto LABEL_13;
        }
        goto LABEL_12;
      }
      int v8 = DWORD2(v6) | 4;
      *(void *)&long long v6 = v14;
      *(void *)&long long v10 = v14;
      if ((BYTE8(v6) & 2) == 0) {
        goto LABEL_19;
      }
    }
LABEL_11:
    if (v8)
    {
LABEL_13:
      DWORD2(v12) = v8 | 3;
      return +[AVAudioTime timeWithAudioTimeStamp:sampleRate:](AVAudioTime, "timeWithAudioTimeStamp:sampleRate:", &v9, sampleRate, *(double *)&v6);
    }
LABEL_12:
    *(double *)&long long v6 = *(double *)&v13
                   + round(sampleRate/ (*(double *)&v6* 24000000.0)* (double)(uint64_t)(*((void *)&v9 + 1) - *((void *)&v13 + 1)));
    *(void *)&long long v9 = v6;
    goto LABEL_13;
  }
  return result;
}

- (double)sampleRate
{
  return self->_sampleRate;
}

- (AVAudioFramePosition)sampleTime
{
  return (uint64_t)self->_ats.mSampleTime;
}

- (uint64_t)hostTime
{
  return self->_ats.mHostTime;
}

- (BOOL)isSampleTimeValid
{
  return self->_ats.mFlags & 1;
}

- (BOOL)isHostTimeValid
{
  return (LOBYTE(self->_ats.mFlags) >> 1) & 1;
}

- (AVAudioTime)initWithHostTime:(uint64_t)hostTime sampleTime:(AVAudioFramePosition)sampleTime atRate:(double)sampleRate
{
  v9.receiver = self;
  v9.super_class = (Class)AVAudioTime;
  result = [(AVAudioTime *)&v9 init];
  if (result)
  {
    result->_ats.AudioTimeStampFlags mFlags = 3;
    result->_ats.mHostTime = hostTime;
    result->_ats.mSampleTime = (double)sampleTime;
    result->_double sampleRate = sampleRate;
  }
  return result;
}

- (AVAudioTime)initWithSampleTime:(AVAudioFramePosition)sampleTime atRate:(double)sampleRate
{
  v7.receiver = self;
  v7.super_class = (Class)AVAudioTime;
  result = [(AVAudioTime *)&v7 init];
  if (result)
  {
    result->_ats.AudioTimeStampFlags mFlags = 1;
    result->_ats.mSampleTime = (double)sampleTime;
    result->_double sampleRate = sampleRate;
  }
  return result;
}

- (AVAudioTime)initWithHostTime:(uint64_t)hostTime
{
  v5.receiver = self;
  v5.super_class = (Class)AVAudioTime;
  result = [(AVAudioTime *)&v5 init];
  if (result)
  {
    result->_ats.AudioTimeStampFlags mFlags = 2;
    result->_ats.mHostTime = hostTime;
  }
  return result;
}

- (AVAudioTime)init
{
  v3.receiver = self;
  v3.super_class = (Class)AVAudioTime;
  return [(AVAudioTime *)&v3 init];
}

+ (NSTimeInterval)secondsForHostTime:(uint64_t)hostTime
{
  return (double)hostTime * 0.0000000416666667;
}

+ (uint64_t)hostTimeForSeconds:(NSTimeInterval)seconds
{
  return (unint64_t)(seconds * 24000000.0);
}

+ (AVAudioTime)timeWithAudioTimeStamp:(const AudioTimeStamp *)ts sampleRate:(double)sampleRate
{
  long long v4 = [[AVAudioTime alloc] initWithAudioTimeStamp:ts sampleRate:sampleRate];

  return v4;
}

+ (AVAudioTime)timeWithHostTime:(uint64_t)hostTime sampleTime:(AVAudioFramePosition)sampleTime atRate:(double)sampleRate
{
  objc_super v5 = [[AVAudioTime alloc] initWithHostTime:hostTime sampleTime:sampleTime atRate:sampleRate];

  return v5;
}

+ (AVAudioTime)timeWithSampleTime:(AVAudioFramePosition)sampleTime atRate:(double)sampleRate
{
  long long v4 = [[AVAudioTime alloc] initWithSampleTime:sampleTime atRate:sampleRate];

  return v4;
}

+ (AVAudioTime)timeWithHostTime:(uint64_t)hostTime
{
  objc_super v3 = [[AVAudioTime alloc] initWithHostTime:hostTime];

  return v3;
}

@end