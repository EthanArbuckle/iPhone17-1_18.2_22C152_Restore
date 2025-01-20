@interface AXSSSwitchControlSettings
- (AXSSSwitchControlSettings)init;
- (AXSSSwitchControlSettings)initWithDictionaryRepresentation:(id)a3;
- (BOOL)soundEffectsEnabled;
- (BOOL)speechEnabled;
- (NSArray)cursorSizes;
- (NSArray)postActivationScanLocations;
- (NSArray)scanningStyles;
- (NSArray)tapBehaviors;
- (double)autoHideTimeout;
- (double)autoScanningInterval;
- (double)autoTapTimeout;
- (double)dwellDuration;
- (double)holdDuration;
- (double)ignoreRepeatDuration;
- (double)longPressDuration;
- (double)pauseOnFirstItemInterval;
- (double)repeatActionInterval;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)numberOfScanLoops;
- (void)setAutoHideTimeout:(double)a3;
- (void)setAutoScanningInterval:(double)a3;
- (void)setAutoTapTimeout:(double)a3;
- (void)setCursorSizes:(id)a3;
- (void)setDwellDuration:(double)a3;
- (void)setHoldDuration:(double)a3;
- (void)setIgnoreRepeatDuration:(double)a3;
- (void)setLongPressDuration:(double)a3;
- (void)setNumberOfScanLoops:(unint64_t)a3;
- (void)setPauseOnFirstItemInterval:(double)a3;
- (void)setPostActivationScanLocations:(id)a3;
- (void)setRepeatActionInterval:(double)a3;
- (void)setScanningStyles:(id)a3;
- (void)setSoundEffectsEnabled:(BOOL)a3;
- (void)setSpeechEnabled:(BOOL)a3;
- (void)setTapBehaviors:(id)a3;
@end

@implementation AXSSSwitchControlSettings

- (AXSSSwitchControlSettings)init
{
  v10.receiver = self;
  v10.super_class = (Class)AXSSSwitchControlSettings;
  v2 = [(AXSSSwitchControlSettings *)&v10 init];
  v3 = v2;
  if (v2)
  {
    scanningStyles = v2->_scanningStyles;
    v5 = (NSArray *)MEMORY[0x1E4F1CBF0];
    v2->_scanningStyles = (NSArray *)MEMORY[0x1E4F1CBF0];

    tapBehaviors = v3->_tapBehaviors;
    v3->_tapBehaviors = v5;

    cursorSizes = v3->_cursorSizes;
    v3->_cursorSizes = v5;

    postActivationScanLocations = v3->_postActivationScanLocations;
    v3->_postActivationScanLocations = v5;
  }
  return v3;
}

