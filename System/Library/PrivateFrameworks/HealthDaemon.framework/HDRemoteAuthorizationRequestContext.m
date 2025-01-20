@interface HDRemoteAuthorizationRequestContext
@end

@implementation HDRemoteAuthorizationRequestContext

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong(&self->_requestSentHandler, 0);

  objc_storeStrong((id *)&self->_requestRecord, 0);
}

@end