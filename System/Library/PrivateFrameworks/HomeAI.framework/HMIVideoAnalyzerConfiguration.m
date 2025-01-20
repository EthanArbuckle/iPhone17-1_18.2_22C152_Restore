@interface HMIVideoAnalyzerConfiguration
+ (BOOL)supportsSecureCoding;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)maxFragmentDuration;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)thumbnailInterval;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)timelapseInterval;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)timelapsePreferredFragmentDuration;
- (BOOL)allowReducedConfiguration;
- (BOOL)enableTemporalEventFiltering;
- (BOOL)isEqual:(id)a3;
- (BOOL)passthroughAudio;
- (BOOL)redactFrames;
- (BOOL)saveAnalyzerResultsToDisk;
- (BOOL)timelapseVideo;
- (BOOL)transcode;
- (HMICamera)camera;
- (HMIVideoAnalyzerConfiguration)init;
- (HMIVideoAnalyzerConfiguration)initWithCoder:(id)a3;
- (NSUUID)homeUUID;
- (double)analysisFPS;
- (double)maxFragmentAnalysisDuration;
- (double)minFrameQuality;
- (double)minFrameScale;
- (id)attributeDescriptions;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)decodeMode;
- (int64_t)packageClassifierMode;
- (unint64_t)thumbnailHeight;
- (unsigned)timelapseCodecType;
- (unsigned)transcodeCodecType;
- (void)encodeWithCoder:(id)a3;
- (void)setAllowReducedConfiguration:(BOOL)a3;
- (void)setAnalysisFPS:(double)a3;
- (void)setCamera:(id)a3;
- (void)setDecodeMode:(int64_t)a3;
- (void)setEnableTemporalEventFiltering:(BOOL)a3;
- (void)setHomeUUID:(id)a3;
- (void)setMaxFragmentAnalysisDuration:(double)a3;
- (void)setMaxFragmentDuration:(id *)a3;
- (void)setMinFrameQuality:(double)a3;
- (void)setMinFrameScale:(double)a3;
- (void)setPackageClassifierMode:(int64_t)a3;
- (void)setPassthroughAudio:(BOOL)a3;
- (void)setRedactFrames:(BOOL)a3;
- (void)setSaveAnalyzerResultsToDisk:(BOOL)a3;
- (void)setThumbnailHeight:(unint64_t)a3;
- (void)setThumbnailInterval:(id *)a3;
- (void)setTimelapseCodecType:(unsigned int)a3;
- (void)setTimelapseInterval:(id *)a3;
- (void)setTimelapsePreferredFragmentDuration:(id *)a3;
- (void)setTimelapseVideo:(BOOL)a3;
- (void)setTimelapseVideoPreferredFragmentDuration:(id *)a3;
- (void)setTranscode:(BOOL)a3;
- (void)setTranscodeCodecType:(unsigned int)a3;
@end

@implementation HMIVideoAnalyzerConfiguration

- (HMIVideoAnalyzerConfiguration)init
{
  v11.receiver = self;
  v11.super_class = (Class)HMIVideoAnalyzerConfiguration;
  v2 = [(HMIVideoAnalyzerConfiguration *)&v11 init];
  if (v2)
  {
    CMTimeMake(&v10, 1, 1);
    long long v3 = *(_OWORD *)&v10.value;
    *((void *)v2 + 14) = v10.epoch;
    *((_OWORD *)v2 + 6) = v3;
    *((void *)v2 + 6) = 100;
    uint64_t v4 = MEMORY[0x263F01090];
    *(_OWORD *)(v2 + 120) = *MEMORY[0x263F01090];
    *((void *)v2 + 17) = *(void *)(v4 + 16);
    CMTimeMake(&v10, 20, 1);
    long long v5 = *(_OWORD *)&v10.value;
    *((void *)v2 + 20) = v10.epoch;
    *((_OWORD *)v2 + 9) = v5;
    *((_DWORD *)v2 + 4) = 1635148593;
    *((void *)v2 + 7) = 0x4014000000000000;
    CMTimeMake(&v10, 8, 1);
    long long v6 = *(_OWORD *)&v10.value;
    *((void *)v2 + 23) = v10.epoch;
    *(_OWORD *)(v2 + 168) = v6;
    *((void *)v2 + 10) = 2;
    v2[8] = 1;
    v2[9] = 1;
    v7 = (void *)*((void *)v2 + 8);
    *((void *)v2 + 8) = 0;

    v8 = (void *)*((void *)v2 + 9);
    *((void *)v2 + 9) = 0;

    *((void *)v2 + 3) = 0x3FE8000000000000;
    *((void *)v2 + 4) = 0x3FD0000000000000;
    *((void *)v2 + 11) = 1;
    v2[10] = 0;
    v2[11] = 1;
    *((_WORD *)v2 + 6) = 1;
    *((_DWORD *)v2 + 5) = 1635148593;
    *((void *)v2 + 5) = 0x3FF0000000000000;
  }
  return (HMIVideoAnalyzerConfiguration *)v2;
}

