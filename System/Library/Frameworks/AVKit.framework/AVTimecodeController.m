@interface AVTimecodeController
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)observationInterval;
- (AVAssetTrack)timecodeTrack;
- (AVTimecodeController)initWithTimecodeTrack:(id)a3 videoTrack:(id)a4;
- (BOOL)readTimecodes;
- (BOOL)timecodeAvailable;
- (BOOL)validateCMTime:(id *)a3;
- (CVSMPTETime)timecodeForFrameNumber64UsingCachedDescription:(SEL)a3;
- (CVSMPTETime)timecodeForOffset:(SEL)a3 from:(int64_t)a4 timecode:(int64_t)a5;
- (double)timeIntervalForFrameNumber:(int64_t)a3;
- (id)calculateTimecodeAtFrame:(int64_t)a3;
- (id)maxFrameCountString;
- (id)maxTimecodeString;
- (id)timecodeForFrameNumber32UsingFormatDescription:(opaqueCMFormatDescription *)a3 timecodeStartFrame:(int64_t)a4;
- (int64_t)calculateFrameNumberAtCMTime:(id *)a3;
- (int64_t)calculateFrameNumberAtTimeInterval:(double)a3;
- (int64_t)calculateFrameNumberAtTimecode:(id)a3;
- (int64_t)offsetFor:(id)a3 fromTimecode:(id)a4;
- (void)cacheTimecodeDescriptionForSampleBuffer:(opaqueCMSampleBuffer *)a3;
- (void)calculateMaxFrameAndTimecode;
- (void)setTimecodeTrack:(id)a3;
@end

@implementation AVTimecodeController

- (void).cxx_destruct
{
  objc_storeStrong(&self->_timeObserver, 0);
  objc_storeStrong((id *)&self->_timecodes, 0);
  objc_storeStrong((id *)&self->_timecodeTrack, 0);

  objc_storeStrong((id *)&self->_videoTrack, 0);
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)observationInterval
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 80);
  return self;
}

- (void)setTimecodeTrack:(id)a3
{
}

- (AVAssetTrack)timecodeTrack
{
  return self->_timecodeTrack;
}

- (BOOL)timecodeAvailable
{
  return [(NSMutableArray *)self->_timecodes count] != 0;
}

- (BOOL)readTimecodes
{
  v3 = [(AVTimecodeController *)self timecodeTrack];
  v4 = [v3 asset];

  if (v4)
  {
    id v5 = objc_alloc(MEMORY[0x1E4F16378]);
    v6 = [(AVTimecodeController *)self timecodeTrack];
    v7 = [v6 asset];
    v8 = (void *)[v5 initWithAsset:v7 error:0];

    if (v8)
    {
      v9 = [(AVTimecodeController *)self timecodeTrack];
      v10 = [v9 asset];
      v11 = objc_msgSend(v10, "avkit_tracksWithMediaType:", *MEMORY[0x1E4F15C10]);

      if ([v11 count]
        && ([v11 firstObject], (uint64_t v12 = objc_claimAutoreleasedReturnValue()) != 0))
      {
        v13 = (void *)v12;
        v14 = [MEMORY[0x1E4F163A0] assetReaderTrackOutputWithTrack:v12 outputSettings:0];
        [v8 addOutput:v14];
      }
      else
      {
        v14 = 0;
      }
    }
    else
    {
      v14 = 0;
    }
    int v15 = [v8 startReading];
    if (v15)
    {
      while ([v8 status] == 1)
      {
        if ([(NSMutableArray *)self->_timecodes count]) {
          break;
        }
        uint64_t v16 = [v14 copyNextSampleBuffer];
        if (!v16) {
          break;
        }
        v17 = (const void *)v16;
        [(AVTimecodeController *)self cacheTimecodeDescriptionForSampleBuffer:v16];
        CFRelease(v17);
        if ([(NSMutableArray *)self->_timecodes count]) {
          [v8 cancelReading];
        }
      }
    }
    p_observationInterval = &self->_observationInterval;
    v19 = [(NSMutableArray *)self->_timecodes firstObject];
    v20 = v19;
    if (v19)
    {
      [v19 frameDuration];
    }
    else
    {
      long long v22 = 0uLL;
      int64_t epoch = 0;
    }
    *(_OWORD *)&p_observationInterval->value = v22;
    self->_observationInterval.int64_t epoch = epoch;

    long long v22 = *(_OWORD *)&p_observationInterval->value;
    int64_t epoch = self->_observationInterval.epoch;
    if ([(AVTimecodeController *)self validateCMTime:&v22]) {
      [(AVTimecodeController *)self calculateMaxFrameAndTimecode];
    }
    else {
      LOBYTE(v15) = 0;
    }
  }
  else
  {
    LOBYTE(v15) = 0;
  }
  return v15;
}

