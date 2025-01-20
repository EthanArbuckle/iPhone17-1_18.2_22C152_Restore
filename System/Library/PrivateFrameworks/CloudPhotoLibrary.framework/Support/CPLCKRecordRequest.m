@interface CPLCKRecordRequest
@end

@implementation CPLCKRecordRequest

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_requestingRecordID, 0);
  objc_storeStrong((id *)&self->_requestedRecordID, 0);
}

@end