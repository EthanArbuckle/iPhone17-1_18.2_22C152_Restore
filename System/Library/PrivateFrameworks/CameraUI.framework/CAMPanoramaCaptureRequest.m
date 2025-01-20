@interface CAMPanoramaCaptureRequest
- (CAMPanoramaCaptureRequest)init;
- (CAMPanoramaCaptureRequest)initWithRequest:(id)a3 distinctPersistence:(BOOL)a4 includeAnalytics:(BOOL)a5;
- (CAMPanoramaCaptureRequestDelegate)delegate;
- (id)mutableCopyWithZone:(_NSZone *)a3;
@end

@implementation CAMPanoramaCaptureRequest

- (CAMPanoramaCaptureRequest)init
{
  v6.receiver = self;
  v6.super_class = (Class)CAMPanoramaCaptureRequest;
  v2 = [(CAMCaptureRequest *)&v6 initWithType:2];
  v3 = v2;
  if (v2) {
    v4 = v2;
  }

  return v3;
}

- (CAMPanoramaCaptureRequest)initWithRequest:(id)a3 distinctPersistence:(BOOL)a4 includeAnalytics:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  id v8 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CAMPanoramaCaptureRequest;
  v9 = [(CAMCaptureRequest *)&v13 initWithRequest:v8 distinctPersistence:v6 includeAnalytics:v5];
  if (v9)
  {
    v10 = [v8 delegate];
    objc_storeWeak((id *)&v9->_delegate, v10);

    v11 = v9;
  }

  return v9;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  v4 = [CAMMutablePanoramaCaptureRequest alloc];
  return [(CAMPanoramaCaptureRequest *)v4 initWithRequest:self distinctPersistence:0 includeAnalytics:1];
}

- (CAMPanoramaCaptureRequestDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (CAMPanoramaCaptureRequestDelegate *)WeakRetained;
}

- (void).cxx_destruct
{
}

@end