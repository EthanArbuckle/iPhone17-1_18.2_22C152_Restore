@interface ADCloudResponseHandler
- (AFWatchdogTimer)timeoutTimer;
- (NSMutableDictionary)responses;
- (NSString)identifier;
- (id)completion;
- (int64_t)outstandingResponses;
- (unsigned)responseType;
- (void)setCompletion:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setOutstandingResponses:(int64_t)a3;
- (void)setResponseType:(unsigned __int16)a3;
- (void)setResponses:(id)a3;
- (void)setTimeoutTimer:(id)a3;
@end

@implementation ADCloudResponseHandler

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeoutTimer, 0);
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong((id *)&self->_responses, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (void)setTimeoutTimer:(id)a3
{
}

- (AFWatchdogTimer)timeoutTimer
{
  return self->_timeoutTimer;
}

- (void)setCompletion:(id)a3
{
}

- (id)completion
{
  return self->_completion;
}

- (void)setResponses:(id)a3
{
}

- (NSMutableDictionary)responses
{
  return self->_responses;
}

- (void)setResponseType:(unsigned __int16)a3
{
  self->_responseType = a3;
}

- (unsigned)responseType
{
  return self->_responseType;
}

- (void)setOutstandingResponses:(int64_t)a3
{
  self->_outstandingResponses = a3;
}

- (int64_t)outstandingResponses
{
  return self->_outstandingResponses;
}

- (void)setIdentifier:(id)a3
{
}

- (NSString)identifier
{
  return self->_identifier;
}

@end