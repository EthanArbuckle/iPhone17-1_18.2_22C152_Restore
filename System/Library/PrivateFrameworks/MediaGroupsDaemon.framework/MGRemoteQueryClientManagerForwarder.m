@interface MGRemoteQueryClientManagerForwarder
- (MGRemoteQueryClientManager)manager;
- (MGRemoteQueryClientManagerForwarder)initWithClientManager:(id)a3;
- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveData:(id)a5;
- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveResponse:(id)a5 completionHandler:(id)a6;
- (void)URLSession:(id)a3 didReceiveChallenge:(id)a4 completionHandler:(id)a5;
- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5;
@end

@implementation MGRemoteQueryClientManagerForwarder

- (MGRemoteQueryClientManagerForwarder)initWithClientManager:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)MGRemoteQueryClientManagerForwarder;
  v5 = [(MGRemoteQueryClientManagerForwarder *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_manager, v4);
  }

  return v6;
}

- (void)URLSession:(id)a3 didReceiveChallenge:(id)a4 completionHandler:(id)a5
{
  id v12 = a3;
  id v8 = a4;
  v9 = (void (**)(id, uint64_t, void))a5;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_manager);
  v11 = WeakRetained;
  if (WeakRetained) {
    [WeakRetained URLSession:v12 didReceiveChallenge:v8 completionHandler:v9];
  }
  else {
    v9[2](v9, 2, 0);
  }
}

- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveResponse:(id)a5 completionHandler:(id)a6
{
  id v15 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = (void (**)(id, void))a6;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_manager);
  v14 = WeakRetained;
  if (WeakRetained) {
    [WeakRetained URLSession:v15 dataTask:v10 didReceiveResponse:v11 completionHandler:v12];
  }
  else {
    v12[2](v12, 0);
  }
}

- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveData:(id)a5
{
  id v12 = a3;
  id v8 = a5;
  id v9 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_manager);
  id v11 = WeakRetained;
  if (WeakRetained) {
    [WeakRetained URLSession:v12 dataTask:v9 didReceiveData:v8];
  }
  else {
    [v9 cancel];
  }
}

- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5
{
  id v12 = a3;
  id v8 = a4;
  id v9 = a5;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_manager);
  id v11 = WeakRetained;
  if (WeakRetained) {
    [WeakRetained URLSession:v12 task:v8 didCompleteWithError:v9];
  }
}

- (MGRemoteQueryClientManager)manager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_manager);
  return (MGRemoteQueryClientManager *)WeakRetained;
}

- (void).cxx_destruct
{
}

@end