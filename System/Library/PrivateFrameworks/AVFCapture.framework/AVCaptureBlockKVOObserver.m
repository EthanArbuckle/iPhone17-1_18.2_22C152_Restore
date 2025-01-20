@interface AVCaptureBlockKVOObserver
- (AVCaptureBlockKVOObserver)initWithObjectToObserve:(id)a3 keyPath:(id)a4 options:(unint64_t)a5 handler:(id)a6;
- (void)dealloc;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
@end

@implementation AVCaptureBlockKVOObserver

- (AVCaptureBlockKVOObserver)initWithObjectToObserve:(id)a3 keyPath:(id)a4 options:(unint64_t)a5 handler:(id)a6
{
  v12.receiver = self;
  v12.super_class = (Class)AVCaptureBlockKVOObserver;
  v10 = [(AVCaptureBlockKVOObserver *)&v12 init];
  if (v10)
  {
    v10->_object = a3;
    v10->_keyPath = (NSString *)a4;
    v10->_handler = a6;
    [a3 addObserver:v10 forKeyPath:a4 options:a5 context:AVCaptureBlockKVOObserverContext];
  }
  return v10;
}

- (void)dealloc
{
  [self->_object removeObserver:self forKeyPath:self->_keyPath];

  v3.receiver = self;
  v3.super_class = (Class)AVCaptureBlockKVOObserver;
  [(AVCaptureBlockKVOObserver *)&v3 dealloc];
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if ((void *)AVCaptureBlockKVOObserverContext == a6)
  {
    v6 = (void (*)(void))*((void *)self->_handler + 2);
    v6();
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)AVCaptureBlockKVOObserver;
    -[AVCaptureBlockKVOObserver observeValueForKeyPath:ofObject:change:context:](&v7, sel_observeValueForKeyPath_ofObject_change_context_, a3, a4, a5);
  }
}

@end