- (BOOL)validateCMTime:(id *)a3
{
  if ((a3->var2 & 0x15) != 1) {
    return 0;
  }
  CMTime time1 = *(CMTime *)a3;
  CMTime v4 = *(CMTime *)*(void *)&MEMORY[0x1E4F1FA48];
  return CMTimeCompare(&time1, &v4) > 0;
}

- (void)cacheTimecodeDescriptionForSampleBuffer:(opaqueCMSampleBuffer *)a3
{
  DataBuffer = CMSampleBufferGetDataBuffer(a3);
  CMFormatDescriptionRef FormatDescription = CMSampleBufferGetFormatDescription(a3);
  if (DataBuffer)
  {
    v7 = FormatDescription;
    if (FormatDescription)
    {
      size_t totalLengthOut = 0;
      size_t lengthAtOffsetOut = 0;
      dataPointerOut = 0;
      if (!CMBlockBufferGetDataPointer(DataBuffer, 0, &lengthAtOffsetOut, &totalLengthOut, &dataPointerOut)
        && CMFormatDescriptionGetMediaSubType(v7) == 1953325924)
      {
        v8 = [(AVTimecodeController *)self timecodeForFrameNumber32UsingFormatDescription:v7 timecodeStartFrame:bswap32(*(_DWORD *)dataPointerOut)];
        [(NSMutableArray *)self->_timecodes addObject:v8];
      }
    }
  }
}

- (double)timeIntervalForFrameNumber:(int64_t)a3
{
  id v5 = [(NSMutableArray *)self->_timecodes firstObject];

  double result = 0.0;
  if (a3 >= 1 && v5)
  {
    memset(&v13, 0, sizeof(v13));
    v7 = [(NSMutableArray *)self->_timecodes firstObject];
    v8 = v7;
    if (v7) {
      [v7 frameDuration];
    }
    else {
      memset(&v13, 0, sizeof(v13));
    }

    memset(&v12, 0, sizeof(v12));
    int32_t v9 = [(AVAssetTrack *)self->_videoTrack naturalTimeScale];
    CMTime time = v13;
    CMTimeConvertScale(&v12, &time, v9, kCMTimeRoundingMethod_QuickTime);
    memset(&time, 0, sizeof(time));
    CMTime v10 = v12;
    CMTimeMultiply(&time, &v10, a3);
    CMTime v10 = time;
    return CMTimeGetSeconds(&v10);
  }
  return result;
}

- (int64_t)calculateFrameNumberAtTimeInterval:(double)a3
{
  memset(&v6, 0, sizeof(v6));
  CMTimeMakeWithSeconds(&v6, a3, [(AVAssetTrack *)self->_videoTrack naturalTimeScale]);
  CMTime v5 = v6;
  return [(AVTimecodeController *)self calculateFrameNumberAtCMTime:&v5];
}

