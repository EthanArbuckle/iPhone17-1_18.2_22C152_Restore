@interface FTCinematicTrackingResult
+ (BOOL)supportsSecureCoding;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)mostRecentTapTime;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)sourceFrameTimestamp;
- (BOOL)detectorDidRun;
- (FTCinematicTapResponse)tapResponse;
- (FTCinematicTrackingResult)init;
- (FTCinematicTrackingResult)initWithCoder:(id)a3;
- (NSArray)tracks;
- (NSDictionary)metadata;
- (void)encodeWithCoder:(id)a3;
- (void)setDetectorDidRun:(BOOL)a3;
- (void)setMetadata:(id)a3;
- (void)setMostRecentTapTime:(id *)a3;
- (void)setSourceFrameTimestamp:(id *)a3;
- (void)setTapResponse:(id)a3;
- (void)setTracks:(id)a3;
@end

@implementation FTCinematicTrackingResult

- (FTCinematicTrackingResult)init
{
  v11.receiver = self;
  v11.super_class = (Class)FTCinematicTrackingResult;
  v2 = [(FTCinematicTrackingResult *)&v11 init];
  v3 = v2;
  if (v2)
  {
    v4 = (long long *)MEMORY[0x263F01090];
    long long v9 = *MEMORY[0x263F01090];
    uint64_t v10 = *(void *)(MEMORY[0x263F01090] + 16);
    [(FTCinematicTrackingResult *)v2 setSourceFrameTimestamp:&v9];
    long long v7 = *v4;
    uint64_t v8 = *((void *)v4 + 2);
    [(FTCinematicTrackingResult *)v3 setMostRecentTapTime:&v7];
    [(FTCinematicTrackingResult *)v3 setDetectorDidRun:0];
    v5 = v3;
  }

  return v3;
}

- (FTCinematicTrackingResult)initWithCoder:(id)a3
{
  v23[4] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)FTCinematicTrackingResult;
  v5 = [(FTCinematicTrackingResult *)&v21 init];
  v6 = v5;
  if (v5)
  {
    if (v4)
    {
      objc_msgSend(v4, "fusionTracker_decodeCMTimeForKey:", @"sourceFrameTimestamp");
      *(_OWORD *)&v6->_sourceFrameTimestamp.value = v19;
      v6->_sourceFrameTimestamp.epoch = v20;
      objc_msgSend(v4, "fusionTracker_decodeCMTimeForKey:", @"mostRecentTapTime");
    }
    else
    {
      v5->_sourceFrameTimestamp.value = 0;
      *(void *)&v5->_sourceFrameTimestamp.timescale = 0;
      v5->_sourceFrameTimestamp.epoch = 0;
      long long v19 = 0uLL;
      int64_t v20 = 0;
    }
    *(_OWORD *)&v6->_mostRecentTapTime.value = v19;
    v6->_mostRecentTapTime.epoch = v20;
    v6->_detectorDidRun = objc_msgSend(v4, "decodeBoolForKey:", @"detectorDidRun", v19, v20);
    long long v7 = (void *)MEMORY[0x263EFFA08];
    v23[0] = objc_opt_class();
    v23[1] = objc_opt_class();
    v23[2] = objc_opt_class();
    v23[3] = objc_opt_class();
    uint64_t v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v23 count:4];
    long long v9 = [v7 setWithArray:v8];
    uint64_t v10 = [v4 decodeObjectOfClasses:v9 forKey:@"metadata"];
    metadata = v6->_metadata;
    v6->_metadata = (NSDictionary *)v10;

    v12 = (void *)MEMORY[0x263EFFA08];
    v22[0] = objc_opt_class();
    v22[1] = objc_opt_class();
    v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v22 count:2];
    v14 = [v12 setWithArray:v13];
    uint64_t v15 = [v4 decodeObjectOfClasses:v14 forKey:@"tracks"];
    tracks = v6->_tracks;
    v6->_tracks = (NSArray *)v15;

    v17 = v6;
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  $95D729B680665BEAEFA1D6FCA8238556 sourceFrameTimestamp = self->_sourceFrameTimestamp;
  objc_msgSend(v4, "fusionTracker_encodeCMTime:forKey:", &sourceFrameTimestamp, @"sourceFrameTimestamp");
  [v4 encodeObject:self->_tracks forKey:@"tracks"];
  $95D729B680665BEAEFA1D6FCA8238556 mostRecentTapTime = self->_mostRecentTapTime;
  objc_msgSend(v4, "fusionTracker_encodeCMTime:forKey:", &mostRecentTapTime, @"mostRecentTapTime");
  [v4 encodeBool:self->_detectorDidRun forKey:@"detectorDidRun"];
  [v4 encodeObject:self->_metadata forKey:@"metadata"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)sourceFrameTimestamp
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 40);
  return self;
}

- (void)setSourceFrameTimestamp:(id *)a3
{
  long long v3 = *(_OWORD *)&a3->var0;
  self->_sourceFrameTimestamp.epoch = a3->var3;
  *(_OWORD *)&self->_sourceFrameTimestamp.value = v3;
}

- (NSArray)tracks
{
  return self->_tracks;
}

- (void)setTracks:(id)a3
{
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)mostRecentTapTime
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 64);
  return self;
}

- (void)setMostRecentTapTime:(id *)a3
{
  long long v3 = *(_OWORD *)&a3->var0;
  self->_mostRecentTapTime.epoch = a3->var3;
  *(_OWORD *)&self->_mostRecentTapTime.value = v3;
}

- (BOOL)detectorDidRun
{
  return self->_detectorDidRun;
}

- (void)setDetectorDidRun:(BOOL)a3
{
  self->_detectorDidRun = a3;
}

- (NSDictionary)metadata
{
  return self->_metadata;
}

- (void)setMetadata:(id)a3
{
}

- (FTCinematicTapResponse)tapResponse
{
  return self->_tapResponse;
}

- (void)setTapResponse:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tapResponse, 0);
  objc_storeStrong((id *)&self->_metadata, 0);

  objc_storeStrong((id *)&self->_tracks, 0);
}

@end