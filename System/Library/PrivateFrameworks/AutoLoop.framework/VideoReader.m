@interface VideoReader
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)lastPresentationTime;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)minFrameDuration;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)readLengthT;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)readStartT;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)trackLengthT;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)trackStartT;
- (AVAsset)asset;
- (AVAssetReader)assetReader;
- (AVAssetReaderOutput)trackOutput;
- (AVAssetTrack)videoTrack;
- (BOOL)fullRangeVideo;
- (BOOL)readAheadEnable;
- (CGAffineTransform)preferredTransform;
- (NSArray)formatDescriptions;
- (NSCondition)readaheadLock;
- (NSError)lastError;
- (VideoReader)initWithAsset:(id)a3;
- (float)fps;
- (float)readLength;
- (float)readStart;
- (float)trackLength;
- (float)trackStart;
- (id)initFromFile:(id)a3;
- (int)buildAssetReader;
- (int)getFrame:(CGImage *)a3;
- (int)getFrameAsSampleBuf:(opaqueCMSampleBuffer *)a3;
- (int)getFrameAtTime:(id *)a3 exactTime:(BOOL)a4 frame:(opaqueCMSampleBuffer *)a5;
- (int)readaheadState;
- (int)reset;
- (int)skipFrames:(unsigned int)a3;
- (int)timeScale;
- (opaqueCMSampleBuffer)lastFrame;
- (opaqueCMSampleBuffer)nextSampleBuf;
- (opaqueCMSampleBuffer)readaheadBuf;
- (unsigned)imageHeight;
- (unsigned)imageWidth;
- (unsigned)pixelFormatOptions;
- (void)dealloc;
- (void)fireReadahead;
- (void)setLastFrame:(opaqueCMSampleBuffer *)a3;
- (void)setPixelFormatOptions:(unsigned int)a3;
- (void)setReadAheadEnable:(BOOL)a3;
- (void)setReadLength:(float)a3;
- (void)setReadLengthT:(id *)a3;
- (void)setReadStart:(float)a3;
- (void)setReadStartT:(id *)a3;
- (void)setReadaheadBuf:(opaqueCMSampleBuffer *)a3;
- (void)setReadaheadLock:(id)a3;
- (void)setReadaheadState:(int)a3;
@end

@implementation VideoReader

