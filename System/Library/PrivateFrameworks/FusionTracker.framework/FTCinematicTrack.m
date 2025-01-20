@interface FTCinematicTrack
+ (BOOL)supportsSecureCoding;
+ (id)fromTrack:(shared_ptr<ft:(BOOL)a4 :Track>)a3 isHighPriority:;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)lastDetectionTime;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)lastTappedTime;
- (BOOL)isHighPriority;
- (BOOL)isTapSpawned;
- (CGRect)box;
- (FTCinematicTrack)init;
- (FTCinematicTrack)initWithCoder:(id)a3;
- (NSDictionary)metadata;
- (float)boxConfidence;
- (float)detectionConfidence;
- (int64_t)identifier;
- (unint64_t)objectKind;
- (unint64_t)sourceObservationId;
- (void)encodeWithCoder:(id)a3;
- (void)setBox:(CGRect)a3;
- (void)setBoxConfidence:(float)a3;
- (void)setDetectionConfidence:(float)a3;
- (void)setIdentifier:(int64_t)a3;
- (void)setIsHighPriority:(BOOL)a3;
- (void)setIsTapSpawned:(BOOL)a3;
- (void)setLastDetectionTime:(id *)a3;
- (void)setLastTappedTime:(id *)a3;
- (void)setMetadata:(id)a3;
- (void)setObjectKind:(unint64_t)a3;
- (void)setSourceObservationId:(unint64_t)a3;
@end

@implementation FTCinematicTrack

- (FTCinematicTrack)init
{
  v8.receiver = self;
  v8.super_class = (Class)FTCinematicTrack;
  v2 = [(FTCinematicTrack *)&v8 init];
  v3 = v2;
  if (v2)
  {
    long long v6 = *MEMORY[0x263F01090];
    uint64_t v7 = *(void *)(MEMORY[0x263F01090] + 16);
    [(FTCinematicTrack *)v2 setLastTappedTime:&v6];
    v4 = v3;
  }

  return v3;
}

