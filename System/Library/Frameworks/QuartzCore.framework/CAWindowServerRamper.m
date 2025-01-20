@interface CAWindowServerRamper
- (CADisplay)cadisplay;
- (CADisplayLink)link;
- (CAWindowServerDisplay)display;
- (CAWindowServerRamper)initWithDisplay:(id)a3;
- (double)beginTime;
- (double)duration;
- (int)id;
- (void)rampCallback:(id)a3;
- (void)runRamp;
- (void)setBeginTime:(double)a3;
- (void)setCadisplay:(id)a3;
- (void)setDisplay:(id)a3;
- (void)setDuration:(double)a3;
- (void)setId:(int)a3;
- (void)setLink:(id)a3;
@end

@implementation CAWindowServerRamper

- (void)setBeginTime:(double)a3
{
  self->_beginTime = a3;
}

- (double)beginTime
{
  return self->_beginTime;
}

- (void)setId:(int)a3
{
  self->_id = a3;
}

- (int)id
{
  return self->_id;
}

- (void)setDuration:(double)a3
{
  self->_duration = a3;
}

- (double)duration
{
  return self->_duration;
}

- (void)setLink:(id)a3
{
}

- (CADisplayLink)link
{
  return (CADisplayLink *)objc_getProperty(self, a2, 32, 1);
}

- (void)setCadisplay:(id)a3
{
}

- (CADisplay)cadisplay
{
  return (CADisplay *)objc_getProperty(self, a2, 24, 1);
}

- (void)setDisplay:(id)a3
{
}

- (CAWindowServerDisplay)display
{
  return (CAWindowServerDisplay *)objc_getProperty(self, a2, 16, 1);
}

- (void)runRamp
{
  [(CAWindowServerRamper *)self setLink:+[CADisplayLink displayLinkWithDisplay:[(CAWindowServerRamper *)self cadisplay] target:self selector:sel_rampCallback_]];
  v3 = [(CAWindowServerRamper *)self link];
  uint64_t v4 = [MEMORY[0x1E4F1CAC0] currentRunLoop];
  [(CADisplayLink *)v3 addToRunLoop:v4 forMode:*MEMORY[0x1E4F1C3A0]];
  v5 = (void *)[MEMORY[0x1E4F1CAC0] currentRunLoop];

  [v5 run];
}

- (void)rampCallback:(id)a3
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  if (x_log_hook_p())
  {
    x_log_();
  }
  else
  {
    v3 = x_log_category_windowserver;
    if (os_log_type_enabled((os_log_t)x_log_category_windowserver, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v4 = 0;
      _os_log_impl(&dword_184668000, v3, OS_LOG_TYPE_DEFAULT, "rampCallback unimplemented", v4, 2u);
    }
  }
}

- (CAWindowServerRamper)initWithDisplay:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v14.receiver = self;
  v14.super_class = (Class)CAWindowServerRamper;
  uint64_t v4 = [(CAWindowServerRamper *)&v14 init];
  uint64_t v5 = v4;
  if (v4)
  {
    [(CAWindowServerRamper *)v4 setDisplay:a3];
    id v6 = +[CADisplay displays];
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v15 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v17;
      while (2)
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v17 != v9) {
            objc_enumerationMutation(v6);
          }
          v11 = *(void **)(*((void *)&v16 + 1) + 8 * i);
          int v12 = [v11 displayId];
          if (v12 == [a3 displayId])
          {
            [(CAWindowServerRamper *)v5 setCadisplay:v11];
            goto LABEL_12;
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v16 objects:v15 count:16];
        if (v8) {
          continue;
        }
        break;
      }
    }
LABEL_12:
    v5->_id = atomic_fetch_add(&_id_generator, 1uLL);
    v5->_beginTime = -1.0;
  }
  return v5;
}

@end