- (VideoReader)initWithAsset:(id)a3
{
  id v5 = a3;
  asset = self->asset;
  self->asset = 0;

  videoTrack = self->videoTrack;
  self->videoTrack = 0;

  assetReader = self->assetReader;
  self->assetReader = 0;

  trackOutput = self->trackOutput;
  self->trackOutput = 0;

  *(void *)&self->trackStart = 0;
  uint64_t v10 = MEMORY[0x1E4F1FA48];
  long long v11 = *MEMORY[0x1E4F1FA48];
  *(_OWORD *)&self->trackStartT.value = *MEMORY[0x1E4F1FA48];
  int64_t v12 = *(void *)(v10 + 16);
  self->trackStartT.epoch = v12;
  uint64_t v13 = MEMORY[0x1E4F1FA10];
  long long v14 = *MEMORY[0x1E4F1FA10];
  *(_OWORD *)&self->trackLengthT.value = *MEMORY[0x1E4F1FA10];
  int64_t v15 = *(void *)(v13 + 16);
  self->trackLengthT.epoch = v15;
  *(void *)&self->readStart = 0;
  *(_OWORD *)&self->readStartT.value = v11;
  self->readStartT.epoch = v12;
  *(_OWORD *)&self->readLengthT.value = v14;
  self->readLengthT.epoch = v15;
  self->fullRangeVideo = 0;
  self->_lastFrame = 0;
  self->_readaheadBuf = 0;
  [(VideoReader *)self setPixelFormatOptions:193];
  self->_readAheadEnable = 0;
  [(VideoReader *)self setReadAheadEnable:1];
  objc_storeStrong((id *)&self->asset, a3);
  v16 = self->asset;
  if (v16)
  {
    v17 = [(AVAsset *)v16 tracksWithMediaType:*MEMORY[0x1E4F15C18]];
    v18 = v17;
    if (!v17 || ![v17 count])
    {
      NSLog(&cfstr_AssetHasNoVide_0.isa);
      goto LABEL_43;
    }
    if ([v18 count] != 1)
    {
      NSLog(&cfstr_AssetHasMultip.isa);
      goto LABEL_43;
    }
    v19 = [v18 objectAtIndex:0];
    v20 = self->videoTrack;
    self->videoTrack = v19;

    v21 = self->videoTrack;
    if (!v21)
    {
      NSLog(&cfstr_InternalErrorA.isa);
      goto LABEL_43;
    }
    memset(v61, 0, sizeof(v61));
    long long v60 = 0u;
    [(AVAssetTrack *)v21 timeRange];
    *(_OWORD *)&self->trackStartT.value = v60;
    self->trackStartT.epoch = *(void *)&v61[0];
    long long v22 = *(_OWORD *)((char *)v61 + 8);
    *(_OWORD *)&self->trackLengthT.value = *(_OWORD *)((char *)v61 + 8);
    uint64_t v23 = *((void *)&v61[1] + 1);
    self->trackLengthT.epoch = *((void *)&v61[1] + 1);
    *(_OWORD *)time = v22;
    *(void *)&time[16] = v23;
    float Seconds = CMTimeGetSeconds((CMTime *)time);
    self->trackLength = Seconds;
    *(_OWORD *)time = *(_OWORD *)&self->trackStartT.value;
    *(void *)&time[16] = self->trackStartT.epoch;
    float v25 = CMTimeGetSeconds((CMTime *)time);
    self->trackStart = v25;
    self->timeScale = [(AVAssetTrack *)self->videoTrack naturalTimeScale];
    [(AVAssetTrack *)self->videoTrack nominalFrameRate];
    self->fps = v26;
    p_minFrameDuration = &self->minFrameDuration;
    v28 = self->videoTrack;
    if (v28)
    {
      [(AVAssetTrack *)v28 minFrameDuration];
      v29 = self->videoTrack;
      *(_OWORD *)&p_minFrameDuration->value = *(_OWORD *)time;
      self->minFrameDuration.epoch = *(void *)&time[16];
      p_preferredTransform = &self->preferredTransform;
      if (v29)
      {
        [(AVAssetTrack *)v29 preferredTransform];
        goto LABEL_15;
      }
    }
    else
    {
      p_minFrameDuration->value = 0;
      *(void *)&self->minFrameDuration.timescale = 0;
      p_preferredTransform = &self->preferredTransform;
      self->minFrameDuration.epoch = 0;
    }
    long long v59 = 0u;
    memset(time, 0, sizeof(time));
LABEL_15:
    long long v32 = *(_OWORD *)time;
    long long v33 = v59;
    *(_OWORD *)&p_preferredTransform->c = *(_OWORD *)&time[16];
    *(_OWORD *)&p_preferredTransform->tx = v33;
    *(_OWORD *)&p_preferredTransform->a = v32;
    v34 = [(AVAssetTrack *)self->videoTrack formatDescriptions];
    formatDescriptions = self->formatDescriptions;
    self->formatDescriptions = v34;

    v36 = self->formatDescriptions;
    if (v36)
    {
      uint64_t v37 = [(NSArray *)v36 count];
      char v38 = v37 != 0;
      v39 = (CFStringRef *)MEMORY[0x1E4F1EDB0];
      if (v37)
      {
        v40 = [(NSArray *)self->formatDescriptions objectAtIndex:0];
        CGRect CleanAperture = CMVideoFormatDescriptionGetCleanAperture(v40, 0);
        double width = CleanAperture.size.width;
        double height = CleanAperture.size.height;
        CFBooleanRef Extension = (const __CFBoolean *)CMFormatDescriptionGetExtension(v40, *v39);
        unsigned int v57 = width;
        unsigned int v44 = height;
        if (Extension)
        {
          int v45 = CFBooleanGetValue(Extension) != 0;
          char v46 = 1;
        }
        else
        {
          char v46 = 0;
          int v45 = 0;
        }
      }
      else
      {
        char v46 = 0;
        int v45 = 0;
        unsigned int v44 = 0;
        unsigned int v57 = 0;
      }
      if ([(NSArray *)self->formatDescriptions count] >= 2)
      {
        CFStringRef v47 = *v39;
        unint64_t v48 = 1;
        do
        {
          char v49 = v38;
          v50 = [(NSArray *)self->formatDescriptions objectAtIndex:v48];
          CGRect v63 = CMVideoFormatDescriptionGetCleanAperture(v50, 0);
          double v51 = v63.size.width;
          double v52 = v63.size.height;
          CFBooleanRef v53 = (const __CFBoolean *)CMFormatDescriptionGetExtension(v50, v47);
          char v38 = 0;
          if ((v49 & 1) != 0 && v52 == (double)v44 && v51 == (double)v57)
          {
            char v55 = v53 ? v46 ^ 1 : 1;
            char v38 = v53 ? 0 : v46 ^ 1;
            if ((v55 & 1) == 0) {
              char v38 = CFBooleanGetValue(v53) == v45;
            }
          }
          ++v48;
        }
        while ([(NSArray *)self->formatDescriptions count] > v48);
      }
      if (v38)
      {
        self->imageWidth = v57;
        self->imageHeight = v44;
        if (v46) {
          self->fullRangeVideo = v45;
        }
        else {
          NSLog(&cfstr_WarningNoKcmfo.isa);
        }
        v31 = self;
        goto LABEL_44;
      }
      NSLog(&cfstr_UnexpectedForm.isa, [(NSArray *)self->formatDescriptions count]);
    }
    else
    {
      NSLog(&cfstr_ErrorObtaining.isa);
    }
LABEL_43:
    v31 = 0;
LABEL_44:

    goto LABEL_45;
  }
  NSLog(&cfstr_ErrorAvassetIs.isa);
  v31 = 0;
LABEL_45:

  return v31;
}