- (CVSMPTETime)timecodeForOffset:(SEL)a3 from:(int64_t)a4 timecode:(int64_t)a5
{
  id v10 = a6;
  v11 = v10;
  memset(&v31[32], 0, 24);
  if (v10) {
    [v10 frameDuration];
  }
  [(AVAssetTrack *)self->_videoTrack nominalFrameRate];
  if (v12 <= 50.0)
  {
    uint64_t v14 = 2;
  }
  else
  {
    videoTrack = self->_videoTrack;
    if (videoTrack) {
      [(AVAssetTrack *)videoTrack minFrameDuration];
    }
    else {
      memset(v31, 0, 24);
    }
    *(CMTime *)&v31[32] = *(CMTime *)v31;
    a5 *= 2;
    uint64_t v14 = 4;
  }
  *(CMTime *)v31 = *(CMTime *)&v31[32];
  if (![(AVTimecodeController *)self validateCMTime:v31])
  {
    [(AVAssetTrack *)self->_videoTrack nominalFrameRate];
    CMTimeMake((CMTime *)v31, 1, (int)v15);
    *(CMTime *)&v31[32] = *(CMTime *)v31;
    if (![(AVTimecodeController *)self validateCMTime:v31])
    {
      CMTimeMake((CMTime *)v31, 1, 60);
      *(CMTime *)&v31[32] = *(CMTime *)v31;
    }
  }
  uint64_t v16 = *(int *)&v31[40];
  uint64_t v17 = *(void *)&v31[32];
  memset(v31, 0, 24);
  if (v11)
  {
    objc_msgSend(v11, "timecodeStruct", *(void *)v31);
    int v18 = *(_DWORD *)&v31[8];
    *(void *)&retstr->type = 0;
    *(void *)&retstr->hours = 0;
    *(void *)&retstr->subframes = 0;
    if (v18 == 1953325924)
    {
      int64_t v19 = a5 + a4;
      UInt32 v20 = *(_DWORD *)&v31[12];
      retstr->type = 1953325924;
      retstr->flags = v20;
      if (a5 + a4 >= 0) {
        int64_t v21 = a5 + a4;
      }
      else {
        int64_t v21 = -v19;
      }
      uint64_t v22 = (v16 + v17 - 1) / v17;
      if (v20)
      {
        uint64_t v23 = 60 * v22 - v14;
        uint64_t v24 = 9 * v23 + 60 * v22;
        uint64_t v25 = 9 * v14 * (v21 / v24);
        uint64_t v26 = v21 % v24;
        if (v26 >= 60 * v22) {
          v25 += v14 + v14 * ((v26 - 60 * v22) / v23);
        }
        v21 += v25;
      }
      uint64_t v27 = v21 / v22;
      retstr->frames = v21 % v22;
      retstr->seconds = v21 / v22 % 60;
      uint64_t v28 = v21 / v22 / 60 % 60;
      retstr->minutes = v28;
      uint64_t v29 = v27 / 3600;
      if ((v20 & 2) != 0 && (v29 %= 24, v19 < 0) && (v20 & 4) == 0)
      {
        retstr->hours = 23 - v29;
      }
      else
      {
        retstr->hours = v29;
        if (v19 < 0) {
          retstr->minutes = v28 | 0x80;
        }
      }
    }
  }
  else
  {
    *(void *)&retstr->subframes = 0;
    *(void *)&retstr->type = 0;
    *(void *)&retstr->hours = 0;
  }

  return result;
}

- (int64_t)offsetFor:(id)a3 fromTimecode:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = v7;
  memset(&v73, 0, sizeof(v73));
  if (v7)
  {
    [v7 frameDuration];
    CMTimeValue value = v73.value;
    int v10 = v73.timescale - 1;
  }
  else
  {
    CMTimeValue value = 0;
    int v10 = -1;
  }
  int v11 = v10 + value;
  if (v6)
  {
    [v6 timecodeStruct];
    int v12 = SHIWORD(v72);
    if (v8)
    {
LABEL_6:
      [v8 timecodeStruct];
      int v13 = SHIWORD(v69);
      goto LABEL_9;
    }
  }
  else
  {
    int v12 = 0;
    uint64_t v70 = 0;
    uint64_t v71 = 0;
    uint64_t v72 = 0;
    if (v8) {
      goto LABEL_6;
    }
  }
  int v13 = 0;
  uint64_t v67 = 0;
  uint64_t v68 = 0;
  uint64_t v69 = 0;