- (id)attributeDescriptions
{
  v74[18] = *MEMORY[0x263EF8340];
  id v3 = objc_alloc(MEMORY[0x263F424F8]);
  uint64_t v4 = NSNumber;
  [(HMIVideoAnalyzerConfiguration *)self thumbnailInterval];
  v69 = [v4 numberWithDouble:CMTimeGetSeconds(&time)];
  v68 = (void *)[v3 initWithName:@"Thumbnail Interval" value:v69];
  v74[0] = v68;
  id v5 = objc_alloc(MEMORY[0x263F424F8]);
  v67 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMIVideoAnalyzerConfiguration thumbnailHeight](self, "thumbnailHeight"));
  v66 = (void *)[v5 initWithName:@"Thumbnail Height" value:v67];
  v74[1] = v66;
  id v6 = objc_alloc(MEMORY[0x263F424F8]);
  v7 = NSNumber;
  [(HMIVideoAnalyzerConfiguration *)self timelapseInterval];
  v65 = [v7 numberWithDouble:CMTimeGetSeconds(&v72)];
  v64 = (void *)[v6 initWithName:@"Timelapse Interval" value:v65];
  v74[2] = v64;
  id v8 = objc_alloc(MEMORY[0x263F424F8]);
  v9 = NSNumber;
  [(HMIVideoAnalyzerConfiguration *)self timelapsePreferredFragmentDuration];
  v63 = [v9 numberWithDouble:CMTimeGetSeconds(&v71)];
  v62 = (void *)[v8 initWithName:@"Timelapse Preferred Fragment Duration" value:v63];
  v74[3] = v62;
  id v10 = objc_alloc(MEMORY[0x263F424F8]);
  v61 = HMIFourCCString([(HMIVideoAnalyzerConfiguration *)self timelapseCodecType]);
  v60 = (void *)[v10 initWithName:@"Timelapse Codec" value:v61];
  v74[4] = v60;
  id v11 = objc_alloc(MEMORY[0x263F424F8]);
  v12 = NSNumber;
  [(HMIVideoAnalyzerConfiguration *)self maxFragmentDuration];
  v59 = [v12 numberWithDouble:CMTimeGetSeconds(&v70)];
  v58 = (void *)[v11 initWithName:@"Max Fragment Duration" value:v59];
  v74[5] = v58;
  id v13 = objc_alloc(MEMORY[0x263F424F8]);
  v14 = NSNumber;
  [(HMIVideoAnalyzerConfiguration *)self maxFragmentAnalysisDuration];
  v57 = objc_msgSend(v14, "numberWithDouble:");
  v56 = (void *)[v13 initWithName:@"Max Fragment Analysis Duration" value:v57];
  v74[6] = v56;
  id v15 = objc_alloc(MEMORY[0x263F424F8]);
  int64_t v16 = [(HMIVideoAnalyzerConfiguration *)self decodeMode];
  v17 = @"IFrameOnly";
  if (v16 != 1) {
    v17 = @"None";
  }
  if (v16 == 2) {
    v17 = @"Full";
  }
  v51 = v17;
  v55 = (void *)[v15 initWithName:@"Decode Mode" value:v51];
  v74[7] = v55;
  id v18 = objc_alloc(MEMORY[0x263F424F8]);
  [(HMIVideoAnalyzerConfiguration *)self transcode];
  v54 = HMFBooleanToString();
  v53 = (void *)[v18 initWithName:@"Transcode" value:v54];
  v74[8] = v53;
  id v19 = objc_alloc(MEMORY[0x263F424F8]);
  v52 = HMIFourCCString([(HMIVideoAnalyzerConfiguration *)self transcodeCodecType]);
  v50 = (void *)[v19 initWithName:@"Transcode Codec" value:v52];
  v74[9] = v50;
  id v20 = objc_alloc(MEMORY[0x263F424F8]);
  [(HMIVideoAnalyzerConfiguration *)self passthroughAudio];
  v49 = HMFBooleanToString();
  v48 = (void *)[v20 initWithName:@"Passthrough Audio" value:v49];
  v74[10] = v48;
  id v21 = objc_alloc(MEMORY[0x263F424F8]);
  [(HMIVideoAnalyzerConfiguration *)self redactFrames];
  v47 = HMFBooleanToString();
  v46 = (void *)[v21 initWithName:@"Redact frames" value:v47];
  v74[11] = v46;
  id v22 = objc_alloc(MEMORY[0x263F424F8]);
  v23 = NSNumber;
  [(HMIVideoAnalyzerConfiguration *)self minFrameQuality];
  v45 = objc_msgSend(v23, "numberWithDouble:");
  uint64_t v43 = [v22 initWithName:@"Min Frame Quality" value:v45];
  v74[12] = v43;
  id v24 = objc_alloc(MEMORY[0x263F424F8]);
  v25 = NSNumber;
  [(HMIVideoAnalyzerConfiguration *)self minFrameScale];
  v26 = objc_msgSend(v25, "numberWithDouble:");
  v27 = (void *)[v24 initWithName:@"Min Frame Scale" value:v26];
  v74[13] = v27;
  id v28 = objc_alloc(MEMORY[0x263F424F8]);
  v29 = [(HMIVideoAnalyzerConfiguration *)self camera];
  v30 = (void *)[v28 initWithName:@"Camera" value:v29];
  v74[14] = v30;
  id v31 = objc_alloc(MEMORY[0x263F424F8]);
  v32 = [(HMIVideoAnalyzerConfiguration *)self homeUUID];
  v33 = (void *)[v31 initWithName:@"Home UUID" value:v32];
  v74[15] = v33;
  id v34 = objc_alloc(MEMORY[0x263F424F8]);
  if ([(HMIVideoAnalyzerConfiguration *)self packageClassifierMode]) {
    v35 = @"Detector";
  }
  else {
    v35 = @"None";
  }
  v36 = objc_msgSend(v34, "initWithName:value:", @"Package Classifier Mode", v35, v43);
  v74[16] = v36;
  id v37 = objc_alloc(MEMORY[0x263F424F8]);
  v38 = NSNumber;
  [(HMIVideoAnalyzerConfiguration *)self analysisFPS];
  v39 = objc_msgSend(v38, "numberWithDouble:");
  v40 = (void *)[v37 initWithName:@"Analysis FPS" value:v39];
  v74[17] = v40;
  v41 = [MEMORY[0x263EFF8C0] arrayWithObjects:v74 count:18];

  return v41;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (HMIVideoAnalyzerConfiguration *)a3;
  if (v4 == self)
  {
    char v6 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      [(HMIVideoAnalyzerConfiguration *)self thumbnailInterval];
      if (v5) {
        [(HMIVideoAnalyzerConfiguration *)v5 thumbnailInterval];
      }
      else {
        memset(&time2, 0, sizeof(time2));
      }
      int32_t v7 = CMTimeCompare(&time1, &time2);
      unint64_t v8 = [(HMIVideoAnalyzerConfiguration *)self thumbnailHeight];
      uint64_t v9 = [(HMIVideoAnalyzerConfiguration *)v5 thumbnailHeight];
      [(HMIVideoAnalyzerConfiguration *)self timelapseInterval];
      if (v5) {
        [(HMIVideoAnalyzerConfiguration *)v5 timelapseInterval];
      }
      else {
        memset(&v58, 0, sizeof(v58));
      }
      int v10 = CMTimeCompare(&v59, &v58) | v7;
      [(HMIVideoAnalyzerConfiguration *)self timelapsePreferredFragmentDuration];
      if (v5) {
        [(HMIVideoAnalyzerConfiguration *)v5 timelapsePreferredFragmentDuration];
      }
      else {
        memset(&v56, 0, sizeof(v56));
      }
      int32_t v11 = CMTimeCompare(&v57, &v56);
      unsigned int v12 = [(HMIVideoAnalyzerConfiguration *)self timelapseCodecType];
      unsigned int v13 = [(HMIVideoAnalyzerConfiguration *)v5 timelapseCodecType];
      BOOL v16 = v8 == v9 && (v10 | v11) == 0 && v12 == v13;
      [(HMIVideoAnalyzerConfiguration *)self maxFragmentDuration];
      if (v5) {
        [(HMIVideoAnalyzerConfiguration *)v5 maxFragmentDuration];
      }
      else {
        memset(&v54, 0, sizeof(v54));
      }
      if (CMTimeCompare(&v55, &v54)) {
        BOOL v16 = 0;
      }
      [(HMIVideoAnalyzerConfiguration *)self maxFragmentAnalysisDuration];
      double v18 = v17;
      [(HMIVideoAnalyzerConfiguration *)v5 maxFragmentAnalysisDuration];
      BOOL v20 = v18 == v19 && v16;
      int64_t v21 = [(HMIVideoAnalyzerConfiguration *)self decodeMode];
      if (v21 != [(HMIVideoAnalyzerConfiguration *)v5 decodeMode]) {
        BOOL v20 = 0;
      }
      BOOL v22 = [(HMIVideoAnalyzerConfiguration *)self transcode];
      int v23 = v20 & ~(v22 ^ [(HMIVideoAnalyzerConfiguration *)v5 transcode]);
      unsigned int v24 = [(HMIVideoAnalyzerConfiguration *)self transcodeCodecType];
      if (v24 != [(HMIVideoAnalyzerConfiguration *)v5 transcodeCodecType]) {
        int v23 = 0;
      }
      BOOL v25 = [(HMIVideoAnalyzerConfiguration *)self passthroughAudio];
      int v26 = v25 ^ [(HMIVideoAnalyzerConfiguration *)v5 passthroughAudio];
      BOOL v27 = [(HMIVideoAnalyzerConfiguration *)self redactFrames];
      int v28 = v26 | v27 ^ [(HMIVideoAnalyzerConfiguration *)v5 redactFrames];
      BOOL v29 = [(HMIVideoAnalyzerConfiguration *)self allowReducedConfiguration];
      int v30 = v29 ^ [(HMIVideoAnalyzerConfiguration *)v5 allowReducedConfiguration];
      BOOL v31 = [(HMIVideoAnalyzerConfiguration *)self enableTemporalEventFiltering];
      int v32 = v28 | v30 | v31 ^ [(HMIVideoAnalyzerConfiguration *)v5 enableTemporalEventFiltering];
      BOOL v33 = [(HMIVideoAnalyzerConfiguration *)self saveAnalyzerResultsToDisk];
      int v34 = v23 & ~(v32 | v33 ^ [(HMIVideoAnalyzerConfiguration *)v5 saveAnalyzerResultsToDisk]);
      [(HMIVideoAnalyzerConfiguration *)self minFrameQuality];
      double v36 = v35;
      [(HMIVideoAnalyzerConfiguration *)v5 minFrameQuality];
      if (v36 != v37) {
        LOBYTE(v34) = 0;
      }
      [(HMIVideoAnalyzerConfiguration *)self minFrameScale];
      double v39 = v38;
      [(HMIVideoAnalyzerConfiguration *)v5 minFrameScale];
      if (v39 == v40) {
        char v41 = v34;
      }
      else {
        char v41 = 0;
      }
      int64_t v42 = [(HMIVideoAnalyzerConfiguration *)self packageClassifierMode];
      if (v42 == [(HMIVideoAnalyzerConfiguration *)v5 packageClassifierMode]) {
        char v43 = v41;
      }
      else {
        char v43 = 0;
      }
      [(HMIVideoAnalyzerConfiguration *)self analysisFPS];
      double v45 = v44;
      [(HMIVideoAnalyzerConfiguration *)v5 analysisFPS];
      if (v45 == v46) {
        char v47 = v43;
      }
      else {
        char v47 = 0;
      }
      v48 = [(HMIVideoAnalyzerConfiguration *)self camera];
      uint64_t v49 = [(HMIVideoAnalyzerConfiguration *)v5 camera];
      char v50 = HMFEqualObjects();

      v51 = [(HMIVideoAnalyzerConfiguration *)self homeUUID];
      v52 = [(HMIVideoAnalyzerConfiguration *)v5 homeUUID];
      LOBYTE(v49) = HMFEqualObjects();

      char v6 = v47 & v50 & v49;
    }
    else
    {
      char v6 = 0;
    }
  }

  return v6;
}