- (id)initFromFile:(id)a3
{
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F16330] assetWithURL:v4];
  if (v5)
  {
    self = [(VideoReader *)self initWithAsset:v5];
    v6 = self;
  }
  else
  {
    NSLog(&cfstr_ErrorOpeningAv.isa, [v4 fileSystemRepresentation]);
    v6 = 0;
  }

  return v6;
}

- (void)dealloc
{
  v3 = [(VideoReader *)self readaheadLock];
  [v3 lock];

  if ([(VideoReader *)self readaheadBuf])
  {
    CFRelease([(VideoReader *)self readaheadBuf]);
    [(VideoReader *)self setReadaheadBuf:0];
  }
  id v4 = [(VideoReader *)self readaheadLock];
  [v4 unlock];

  if ([(VideoReader *)self lastFrame])
  {
    CFRelease([(VideoReader *)self lastFrame]);
    [(VideoReader *)self setLastFrame:0];
  }
  v5.receiver = self;
  v5.super_class = (Class)VideoReader;
  [(VideoReader *)&v5 dealloc];
}

- (void)setReadStart:(float)a3
{
  CMTimeMakeWithSeconds(&v4, a3, self->timeScale);
  self->readStartT = ($95D729B680665BEAEFA1D6FCA8238556)v4;
}

- (float)readStart
{
  return self->readStart;
}

