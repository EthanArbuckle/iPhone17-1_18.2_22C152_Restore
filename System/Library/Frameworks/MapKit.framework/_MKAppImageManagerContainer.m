@interface _MKAppImageManagerContainer
- (NSMutableData)data;
- (NSString)urlString;
- (id)completionHandler;
- (unint64_t)signpostID;
- (void)setCompletionHandler:(id)a3;
- (void)setData:(id)a3;
- (void)setSignpostID:(unint64_t)a3;
- (void)setUrlString:(id)a3;
@end

@implementation _MKAppImageManagerContainer

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_urlString, 0);
  objc_storeStrong((id *)&self->_data, 0);

  objc_storeStrong(&self->_completionHandler, 0);
}

- (unint64_t)signpostID
{
  return self->_signpostID;
}

- (void)setUrlString:(id)a3
{
}

- (void)setSignpostID:(unint64_t)a3
{
  self->_signpostID = a3;
}

- (void)setData:(id)a3
{
}

- (void)setCompletionHandler:(id)a3
{
}

- (NSString)urlString
{
  return self->_urlString;
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (NSMutableData)data
{
  return self->_data;
}

@end