- (void)setMinFrameQuality:(double)a3
{
  if (a3 > 0.0)
  {
    BOOL v4 = a3 == 1.0;
    BOOL v3 = a3 >= 1.0;
  }
  else
  {
    BOOL v3 = 1;
    BOOL v4 = 0;
  }
  if (!v4 && v3)
  {
    id v5 = (HMIVideoAnalyzerConfiguration *)_HMFPreconditionFailure();
    [(HMIVideoAnalyzerConfiguration *)v5 minFrameQuality];
  }
  else
  {
    self->_minFrameQuality = a3;
  }
}

- (double)minFrameQuality
{
  return self->_minFrameQuality;
}

- (void)setMinFrameScale:(double)a3
{
  if (a3 > 0.0)
  {
    BOOL v4 = a3 == 1.0;
    BOOL v3 = a3 >= 1.0;
  }
  else
  {
    BOOL v3 = 1;
    BOOL v4 = 0;
  }
  if (!v4 && v3)
  {
    id v5 = (HMIVideoAnalyzerConfiguration *)_HMFPreconditionFailure();
    [(HMIVideoAnalyzerConfiguration *)v5 minFrameScale];
  }
  else
  {
    self->_minFrameScale = a3;
  }
}

- (double)minFrameScale
{
  return self->_minFrameScale;
}