- (int)buildAssetReader
{
  if (!self->assetReader)
  {
    asset = self->asset;
    id v27 = 0;
    objc_super v5 = [MEMORY[0x1E4F16378] assetReaderWithAsset:asset error:&v27];
    id v6 = v27;
    id v7 = v27;
    assetReader = self->assetReader;
    self->assetReader = v5;

    if (!self->assetReader)
    {
      objc_storeStrong((id *)&self->lastError, v6);
      NSLog(&cfstr_ErrorCreatingA.isa);
      int v2 = -1;
LABEL_27:

      return v2;
    }
    *(_OWORD *)&time1.start.value = *(_OWORD *)&self->readStartT.value;
    time1.start.epoch = self->readStartT.epoch;
    long long v21 = *MEMORY[0x1E4F1FA48];
    *(_OWORD *)&time2.value = *MEMORY[0x1E4F1FA48];
    CMTimeEpoch v9 = *(void *)(MEMORY[0x1E4F1FA48] + 16);
    time2.epoch = v9;
    if (CMTimeCompare(&time1.start, &time2)
      && (*(_OWORD *)&time1.start.value = *(_OWORD *)&self->readLengthT.value,
          time1.start.epoch = self->readLengthT.epoch,
          long long v20 = *MEMORY[0x1E4F1FA10],
          *(_OWORD *)&time2.value = *MEMORY[0x1E4F1FA10],
          CMTimeEpoch v10 = *(void *)(MEMORY[0x1E4F1FA10] + 16),
          time2.epoch = v10,
          CMTimeCompare(&time1.start, &time2)))
    {
      float readStart = self->readStart;
      if (readStart == 0.0 && self->readLength == 0.0)
      {
LABEL_18:
        int64_t v15 = sub_1DD3D9ABC([(VideoReader *)self pixelFormatOptions], 1);
        v16 = [MEMORY[0x1E4F163A0] assetReaderTrackOutputWithTrack:self->videoTrack outputSettings:v15];
        trackOutput = self->trackOutput;
        self->trackOutput = v16;

        if (([(VideoReader *)self pixelFormatOptions] & 0x400) != 0) {
          [(AVAssetReaderOutput *)self->trackOutput setAlwaysCopiesSampleData:0];
        }
        if ([(AVAssetReader *)self->assetReader canAddOutput:self->trackOutput])
        {
          [(AVAssetReader *)self->assetReader addOutput:self->trackOutput];
          if ([(AVAssetReader *)self->assetReader startReading])
          {
            int v2 = 0;
LABEL_26:

            goto LABEL_27;
          }
          NSLog(&cfstr_StartreadingFa.isa);
          v18 = [(AVAssetReader *)self->assetReader error];
          NSLog(&cfstr_AssetreaderErr.isa, v18);
        }
        else
        {
          NSLog(&cfstr_CanTAddAvasset.isa);
        }
        int v2 = -1;
        goto LABEL_26;
      }
      memset(&time1, 0, sizeof(time1));
      if (readStart == 0.0)
      {
        *(_OWORD *)&time1.start.value = v21;
        time1.start.epoch = v9;
      }
      else
      {
        CMTimeMakeWithSeconds(&time1.start, readStart, self->timeScale);
      }
      float readLength = self->readLength;
      if (readLength == 0.0)
      {
        *(_OWORD *)&time1.duration.value = v20;
        time1.duration.epoch = v10;
      }
      else
      {
        CMTimeMakeWithSeconds(&time2, readLength, self->timeScale);
        time1.CMTime duration = time2;
      }
      CMTimeRange v22 = time1;
      int64_t v12 = self->assetReader;
      uint64_t v13 = &v22;
    }
    else
    {
      memset(&time1, 0, sizeof(time1));
      CMTime time2 = (CMTime)self->readStartT;
      CMTime duration = (CMTime)self->readLengthT;
      CMTimeRangeMake(&time1, &time2, &duration);
      CMTimeRange v23 = time1;
      int64_t v12 = self->assetReader;
      uint64_t v13 = &v23;
    }
    [(AVAssetReader *)v12 setTimeRange:v13];
    goto LABEL_18;
  }
  return 0;
}