LABEL_9:
  uint64_t v14 = v11;
  int v15 = v12 - v13;
  if (v6)
  {
    [v6 timecodeStruct];
    int v16 = SWORD2(v66);
  }
  else
  {
    int v16 = 0;
    uint64_t v64 = 0;
    uint64_t v65 = 0;
    uint64_t v66 = 0;
  }
  int v17 = v15 >> 31;
  uint64_t v18 = v14 / value;
  if (v8)
  {
    [v8 timecodeStruct];
    int v19 = SWORD2(v63);
  }
  else
  {
    int v19 = 0;
    uint64_t v61 = 0;
    uint64_t v62 = 0;
    uint64_t v63 = 0;
  }
  int v20 = v16 - v19;
  int v22 = v20 + v17;
  char v21 = (v20 + v17 < 0) ^ __OFADD__(v20, v17);
  int v23 = v20 + v17 + 60;
  if (v21) {
    int32_t v24 = v23;
  }
  else {
    int32_t v24 = v22;
  }
  if (v6)
  {
    [v6 timecodeStruct];
    int v25 = SWORD1(v60);
  }
  else
  {
    int v25 = 0;
    uint64_t v58 = 0;
    uint64_t v59 = 0;
    uint64_t v60 = 0;
  }
  int v26 = v22 >> 31;
  if (v8)
  {
    [v8 timecodeStruct];
    int v27 = SWORD1(v57);
  }
  else
  {
    int v27 = 0;
    uint64_t v55 = 0;
    uint64_t v56 = 0;
    uint64_t v57 = 0;
  }
  int32_t v28 = (v18 & (v15 >> 31)) + v15;
  int v29 = v25 - v27;
  BOOL v30 = __OFADD__(v29, v26);
  int v31 = v29 + v26;
  int v32 = v31 >> 31;
  if (v31 < 0 != v30) {
    int v33 = v31 + 60;
  }
  else {
    int v33 = v31;
  }
  if (v6)
  {
    [v6 timecodeStruct];
    int v34 = (__int16)v54;
  }
  else
  {
    int v34 = 0;
    uint64_t v52 = 0;
    uint64_t v53 = 0;
    uint64_t v54 = 0;
  }
  unsigned int v35 = v32 & 0xFFFFFFFE;
  if (v8)
  {
    [v8 timecodeStruct];
    int v36 = (__int16)v51;
  }
  else
  {
    int v36 = 0;
    uint64_t v49 = 0;
    uint64_t v50 = 0;
    uint64_t v51 = 0;
  }
  unsigned int v37 = v34 - v36 + v35;
  memset(&v48, 0, sizeof(v48));
  CMTimeMake(&v48, v73.timescale, v73.timescale);
  memset(&v47, 0, sizeof(v47));
  CMTimeMake(&v47, 0, v48.timescale);
  CMTime time = v48;
  CMTimeMultiply(&rhs, &time, 3600 * v37);
  CMTime lhs = v47;
  CMTimeAdd(&time, &lhs, &rhs);
  CMTime v47 = time;
  CMTime time = v48;
  CMTimeMultiply(&v43, &time, 60 * v33);
  CMTime lhs = v47;
  CMTimeAdd(&time, &lhs, &v43);
  CMTime v47 = time;
  CMTime time = v48;
  CMTimeMultiply(&v42, &time, v24);
  CMTime lhs = v47;
  CMTimeAdd(&time, &lhs, &v42);
  CMTime v47 = time;
  CMTime time = v73;
  CMTimeMultiply(&v41, &time, v28);
  CMTime lhs = v47;
  CMTimeAdd(&time, &lhs, &v41);
  CMTime v47 = time;
  if (objc_msgSend(v8, "tc_flags"))
  {
    CMTimeMake(&v40, ((int)(108 * v37) + (uint64_t)(2 * (v33 / -10 + v33))) << ((int)v18 > 50), v48.timescale);
    CMTime lhs = v47;
    CMTimeAdd(&time, &lhs, &v40);
    CMTime v47 = time;
  }
  CMTime time = v47;
  int64_t v38 = [(AVTimecodeController *)self calculateFrameNumberAtCMTime:&time];

  return v38;
}

- (CVSMPTETime)timecodeForFrameNumber64UsingCachedDescription:(SEL)a3
{
  *(void *)&retstr->subframes = 0;
  *(void *)&retstr->type = 0;
  *(void *)&retstr->hours = 0;
  id v7 = [(NSMutableArray *)self->_timecodes firstObject];
  uint64_t v8 = [v7 frameNumber];
  int32_t v9 = [(NSMutableArray *)self->_timecodes firstObject];
  [(AVTimecodeController *)self timecodeForOffset:a4 from:v8 timecode:v9];
  *retstr = v11;

  return result;
}

- (id)timecodeForFrameNumber32UsingFormatDescription:(opaqueCMFormatDescription *)a3 timecodeStartFrame:(int64_t)a4
{
  FourCharCode MediaSubType = CMFormatDescriptionGetMediaSubType(a3);
  uint32_t TimeCodeFlags = CMTimeCodeFormatDescriptionGetTimeCodeFlags(a3);
  memset(&v20, 0, sizeof(v20));
  CMTimeCodeFormatDescriptionGetFrameDuration(&v20, a3);
  int32_t v9 = objc_opt_new();
  [v9 setFrameNumber:a4];
  CMTime v19 = v20;
  [v9 setFrameDuration:&v19];
  uint64_t v15 = 0;
  FourCharCode v16 = MediaSubType;
  uint32_t v17 = TimeCodeFlags;
  uint64_t v18 = 0;
  [v9 setTimecodeStruct:&v15];
  objc_msgSend(v9, "setTc_flags:", CMTimeCodeFormatDescriptionGetTimeCodeFlags(a3));
  [(AVTimecodeController *)self timecodeForOffset:0 from:a4 timecode:v9];
  long long v11 = v13;
  uint64_t v12 = v14;
  [v9 setTimecodeStruct:&v11];

  return v9;
}