- (AXSSSwitchControlSettings)initWithDictionaryRepresentation:(id)a3
{
  id v4 = a3;
  v36.receiver = self;
  v36.super_class = (Class)AXSSSwitchControlSettings;
  v5 = [(AXSSSwitchControlSettings *)&v36 init];
  if (v5)
  {
    uint64_t v6 = [v4 objectForKeyedSubscript:@"ScanningStyles"];
    scanningStyles = v5->_scanningStyles;
    v5->_scanningStyles = (NSArray *)v6;

    if (!v5->_scanningStyles)
    {
      v5->_scanningStyles = (NSArray *)MEMORY[0x1E4F1CBF0];
    }
    uint64_t v8 = [v4 objectForKeyedSubscript:@"TapBehaviors"];
    tapBehaviors = v5->_tapBehaviors;
    v5->_tapBehaviors = (NSArray *)v8;

    if (!v5->_tapBehaviors)
    {
      v5->_tapBehaviors = (NSArray *)MEMORY[0x1E4F1CBF0];
    }
    uint64_t v10 = [v4 objectForKeyedSubscript:@"CursorSizes"];
    cursorSizes = v5->_cursorSizes;
    v5->_cursorSizes = (NSArray *)v10;

    if (!v5->_cursorSizes)
    {
      v5->_cursorSizes = (NSArray *)MEMORY[0x1E4F1CBF0];
    }
    uint64_t v12 = [v4 objectForKeyedSubscript:@"PostActivationScanLocations"];
    postActivationScanLocations = v5->_postActivationScanLocations;
    v5->_postActivationScanLocations = (NSArray *)v12;

    if (!v5->_postActivationScanLocations)
    {
      v5->_postActivationScanLocations = (NSArray *)MEMORY[0x1E4F1CBF0];
    }
    v14 = [v4 objectForKeyedSubscript:@"AutoScanningInterval"];
    [v14 doubleValue];
    v5->_autoScanningInterval = v15;

    v16 = [v4 objectForKeyedSubscript:@"AutoHideTimeout"];
    [v16 doubleValue];
    v5->_autoHideTimeout = v17;

    v18 = [v4 objectForKeyedSubscript:@"PauseOnFirstItemInterval"];
    [v18 doubleValue];
    v5->_pauseOnFirstItemInterval = v19;

    v20 = [v4 objectForKeyedSubscript:@"NumberOfScanLoops"];
    v5->_numberOfScanLoops = [v20 unsignedIntegerValue];

    v21 = [v4 objectForKeyedSubscript:@"DwellDuration"];
    [v21 doubleValue];
    v5->_dwellDuration = v22;

    v23 = [v4 objectForKeyedSubscript:@"RepeatActionInterval"];
    [v23 doubleValue];
    v5->_repeatActionInterval = v24;

    v25 = [v4 objectForKeyedSubscript:@"HoldDuration"];
    [v25 doubleValue];
    v5->_holdDuration = v26;

    v27 = [v4 objectForKeyedSubscript:@"IgnoreRepeatDuration"];
    [v27 doubleValue];
    v5->_ignoreRepeatDuration = v28;

    v29 = [v4 objectForKeyedSubscript:@"SoundEffectsEnabled"];
    v5->_soundEffectsEnabled = [v29 BOOLValue];

    v30 = [v4 objectForKeyedSubscript:@"SpeechEnabled"];
    v5->_speechEnabled = [v30 BOOLValue];

    v31 = [v4 objectForKeyedSubscript:@"LongPressDuration"];
    [v31 doubleValue];
    v5->_longPressDuration = v32;

    v33 = [v4 objectForKeyedSubscript:@"AutoTapTimeout"];
    [v33 doubleValue];
    v5->_autoTapTimeout = v34;
  }
  return v5;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = [(AXSSSwitchControlSettings *)self scanningStyles];
  [v3 setObject:v4 forKeyedSubscript:@"ScanningStyles"];

  v5 = [(AXSSSwitchControlSettings *)self tapBehaviors];
  [v3 setObject:v5 forKeyedSubscript:@"TapBehaviors"];

  uint64_t v6 = [(AXSSSwitchControlSettings *)self cursorSizes];
  [v3 setObject:v6 forKeyedSubscript:@"CursorSizes"];

  v7 = [(AXSSSwitchControlSettings *)self postActivationScanLocations];
  [v3 setObject:v7 forKeyedSubscript:@"PostActivationScanLocations"];

  uint64_t v8 = NSNumber;
  [(AXSSSwitchControlSettings *)self autoScanningInterval];
  v9 = objc_msgSend(v8, "numberWithDouble:");
  [v3 setObject:v9 forKeyedSubscript:@"AutoScanningInterval"];

  uint64_t v10 = NSNumber;
  [(AXSSSwitchControlSettings *)self autoHideTimeout];
  v11 = objc_msgSend(v10, "numberWithDouble:");
  [v3 setObject:v11 forKeyedSubscript:@"AutoHideTimeout"];

  uint64_t v12 = NSNumber;
  [(AXSSSwitchControlSettings *)self pauseOnFirstItemInterval];
  v13 = objc_msgSend(v12, "numberWithDouble:");
  [v3 setObject:v13 forKeyedSubscript:@"PauseOnFirstItemInterval"];

  v14 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[AXSSSwitchControlSettings numberOfScanLoops](self, "numberOfScanLoops"));
  [v3 setObject:v14 forKeyedSubscript:@"NumberOfScanLoops"];

  double v15 = NSNumber;
  [(AXSSSwitchControlSettings *)self dwellDuration];
  v16 = objc_msgSend(v15, "numberWithDouble:");
  [v3 setObject:v16 forKeyedSubscript:@"DwellDuration"];

  double v17 = NSNumber;
  [(AXSSSwitchControlSettings *)self repeatActionInterval];
  v18 = objc_msgSend(v17, "numberWithDouble:");
  [v3 setObject:v18 forKeyedSubscript:@"RepeatActionInterval"];

  double v19 = NSNumber;
  [(AXSSSwitchControlSettings *)self holdDuration];
  v20 = objc_msgSend(v19, "numberWithDouble:");
  [v3 setObject:v20 forKeyedSubscript:@"HoldDuration"];

  v21 = NSNumber;
  [(AXSSSwitchControlSettings *)self ignoreRepeatDuration];
  double v22 = objc_msgSend(v21, "numberWithDouble:");
  [v3 setObject:v22 forKeyedSubscript:@"IgnoreRepeatDuration"];

  v23 = objc_msgSend(NSNumber, "numberWithBool:", -[AXSSSwitchControlSettings soundEffectsEnabled](self, "soundEffectsEnabled"));
  [v3 setObject:v23 forKeyedSubscript:@"SoundEffectsEnabled"];

  double v24 = objc_msgSend(NSNumber, "numberWithBool:", -[AXSSSwitchControlSettings speechEnabled](self, "speechEnabled"));
  [v3 setObject:v24 forKeyedSubscript:@"SpeechEnabled"];

  v25 = NSNumber;
  [(AXSSSwitchControlSettings *)self longPressDuration];
  double v26 = objc_msgSend(v25, "numberWithDouble:");
  [v3 setObject:v26 forKeyedSubscript:@"LongPressDuration"];

  v27 = NSNumber;
  [(AXSSSwitchControlSettings *)self autoTapTimeout];
  double v28 = objc_msgSend(v27, "numberWithDouble:");
  [v3 setObject:v28 forKeyedSubscript:@"AutoTapTimeout"];

  return v3;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)AXSSSwitchControlSettings;
  v3 = [(AXSSSwitchControlSettings *)&v7 description];
  id v4 = [(AXSSSwitchControlSettings *)self dictionaryRepresentation];
  v5 = [v3 stringByAppendingFormat:@"- %@", v4];

  return v5;
}