- (BOOL)timelapseVideo
{
  [(HMIVideoAnalyzerConfiguration *)self timelapseInterval];
  return v3 & 1;
}

- (void)setTimelapseVideo:(BOOL)a3
{
  if (a3) {
    CMTimeMake(&v5, 1, 1);
  }
  else {
    CMTime v5 = *(CMTime *)*(void *)&MEMORY[0x263F01090];
  }
  CMTime v4 = v5;
  [(HMIVideoAnalyzerConfiguration *)self setTimelapseInterval:&v4];
}

- (void)setTimelapseVideoPreferredFragmentDuration:(id *)a3
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE v3 = *a3;
  [(HMIVideoAnalyzerConfiguration *)self setTimelapsePreferredFragmentDuration:&v3];
}

- (double)analysisFPS
{
  return self->_analysisFPS;
}

- (void)setAnalysisFPS:(double)a3
{
  if (a3 <= 0.0)
  {
    $3CC8671D27C23BF42ADDB32F2B5E48AE v3 = (HMIVideoAnalyzerConfiguration *)_HMFPreconditionFailure();
    [(HMIVideoAnalyzerConfiguration *)v3 copyWithZone:v5];
  }
  else
  {
    self->_analysisFPS = a3;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  SEL v4 = objc_alloc_init(HMIVideoAnalyzerConfiguration);
  [(HMIVideoAnalyzerConfiguration *)self thumbnailInterval];
  long long v20 = v22;
  uint64_t v21 = v23;
  [(HMIVideoAnalyzerConfiguration *)v4 setThumbnailInterval:&v20];
  [(HMIVideoAnalyzerConfiguration *)v4 setThumbnailHeight:[(HMIVideoAnalyzerConfiguration *)self thumbnailHeight]];
  [(HMIVideoAnalyzerConfiguration *)self timelapseInterval];
  long long v16 = v18;
  uint64_t v17 = v19;
  [(HMIVideoAnalyzerConfiguration *)v4 setTimelapseInterval:&v16];
  [(HMIVideoAnalyzerConfiguration *)self timelapsePreferredFragmentDuration];
  long long v12 = v14;
  uint64_t v13 = v15;
  [(HMIVideoAnalyzerConfiguration *)v4 setTimelapsePreferredFragmentDuration:&v12];
  [(HMIVideoAnalyzerConfiguration *)v4 setTimelapseCodecType:[(HMIVideoAnalyzerConfiguration *)self timelapseCodecType]];
  [(HMIVideoAnalyzerConfiguration *)self maxFragmentAnalysisDuration];
  -[HMIVideoAnalyzerConfiguration setMaxFragmentAnalysisDuration:](v4, "setMaxFragmentAnalysisDuration:");
  [(HMIVideoAnalyzerConfiguration *)self maxFragmentDuration];
  long long v8 = v10;
  uint64_t v9 = v11;
  [(HMIVideoAnalyzerConfiguration *)v4 setMaxFragmentDuration:&v8];
  [(HMIVideoAnalyzerConfiguration *)v4 setDecodeMode:[(HMIVideoAnalyzerConfiguration *)self decodeMode]];
  [(HMIVideoAnalyzerConfiguration *)v4 setTranscode:[(HMIVideoAnalyzerConfiguration *)self transcode]];
  [(HMIVideoAnalyzerConfiguration *)v4 setTranscodeCodecType:[(HMIVideoAnalyzerConfiguration *)self transcodeCodecType]];
  [(HMIVideoAnalyzerConfiguration *)v4 setPassthroughAudio:[(HMIVideoAnalyzerConfiguration *)self passthroughAudio]];
  CMTime v5 = [(HMIVideoAnalyzerConfiguration *)self camera];
  [(HMIVideoAnalyzerConfiguration *)v4 setCamera:v5];

  SEL v6 = [(HMIVideoAnalyzerConfiguration *)self homeUUID];
  [(HMIVideoAnalyzerConfiguration *)v4 setHomeUUID:v6];

  [(HMIVideoAnalyzerConfiguration *)self minFrameQuality];
  -[HMIVideoAnalyzerConfiguration setMinFrameQuality:](v4, "setMinFrameQuality:");
  [(HMIVideoAnalyzerConfiguration *)self minFrameScale];
  -[HMIVideoAnalyzerConfiguration setMinFrameScale:](v4, "setMinFrameScale:");
  [(HMIVideoAnalyzerConfiguration *)v4 setPackageClassifierMode:[(HMIVideoAnalyzerConfiguration *)self packageClassifierMode]];
  [(HMIVideoAnalyzerConfiguration *)v4 setRedactFrames:[(HMIVideoAnalyzerConfiguration *)self redactFrames]];
  [(HMIVideoAnalyzerConfiguration *)v4 setAllowReducedConfiguration:[(HMIVideoAnalyzerConfiguration *)self allowReducedConfiguration]];
  [(HMIVideoAnalyzerConfiguration *)v4 setEnableTemporalEventFiltering:[(HMIVideoAnalyzerConfiguration *)self enableTemporalEventFiltering]];
  [(HMIVideoAnalyzerConfiguration *)v4 setSaveAnalyzerResultsToDisk:[(HMIVideoAnalyzerConfiguration *)self saveAnalyzerResultsToDisk]];
  [(HMIVideoAnalyzerConfiguration *)self analysisFPS];
  -[HMIVideoAnalyzerConfiguration setAnalysisFPS:](v4, "setAnalysisFPS:");
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HMIVideoAnalyzerConfiguration)initWithCoder:(id)a3
{
  id v4 = a3;
  CMTime v5 = [(HMIVideoAnalyzerConfiguration *)self init];
  SEL v6 = NSStringFromSelector(sel_thumbnailInterval);
  if (v4)
  {
    [v4 decodeCMTimeForKey:v6];
  }
  else
  {
    long long v46 = 0uLL;
    uint64_t v47 = 0;
  }
  long long v44 = v46;
  uint64_t v45 = v47;
  [(HMIVideoAnalyzerConfiguration *)v5 setThumbnailInterval:&v44];

  int32_t v7 = NSStringFromSelector(sel_thumbnailHeight);
  -[HMIVideoAnalyzerConfiguration setThumbnailHeight:](v5, "setThumbnailHeight:", [v4 decodeIntegerForKey:v7]);

  long long v8 = NSStringFromSelector(sel_timelapseInterval);
  if (v4)
  {
    [v4 decodeCMTimeForKey:v8];
  }
  else
  {
    long long v42 = 0uLL;
    uint64_t v43 = 0;
  }
  long long v40 = v42;
  uint64_t v41 = v43;
  [(HMIVideoAnalyzerConfiguration *)v5 setTimelapseInterval:&v40];

  uint64_t v9 = NSStringFromSelector(sel_timelapsePreferredFragmentDuration);
  if (v4)
  {
    [v4 decodeCMTimeForKey:v9];
  }
  else
  {
    long long v38 = 0uLL;
    uint64_t v39 = 0;
  }
  long long v36 = v38;
  uint64_t v37 = v39;
  [(HMIVideoAnalyzerConfiguration *)v5 setTimelapsePreferredFragmentDuration:&v36];

  long long v10 = NSStringFromSelector(sel_timelapseCodecType);
  -[HMIVideoAnalyzerConfiguration setTimelapseCodecType:](v5, "setTimelapseCodecType:", [v4 decodeIntegerForKey:v10]);

  uint64_t v11 = NSStringFromSelector(sel_maxFragmentAnalysisDuration);
  [v4 decodeDoubleForKey:v11];
  -[HMIVideoAnalyzerConfiguration setMaxFragmentAnalysisDuration:](v5, "setMaxFragmentAnalysisDuration:");

  long long v12 = NSStringFromSelector(sel_maxFragmentDuration);
  if (v4)
  {
    [v4 decodeCMTimeForKey:v12];
  }
  else
  {
    long long v34 = 0uLL;
    uint64_t v35 = 0;
  }
  long long v32 = v34;
  uint64_t v33 = v35;
  [(HMIVideoAnalyzerConfiguration *)v5 setMaxFragmentDuration:&v32];

  uint64_t v13 = NSStringFromSelector(sel_decodeMode);
  -[HMIVideoAnalyzerConfiguration setDecodeMode:](v5, "setDecodeMode:", [v4 decodeIntegerForKey:v13]);

  long long v14 = NSStringFromSelector(sel_transcode);
  -[HMIVideoAnalyzerConfiguration setTranscode:](v5, "setTranscode:", [v4 decodeBoolForKey:v14]);

  uint64_t v15 = NSStringFromSelector(sel_transcodeCodecType);
  -[HMIVideoAnalyzerConfiguration setTranscodeCodecType:](v5, "setTranscodeCodecType:", [v4 decodeIntegerForKey:v15]);

  long long v16 = NSStringFromSelector(sel_passthroughAudio);
  -[HMIVideoAnalyzerConfiguration setPassthroughAudio:](v5, "setPassthroughAudio:", [v4 decodeBoolForKey:v16]);

  uint64_t v17 = NSStringFromSelector(sel_redactFrames);
  -[HMIVideoAnalyzerConfiguration setRedactFrames:](v5, "setRedactFrames:", [v4 decodeBoolForKey:v17]);

  long long v18 = NSStringFromSelector(sel_allowReducedConfiguration);
  -[HMIVideoAnalyzerConfiguration setAllowReducedConfiguration:](v5, "setAllowReducedConfiguration:", [v4 decodeBoolForKey:v18]);

  uint64_t v19 = NSStringFromSelector(sel_enableTemporalEventFiltering);
  -[HMIVideoAnalyzerConfiguration setEnableTemporalEventFiltering:](v5, "setEnableTemporalEventFiltering:", [v4 decodeBoolForKey:v19]);

  long long v20 = NSStringFromSelector(sel_saveAnalyzerResultsToDisk);
  -[HMIVideoAnalyzerConfiguration setSaveAnalyzerResultsToDisk:](v5, "setSaveAnalyzerResultsToDisk:", [v4 decodeBoolForKey:v20]);

  uint64_t v21 = NSStringFromSelector(sel_minFrameQuality);
  [v4 decodeDoubleForKey:v21];
  -[HMIVideoAnalyzerConfiguration setMinFrameQuality:](v5, "setMinFrameQuality:");

  long long v22 = NSStringFromSelector(sel_minFrameScale);
  [v4 decodeDoubleForKey:v22];
  -[HMIVideoAnalyzerConfiguration setMinFrameScale:](v5, "setMinFrameScale:");

  uint64_t v23 = objc_opt_class();
  unsigned int v24 = NSStringFromSelector(sel_camera);
  BOOL v25 = [v4 decodeObjectOfClass:v23 forKey:v24];
  [(HMIVideoAnalyzerConfiguration *)v5 setCamera:v25];

  uint64_t v26 = objc_opt_class();
  BOOL v27 = NSStringFromSelector(sel_homeUUID);
  int v28 = [v4 decodeObjectOfClass:v26 forKey:v27];
  [(HMIVideoAnalyzerConfiguration *)v5 setHomeUUID:v28];

  BOOL v29 = NSStringFromSelector(sel_packageClassifierMode);
  -[HMIVideoAnalyzerConfiguration setPackageClassifierMode:](v5, "setPackageClassifierMode:", [v4 decodeIntegerForKey:v29]);

  int v30 = NSStringFromSelector(sel_analysisFPS);
  [v4 decodeDoubleForKey:v30];
  -[HMIVideoAnalyzerConfiguration setAnalysisFPS:](v5, "setAnalysisFPS:");

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  [(HMIVideoAnalyzerConfiguration *)self thumbnailInterval];
  CMTime v5 = NSStringFromSelector(sel_thumbnailInterval);
  [v4 encodeCMTime:v50 forKey:v5];

  unint64_t v6 = [(HMIVideoAnalyzerConfiguration *)self thumbnailHeight];
  int32_t v7 = NSStringFromSelector(sel_thumbnailHeight);
  [v4 encodeInteger:v6 forKey:v7];

  [(HMIVideoAnalyzerConfiguration *)self timelapseInterval];
  long long v8 = NSStringFromSelector(sel_timelapseInterval);
  [v4 encodeCMTime:v49 forKey:v8];

  [(HMIVideoAnalyzerConfiguration *)self timelapsePreferredFragmentDuration];
  uint64_t v9 = NSStringFromSelector(sel_timelapsePreferredFragmentDuration);
  [v4 encodeCMTime:v48 forKey:v9];

  uint64_t v10 = [(HMIVideoAnalyzerConfiguration *)self timelapseCodecType];
  uint64_t v11 = NSStringFromSelector(sel_timelapseCodecType);
  [v4 encodeInteger:v10 forKey:v11];

  [(HMIVideoAnalyzerConfiguration *)self maxFragmentAnalysisDuration];
  double v13 = v12;
  long long v14 = NSStringFromSelector(sel_maxFragmentAnalysisDuration);
  [v4 encodeDouble:v14 forKey:v13];

  [(HMIVideoAnalyzerConfiguration *)self maxFragmentDuration];
  uint64_t v15 = NSStringFromSelector(sel_maxFragmentDuration);
  [v4 encodeCMTime:&v47 forKey:v15];

  int64_t v16 = [(HMIVideoAnalyzerConfiguration *)self decodeMode];
  uint64_t v17 = NSStringFromSelector(sel_decodeMode);
  [v4 encodeInteger:v16 forKey:v17];

  BOOL v18 = [(HMIVideoAnalyzerConfiguration *)self transcode];
  uint64_t v19 = NSStringFromSelector(sel_transcode);
  [v4 encodeBool:v18 forKey:v19];

  uint64_t v20 = [(HMIVideoAnalyzerConfiguration *)self transcodeCodecType];
  uint64_t v21 = NSStringFromSelector(sel_transcodeCodecType);
  [v4 encodeInteger:v20 forKey:v21];

  BOOL v22 = [(HMIVideoAnalyzerConfiguration *)self passthroughAudio];
  uint64_t v23 = NSStringFromSelector(sel_passthroughAudio);
  [v4 encodeBool:v22 forKey:v23];

  BOOL v24 = [(HMIVideoAnalyzerConfiguration *)self redactFrames];
  BOOL v25 = NSStringFromSelector(sel_redactFrames);
  [v4 encodeBool:v24 forKey:v25];

  BOOL v26 = [(HMIVideoAnalyzerConfiguration *)self allowReducedConfiguration];
  BOOL v27 = NSStringFromSelector(sel_allowReducedConfiguration);
  [v4 encodeBool:v26 forKey:v27];

  BOOL v28 = [(HMIVideoAnalyzerConfiguration *)self enableTemporalEventFiltering];
  BOOL v29 = NSStringFromSelector(sel_enableTemporalEventFiltering);
  [v4 encodeBool:v28 forKey:v29];

  BOOL v30 = [(HMIVideoAnalyzerConfiguration *)self saveAnalyzerResultsToDisk];
  BOOL v31 = NSStringFromSelector(sel_saveAnalyzerResultsToDisk);
  [v4 encodeBool:v30 forKey:v31];

  [(HMIVideoAnalyzerConfiguration *)self minFrameQuality];
  double v33 = v32;
  long long v34 = NSStringFromSelector(sel_minFrameQuality);
  [v4 encodeDouble:v34 forKey:v33];

  [(HMIVideoAnalyzerConfiguration *)self minFrameScale];
  double v36 = v35;
  uint64_t v37 = NSStringFromSelector(sel_minFrameScale);
  [v4 encodeDouble:v37 forKey:v36];

  long long v38 = [(HMIVideoAnalyzerConfiguration *)self camera];
  uint64_t v39 = NSStringFromSelector(sel_camera);
  [v4 encodeObject:v38 forKey:v39];

  long long v40 = [(HMIVideoAnalyzerConfiguration *)self homeUUID];
  uint64_t v41 = NSStringFromSelector(sel_homeUUID);
  [v4 encodeObject:v40 forKey:v41];

  int64_t v42 = [(HMIVideoAnalyzerConfiguration *)self packageClassifierMode];
  uint64_t v43 = NSStringFromSelector(sel_packageClassifierMode);
  [v4 encodeInteger:v42 forKey:v43];

  [(HMIVideoAnalyzerConfiguration *)self analysisFPS];
  double v45 = v44;
  long long v46 = NSStringFromSelector(sel_analysisFPS);
  [v4 encodeDouble:v46 forKey:v45];
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)thumbnailInterval
{
  objc_copyStruct(retstr, &self->_thumbnailInterval, 24, 1, 0);
  return result;
}

- (void)setThumbnailInterval:(id *)a3
{
}

- (unint64_t)thumbnailHeight
{
  return self->_thumbnailHeight;
}

- (void)setThumbnailHeight:(unint64_t)a3
{
  self->_thumbnailHeight = a3;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)timelapseInterval
{
  objc_copyStruct(retstr, &self->_timelapseInterval, 24, 1, 0);
  return result;
}

- (void)setTimelapseInterval:(id *)a3
{
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)timelapsePreferredFragmentDuration
{
  objc_copyStruct(retstr, &self->_timelapsePreferredFragmentDuration, 24, 1, 0);
  return result;
}

- (void)setTimelapsePreferredFragmentDuration:(id *)a3
{
}

- (unsigned)timelapseCodecType
{
  return self->_timelapseCodecType;
}

- (void)setTimelapseCodecType:(unsigned int)a3
{
  self->_timelapseCodecType = a3;
}

- (double)maxFragmentAnalysisDuration
{
  return self->_maxFragmentAnalysisDuration;
}

- (void)setMaxFragmentAnalysisDuration:(double)a3
{
  self->_maxFragmentAnalysisDuration = a3;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)maxFragmentDuration
{
  objc_copyStruct(retstr, &self->_maxFragmentDuration, 24, 1, 0);
  return result;
}

- (void)setMaxFragmentDuration:(id *)a3
{
}

- (BOOL)transcode
{
  return self->_transcode;
}

- (void)setTranscode:(BOOL)a3
{
  self->_transcode = a3;
}

- (unsigned)transcodeCodecType
{
  return self->_transcodeCodecType;
}

- (void)setTranscodeCodecType:(unsigned int)a3
{
  self->_transcodeCodecType = a3;
}

- (HMICamera)camera
{
  return (HMICamera *)objc_getProperty(self, a2, 64, 1);
}

- (void)setCamera:(id)a3
{
}

- (NSUUID)homeUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 72, 1);
}