- (FTCinematicTrack)initWithCoder:(id)a3
{
  v24[4] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)FTCinematicTrack;
  v5 = [(FTCinematicTrack *)&v23 init];
  if (v5)
  {
    *((void *)v5 + 3) = [v4 decodeInt64ForKey:@"identifier"];
    objc_msgSend(v4, "fusionTracker_decodeCGRectForKey:", @"box");
    *((void *)v5 + 13) = v6;
    *((void *)v5 + 14) = v7;
    *((void *)v5 + 15) = v8;
    *((void *)v5 + 16) = v9;
    *((void *)v5 + 4) = [v4 decodeInt64ForKey:@"objectKind"];
    if (v4)
    {
      objc_msgSend(v4, "fusionTracker_decodeCMTimeForKey:", @"lastDetectionTime");
    }
    else
    {
      long long v19 = 0uLL;
      uint64_t v21 = 0;
    }
    *(_OWORD *)(v5 + 56) = v19;
    *((void *)v5 + 9) = v21;
    objc_msgSend(v4, "decodeFloatForKey:", @"boxConfidence", v19, v21);
    *((_DWORD *)v5 + 3) = v10;
    [v4 decodeFloatForKey:@"detectionConfidence"];
    *((_DWORD *)v5 + 4) = v11;
    if (v4)
    {
      objc_msgSend(v4, "fusionTracker_decodeCMTimeForKey:", @"lastTappedTime");
    }
    else
    {
      long long v20 = 0uLL;
      uint64_t v22 = 0;
    }
    *((_OWORD *)v5 + 5) = v20;
    *((void *)v5 + 12) = v22;
    v5[9] = objc_msgSend(v4, "decodeBoolForKey:", @"isHighPriority", v20, v22);
    *((void *)v5 + 6) = [v4 decodeInt64ForKey:@"sourceObservationId"];
    v5[8] = [v4 decodeBoolForKey:@"isTapSpawned"];
    v12 = (void *)MEMORY[0x263EFFA08];
    v24[0] = objc_opt_class();
    v24[1] = objc_opt_class();
    v24[2] = objc_opt_class();
    v24[3] = objc_opt_class();
    v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v24 count:4];
    v14 = [v12 setWithArray:v13];
    uint64_t v15 = [v4 decodeObjectOfClasses:v14 forKey:@"metadata"];
    v16 = (void *)*((void *)v5 + 5);
    *((void *)v5 + 5) = v15;

    v17 = v5;
  }

  return (FTCinematicTrack *)v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  [v4 encodeInt64:self->_identifier forKey:@"identifier"];
  [v4 encodeInt64:self->_objectKind forKey:@"objectKind"];
  $95D729B680665BEAEFA1D6FCA8238556 lastDetectionTime = self->_lastDetectionTime;
  objc_msgSend(v4, "fusionTracker_encodeCMTime:forKey:", &lastDetectionTime, @"lastDetectionTime");
  *(float *)&double v5 = self->_boxConfidence;
  [v4 encodeFloat:@"boxConfidence" forKey:v5];
  *(float *)&double v6 = self->_detectionConfidence;
  [v4 encodeFloat:@"detectionConfidence" forKey:v6];
  $95D729B680665BEAEFA1D6FCA8238556 lastTappedTime = self->_lastTappedTime;
  objc_msgSend(v4, "fusionTracker_encodeCMTime:forKey:", &lastTappedTime, @"lastTappedTime");
  [v4 encodeBool:self->_isHighPriority forKey:@"isHighPriority"];
  [v4 encodeInt64:self->_sourceObservationId forKey:@"sourceObservationId"];
  objc_msgSend(v4, "fusionTracker_encodeCGRect:forKey:", @"box", self->_box.origin.x, self->_box.origin.y, self->_box.size.width, self->_box.size.height);
  [v4 encodeBool:self->_isTapSpawned forKey:@"isTapSpawned"];
  [v4 encodeObject:self->_metadata forKey:@"metadata"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)fromTrack:(shared_ptr<ft:(BOOL)a4 :Track>)a3 isHighPriority:
{
  var1 = a3.var1;
  var0 = a3.var0;
  double v6 = objc_alloc_init(FTCinematicTrack);
  [(FTCinematicTrack *)v6 setIdentifier:*(void *)(*(void *)var0 + 16)];
  -[FTCinematicTrack setBox:](v6, "setBox:", *(double *)(*(void *)var0 + 24), *(double *)(*(void *)var0 + 32), *(double *)(*(void *)var0 + 40), *(double *)(*(void *)var0 + 48));
  [(FTCinematicTrack *)v6 setObjectKind:*(void *)(*(void *)var0 + 88)];
  uint64_t v7 = *(void *)var0;
  if (!*(unsigned char *)(*(void *)var0 + 232))
  {
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(exception, "Track not yet initialized.");
    goto LABEL_12;
  }
  long long v17 = *(_OWORD *)(v7 + 124);
  uint64_t v18 = *(void *)(v7 + 140);
  [(FTCinematicTrack *)v6 setLastDetectionTime:&v17];
  double v8 = *(double *)(*(void *)var0 + 248);
  *(float *)&double v8 = v8;
  [(FTCinematicTrack *)v6 setBoxConfidence:v8];
  if (!*(unsigned char *)(*(void *)var0 + 232))
  {
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(exception, "Track not yet initialized.");
LABEL_12:
    __cxa_throw(exception, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
  }
  LODWORD(v9) = *(_DWORD *)(*(void *)var0 + 96);
  [(FTCinematicTrack *)v6 setDetectionConfidence:v9];
  long long v15 = *MEMORY[0x263F01090];
  uint64_t v16 = *(void *)(MEMORY[0x263F01090] + 16);
  [(FTCinematicTrack *)v6 setLastTappedTime:&v15];
  [(FTCinematicTrack *)v6 setIsHighPriority:var1];
  uint64_t v10 = *(void *)var0;
  if (!*(unsigned char *)(*(void *)var0 + 232))
  {
    v14 = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(v14, "Track not yet initialized.");
    __cxa_throw(v14, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
  }
  if (*(unsigned char *)(v10 + 160)) {
    int v11 = (uint64_t *)(v10 + 152);
  }
  else {
    int v11 = &kFTInvalidTrackId;
  }
  [(FTCinematicTrack *)v6 setSourceObservationId:*v11];

  return v6;
}

- (int64_t)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(int64_t)a3
{
  self->_identifier = a3;
}

- (CGRect)box
{
  double x = self->_box.origin.x;
  double y = self->_box.origin.y;
  double width = self->_box.size.width;
  double height = self->_box.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setBox:(CGRect)a3
{
  self->_bodouble x = a3;
}

- (unint64_t)objectKind
{
  return self->_objectKind;
}

- (void)setObjectKind:(unint64_t)a3
{
  self->_objectKind = a3;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)lastDetectionTime
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 56);
  return self;
}

- (void)setLastDetectionTime:(id *)a3
{
  long long v3 = *(_OWORD *)&a3->var0;
  self->_lastDetectionTime.epoch = a3->var3;
  *(_OWORD *)&self->_lastDetectionTime.value = v3;
}

- (float)boxConfidence
{
  return self->_boxConfidence;
}

- (void)setBoxConfidence:(float)a3
{
  self->_boxConfidence = a3;
}

- (float)detectionConfidence
{
  return self->_detectionConfidence;
}

- (void)setDetectionConfidence:(float)a3
{
  self->_detectionConfidence = a3;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)lastTappedTime
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 80);
  return self;
}

- (void)setLastTappedTime:(id *)a3
{
  long long v3 = *(_OWORD *)&a3->var0;
  self->_lastTappedTime.epoch = a3->var3;
  *(_OWORD *)&self->_lastTappedTime.value = v3;
}

- (NSDictionary)metadata
{
  return self->_metadata;
}

- (void)setMetadata:(id)a3
{
}

- (BOOL)isTapSpawned
{
  return self->_isTapSpawned;
}

- (void)setIsTapSpawned:(BOOL)a3
{
  self->_isTapSpawned = a3;
}

- (BOOL)isHighPriority
{
  return self->_isHighPriority;
}

- (void)setIsHighPriority:(BOOL)a3
{
  self->_isHighPrioritdouble y = a3;
}

- (unint64_t)sourceObservationId
{
  return self->_sourceObservationId;
}

- (void)setSourceObservationId:(unint64_t)a3
{
  self->_sourceObservationId = a3;
}

- (void).cxx_destruct
{
}

@end