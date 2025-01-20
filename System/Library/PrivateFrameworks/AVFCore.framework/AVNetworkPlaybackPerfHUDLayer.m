@interface AVNetworkPlaybackPerfHUDLayer
- (AVNetworkPlaybackPerfHUDLayer)init;
- (AVPlayer)player;
- (AVPlayerLayer)playerLayer;
- (BOOL)hudEnabled;
- (BOOL)valueLoadedForKey:(id)a3 onObject:(id)a4;
- (float)getScaleFactorForDisplaySize:(CGSize)a3;
- (id)displayStringGenerator;
- (void)_hudUpdateTrigger;
- (void)copyPropertiesFromStringGenerator:(id)a3;
- (void)currentItemChanged;
- (void)currentItemTracksChanged;
- (void)dealloc;
- (void)getHudSetting;
- (void)readHudSettingsAndCallCompletionHandler:(id)a3;
- (void)setBounds:(CGRect)a3;
- (void)setColor:(int)a3;
- (void)setPlayer:(id)a3;
- (void)setPlayerLayer:(id)a3;
- (void)startDispatchTimer;
- (void)updateHudWithDisplayString:(id)a3;
@end

@implementation AVNetworkPlaybackPerfHUDLayer

- (void)setBounds:(CGRect)a3
{
  if (!self->_spatialDiagnostics)
  {
    CGFloat v4 = a3.size.width - (double)self->_hudXoffset;
    CGFloat v5 = a3.size.height - (double)self->_hudYoffset;
    [MEMORY[0x1E4F39CF8] begin];
    [MEMORY[0x1E4F39CF8] setDisableActions:1];
    -[AVNetworkPlaybackPerfHUDLayer setPosition:](self, "setPosition:", (double)self->_hudXoffset, (double)self->_hudYoffset);
    v6.receiver = self;
    v6.super_class = (Class)AVNetworkPlaybackPerfHUDLayer;
    -[AVNetworkPlaybackPerfHUDLayer setBounds:](&v6, sel_setBounds_, 0.0, 0.0, v4, v5);
    [MEMORY[0x1E4F39CF8] commit];
  }
}

- (void)currentItemTracksChanged
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (self->_showHud)
  {
    long long v9 = 0u;
    long long v10 = 0u;
    long long v7 = 0u;
    long long v8 = 0u;
    v2 = objc_msgSend((id)objc_msgSend(objc_loadWeak((id *)&self->_player), "currentItem", 0), "tracks");
    uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    if (v3)
    {
      uint64_t v4 = v3;
      uint64_t v5 = *(void *)v8;
      do
      {
        uint64_t v6 = 0;
        do
        {
          if (*(void *)v8 != v5) {
            objc_enumerationMutation(v2);
          }
          objc_msgSend((id)objc_msgSend(*(id *)(*((void *)&v7 + 1) + 8 * v6++), "assetTrack"), "loadValuesAsynchronouslyForKeys:completionHandler:", &unk_1EE5E1BF0, 0);
        }
        while (v4 != v6);
        uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
      }
      while (v4);
    }
  }
}

- (BOOL)hudEnabled
{
  return self->_showHud;
}

- (void)readHudSettingsAndCallCompletionHandler:(id)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __73__AVNetworkPlaybackPerfHUDLayer_readHudSettingsAndCallCompletionHandler___block_invoke;
  v3[3] = &unk_1E57B3748;
  v3[4] = self;
  v3[5] = a3;
  dispatch_async(MEMORY[0x1E4F14428], v3);
}

- (AVNetworkPlaybackPerfHUDLayer)init
{
  v5.receiver = self;
  v5.super_class = (Class)AVNetworkPlaybackPerfHUDLayer;
  v2 = [(AVNetworkPlaybackPerfHUDLayer *)&v5 init];
  if (registerOnce != -1) {
    dispatch_once(&registerOnce, &__block_literal_global_418_0);
  }
  float v3 = *(double *)&sMaxDisplayScale;
  [(AVNetworkPlaybackPerfHUDLayer *)v2 setContentsScale:v3];
  -[AVNetworkPlaybackPerfHUDLayer setAnchorPoint:](v2, "setAnchorPoint:", 0.0, 0.0);
  [(AVNetworkPlaybackPerfHUDLayer *)v2 setFont:@"Helvetica-Bold"];
  [(AVNetworkPlaybackPerfHUDLayer *)v2 setTruncationMode:*MEMORY[0x1E4F3A5E8]];
  [(AVNetworkPlaybackPerfHUDLayer *)v2 setWrapped:1];
  v2->_updateUISettings = 1;
  [(AVNetworkPlaybackPerfHUDLayer *)v2 setAlignmentMode:*MEMORY[0x1E4F39D48]];
  return v2;
}

