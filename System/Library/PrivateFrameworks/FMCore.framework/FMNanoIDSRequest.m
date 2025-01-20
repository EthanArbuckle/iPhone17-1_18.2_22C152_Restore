@interface FMNanoIDSRequest
- (FMDispatchTimer)timer;
- (NSString)idsMessageID;
- (id)responseHandler;
- (void)setIdsMessageID:(id)a3;
- (void)setResponseHandler:(id)a3;
- (void)setTimer:(id)a3;
@end

@implementation FMNanoIDSRequest

- (NSString)idsMessageID
{
  return self->_idsMessageID;
}

- (void)setIdsMessageID:(id)a3
{
}

- (id)responseHandler
{
  return self->_responseHandler;
}

- (void)setResponseHandler:(id)a3
{
}

- (FMDispatchTimer)timer
{
  return self->_timer;
}

- (void)setTimer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong(&self->_responseHandler, 0);
  objc_storeStrong((id *)&self->_idsMessageID, 0);
}

@end