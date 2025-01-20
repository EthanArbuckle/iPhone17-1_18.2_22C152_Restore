@interface JFXCaptureCallObserver
- (CXCallObserver)callObserver;
- (JFXCaptureCallObserver)init;
- (int64_t)callCount;
- (void)setCallObserver:(id)a3;
@end

@implementation JFXCaptureCallObserver

- (JFXCaptureCallObserver)init
{
  v6.receiver = self;
  v6.super_class = (Class)JFXCaptureCallObserver;
  v2 = [(JFXCaptureCallObserver *)&v6 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    callObserver = v2->_callObserver;
    v2->_callObserver = (CXCallObserver *)v3;

    [(CXCallObserver *)v2->_callObserver setDelegate:v2 queue:MEMORY[0x263EF83A0]];
  }
  return v2;
}

- (int64_t)callCount
{
  v2 = [(JFXCaptureCallObserver *)self callObserver];
  uint64_t v3 = [v2 calls];
  int64_t v4 = [v3 count];

  return v4;
}

- (CXCallObserver)callObserver
{
  return self->_callObserver;
}

- (void)setCallObserver:(id)a3
{
}

- (void).cxx_destruct
{
}

@end