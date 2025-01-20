@interface BBObserverGatewayAddBulletinRequest
- (NSDate)timeout;
- (NSString)bulletinID;
- (NSString)sectionID;
- (id)timeoutHandler;
- (void)setBulletinID:(id)a3;
- (void)setSectionID:(id)a3;
- (void)setTimeout:(id)a3;
- (void)setTimeoutHandler:(id)a3;
@end

@implementation BBObserverGatewayAddBulletinRequest

- (NSString)bulletinID
{
  return self->_bulletinID;
}

- (void)setBulletinID:(id)a3
{
}

- (NSString)sectionID
{
  return self->_sectionID;
}

- (void)setSectionID:(id)a3
{
}

- (NSDate)timeout
{
  return self->_timeout;
}

- (void)setTimeout:(id)a3
{
}

- (id)timeoutHandler
{
  return self->_timeoutHandler;
}

- (void)setTimeoutHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_timeoutHandler, 0);
  objc_storeStrong((id *)&self->_timeout, 0);
  objc_storeStrong((id *)&self->_sectionID, 0);
  objc_storeStrong((id *)&self->_bulletinID, 0);
}

@end