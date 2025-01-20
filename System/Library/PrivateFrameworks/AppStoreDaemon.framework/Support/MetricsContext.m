@interface MetricsContext
@end

@implementation MetricsContext

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_topic, 0);
  objc_storeStrong((id *)&self->_subscriptionState, 0);
  objc_storeStrong((id *)&self->_subscriptionInfo, 0);
  objc_storeStrong((id *)&self->_subscribedAccount, 0);
  objc_storeStrong((id *)&self->_payoutKatanaIDs, 0);
  objc_storeStrong((id *)&self->_nowDate, 0);
  objc_storeStrong((id *)&self->_logKey, 0);
  objc_storeStrong((id *)&self->_intervalStartDate, 0);
  objc_storeStrong((id *)&self->_keepAlive, 0);
  objc_storeStrong((id *)&self->_deletedApps, 0);
  objc_storeStrong((id *)&self->_currentOSVersion, 0);
  objc_storeStrong((id *)&self->_anonymousKatanaIDs, 0);
  objc_storeStrong((id *)&self->_actorID, 0);
}

@end