- (int)getFrame:(CGImage *)a3
{
  if ([(VideoReader *)self buildAssetReader]) {
    return 2;
  }
  lastError = self->lastError;
  self->lastError = 0;

  int v7 = 1000;
  while (1)
  {
    v8 = [(AVAssetReaderOutput *)self->trackOutput copyNextSampleBuffer];
    if (!v8) {
      break;
    }
    CMTimeEpoch v9 = v8;
    CMItemCount NumSamples = CMSampleBufferGetNumSamples(v8);
    if (NumSamples)
    {
      if (NumSamples != 1)
      {
        NSLog(&cfstr_GetframeNumsam_0.isa, NumSamples);
        CFRelease(v9);
        return 2;
      }
      ImageBuffer = CMSampleBufferGetImageBuffer(v9);
      CGRect CleanRect = CVImageBufferGetCleanRect(ImageBuffer);
      if (ImageBuffer)
      {
        CGFloat x = CleanRect.origin.x;
        CGFloat y = CleanRect.origin.y;
        CGFloat width = CleanRect.size.width;
        CGFloat height = CleanRect.size.height;
        size_t v16 = CVPixelBufferGetWidth(ImageBuffer);
        size_t v17 = CVPixelBufferGetHeight(ImageBuffer);
        size_t BytesPerRow = CVPixelBufferGetBytesPerRow(ImageBuffer);
        uint64_t PixelFormatType = CVPixelBufferGetPixelFormatType(ImageBuffer);
        switch(PixelFormatType)
        {
          case 0x42475241:
            uint32_t v24 = 8198;
            goto LABEL_21;
          case 0x20:
            uint32_t v24 = 16386;
            goto LABEL_21;
          case 0x18:
            uint32_t v24 = 16389;
LABEL_21:
            CVPixelBufferLockBaseAddress(ImageBuffer, 0);
            BaseAddress = CVPixelBufferGetBaseAddress(ImageBuffer);
            if (BaseAddress || (BaseAddress = CVPixelBufferGetBaseAddressOfPlane(ImageBuffer, 0)) != 0)
            {
              DeviceRGB = CGColorSpaceCreateDeviceRGB();
              v31 = CGBitmapContextCreate(BaseAddress, v16, v17, 8uLL, BytesPerRow, DeviceRGB, v24);
              long long v32 = v31;
              if (v31)
              {
                CGContextSetInterpolationQuality(v31, kCGInterpolationNone);
                CGContextSetShouldAntialias(v32, 0);
                Image = CGBitmapContextCreateImage(v32);
                if (Image)
                {
                  v34 = Image;
                  v38.origin.CGFloat x = x;
                  v38.origin.CGFloat y = y;
                  v38.size.CGFloat width = width;
                  v38.size.CGFloat height = height;
                  v35 = CGImageCreateWithImageInRect(Image, v38);
                  CGImageRelease(v34);
LABEL_31:
                  CVPixelBufferUnlockBaseAddress(ImageBuffer, 0);
                  CGColorSpaceRelease(DeviceRGB);
                  if (v32) {
                    CFRelease(v32);
                  }
LABEL_33:
                  *a3 = v35;
                  CMSampleBufferGetPresentationTimeStamp(&v36, v9);
                  self->lastPresentationTime = ($95D729B680665BEAEFA1D6FCA8238556)v36;
                  CFRelease(v9);
                  return 2 * (*a3 == 0);
                }
                NSLog(&cfstr_VideoreaderErr_0.isa);
              }
              else
              {
                NSLog(&cfstr_VideoreaderErr.isa);
              }
              v35 = 0;
              goto LABEL_31;
            }
            CVPixelBufferUnlockBaseAddress(ImageBuffer, 0);
            puts("***VideoReader: NULL base address");
            break;
          default:
            NSLog(&cfstr_VideoreaderUnk.isa, v20, v21, v22, v23, PixelFormatType);
            break;
        }
      }
      else
      {
        NSLog(&cfstr_VideoreaderNoC.isa, CleanRect.origin.x, CleanRect.origin.y, CleanRect.size.width, CleanRect.size.height);
      }
      v35 = 0;
      goto LABEL_33;
    }
    CFRelease(v9);
    if (!--v7)
    {
      NSLog(&cfstr_GetframeNumsam.isa);
      return 2;
    }
  }
  if ([(AVAssetReader *)self->assetReader status] == AVAssetReaderStatusFailed)
  {
    NSLog(&cfstr_GetframeAvasse.isa);
    float v25 = [(AVAssetReader *)self->assetReader error];
    float v26 = self->lastError;
    self->lastError = v25;

    return 2;
  }
  [(AVAssetReader *)self->assetReader cancelReading];
  assetReader = self->assetReader;
  self->assetReader = 0;

  trackOutput = self->trackOutput;
  self->trackOutput = 0;

  return 1;
}

- (opaqueCMSampleBuffer)nextSampleBuf
{
  if (self->_readAheadEnable)
  {
    v3 = [(VideoReader *)self readaheadLock];
    [v3 lock];

    int v4 = [(VideoReader *)self readaheadState];
    if (v4)
    {
      while (v4 == 1)
      {
        objc_super v5 = [(VideoReader *)self readaheadLock];
        [v5 wait];

        int v4 = [(VideoReader *)self readaheadState];
      }
    }
    else
    {
      [(VideoReader *)self setReadaheadBuf:[(AVAssetReaderOutput *)self->trackOutput copyNextSampleBuffer]];
    }
    v8 = [(VideoReader *)self readaheadBuf];
    [(VideoReader *)self setReadaheadBuf:0];
    if (v8) {
      [(VideoReader *)self fireReadahead];
    }
    else {
      [(VideoReader *)self setReadaheadState:3];
    }
    CMTimeEpoch v9 = [(VideoReader *)self readaheadLock];
    [v9 unlock];

    return v8;
  }
  else
  {
    trackOutput = self->trackOutput;
    return [(AVAssetReaderOutput *)trackOutput copyNextSampleBuffer];
  }
}

