@interface UpdatesResponse
@end

@implementation UpdatesResponse

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rolloutDeferred, 0);
  objc_storeStrong((id *)&self->_dictionary, 0);
  objc_storeStrong((id *)&self->_device, 0);
}

@end