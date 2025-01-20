@interface _CNDataURLSessionTaskAdapter
- (id)onCompletion;
- (id)onDataReceived;
- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveData:(id)a5;
- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5;
- (void)setOnCompletion:(id)a3;
- (void)setOnDataReceived:(id)a3;
@end

@implementation _CNDataURLSessionTaskAdapter

- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveData:(id)a5
{
  id v6 = a5;
  v7 = [(_CNDataURLSessionTaskAdapter *)self onDataReceived];
  v7[2](v7, v6);
}

- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5
{
  id v6 = a5;
  v7 = [(_CNDataURLSessionTaskAdapter *)self onCompletion];
  v7[2](v7, v6);
}

- (id)onDataReceived
{
  return objc_getProperty(self, a2, 8, 1);
}

- (void)setOnDataReceived:(id)a3
{
}

- (id)onCompletion
{
  return objc_getProperty(self, a2, 16, 1);
}

- (void)setOnCompletion:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_onCompletion, 0);

  objc_storeStrong(&self->_onDataReceived, 0);
}

@end