@interface NWURLSessionMultipartContent
@end

@implementation NWURLSessionMultipartContent

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_error, 0);

  objc_storeStrong((id *)&self->_data, 0);
}

@end