uint64_t __73__AVNetworkPlaybackPerfHUDLayer_readHudSettingsAndCallCompletionHandler___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) getHudSetting];
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    float v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

- (void)getHudSetting
{
  self->_showHud = CFPreferencesGetAppBooleanValue(@"enable", @"com.apple.avfoundation.videoperformancehud", 0) != 0;
  self->_spatialDiagnostics = CFPreferencesGetAppBooleanValue(@"spatial", @"com.apple.avfoundation.videoperformancehud", 0) != 0;
  self->_hudUpdateInterval = 1;
  CFIndex AppIntegerValue = CFPreferencesGetAppIntegerValue(@"interval", @"com.apple.avfoundation.videoperformancehud", 0);
  if (AppIntegerValue >= 1) {
    self->_hudUpdateInterval = AppIntegerValue;
  }
  self->_colorId = CFPreferencesGetAppIntegerValue(@"color", @"com.apple.avfoundation.videoperformancehud", 0);
  self->_opacity = 0.7;
  CFNumberRef v4 = (const __CFNumber *)CFPreferencesCopyAppValue(@"opacity", @"com.apple.avfoundation.videoperformancehud");
  if (v4)
  {
    CFNumberRef v5 = v4;
    if (CFNumberIsFloatType(v4))
    {
      float valuePtr = 0.0;
      if (CFNumberGetValue(v5, kCFNumberFloat32Type, &valuePtr)) {
        self->_opacity = valuePtr;
      }
    }
    CFRelease(v5);
  }
  self->_fontSizeInt = 30;
  int v6 = CFPreferencesGetAppIntegerValue(@"fontsize", @"com.apple.avfoundation.videoperformancehud", 0);
  if (v6 <= 7)
  {
    long long v7 = (void *)[MEMORY[0x1E4F39B60] mainDisplay];
    if (!v7) {
      goto LABEL_15;
    }
    [v7 bounds];
    int v9 = (int)(v8 * 30.0 / 1280.0);
    self->_fontSizeInt = v9;
    if (v9 >= 8)
    {
      if (v9 < 0x29) {
        goto LABEL_15;
      }
      int v6 = 40;
    }
    else
    {
      int v6 = 8;
    }
  }
  self->_fontSizeInt = v6;
LABEL_15:
  self->_showCompleteURI = CFPreferencesGetAppBooleanValue(@"show_complete_uri", @"com.apple.avfoundation.videoperformancehud", 0) != 0;
  self->_hudXoffset = 0;
  self->_hudYoffset = 0;
  int v10 = CFPreferencesGetAppIntegerValue(@"xoffset", @"com.apple.avfoundation.videoperformancehud", 0);
  if (v10 >= 1) {
    self->_hudXoffset = v10;
  }
  int v11 = CFPreferencesGetAppIntegerValue(@"yoffset", @"com.apple.avfoundation.videoperformancehud", 0);
  if (v11 >= 1) {
    self->_hudYoffset = v11;
  }
}

- (void)setPlayer:(id)a3
{
}

- (void)currentItemChanged
{
  if (self->_showHud)
  {
    objc_msgSend((id)objc_msgSend((id)objc_msgSend(objc_loadWeak((id *)&self->_player), "currentItem"), "asset"), "loadValuesAsynchronouslyForKeys:completionHandler:", &unk_1EE5E1BD8, 0);
    self->_prevVariantIdx = -1;
    self->_totalStallCount = 0;
  }
}

