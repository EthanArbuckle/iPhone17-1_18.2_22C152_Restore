@interface SHSyncedLyrics
+ (BOOL)supportsSecureCoding;
- (NSArray)lines;
- (NSArray)songwriters;
- (NSDate)lyricsStartDate;
- (NSTimer)timer;
- (SHSyncedLyrics)initWithCoder:(id)a3;
- (SHSyncedLyrics)initWithLyricsStartDate:(id)a3 lines:(id)a4 songwriters:(id)a5;
- (SHSyncedLyricsDelegate)delegate;
- (double)fireTimeForLine:(id)a3;
- (double)offsetFromStartDate;
- (double)preCueDuration;
- (double)timeToLine:(id)a3 afterDuration:(double)a4;
- (double)timeWarp;
- (id)currentLyricLineForOffset:(double)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setLines:(id)a3;
- (void)setPreCueDuration:(double)a3;
- (void)setSongwriters:(id)a3;
- (void)setTimeWarp:(double)a3;
- (void)setTimer:(id)a3;
- (void)startSyncing;
- (void)stopSyncing;
@end

@implementation SHSyncedLyrics

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SHSyncedLyrics)initWithLyricsStartDate:(id)a3 lines:(id)a4 songwriters:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)SHSyncedLyrics;
  v12 = [(SHSyncedLyrics *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_lyricsStartDate, a3);
    objc_storeStrong((id *)&v13->_songwriters, a5);
    objc_storeStrong((id *)&v13->_lines, a4);
    v13->_timeWarp = 1.0;
  }

  return v13;
}

- (SHSyncedLyrics)initWithCoder:(id)a3
{
  v22[2] = *MEMORY[0x263EF8340];
  v4 = (void *)MEMORY[0x263EFFA08];
  id v5 = a3;
  v22[0] = objc_opt_class();
  v22[1] = objc_opt_class();
  v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v22 count:2];
  v7 = [v4 setWithArray:v6];
  v8 = [v5 decodeObjectOfClasses:v7 forKey:@"lines"];

  id v9 = (void *)MEMORY[0x263EFFA08];
  v21[0] = objc_opt_class();
  v21[1] = objc_opt_class();
  id v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v21 count:2];
  id v11 = [v9 setWithArray:v10];
  v12 = [v5 decodeObjectOfClasses:v11 forKey:@"songwriters"];

  v13 = [v5 decodeObjectOfClass:objc_opt_class() forKey:@"startDate"];
  [v5 decodeDoubleForKey:@"preCueDuration"];
  double v15 = v14;
  [v5 decodeDoubleForKey:@"timeWarp"];
  double v17 = v16;

  v18 = [(SHSyncedLyrics *)self initWithLyricsStartDate:v13 lines:v8 songwriters:v12];
  v19 = v18;
  if (v18)
  {
    v18->_preCueDuration = v15;
    v18->_timeWarp = v17;
  }

  return v19;
}

- (void)encodeWithCoder:(id)a3
{
  lines = self->_lines;
  id v5 = a3;
  [v5 encodeObject:lines forKey:@"lines"];
  [v5 encodeObject:self->_songwriters forKey:@"songwriters"];
  [v5 encodeObject:self->_lyricsStartDate forKey:@"startDate"];
  [v5 encodeDouble:@"preCueDuration" forKey:self->_preCueDuration];
  [v5 encodeDouble:@"timeWarp" forKey:self->_timeWarp];
}

