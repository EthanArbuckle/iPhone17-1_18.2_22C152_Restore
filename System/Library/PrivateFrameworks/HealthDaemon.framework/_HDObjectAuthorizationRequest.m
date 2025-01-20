@interface _HDObjectAuthorizationRequest
@end

@implementation _HDObjectAuthorizationRequest

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionIdentifier, 0);
  objc_storeStrong((id *)&self->_authorizationRecords, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_samples, 0);
  objc_storeStrong((id *)&self->_identifier, 0);

  objc_storeStrong(&self->_completion, 0);
}

@end