@interface AUAppleViewControllerBase
+ (id)customViewLogger;
+ (id)getLocalizedString:(id)a3;
- (AudioUnitParameterInfo)getParameterInfo:(SEL)a3 scope:(unsigned int)a4;
- (BOOL)needsRealtimeDrawing;
- (OpaqueAudioComponentInstance)au;
- (UIColor)tintColor;
- (_TtC12CoreAudioKit25AUAppleViewControllerBase)init;
- (_TtC12CoreAudioKit25AUAppleViewControllerBase)initWithCoder:(id)a3;
- (_TtC12CoreAudioKit25AUAppleViewControllerBase)initWithNibName:(id)a3 bundle:(id)a4;
- (double)realtimeDrawingInterval;
- (void)postBeginGestureNotificationForParameter:(unsigned int)a3;
- (void)postEndGestureNotificationForParameter:(unsigned int)a3;
- (void)priv_addListenerForParameter:(unsigned int)a3 scope:(unsigned int)a4 element:(unsigned int)a5;
- (void)priv_eventListener:(void *)a3 event:(const AudioUnitEvent *)a4 value:(float)a5;
- (void)priv_removeListenerForParameter:(unsigned int)a3 scope:(unsigned int)a4 element:(unsigned int)a5;
- (void)priv_removeListeners;
- (void)setAU:(OpaqueAudioComponentInstance *)a3;
- (void)setNeedsRealtimeDrawing:(BOOL)a3;
- (void)setRealtimeDrawingInterval:(double)a3;
- (void)setTintColor:(id)a3;
- (void)viewDidLoad;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation AUAppleViewControllerBase

+ (id)customViewLogger
{
  v2 = (void *)customViewLogger;
  if (!customViewLogger)
  {
    os_log_t v3 = os_log_create("com.apple.audio.CoreAudioKit", "AUCustomViews");
    v4 = (void *)customViewLogger;
    customViewLogger = (uint64_t)v3;

    v2 = (void *)customViewLogger;
  }

  return v2;
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for AUAppleViewControllerBase();
  v2 = (char *)v3.receiver;
  [(AUAppleViewControllerBase *)&v3 viewDidLoad];
  *(void *)&v2[OBJC_IVAR____TtC12CoreAudioKit25AUAppleViewControllerBase_realtimeDrawingInterval] = 0x3FA999999999999ALL;
}

- (void)setNeedsRealtimeDrawing:(BOOL)a3
{
  self->_needsRealtimeDrawing = a3;
}

- (BOOL)needsRealtimeDrawing
{
  return self->_needsRealtimeDrawing;
}

- (void)setAU:(OpaqueAudioComponentInstance *)a3
{
  self->AU = a3;
}

- (OpaqueAudioComponentInstance)au
{
  return self->AU;
}

- (void)priv_removeListeners
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  eventListener = self->eventListener;
  if (eventListener)
  {
    OSStatus v4 = AUListenerDispose(eventListener);
    if (v4)
    {
      OSStatus v5 = v4;
      v6 = +[AUAppleViewControllerBase customViewLogger];
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        v7 = (objc_class *)objc_opt_class();
        v8 = NSStringFromClass(v7);
        v9[0] = 67109378;
        v9[1] = v5;
        __int16 v10 = 2112;
        v11 = v8;
        _os_log_impl(&dword_21E523000, v6, OS_LOG_TYPE_ERROR, "Error disposing au listener: %d, [%@ priv_removeListeners]", (uint8_t *)v9, 0x12u);
      }
    }
  }
  self->eventListener = 0;
}