- (SHSyncedLyricsDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (SHSyncedLyricsDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
  id v4 = objc_storeWeak((id *)&self->_delegate, a3);
  if (a3) {
    [(SHSyncedLyrics *)self startSyncing];
  }
  else {
    [(SHSyncedLyrics *)self stopSyncing];
  }
}

- (void)startSyncing
{
  [(SHSyncedLyrics *)self stopSyncing];
  v3 = [(SHSyncedLyrics *)self lines];
  uint64_t v4 = [v3 count];

  if (v4)
  {
    [(SHSyncedLyrics *)self offsetFromStartDate];
    double v6 = v5;
    -[SHSyncedLyrics currentLyricLineForOffset:](self, "currentLyricLineForOffset:");
    id v23 = (id)objc_claimAutoreleasedReturnValue();
    v7 = [(SHSyncedLyrics *)self lines];
    uint64_t v8 = [v7 indexOfObject:v23];

    id v9 = v23;
    if (v23)
    {
      id v10 = [(SHSyncedLyrics *)self delegate];
      char v11 = objc_opt_respondsToSelector();

      id v9 = v23;
      if (v11)
      {
        v12 = [(SHSyncedLyrics *)self delegate];
        [v12 lyricsDidUpdateToLine:v23 atLineNumber:v8];

        id v9 = v23;
      }
    }
    if (v9) {
      unint64_t v13 = v8 + 1;
    }
    else {
      unint64_t v13 = 0;
    }
    double v14 = [(SHSyncedLyrics *)self lines];
    unint64_t v15 = [v14 count];

    if (v15 > v13)
    {
      double v16 = [(SHSyncedLyrics *)self lines];
      double v17 = [v16 objectAtIndexedSubscript:v13];
      [(SHSyncedLyrics *)self timeToLine:v17 afterDuration:v6];
      double v19 = v18;

      v20 = [MEMORY[0x263EFFA20] timerWithTimeInterval:self target:sel_startSyncing selector:0 userInfo:0 repeats:v19];
      [(SHSyncedLyrics *)self setTimer:v20];

      v21 = [MEMORY[0x263EFF9F0] currentRunLoop];
      v22 = [(SHSyncedLyrics *)self timer];
      [v21 addTimer:v22 forMode:*MEMORY[0x263EFF588]];
    }
  }
}

- (double)offsetFromStartDate
{
  v3 = [MEMORY[0x263EFF910] date];
  uint64_t v4 = [(SHSyncedLyrics *)self lyricsStartDate];
  [v3 timeIntervalSinceDate:v4];
  double v6 = v5;

  return v6;
}

- (double)timeToLine:(id)a3 afterDuration:(double)a4
{
  [(SHSyncedLyrics *)self fireTimeForLine:a3];
  return v5 - a4;
}

- (double)fireTimeForLine:(id)a3
{
  [a3 offset];
  double v5 = v4;
  [(SHSyncedLyrics *)self preCueDuration];
  double v7 = v5 - v6;
  [(SHSyncedLyrics *)self timeWarp];
  return v7 * (1.0 / v8);
}

- (double)preCueDuration
{
  return self->_preCueDuration;
}

- (void)setPreCueDuration:(double)a3
{
  if (a3 < 0.0) {
    a3 = 0.0;
  }
  self->_preCueDuration = a3;
}

- (double)timeWarp
{
  return self->_timeWarp;
}

- (void)setTimeWarp:(double)a3
{
  if (a3 > 0.0) {
    self->_timeWarp = a3;
  }
}

- (void)stopSyncing
{
  v3 = [(SHSyncedLyrics *)self timer];
  [v3 invalidate];

  [(SHSyncedLyrics *)self setTimer:0];
}

- (id)currentLyricLineForOffset:(double)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  double v5 = [(SHSyncedLyrics *)self lines];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    id v8 = 0;
    uint64_t v9 = *(void *)v16;
    while (2)
    {
      uint64_t v10 = 0;
      char v11 = v8;
      do
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v5);
        }
        v12 = *(void **)(*((void *)&v15 + 1) + 8 * v10);
        [(SHSyncedLyrics *)self fireTimeForLine:v12];
        if (v13 > a3)
        {
          id v8 = v11;
          goto LABEL_12;
        }
        id v8 = v12;

        ++v10;
        char v11 = v8;
      }
      while (v7 != v10);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  else
  {
    id v8 = 0;
  }
LABEL_12:

  return v8;
}

- (NSArray)lines
{
  return self->_lines;
}

- (void)setLines:(id)a3
{
}

- (NSArray)songwriters
{
  return self->_songwriters;
}

- (void)setSongwriters:(id)a3
{
}

- (NSTimer)timer
{
  return self->_timer;
}

- (void)setTimer:(id)a3
{
}

- (NSDate)lyricsStartDate
{
  return self->_lyricsStartDate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lyricsStartDate, 0);
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_songwriters, 0);
  objc_storeStrong((id *)&self->_lines, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end