- (void)setColor:(int)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (a3 <= 5)
  {
    DeviceRGB = CGColorSpaceCreateDeviceRGB();
    int v6 = DeviceRGB;
    int64x2_t v15 = (int64x2_t)xmmword_194C5FF18;
    long long v16 = unk_194C5FF28;
    switch(a3)
    {
      case 1:
        v15.i64[1] = 0x3FF0000000000000;
        break;
      case 2:
        v15.i64[0] = 0x3FF0000000000000;
        break;
      case 3:
        goto LABEL_7;
      case 4:
        __asm { FMOV            V0.2D, #1.0; jumptable 0000000194C00004 case 4 }
        int64x2_t v15 = _Q0;
LABEL_7:
        uint64_t v13 = 0x3FF0000000000000;
        goto LABEL_9;
      case 5:
        uint64_t v13 = 0x3FE547AE20000000;
        int64x2_t v15 = vdupq_n_s64(0x3FE547AE20000000uLL);
LABEL_9:
        *(void *)&long long v16 = v13;
        break;
      default:
        __asm { FMOV            V0.2D, #1.0; jumptable 0000000194C00004 default case, case 0 }
        int64x2_t v15 = _Q0;
        break;
    }
    v14 = CGColorCreate(DeviceRGB, (const CGFloat *)v15.i64);
    CGColorSpaceRelease(v6);
    -[AVNetworkPlaybackPerfHUDLayer setForegroundColor:](self, "setForegroundColor:", v14, *(_OWORD *)&v15, v16);
    CGColorRelease(v14);
  }
}

- (void)startDispatchTimer
{
  float v3 = [[AVWeakReference alloc] initWithReferencedObject:self];
  unint64_t hudUpdateInterval = self->_hudUpdateInterval;
  handler[0] = MEMORY[0x1E4F143A8];
  handler[1] = 3221225472;
  handler[2] = __51__AVNetworkPlaybackPerfHUDLayer_startDispatchTimer__block_invoke;
  handler[3] = &unk_1E57B1E80;
  handler[4] = v3;
  dispatch_source_t v5 = dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, MEMORY[0x1E4F14428]);
  if (v5)
  {
    int v6 = v5;
    dispatch_time_t v7 = dispatch_time(0, 0);
    dispatch_source_set_timer(v6, v7, 1000000000 * hudUpdateInterval, 0x3B9ACA00uLL);
    dispatch_source_set_event_handler(v6, handler);
    dispatch_resume(v6);
    self->_hudTimer = (OS_dispatch_source *)v6;
  }
}

void *__51__AVNetworkPlaybackPerfHUDLayer_startDispatchTimer__block_invoke(uint64_t a1)
{
  uint64_t result = (void *)[*(id *)(a1 + 32) referencedObject];
  if (result)
  {
    return (void *)[result _hudUpdateTrigger];
  }
  return result;
}

- (void)dealloc
{
  hudTimer = self->_hudTimer;
  if (hudTimer)
  {
    dispatch_source_cancel(hudTimer);
    dispatch_release((dispatch_object_t)self->_hudTimer);
  }

  v4.receiver = self;
  v4.super_class = (Class)AVNetworkPlaybackPerfHUDLayer;
  [(AVNetworkPlaybackPerfHUDLayer *)&v4 dealloc];
}

- (float)getScaleFactorForDisplaySize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  [(AVNetworkPlaybackPerfHUDLayer *)self bounds];
  float v7 = fmax(v5, v6);
  float v8 = fmax(width, height);
  BOOL v9 = v7 == 0.0 || v8 == 0.0;
  float result = v8 / v7;
  if (v9) {
    return 1.0;
  }
  return result;
}

- (BOOL)valueLoadedForKey:(id)a3 onObject:(id)a4
{
  id v7 = (id)-[NSMutableDictionary objectForKey:](self->_loadingStatusCache, "objectForKey:");
  uint64_t v8 = [MEMORY[0x1E4F29238] valueWithNonretainedObject:a4];
  if (!v7
    || (BOOL v9 = (void *)[v7 objectForKey:v8]) == 0
    || (unint64_t v10 = [v9 unsignedLongValue]) == 0)
  {
    unint64_t v10 = [a4 statusOfValueForKey:a3 error:0];
    if (v10 >= 2)
    {
      uint64_t v11 = [MEMORY[0x1E4F28ED0] numberWithUnsignedLong:v10];
      if (!v7)
      {
        id v7 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
        [(NSMutableDictionary *)self->_loadingStatusCache setObject:v7 forKey:a3];
      }
      [v7 setObject:v11 forKey:v8];
    }
  }
  return v10 == 2;
}

