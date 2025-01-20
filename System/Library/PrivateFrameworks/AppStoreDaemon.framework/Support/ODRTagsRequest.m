@interface ODRTagsRequest
@end

@implementation ODRTagsRequest

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_progress, 0);
  objc_storeStrong((id *)&self->_logKey, 0);
  objc_storeStrong((id *)&self->_tagRequests, 0);
}

@end