- (void)setHomeUUID:(id)a3
{
}

- (BOOL)passthroughAudio
{
  return self->_passthroughAudio;
}

- (void)setPassthroughAudio:(BOOL)a3
{
  self->_passthroughAudio = a3;
}

- (int64_t)decodeMode
{
  return self->_decodeMode;
}

- (void)setDecodeMode:(int64_t)a3
{
  self->_decodeMode = a3;
}

- (BOOL)redactFrames
{
  return self->_redactFrames;
}

- (void)setRedactFrames:(BOOL)a3
{
  self->_redactFrames = a3;
}

- (int64_t)packageClassifierMode
{
  return self->_packageClassifierMode;
}

- (void)setPackageClassifierMode:(int64_t)a3
{
  self->_packageClassifierMode = a3;
}

- (BOOL)allowReducedConfiguration
{
  return self->_allowReducedConfiguration;
}

- (void)setAllowReducedConfiguration:(BOOL)a3
{
  self->_allowReducedConfiguration = a3;
}

- (BOOL)enableTemporalEventFiltering
{
  return self->_enableTemporalEventFiltering;
}

- (void)setEnableTemporalEventFiltering:(BOOL)a3
{
  self->_enableTemporalEventFiltering = a3;
}

- (BOOL)saveAnalyzerResultsToDisk
{
  return self->_saveAnalyzerResultsToDisk;
}

- (void)setSaveAnalyzerResultsToDisk:(BOOL)a3
{
  self->_saveAnalyzerResultsToDisk = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_homeUUID, 0);
  objc_storeStrong((id *)&self->_camera, 0);
}

@end