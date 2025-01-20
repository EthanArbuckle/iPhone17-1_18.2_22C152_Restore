@interface _HDRemoteAuthorizationRecord
@end

@implementation _HDRemoteAuthorizationRecord

- (void).cxx_destruct
{
  objc_storeStrong(&self->_requestFinishedHandler, 0);
  objc_storeStrong(&self->_requestSentHandler, 0);

  objc_storeStrong((id *)&self->_record, 0);
}

@end