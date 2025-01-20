@interface EmbeddedTrackpadBridge
- (BOOL)coverClosed;
- (BOOL)displayOff;
- (EmbeddedTrackpadBridge)initWithDevice:(__MTDevice *)a3 parserOptions:(int)a4;
- (id)debug;
- (id)generateHostStateEvent:(id)a3;
- (unsigned)deviceOrientation;
- (unsigned)screenOrientation;
- (void)handleCancelEvent:(id)a3;
- (void)handleSetPropertyEvent:(id)a3;
- (void)setCoverClosed:(BOOL)a3;
- (void)setDeviceOrientation:(unsigned __int8)a3;
- (void)setDisplayOff:(BOOL)a3;
- (void)setQueue:(id)a3;
- (void)setScreenOrientation:(unsigned __int8)a3;
@end

@implementation EmbeddedTrackpadBridge

- (EmbeddedTrackpadBridge)initWithDevice:(__MTDevice *)a3 parserOptions:(int)a4
{
  v8.receiver = self;
  v8.super_class = (Class)EmbeddedTrackpadBridge;
  v4 = [(TrackpadBridge *)&v8 initWithDevice:a3 parserOptions:*(void *)&a4];
  v4->_coverClosed = 0;
  v4->_displayOff = 0;
  v4->_screenOrientation = 0;
  v4->_deviceOrientation = 0;
  v5 = objc_alloc_init(CoreAccessoryManager);
  coreAccessoryManager = v4->_coreAccessoryManager;
  v4->_coreAccessoryManager = v5;

  return v4;
}

- (void)handleSetPropertyEvent:(id)a3
{
  v4 = (char *)a3;
  v5 = v4 + 16;
  v6 = v4 + 16;
  if (v4[39] < 0) {
    v6 = (void *)*v5;
  }
  v7 = +[NSString stringWithUTF8String:v6];
  id v8 = *((id *)v4 + 5);
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v9 = v8;
  }
  else {
    id v9 = 0;
  }

  int v10 = v4[39];
  if (v10 < 0)
  {
    if (*((void *)v4 + 3) != 21) {
      goto LABEL_27;
    }
    v5 = (void *)*v5;
  }
  else if (v10 != 21)
  {
    goto LABEL_27;
  }
  if (*v5 == 0x7461745374736F48
    && v5[1] == 0x63696669746F4E65
    && *(void *)((char *)v5 + 13) == 0x6E6F697461636966
    && v9 != 0)
  {
    v15 = [(EmbeddedTrackpadBridge *)self generateHostStateEvent:v9];
    if (v15)
    {
      v17.receiver = self;
      v17.super_class = (Class)EmbeddedTrackpadBridge;
      [(TrackpadBridge *)&v17 handleConsume:v15];
    }
  }
LABEL_27:
  [(CoreAccessoryManager *)self->_coreAccessoryManager handleProperty:v7 value:*((void *)v4 + 5)];
  v16.receiver = self;
  v16.super_class = (Class)EmbeddedTrackpadBridge;
  [(TrackpadBridge *)&v16 handleSetPropertyEvent:v4];
}

- (void)handleCancelEvent:(id)a3
{
  coreAccessoryManager = self->_coreAccessoryManager;
  self->_coreAccessoryManager = 0;
  id v5 = a3;

  v6.receiver = self;
  v6.super_class = (Class)EmbeddedTrackpadBridge;
  [(TrackpadBridge *)&v6 handleCancelEvent:v5];
}

- (void)setQueue:(id)a3
{
  id v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)EmbeddedTrackpadBridge;
  [(TrackpadBridge *)&v5 setQueue:v4];
  [(CoreAccessoryManager *)self->_coreAccessoryManager setQueue:v4];
}

