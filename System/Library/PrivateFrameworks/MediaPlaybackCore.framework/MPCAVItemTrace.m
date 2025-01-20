@interface MPCAVItemTrace
+ (MPCAVItemTrace)traceWithName:(id)a3 item:(id)a4 event:(unsigned int)a5;
+ (id)traceIntervalWithName:(id)a3 item:(id)a4 beginEvent:(unsigned int)a5 endEvent:(unsigned int)a6;
- (MPAVItem)item;
- (NSString)name;
- (double)ended;
- (double)started;
- (unsigned)endEvent;
- (void)cancel;
- (void)dealloc;
- (void)endInterval;
- (void)setEndEvent:(unsigned int)a3;
- (void)setEnded:(double)a3;
- (void)setItem:(id)a3;
- (void)setName:(id)a3;
- (void)setStarted:(double)a3;
@end

@implementation MPCAVItemTrace

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);

  objc_destroyWeak((id *)&self->_item);
}

- (void)setEnded:(double)a3
{
  self->_ended = a3;
}

- (double)ended
{
  return self->_ended;
}

- (void)setStarted:(double)a3
{
  self->_started = a3;
}

- (double)started
{
  return self->_started;
}

- (void)setEndEvent:(unsigned int)a3
{
  self->_endEvent = a3;
}

- (unsigned)endEvent
{
  return self->_endEvent;
}

- (void)setName:(id)a3
{
}

- (NSString)name
{
  return self->_name;
}

- (void)setItem:(id)a3
{
}

- (MPAVItem)item
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_item);

  return (MPAVItem *)WeakRetained;
}

- (void)cancel
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  [(MPCAVItemTrace *)self ended];
  if (v3 == 0.0)
  {
    [MEMORY[0x263EFF910] timeIntervalSinceReferenceDate];
    -[MPCAVItemTrace setEnded:](self, "setEnded:");
    v4 = [(MPCAVItemTrace *)self item];
    v5 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      v6 = [(MPCAVItemTrace *)self name];
      unsigned int v7 = [(MPCAVItemTrace *)self endEvent];
      [(MPCAVItemTrace *)self ended];
      double v9 = v8;
      [(MPCAVItemTrace *)self started];
      int v11 = 138413058;
      v12 = v6;
      __int16 v13 = 1024;
      unsigned int v14 = v7;
      __int16 v15 = 2048;
      double v16 = v9 - v10;
      __int16 v17 = 2112;
      v18 = v4;
      _os_log_impl(&dword_21BB87000, v5, OS_LOG_TYPE_DEBUG, "%@_END (%x) CANCELLED: %.3fs %@", (uint8_t *)&v11, 0x26u);
    }
  }
}

- (void)endInterval
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  [(MPCAVItemTrace *)self ended];
  if (v3 == 0.0)
  {
    [MEMORY[0x263EFF910] timeIntervalSinceReferenceDate];
    -[MPCAVItemTrace setEnded:](self, "setEnded:");
    v4 = [(MPCAVItemTrace *)self item];
    [(MPCAVItemTrace *)self endEvent];
    [v4 type];
    v5 = [MEMORY[0x263F89110] sharedMonitor];
    [v5 networkType];
    kdebug_trace();

    v6 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      unsigned int v7 = [(MPCAVItemTrace *)self name];
      unsigned int v8 = [(MPCAVItemTrace *)self endEvent];
      [(MPCAVItemTrace *)self ended];
      double v10 = v9;
      [(MPCAVItemTrace *)self started];
      int v12 = 138413058;
      __int16 v13 = v7;
      __int16 v14 = 1024;
      unsigned int v15 = v8;
      __int16 v16 = 2048;
      double v17 = v10 - v11;
      __int16 v18 = 2112;
      uint64_t v19 = v4;
      _os_log_impl(&dword_21BB87000, v6, OS_LOG_TYPE_DEBUG, "%@_END (%x): %.3fs %@", (uint8_t *)&v12, 0x26u);
    }
  }
}

- (void)dealloc
{
  [(MPCAVItemTrace *)self cancel];
  v3.receiver = self;
  v3.super_class = (Class)MPCAVItemTrace;
  [(MPCAVItemTrace *)&v3 dealloc];
}

+ (id)traceIntervalWithName:(id)a3 item:(id)a4 beginEvent:(unsigned int)a5 endEvent:(unsigned int)a6
{
  uint64_t v6 = *(void *)&a6;
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  double v11 = objc_alloc_init(MPCAVItemTrace);
  [(MPCAVItemTrace *)v11 setName:v9];
  [(MPCAVItemTrace *)v11 setItem:v10];
  [(MPCAVItemTrace *)v11 setEndEvent:v6];
  [MEMORY[0x263EFF910] timeIntervalSinceReferenceDate];
  -[MPCAVItemTrace setStarted:](v11, "setStarted:");
  [v10 type];
  int v12 = [MEMORY[0x263F89110] sharedMonitor];

  [v12 networkType];
  kdebug_trace();

  __int16 v13 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    int v15 = 138412802;
    id v16 = v9;
    __int16 v17 = 1024;
    unsigned int v18 = a5;
    __int16 v19 = 2112;
    id v20 = v10;
    _os_log_impl(&dword_21BB87000, v13, OS_LOG_TYPE_DEBUG, "%@_BEGIN (%x): %@", (uint8_t *)&v15, 0x1Cu);
  }

  return v11;
}

+ (MPCAVItemTrace)traceWithName:(id)a3 item:(id)a4 event:(unsigned int)a5
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  [v8 type];
  id v9 = [MEMORY[0x263F89110] sharedMonitor];

  [v9 networkType];
  kdebug_trace();

  id v10 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    int v12 = 138412802;
    id v13 = v7;
    __int16 v14 = 1024;
    unsigned int v15 = a5;
    __int16 v16 = 2112;
    id v17 = a4;
    _os_log_impl(&dword_21BB87000, v10, OS_LOG_TYPE_DEBUG, "%@ (%x): %@", (uint8_t *)&v12, 0x1Cu);
  }

  return result;
}

@end