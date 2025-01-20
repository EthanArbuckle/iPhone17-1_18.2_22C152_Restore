@interface MADServiceProxy
- (MADServiceProxy)initWithService:(id)a3;
- (void)handleResult:(id)a3 atRequestIdx:(unint64_t)a4 forRequestID:(int)a5;
- (void)reportProgress:(double)a3 forRequest:(int)a4;
@end

@implementation MADServiceProxy

- (MADServiceProxy)initWithService:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)MADServiceProxy;
  v5 = [(MADServiceProxy *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_service, v4);
  }

  return v6;
}

- (void)reportProgress:(double)a3 forRequest:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_service);
  if (WeakRetained) {
    [WeakRetained reportProgress:v4 forRequest:a3];
  }
}

- (void)handleResult:(id)a3 atRequestIdx:(unint64_t)a4 forRequestID:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  id v10 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_service);
  v9 = WeakRetained;
  if (WeakRetained) {
    [WeakRetained handleResult:v10 atRequestIdx:a4 forRequestID:v5];
  }
}

- (void).cxx_destruct
{
}

@end