- (void)priv_addListenerForParameter:(unsigned int)a3 scope:(unsigned int)a4 element:(unsigned int)a5
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  AU = self->AU;
  if (AU)
  {
    p_eventListener = &self->eventListener;
    eventListener = self->eventListener;
    if (!eventListener)
    {
      Current = CFRunLoopGetCurrent();
      OSStatus v20 = AUEventListenerCreate((AUEventListenerProc)EventListenerDispatcher, self, Current, (CFStringRef)*MEMORY[0x263EFFE78], 0.05, 0.05, p_eventListener);
      if (v20)
      {
        OSStatus v21 = v20;
        v14 = +[AUAppleViewControllerBase customViewLogger];
        if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
LABEL_10:

          return;
        }
        v22 = (objc_class *)objc_opt_class();
        v16 = NSStringFromClass(v22);
        buf.mEventType = 67109634;
        *((_DWORD *)&buf.mEventType + 1) = a3;
        LOWORD(buf.mArgument.mParameter.mAudioUnit) = 1024;
        *(_DWORD *)((char *)&buf.mArgument.mProperty.mAudioUnit + 2) = v21;
        HIWORD(buf.mArgument.mProperty.mAudioUnit) = 2112;
        *(void *)&buf.mArgument.mProperty.mPropertyID = v16;
        v17 = "Error creating event listener for param id %d: %d, [%@ priv_addListenerForParameter:scope:element:]";
        p_AudioUnitEvent buf = (uint8_t *)&buf;
LABEL_9:
        _os_log_impl(&dword_21E523000, v14, OS_LOG_TYPE_ERROR, v17, p_buf, 0x18u);

        goto LABEL_10;
      }
      AU = self->AU;
      eventListener = *p_eventListener;
    }
    *(void *)&buf.mEventType = 0;
    buf.mArgument.mParameter.mAudioUnit = AU;
    *(void *)&buf.mArgument.mProperty.mPropertyID = __PAIR64__(a4, a3);
    *(void *)&buf.mArgument.mProperty.mElement = a5;
    int v12 = addParamListener(eventListener, self, &buf);
    if (!v12) {
      return;
    }
    int v13 = v12;
    v14 = +[AUAppleViewControllerBase customViewLogger];
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      goto LABEL_10;
    }
    v15 = (objc_class *)objc_opt_class();
    v16 = NSStringFromClass(v15);
    v23[0] = 67109634;
    v23[1] = a3;
    __int16 v24 = 1024;
    int v25 = v13;
    __int16 v26 = 2112;
    v27 = v16;
    v17 = "Error adding parameter listener for param id %d: %d, [%@ priv_addListenerForParameter:scope:element:]";
    p_AudioUnitEvent buf = (uint8_t *)v23;
    goto LABEL_9;
  }
}

- (void)priv_removeListenerForParameter:(unsigned int)a3 scope:(unsigned int)a4 element:(unsigned int)a5
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  if (self->AU)
  {
    OSStatus v6 = AUListenerDispose(self->eventListener);
    if (v6)
    {
      OSStatus v7 = v6;
      v8 = +[AUAppleViewControllerBase customViewLogger];
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        v9 = (objc_class *)objc_opt_class();
        __int16 v10 = NSStringFromClass(v9);
        v11[0] = 67109634;
        v11[1] = a3;
        __int16 v12 = 1024;
        OSStatus v13 = v7;
        __int16 v14 = 2112;
        v15 = v10;
        _os_log_impl(&dword_21E523000, v8, OS_LOG_TYPE_ERROR, "Error disposing of event listener for param id %d: %d, [%@ priv_removeListenerForParameter:scope:element:]", (uint8_t *)v11, 0x18u);
      }
    }
  }
}

- (AudioUnitParameterInfo)getParameterInfo:(SEL)a3 scope:(unsigned int)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  UInt32 ioDataSize = 104;
  *(_OWORD *)retstr->name = 0u;
  *(_OWORD *)&retstr->name[16] = 0u;
  *(_OWORD *)&retstr->name[32] = 0u;
  *(_OWORD *)&retstr->name[48] = 0u;
  *(_OWORD *)&retstr->clumpID = 0u;
  *(_OWORD *)&retstr->unit = 0u;
  *(void *)&retstr->flags = 0;
  result = (AudioUnitParameterInfo *)AudioUnitGetProperty(self->AU, 4u, 0, a4, retstr, &ioDataSize);
  if (result)
  {
    int v8 = (int)result;
    v9 = +[AUAppleViewControllerBase customViewLogger];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      __int16 v10 = (objc_class *)objc_opt_class();
      v11 = NSStringFromClass(v10);
      *(_DWORD *)AudioUnitEvent buf = 67109634;
      unsigned int v14 = a4;
      __int16 v15 = 1024;
      int v16 = v8;
      __int16 v17 = 2112;
      v18 = v11;
      _os_log_impl(&dword_21E523000, v9, OS_LOG_TYPE_ERROR, "Error getting parameter info for param id %d: %d, [%@ getParameterInfo:scope:]", buf, 0x18u);
    }
    *(void *)&retstr->flags = 0;
    *(_OWORD *)&retstr->clumpID = 0u;
    *(_OWORD *)&retstr->unit = 0u;
    *(_OWORD *)&retstr->name[32] = 0u;
    *(_OWORD *)&retstr->name[48] = 0u;
    *(_OWORD *)retstr->name = 0u;
    *(_OWORD *)&retstr->name[16] = 0u;
  }
  return result;
}