- (void)fireReadahead
{
  [(VideoReader *)self setReadaheadState:1];
  qos_class_t v3 = qos_class_self();
  int v4 = dispatch_get_global_queue(v3, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1DD3DA1D8;
  block[3] = &unk_1E6CC0308;
  block[4] = self;
  dispatch_async(v4, block);
}

- (int)getFrameAsSampleBuf:(opaqueCMSampleBuffer *)a3
{
  if ([(VideoReader *)self buildAssetReader]) {
    return 2;
  }
  lastError = self->lastError;
  self->lastError = 0;

  int v7 = 1000;
  while (1)
  {
    v8 = [(VideoReader *)self nextSampleBuf];
    if (!v8) {
      break;
    }
    CMTimeEpoch v9 = v8;
    CMItemCount NumSamples = CMSampleBufferGetNumSamples(v8);
    if (NumSamples)
    {
      if (NumSamples == 1)
      {
        *a3 = v9;
        CMSampleBufferGetPresentationTimeStamp(&v17, v9);
        int result = 0;
        self->lastPresentationTime = ($95D729B680665BEAEFA1D6FCA8238556)v17;
        return result;
      }
      NSLog(&cfstr_Getframeassamp_1.isa, NumSamples);
      CFRelease(v9);
      return 2;
    }
    CFRelease(v9);
    if (!--v7)
    {
      NSLog(&cfstr_Getframeassamp_0.isa);
      return 2;
    }
  }
  AVAssetReaderStatus v11 = [(AVAssetReader *)self->assetReader status];
  assetReader = self->assetReader;
  if (v11 == AVAssetReaderStatusFailed)
  {
    uint64_t v13 = [(AVAssetReader *)assetReader error];
    long long v14 = self->lastError;
    self->lastError = v13;

    NSLog(&cfstr_Getframeassamp.isa, self->lastError);
    return 2;
  }
  [(AVAssetReader *)assetReader cancelReading];
  int64_t v15 = self->assetReader;
  self->assetReader = 0;

  trackOutput = self->trackOutput;
  self->trackOutput = 0;

  return 1;
}

- (int)getFrameAtTime:(id *)a3 exactTime:(BOOL)a4 frame:(opaqueCMSampleBuffer *)a5
{
  BOOL v6 = a4;
  if ([(VideoReader *)self lastFrame])
  {
    CMSampleBufferGetPresentationTimeStamp(&time1, [(VideoReader *)self lastFrame]);
    CMTime time2 = (CMTime)*a3;
    int32_t v9 = CMTimeCompare(&time1, &time2);
    if ((v9 & 0x80000000) == 0)
    {
      int32_t v10 = v9;
      AVAssetReaderStatus v11 = [(VideoReader *)self lastFrame];
      if (v10 && v6)
      {
        if (v11)
        {
          CFRelease([(VideoReader *)self lastFrame]);
          [(VideoReader *)self setLastFrame:0];
        }
        return 2;
      }
      *a5 = v11;
      goto LABEL_19;
    }
    if ([(VideoReader *)self lastFrame])
    {
      CFRelease([(VideoReader *)self lastFrame]);
      [(VideoReader *)self setLastFrame:0];
    }
  }
  CFTypeRef cf = 0;
  int result = [(VideoReader *)self getFrameAsSampleBuf:&cf];
  if (result) {
    return result;
  }
  while (1)
  {
    CMTime time2 = (CMTime)self->lastPresentationTime;
    $3CC8671D27C23BF42ADDB32F2B5E48AE v14 = *a3;
    int32_t v13 = CMTimeCompare(&time2, (CMTime *)&v14);
    if ((v13 & 0x80000000) == 0) {
      break;
    }
    CFRelease(cf);
    CFTypeRef cf = 0;
    int result = [(VideoReader *)self getFrameAsSampleBuf:&cf];
    if (result) {
      return result;
    }
  }
  if (v13 && v6)
  {
    CFRelease(cf);
    return 2;
  }
  *a5 = (opaqueCMSampleBuffer *)cf;
  -[VideoReader setLastFrame:](self, "setLastFrame:");
LABEL_19:
  CFRetain([(VideoReader *)self lastFrame]);
  return 0;
}

- (void)setReadAheadEnable:(BOOL)a3
{
  self->_readAheadEnable = a3;
  if (a3)
  {
    [(VideoReader *)self setReadaheadState:0];
    id v4 = objc_alloc_init(MEMORY[0x1E4F28BB0]);
    [(VideoReader *)self setReadaheadLock:v4];
  }
}

- (BOOL)readAheadEnable
{
  return self->_readAheadEnable;
}

- (int)reset
{
  assetReader = self->assetReader;
  if (assetReader)
  {
    self->assetReader = 0;
  }
  trackOutput = self->trackOutput;
  self->trackOutput = 0;

  return 0;
}

- (int)skipFrames:(unsigned int)a3
{
  if (!a3) {
    return 0;
  }
  unsigned int v3 = a3;
  while (1)
  {
    CFTypeRef cf = 0;
    int result = [(VideoReader *)self getFrameAsSampleBuf:&cf];
    if (result) {
      break;
    }
    CFRelease(cf);
    if (!--v3) {
      return 0;
    }
  }
  return result;
}

- (float)trackStart
{
  return self->trackStart;
}

- (float)trackLength
{
  return self->trackLength;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)trackStartT
{
  objc_copyStruct(retstr, &self->trackStartT, 24, 1, 0);
  return result;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)trackLengthT
{
  objc_copyStruct(retstr, &self->trackLengthT, 24, 1, 0);
  return result;
}

- (float)readLength
{
  return self->readLength;
}

- (void)setReadLength:(float)a3
{
  self->float readLength = a3;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)readStartT
{
  objc_copyStruct(retstr, &self->readStartT, 24, 1, 0);
  return result;
}

- (void)setReadStartT:(id *)a3
{
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)readLengthT
{
  objc_copyStruct(retstr, &self->readLengthT, 24, 1, 0);
  return result;
}

- (void)setReadLengthT:(id *)a3
{
}

- (int)timeScale
{
  return self->timeScale;
}

- (float)fps
{
  return self->fps;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)minFrameDuration
{
  objc_copyStruct(retstr, &self->minFrameDuration, 24, 1, 0);
  return result;
}

- (unsigned)imageWidth
{
  return self->imageWidth;
}

- (unsigned)imageHeight
{
  return self->imageHeight;
}

- (NSError)lastError
{
  return (NSError *)objc_getProperty(self, a2, 56, 1);
}

- (CGAffineTransform)preferredTransform
{
  objc_copyStruct(retstr, &self->preferredTransform, 48, 1, 0);
  return result;
}

- (NSArray)formatDescriptions
{
  return (NSArray *)objc_getProperty(self, a2, 64, 1);
}

- (BOOL)fullRangeVideo
{
  return self->fullRangeVideo;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)lastPresentationTime
{
  objc_copyStruct(retstr, &self->lastPresentationTime, 24, 1, 0);
  return result;
}

- (AVAsset)asset
{
  return (AVAsset *)objc_getProperty(self, a2, 72, 1);
}

- (AVAssetTrack)videoTrack
{
  return (AVAssetTrack *)objc_getProperty(self, a2, 80, 1);
}

- (AVAssetReader)assetReader
{
  return (AVAssetReader *)objc_getProperty(self, a2, 88, 1);
}

- (AVAssetReaderOutput)trackOutput
{
  return (AVAssetReaderOutput *)objc_getProperty(self, a2, 96, 1);
}

- (unsigned)pixelFormatOptions
{
  return self->_pixelFormatOptions;
}

- (void)setPixelFormatOptions:(unsigned int)a3
{
  self->_pixelFormatOptions = a3;
}

- (opaqueCMSampleBuffer)readaheadBuf
{
  return self->_readaheadBuf;
}

- (void)setReadaheadBuf:(opaqueCMSampleBuffer *)a3
{
  self->_readaheadBuf = a3;
}

- (int)readaheadState
{
  return self->_readaheadState;
}

- (void)setReadaheadState:(int)a3
{
  self->_readaheadState = a3;
}

- (NSCondition)readaheadLock
{
  return (NSCondition *)objc_getProperty(self, a2, 112, 1);
}

- (void)setReadaheadLock:(id)a3
{
}

- (opaqueCMSampleBuffer)lastFrame
{
  return self->_lastFrame;
}

- (void)setLastFrame:(opaqueCMSampleBuffer *)a3
{
  self->_lastFrame = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_readaheadLock, 0);
  objc_storeStrong((id *)&self->trackOutput, 0);
  objc_storeStrong((id *)&self->assetReader, 0);
  objc_storeStrong((id *)&self->videoTrack, 0);
  objc_storeStrong((id *)&self->asset, 0);
  objc_storeStrong((id *)&self->formatDescriptions, 0);

  objc_storeStrong((id *)&self->lastError, 0);
}

@end