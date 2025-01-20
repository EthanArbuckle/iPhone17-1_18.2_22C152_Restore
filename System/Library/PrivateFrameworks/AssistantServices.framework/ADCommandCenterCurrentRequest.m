@interface ADCommandCenterCurrentRequest
- (NSString)currentRequestId;
- (SABaseCommand)currentRequestCommand;
- (id)description;
- (void)setCurrentRequestCommand:(id)a3;
- (void)setCurrentRequestId:(id)a3;
@end

@implementation ADCommandCenterCurrentRequest

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentRequestCommand, 0);
  objc_storeStrong((id *)&self->_currentRequestId, 0);
}

- (SABaseCommand)currentRequestCommand
{
  return self->_currentRequestCommand;
}

- (void)setCurrentRequestId:(id)a3
{
}

- (NSString)currentRequestId
{
  return self->_currentRequestId;
}

- (id)description
{
  id v2 = [objc_alloc((Class)NSString) initWithFormat:@"command: %@ requestId:%@", self->_currentRequestCommand, self->_currentRequestId];
  return v2;
}

- (void)setCurrentRequestCommand:(id)a3
{
  objc_storeStrong((id *)&self->_currentRequestCommand, a3);
  id v7 = a3;
  v5 = [v7 aceId];
  currentRequestId = self->_currentRequestId;
  self->_currentRequestId = v5;
}

@end