@interface COOutstandingRequests
- (COStateUpdateRequest)request;
- (id)callback;
- (void)setCallback:(id)a3;
- (void)setRequest:(id)a3;
@end

@implementation COOutstandingRequests

- (COStateUpdateRequest)request
{
  return (COStateUpdateRequest *)objc_getProperty(self, a2, 8, 1);
}

- (void)setRequest:(id)a3
{
}

- (id)callback
{
  return objc_getProperty(self, a2, 16, 1);
}

- (void)setCallback:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_callback, 0);
  objc_storeStrong((id *)&self->_request, 0);
}

@end