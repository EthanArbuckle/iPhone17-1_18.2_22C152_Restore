@interface _HKAppImageManagerContainer
- (NSMutableData)data;
- (NSString)productType;
- (NSString)urlString;
- (id)completionHandler;
- (void)setCompletionHandler:(id)a3;
- (void)setData:(id)a3;
- (void)setProductType:(id)a3;
- (void)setUrlString:(id)a3;
@end

@implementation _HKAppImageManagerContainer

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
}

- (NSString)urlString
{
  return self->_urlString;
}

- (void)setUrlString:(id)a3
{
}

- (NSString)productType
{
  return self->_productType;
}

- (void)setProductType:(id)a3
{
}

- (NSMutableData)data
{
  return self->_data;
}

- (void)setData:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_productType, 0);
  objc_storeStrong((id *)&self->_urlString, 0);
  objc_storeStrong(&self->_completionHandler, 0);
}

@end