- (void)postBeginGestureNotificationForParameter:(unsigned int)a3
{
  v3.mArgument.mParameter.mAudioUnit = self->AU;
  *(_OWORD *)&v3.mArgument.mProperty.mPropertyID = a3;
  *(void *)&v3.mEventType = 1;
  AUEventListenerNotify(self->eventListener, self, &v3);
}

- (void)postEndGestureNotificationForParameter:(unsigned int)a3
{
  v3.mArgument.mParameter.mAudioUnit = self->AU;
  *(_OWORD *)&v3.mArgument.mProperty.mPropertyID = a3;
  *(void *)&v3.mEventType = 2;
  AUEventListenerNotify(self->eventListener, self, &v3);
}

- (void)priv_eventListener:(void *)a3 event:(const AudioUnitEvent *)a4 value:(float)a5
{
  AudioUnitEventType mEventType = a4->mEventType;
  if (a4->mEventType == kAudioUnitEvent_BeginParameterChangeGesture)
  {
    [(AUAppleViewControllerBase *)self handleBeginGesture:a4->mArgument.mParameter.mParameterID];
  }
  else if (mEventType == kAudioUnitEvent_EndParameterChangeGesture)
  {
    [(AUAppleViewControllerBase *)self handleEndGesture:a4->mArgument.mParameter.mParameterID];
  }
  else if (mEventType == kAudioUnitEvent_PropertyChange)
  {
    AudioUnitParameterID mParameterID = a4->mArgument.mParameter.mParameterID;
    if (mParameterID == 8 || mParameterID == 3) {
      [(AUAppleViewControllerBase *)self handleParameterListChanged];
    }
  }
}

+ (id)getLocalizedString:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v3 = a3;
  OSStatus v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  OSStatus v5 = v4;
  if (!v4
    || ([v4 localizedStringForKey:v3 value:&stru_26CF7B700 table:@"AudioUnits"],
        (id v6 = (id)objc_claimAutoreleasedReturnValue()) == 0))
  {
    id v6 = v3;
    OSStatus v7 = +[AUAppleViewControllerBase customViewLogger];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v8 = (objc_class *)objc_opt_class();
      v9 = NSStringFromClass(v8);
      int v11 = 138412546;
      id v12 = v6;
      __int16 v13 = 2112;
      unsigned int v14 = v9;
      _os_log_impl(&dword_21E523000, v7, OS_LOG_TYPE_ERROR, "Error reading \"%@\" string from localized string file,  [%@ +getLocalizedString:]", (uint8_t *)&v11, 0x16u);
    }
  }

  return v6;
}

- (double)realtimeDrawingInterval
{
  return self->_realtimeDrawingInterval;
}

- (void)setRealtimeDrawingInterval:(double)a3
{
  self->_realtimeDrawingInterval = a3;
}

- (UIColor)tintColor
{
  return self->_tintColor;
}

- (void)setTintColor:(id)a3
{
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC12CoreAudioKit25AUAppleViewControllerBase_tintColor);
}

- (_TtC12CoreAudioKit25AUAppleViewControllerBase)init
{
  return (_TtC12CoreAudioKit25AUAppleViewControllerBase *)sub_21E594AD8();
}

- (_TtC12CoreAudioKit25AUAppleViewControllerBase)initWithCoder:(id)a3
{
  return (_TtC12CoreAudioKit25AUAppleViewControllerBase *)sub_21E594BC4(a3);
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  OSStatus v4 = *(void (**)(void))((*MEMORY[0x263F8EED0] & (uint64_t)self->super.super.super.isa) + 0x1D0);
  OSStatus v5 = self;
  v4();
  v6.receiver = v5;
  v6.super_class = (Class)type metadata accessor for AUAppleViewControllerBase();
  [(AUAppleViewControllerBase *)&v6 viewWillDisappear:v3];
}

- (_TtC12CoreAudioKit25AUAppleViewControllerBase)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC12CoreAudioKit25AUAppleViewControllerBase *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end