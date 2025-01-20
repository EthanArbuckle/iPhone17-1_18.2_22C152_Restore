@interface _HDRemoteAuthorizationRequestRecord
@end

@implementation _HDRemoteAuthorizationRequestRecord

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_records, 0);
  objc_storeStrong((id *)&self->_shouldPromptError, 0);
  objc_storeStrong((id *)&self->_hostAppName, 0);

  objc_storeStrong((id *)&self->_bundleID, 0);
}

@end