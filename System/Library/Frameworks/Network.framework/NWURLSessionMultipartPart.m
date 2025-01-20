@interface NWURLSessionMultipartPart
@end

@implementation NWURLSessionMultipartPart

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_data, 0);

  objc_storeStrong((id *)&self->_response, 0);
}

@end