- (id)generateHostStateEvent:(id)a3
{
  id v4 = a3;
  objc_super v5 = [v4 objectForKey:@"DigitizerSurfaceCovered"];
  id v6 = [v5 BOOLValue];

  v7 = [v4 objectForKey:@"ScreenOn"];
  id v8 = v7;
  if (v7) {
    uint64_t v9 = [v7 BOOLValue] ^ 1;
  }
  else {
    uint64_t v9 = 0;
  }
  int v10 = [v4 objectForKey:@"GraphicsOrientation"];
  unsigned __int8 v11 = [v10 intValue];

  v12 = [v4 objectForKey:@"DeviceOrientation"];
  unsigned __int8 v13 = [v12 intValue];

  if (v6 == [(EmbeddedTrackpadBridge *)self coverClosed]
    && v9 == [(EmbeddedTrackpadBridge *)self displayOff]
    && [(EmbeddedTrackpadBridge *)self screenOrientation] == v11
    && [(EmbeddedTrackpadBridge *)self deviceOrientation] == v13)
  {
    v14 = MTLoggingPlugin();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      int v18 = 136315650;
      v19 = "[Debug] ";
      __int16 v20 = 2080;
      v21 = "";
      __int16 v22 = 2080;
      v23 = "-[EmbeddedTrackpadBridge generateHostStateEvent:]";
      _os_log_impl(&def_411C8, v14, OS_LOG_TYPE_DEBUG, "[HID] [MT] %s%s%s Received host state notification, but nothing changed.", (uint8_t *)&v18, 0x20u);
    }

    v15 = 0;
  }
  else
  {
    objc_super v16 = MTLoggingPlugin();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      int v18 = 136316674;
      v19 = "[Debug] ";
      __int16 v20 = 2080;
      v21 = "";
      __int16 v22 = 2080;
      v23 = "-[EmbeddedTrackpadBridge generateHostStateEvent:]";
      __int16 v24 = 1024;
      int v25 = (int)v6;
      __int16 v26 = 1024;
      int v27 = v9;
      __int16 v28 = 1024;
      int v29 = v11;
      __int16 v30 = 1024;
      int v31 = v13;
      _os_log_impl(&def_411C8, v16, OS_LOG_TYPE_DEBUG, "[HID] [MT] %s%s%s Received host state notification coverClosed(%d) displayOff(%d) screenOrientation(%d) deviceOrientation(%d)", (uint8_t *)&v18, 0x38u);
    }

    [(EmbeddedTrackpadBridge *)self setCoverClosed:v6];
    [(EmbeddedTrackpadBridge *)self setDisplayOff:v9];
    [(EmbeddedTrackpadBridge *)self setScreenOrientation:v11];
    [(EmbeddedTrackpadBridge *)self setDeviceOrientation:v13];
    v15 = [[HSTHostStateEvent alloc] initWithDeviceOrientation:v13 screenOrientation:v11 coverClosed:v6 displayOff:v9];
  }

  return v15;
}

- (id)debug
{
  v12.receiver = self;
  v12.super_class = (Class)EmbeddedTrackpadBridge;
  v3 = [(TrackpadBridge *)&v12 debug];
  id v4 = [v3 mutableCopy];

  objc_super v5 = +[NSNumber numberWithBool:[(EmbeddedTrackpadBridge *)self coverClosed]];
  [v4 setObject:v5 forKeyedSubscript:@"CoverClosed"];

  id v6 = +[NSNumber numberWithBool:[(EmbeddedTrackpadBridge *)self displayOff]];
  [v4 setObject:v6 forKeyedSubscript:@"DisplayOff"];

  v7 = +[NSNumber numberWithUnsignedInteger:[(EmbeddedTrackpadBridge *)self screenOrientation]];
  [v4 setObject:v7 forKeyedSubscript:@"ScreenOrientation"];

  id v8 = +[NSNumber numberWithUnsignedInteger:[(EmbeddedTrackpadBridge *)self deviceOrientation]];
  [v4 setObject:v8 forKeyedSubscript:@"DeviceOrientation"];

  uint64_t v9 = [(CoreAccessoryManager *)self->_coreAccessoryManager debugDictionary];
  [v4 setObject:v9 forKeyedSubscript:@"CoreAccessoryManager"];

  id v10 = [v4 copy];

  return v10;
}

- (BOOL)coverClosed
{
  return self->_coverClosed;
}

- (void)setCoverClosed:(BOOL)a3
{
  self->_coverClosed = a3;
}

- (BOOL)displayOff
{
  return self->_displayOff;
}

- (void)setDisplayOff:(BOOL)a3
{
  self->_displayOff = a3;
}

- (unsigned)screenOrientation
{
  return self->_screenOrientation;
}

- (void)setScreenOrientation:(unsigned __int8)a3
{
  self->_screenOrientation = a3;
}

- (unsigned)deviceOrientation
{
  return self->_deviceOrientation;
}

- (void)setDeviceOrientation:(unsigned __int8)a3
{
  self->_deviceOrientation = a3;
}

- (void).cxx_destruct
{
}

@end