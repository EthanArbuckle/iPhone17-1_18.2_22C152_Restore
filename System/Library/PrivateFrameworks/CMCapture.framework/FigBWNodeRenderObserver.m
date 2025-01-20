@interface FigBWNodeRenderObserver
- (FigBWNodeRenderObserver)initWithBWNode:(id)a3;
- (id)formatDidBecomeLiveHandler;
- (id)willRenderSampleBufferHandler;
- (void)dealloc;
- (void)node:(id)a3 format:(id)a4 didBecomeLiveForInput:(id)a5 configurationID:(int64_t)a6;
- (void)node:(id)a3 willRenderSampleBuffer:(opaqueCMSampleBuffer *)a4 forInput:(id)a5;
- (void)setFormatDidBecomeLiveHandler:(id)a3;
- (void)setWillRenderSampleBufferHandler:(id)a3;
@end

@implementation FigBWNodeRenderObserver

- (void)node:(id)a3 willRenderSampleBuffer:(opaqueCMSampleBuffer *)a4 forInput:(id)a5
{
  willRenderSampleBufferHandler = (void (**)(id, opaqueCMSampleBuffer *, id))self->_willRenderSampleBufferHandler;
  if (willRenderSampleBufferHandler) {
    willRenderSampleBufferHandler[2](willRenderSampleBufferHandler, a4, a5);
  }
}

- (void)node:(id)a3 format:(id)a4 didBecomeLiveForInput:(id)a5 configurationID:(int64_t)a6
{
  formatDidBecomeLiveHandler = (void (**)(id, id, id, int64_t))self->_formatDidBecomeLiveHandler;
  if (formatDidBecomeLiveHandler) {
    formatDidBecomeLiveHandler[2](formatDidBecomeLiveHandler, a4, a5, a6);
  }
}

- (void)setWillRenderSampleBufferHandler:(id)a3
{
}

- (void)setFormatDidBecomeLiveHandler:(id)a3
{
}

- (FigBWNodeRenderObserver)initWithBWNode:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)FigBWNodeRenderObserver;
  v4 = [(FigBWNodeRenderObserver *)&v7 init];
  if (v4)
  {
    v5 = (BWNode *)a3;
    v4->_node = v5;
    [(BWNode *)v5 setRenderDelegate:v4];
  }
  return v4;
}

- (void)dealloc
{
  [(BWNode *)self->_node setRenderDelegate:0];

  v3.receiver = self;
  v3.super_class = (Class)FigBWNodeRenderObserver;
  [(FigBWNodeRenderObserver *)&v3 dealloc];
}

- (id)willRenderSampleBufferHandler
{
  return self->_willRenderSampleBufferHandler;
}

- (id)formatDidBecomeLiveHandler
{
  return self->_formatDidBecomeLiveHandler;
}

@end