@interface AssetPromise
- (AssetPromise)initWithRequestID:(id)a3 promiseBlock:(id)a4;
- (NSUUID)requestID;
- (id)progress;
- (void)setProgress:(id)a3;
@end

@implementation AssetPromise

- (AssetPromise)initWithRequestID:(id)a3 promiseBlock:(id)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)AssetPromise;
  v8 = [(AssetPromise *)&v11 initWithBlock:a4];
  v9 = v8;
  if (v8) {
    objc_storeStrong((id *)&v8->_requestID, a3);
  }

  return v9;
}

- (id)progress
{
  return objc_getProperty(self, a2, 8, 1);
}

- (void)setProgress:(id)a3
{
}

- (NSUUID)requestID
{
  return (NSUUID *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestID, 0);

  objc_storeStrong(&self->_progress, 0);
}

@end