- (NSArray)scanningStyles
{
  return self->_scanningStyles;
}

- (void)setScanningStyles:(id)a3
{
}

- (NSArray)tapBehaviors
{
  return self->_tapBehaviors;
}

- (void)setTapBehaviors:(id)a3
{
}

- (NSArray)cursorSizes
{
  return self->_cursorSizes;
}

- (void)setCursorSizes:(id)a3
{
}

- (NSArray)postActivationScanLocations
{
  return self->_postActivationScanLocations;
}

- (void)setPostActivationScanLocations:(id)a3
{
}

- (double)autoScanningInterval
{
  return self->_autoScanningInterval;
}

- (void)setAutoScanningInterval:(double)a3
{
  self->_autoScanningInterval = a3;
}

- (double)autoHideTimeout
{
  return self->_autoHideTimeout;
}

- (void)setAutoHideTimeout:(double)a3
{
  self->_autoHideTimeout = a3;
}

- (double)pauseOnFirstItemInterval
{
  return self->_pauseOnFirstItemInterval;
}

- (void)setPauseOnFirstItemInterval:(double)a3
{
  self->_pauseOnFirstItemInterval = a3;
}

- (unint64_t)numberOfScanLoops
{
  return self->_numberOfScanLoops;
}

- (void)setNumberOfScanLoops:(unint64_t)a3
{
  self->_numberOfScanLoops = a3;
}

- (double)dwellDuration
{
  return self->_dwellDuration;
}

- (void)setDwellDuration:(double)a3
{
  self->_dwellDuration = a3;
}

- (double)repeatActionInterval
{
  return self->_repeatActionInterval;
}

- (void)setRepeatActionInterval:(double)a3
{
  self->_repeatActionInterval = a3;
}

- (double)holdDuration
{
  return self->_holdDuration;
}

- (void)setHoldDuration:(double)a3
{
  self->_holdDuration = a3;
}

- (double)ignoreRepeatDuration
{
  return self->_ignoreRepeatDuration;
}

- (void)setIgnoreRepeatDuration:(double)a3
{
  self->_ignoreRepeatDuration = a3;
}

- (BOOL)soundEffectsEnabled
{
  return self->_soundEffectsEnabled;
}

- (void)setSoundEffectsEnabled:(BOOL)a3
{
  self->_soundEffectsEnabled = a3;
}

- (BOOL)speechEnabled
{
  return self->_speechEnabled;
}

- (void)setSpeechEnabled:(BOOL)a3
{
  self->_speechEnabled = a3;
}

- (double)longPressDuration
{
  return self->_longPressDuration;
}

- (void)setLongPressDuration:(double)a3
{
  self->_longPressDuration = a3;
}

- (double)autoTapTimeout
{
  return self->_autoTapTimeout;
}

- (void)setAutoTapTimeout:(double)a3
{
  self->_autoTapTimeout = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_postActivationScanLocations, 0);
  objc_storeStrong((id *)&self->_cursorSizes, 0);
  objc_storeStrong((id *)&self->_tapBehaviors, 0);

  objc_storeStrong((id *)&self->_scanningStyles, 0);
}

@end