- (int64_t)calculateFrameNumberAtTimecode:(id)a3
{
  timecodes = self->_timecodes;
  id v5 = a3;
  id v6 = [(NSMutableArray *)timecodes firstObject];
  int64_t v7 = [(AVTimecodeController *)self offsetFor:v5 fromTimecode:v6];

  return v7;
}

- (id)calculateTimecodeAtFrame:(int64_t)a3
{
  [(AVTimecodeController *)self timecodeForFrameNumber64UsingCachedDescription:a3];
  CMTime v4 = [(NSMutableArray *)self->_timecodes firstObject];
  char v5 = objc_msgSend(v4, "tc_flags");
  id v6 = @";";
  if ((v5 & 1) == 0) {
    id v6 = @":";
  }
  int64_t v7 = v6;

  uint64_t v8 = [NSString stringWithFormat:@"%02d:%02d:%02d%@%02d", 0, 0, 0, v7, 0];

  return v8;
}

- (int64_t)calculateFrameNumberAtCMTime:(id *)a3
{
  char v5 = [(NSMutableArray *)self->_timecodes firstObject];

  if (!v5) {
    return 0;
  }
  [(AVAssetTrack *)self->_videoTrack nominalFrameRate];
  $3CC8671D27C23BF42ADDB32F2B5E48AE v8 = *a3;
  return vcvtmd_s64_f64(CMTimeGetSeconds((CMTime *)&v8) * v6);
}

- (id)maxFrameCountString
{
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"%lu F", self->_maxFrameNumber);
}

- (id)maxTimecodeString
{
  v3 = [(NSMutableArray *)self->_timecodes firstObject];
  char v4 = objc_msgSend(v3, "tc_flags");
  char v5 = @";";
  if ((v4 & 1) == 0) {
    char v5 = @":";
  }
  float v6 = v5;

  int64_t v7 = [NSString stringWithFormat:@"%02d:%02d:%02d%@%02d", self->_maxTimecode.hours, self->_maxTimecode.minutes, self->_maxTimecode.seconds, v6, self->_maxTimecode.frames];

  return v7;
}

- (void)calculateMaxFrameAndTimecode
{
  videoTrack = self->_videoTrack;
  if (videoTrack) {
    [(AVAssetTrack *)videoTrack timeRange];
  }
  else {
    memset(v7, 0, sizeof(v7));
  }
  long long v8 = *(_OWORD *)((char *)v7 + 8);
  uint64_t v9 = *((void *)&v7[1] + 1);
  int64_t v4 = [(AVTimecodeController *)self calculateFrameNumberAtCMTime:&v8];
  self->_maxFrameNumber = v4;
  [(AVTimecodeController *)self timecodeForFrameNumber64UsingCachedDescription:v4];
  *(_OWORD *)&self->_maxTimecode.subframes = v5;
  *(void *)&self->_maxTimecode.hours = v6;
}

- (AVTimecodeController)initWithTimecodeTrack:(id)a3 videoTrack:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v17.receiver = self;
  v17.super_class = (Class)AVTimecodeController;
  uint64_t v9 = [(AVTimecodeController *)&v17 init];
  int v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_timecodeTrack, a3);
    objc_storeStrong((id *)&v10->_videoTrack, a4);
    uint64_t v11 = objc_opt_new();
    timecodes = v10->_timecodes;
    v10->_timecodes = (NSMutableArray *)v11;

    uint64_t v13 = MEMORY[0x1E4F1F9F8];
    *(_OWORD *)&v10->_observationInterval.CMTimeValue value = *MEMORY[0x1E4F1F9F8];
    v10->_observationInterval.int64_t epoch = *(void *)(v13 + 16);
  }
  if ([(AVTimecodeController *)v10 readTimecodes]) {
    uint64_t v14 = v10;
  }
  else {
    uint64_t v14 = 0;
  }
  uint64_t v15 = v14;

  return v15;
}

@end