- (void)updateHudWithDisplayString:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if (self->_updateUISettings)
  {
    [MEMORY[0x1E4F39CF8] begin];
    [MEMORY[0x1E4F39CF8] setDisableActions:1];
    [(AVNetworkPlaybackPerfHUDLayer *)self setColor:self->_colorId];
    double opacity = self->_opacity;
    *(float *)&double opacity = opacity;
    [(AVNetworkPlaybackPerfHUDLayer *)self setOpacity:opacity];
    [(AVNetworkPlaybackPerfHUDLayer *)self setFontSize:(double)self->_fontSizeInt];
    [MEMORY[0x1E4F39CF8] commit];
    self->_updateUISettings = 0;
  }
  if (!self->_spatialDiagnostics) {
    goto LABEL_9;
  }
  if (runningAnInternalBuild_onceToken != -1) {
    dispatch_once(&runningAnInternalBuild_onceToken, &__block_literal_global_41);
  }
  if (runningAnInternalBuild_internalBuild)
  {
    DeviceRGB = CGColorSpaceCreateDeviceRGB();
    v21[0] = xmmword_194C5FF18;
    v21[1] = unk_194C5FF28;
    CGColorRef v7 = CGColorCreate(DeviceRGB, (const CGFloat *)v21);
    audioSpatializationMode = self->_audioSpatializationMode;
    if (audioSpatializationMode) {
      unint64_t v9 = [(NSNumber *)audioSpatializationMode integerValue];
    }
    else {
      unint64_t v9 = -1;
    }
    [MEMORY[0x1E4F39CF8] begin];
    [MEMORY[0x1E4F39CF8] setDisableActions:1];
    LODWORD(v17) = 1.0;
    [(AVNetworkPlaybackPerfHUDLayer *)self setOpacity:v17];
    [(AVNetworkPlaybackPerfHUDLayer *)self setBackgroundColor:v7];
    [(AVNetworkPlaybackPerfHUDLayer *)self setWrapped:0];
    if (v9 <= 3) {
      [(AVNetworkPlaybackPerfHUDLayer *)self setColor:dword_194C5FF40[v9]];
    }
    [(AVNetworkPlaybackPerfHUDLayer *)self setString:a3];
    [(AVNetworkPlaybackPerfHUDLayer *)self preferredFrameSize];
    if (v18 > 0.0)
    {
      [(AVNetworkPlaybackPerfHUDLayer *)self frame];
      double v20 = v19;
      [(AVNetworkPlaybackPerfHUDLayer *)self frame];
      [(AVNetworkPlaybackPerfHUDLayer *)self setFrame:v20];
    }
    [MEMORY[0x1E4F39CF8] commit];
    if (v7) {
      CFRelease(v7);
    }
    if (DeviceRGB) {
      CFRelease(DeviceRGB);
    }
  }
  else
  {
LABEL_9:
    int fontSizeInt = self->_fontSizeInt;
    if (self->_displayResolutionHeight)
    {
      displayResolutionWidth = self->_displayResolutionWidth;
      if (displayResolutionWidth)
      {
        [(NSNumber *)displayResolutionWidth floatValue];
        double v13 = v12;
        [(NSNumber *)self->_displayResolutionHeight floatValue];
        -[AVNetworkPlaybackPerfHUDLayer getScaleFactorForDisplaySize:](self, "getScaleFactorForDisplaySize:", v13, v14);
        int fontSizeInt = (int)(float)((float)fontSizeInt / v15);
      }
    }
    [MEMORY[0x1E4F39CF8] begin];
    [MEMORY[0x1E4F39CF8] setDisableActions:1];
    [(AVNetworkPlaybackPerfHUDLayer *)self setFontSize:(double)fontSizeInt];
    [(AVNetworkPlaybackPerfHUDLayer *)self setString:a3];
    long long v16 = (void *)MEMORY[0x1E4F39CF8];
    [v16 commit];
  }
}

