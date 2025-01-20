@interface PKDisplayLinkObserver
- (BOOL)startWithPreferredFramesPerSecond:(CAFrameRateRange)a3 addToRunLoop:(id)a4 forMode:(id)a5;
- (BOOL)stop;
- (PKDisplayLinkObserver)initWithHandler:(id)a3;
- (void)_displayLinkHandler:(id)a3;
- (void)dealloc;
@end

@implementation PKDisplayLinkObserver

- (PKDisplayLinkObserver)initWithHandler:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKDisplayLinkObserver;
  v5 = [(PKDisplayLinkObserver *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    id handler = v5->_handler;
    v5->_id handler = (id)v6;
  }
  return v5;
}

- (void)dealloc
{
  [(PKDisplayLinkObserver *)self stop];
  v3.receiver = self;
  v3.super_class = (Class)PKDisplayLinkObserver;
  [(PKDisplayLinkObserver *)&v3 dealloc];
}

- (BOOL)startWithPreferredFramesPerSecond:(CAFrameRateRange)a3 addToRunLoop:(id)a4 forMode:(id)a5
{
  displayLink = self->_displayLink;
  if (!displayLink)
  {
    float preferred = a3.preferred;
    float maximum = a3.maximum;
    float minimum = a3.minimum;
    v11 = (void *)MEMORY[0x1E4F39B68];
    id v12 = a5;
    id v13 = a4;
    v14 = [v11 displayLinkWithTarget:self selector:sel__displayLinkHandler_];
    v15 = self->_displayLink;
    self->_displayLink = v14;

    *(float *)&double v16 = minimum;
    *(float *)&double v17 = maximum;
    *(float *)&double v18 = preferred;
    -[CADisplayLink setPreferredFrameRateRange:](self->_displayLink, "setPreferredFrameRateRange:", v16, v17, v18);
    [(CADisplayLink *)self->_displayLink addToRunLoop:v13 forMode:v12];
  }
  return displayLink == 0;
}

- (BOOL)stop
{
  displayLink = self->_displayLink;
  if (displayLink)
  {
    [(CADisplayLink *)self->_displayLink invalidate];
    id v4 = self->_displayLink;
    self->_displayLink = 0;
  }
  return displayLink != 0;
}

- (void)_displayLinkHandler:(id)a3
{
  id v4 = a3;
  id handler = (uint64_t (**)(void))self->_handler;
  if (handler)
  {
    id v7 = v4;
    char v6 = handler[2]();
    id v4 = v7;
    if ((v6 & 1) == 0)
    {
      [(PKDisplayLinkObserver *)self stop];
      id v4 = v7;
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_handler, 0);

  objc_storeStrong((id *)&self->_displayLink, 0);
}

@end