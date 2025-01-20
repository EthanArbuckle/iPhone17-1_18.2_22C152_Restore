@interface SSSDisplayLinkObserver
- (id)displayLinkObserverHandler;
- (void)_displayLinkHandler:(id)a3;
- (void)dealloc;
- (void)setDisplayLinkObserverHandler:(id)a3;
- (void)startObserver;
- (void)stopObserver;
@end

@implementation SSSDisplayLinkObserver

- (void)dealloc
{
  [(SSSDisplayLinkObserver *)self stopObserver];
  v3.receiver = self;
  v3.super_class = (Class)SSSDisplayLinkObserver;
  [(SSSDisplayLinkObserver *)&v3 dealloc];
}

- (void)startObserver
{
  if (!self->_displayLink)
  {
    objc_super v3 = +[CADisplayLink displayLinkWithTarget:self selector:"_displayLinkHandler:"];
    displayLink = self->_displayLink;
    self->_displayLink = v3;

    [(CADisplayLink *)self->_displayLink setPreferredFramesPerSecond:3];
    v5 = self->_displayLink;
    id v6 = +[NSRunLoop mainRunLoop];
    [(CADisplayLink *)v5 addToRunLoop:v6 forMode:NSRunLoopCommonModes];
  }
}

- (void)_displayLinkHandler:(id)a3
{
  v4 = [(SSSDisplayLinkObserver *)self displayLinkObserverHandler];

  if (v4)
  {
    v5 = [(SSSDisplayLinkObserver *)self displayLinkObserverHandler];
    char v6 = v5[2]();

    if ((v6 & 1) == 0)
    {
      [(SSSDisplayLinkObserver *)self stopObserver];
    }
  }
}

- (void)stopObserver
{
  displayLink = self->_displayLink;
  if (displayLink)
  {
    [(CADisplayLink *)displayLink invalidate];
    v4 = self->_displayLink;
    self->_displayLink = 0;
  }
}

- (id)displayLinkObserverHandler
{
  return self->_displayLinkObserverHandler;
}

- (void)setDisplayLinkObserverHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_displayLinkObserverHandler, 0);

  objc_storeStrong((id *)&self->_displayLink, 0);
}

@end