- (id)displayStringGenerator
{
  float v3 = objc_alloc_init(AVHUDStringGenerator);
  [(AVHUDStringGenerator *)v3 setCaptureCompleteURI:self->_showCompleteURI];
  [(AVHUDStringGenerator *)v3 setSpatialDiagnostics:self->_spatialDiagnostics];
  [(AVHUDStringGenerator *)v3 setPrevStallCount:self->_prevStallCount];
  [(AVHUDStringGenerator *)v3 setTotalStallCount:self->_totalStallCount];
  [(AVHUDStringGenerator *)v3 setPlayer:objc_loadWeak((id *)&self->_player)];
  return v3;
}

- (void)copyPropertiesFromStringGenerator:(id)a3
{
  self->_prevStallCount = [a3 prevStallCount];
  self->_totalStallCount = [a3 totalStallCount];
  self->_prevVariantIdx = [a3 prevVariantIdx];
  self->_displayResolutionHeight = (NSNumber *)objc_msgSend((id)objc_msgSend(a3, "displayResolutionHeight"), "copy");
  self->_displayResolutionWidth = (NSNumber *)objc_msgSend((id)objc_msgSend(a3, "displayResolutionWidth"), "copy");
  self->_audioSpatializationMode = (NSNumber *)objc_msgSend((id)objc_msgSend(a3, "audioSpatializationMode"), "copy");
}

- (void)_hudUpdateTrigger
{
  if ([(AVNetworkPlaybackPerfHUDLayer *)self hudEnabled])
  {
    if (objc_loadWeak((id *)&self->_player)
      && objc_loadWeak((id *)&self->_playerLayer)
      && [objc_loadWeak((id *)&self->_player) status] == 1)
    {
      if ([(AVNetworkPlaybackPerfHUDLayer *)self isHidden]) {
        [(AVNetworkPlaybackPerfHUDLayer *)self setHidden:0];
      }
      if (![(AVNetworkPlaybackPerfHUDLayer *)self superlayer]) {
        objc_msgSend((id)objc_msgSend(objc_loadWeak((id *)&self->_playerLayer), "_maskLayer"), "addSublayer:", self);
      }
      if ([objc_loadWeak((id *)&self->_player) currentItem])
      {
        if (!self->_requestInFlight)
        {
          self->_requestInFlight = 1;
          global_queue = dispatch_get_global_queue(-32768, 0);
          block[0] = MEMORY[0x1E4F143A8];
          block[1] = 3221225472;
          block[2] = __50__AVNetworkPlaybackPerfHUDLayer__hudUpdateTrigger__block_invoke;
          block[3] = &unk_1E57B1E80;
          block[4] = self;
          dispatch_async(global_queue, block);
        }
      }
    }
  }
  else if (([(AVNetworkPlaybackPerfHUDLayer *)self isHidden] & 1) == 0)
  {
    [(AVNetworkPlaybackPerfHUDLayer *)self setHidden:1];
  }
}

void __50__AVNetworkPlaybackPerfHUDLayer__hudUpdateTrigger__block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x199715AE0]();
  float v3 = (void *)[*(id *)(a1 + 32) displayStringGenerator];
  [v3 update];
  uint64_t v4 = [v3 formattedDisplayString];
  [*(id *)(a1 + 32) copyPropertiesFromStringGenerator:v3];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __50__AVNetworkPlaybackPerfHUDLayer__hudUpdateTrigger__block_invoke_2;
  v5[3] = &unk_1E57B2098;
  v5[4] = *(void *)(a1 + 32);
  v5[5] = v4;
  dispatch_async(MEMORY[0x1E4F14428], v5);
}

uint64_t __50__AVNetworkPlaybackPerfHUDLayer__hudUpdateTrigger__block_invoke_2(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) updateHudWithDisplayString:*(void *)(a1 + 40)];
  *(unsigned char *)(*(void *)(a1 + 32) + 160) = 0;
  return result;
}

- (AVPlayer)player
{
  return (AVPlayer *)objc_loadWeak((id *)&self->_player);
}

- (AVPlayerLayer)playerLayer
{
  return (AVPlayerLayer *)objc_loadWeak((id *)&self->_playerLayer);
}

- (void)setPlayerLayer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_playerLayer);
  objc_destroyWeak((id *)&self->_player);
}

@end