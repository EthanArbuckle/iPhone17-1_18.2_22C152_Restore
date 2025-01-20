@interface HDSummarySharingAnalytics
- (NSDate)anySharingWithYouLastViewedDate;
- (NSDate)askSomeoneToShareLastSelectedDate;
- (NSDate)mostRecentIncomingTransactionDate;
- (NSDate)sharingContactOptionLastSelectedDate;
- (double)averageNumberAuthorizationsSharedOutPerPerson;
- (int64_t)maxAuthorizationsSharedOutPerPerson;
- (int64_t)minAuthorizationsSharedOutPerPerson;
- (int64_t)numberAuthorizationsSharingOut;
- (int64_t)numberOfAlertNotificationsEnabled;
- (int64_t)numberOfTrendNotificationsEnabled;
- (int64_t)numberOfUpdateNotificationsEnabled;
- (int64_t)numberPeopleSharingIn;
- (int64_t)numberPeopleSharingOut;
- (void)setAnySharingWithYouLastViewedDate:(id)a3;
- (void)setAskSomeoneToShareLastSelectedDate:(id)a3;
- (void)setAverageNumberAuthorizationsSharedOutPerPerson:(double)a3;
- (void)setMaxAuthorizationsSharedOutPerPerson:(int64_t)a3;
- (void)setMinAuthorizationsSharedOutPerPerson:(int64_t)a3;
- (void)setMostRecentIncomingTransactionDate:(id)a3;
- (void)setNumberAuthorizationsSharingOut:(int64_t)a3;
- (void)setNumberOfAlertNotificationsEnabled:(int64_t)a3;
- (void)setNumberOfTrendNotificationsEnabled:(int64_t)a3;
- (void)setNumberOfUpdateNotificationsEnabled:(int64_t)a3;
- (void)setNumberPeopleSharingIn:(int64_t)a3;
- (void)setNumberPeopleSharingOut:(int64_t)a3;
- (void)setSharingContactOptionLastSelectedDate:(id)a3;
@end

@implementation HDSummarySharingAnalytics

- (int64_t)numberAuthorizationsSharingOut
{
  return self->_numberAuthorizationsSharingOut;
}

- (void)setNumberAuthorizationsSharingOut:(int64_t)a3
{
  self->_numberAuthorizationsSharingOut = a3;
}

- (double)averageNumberAuthorizationsSharedOutPerPerson
{
  return self->_averageNumberAuthorizationsSharedOutPerPerson;
}

- (void)setAverageNumberAuthorizationsSharedOutPerPerson:(double)a3
{
  self->_averageNumberAuthorizationsSharedOutPerPerson = a3;
}

- (int64_t)maxAuthorizationsSharedOutPerPerson
{
  return self->_maxAuthorizationsSharedOutPerPerson;
}

- (void)setMaxAuthorizationsSharedOutPerPerson:(int64_t)a3
{
  self->_maxAuthorizationsSharedOutPerPerson = a3;
}

- (int64_t)minAuthorizationsSharedOutPerPerson
{
  return self->_minAuthorizationsSharedOutPerPerson;
}

- (void)setMinAuthorizationsSharedOutPerPerson:(int64_t)a3
{
  self->_minAuthorizationsSharedOutPerPerson = a3;
}

- (int64_t)numberPeopleSharingOut
{
  return self->_numberPeopleSharingOut;
}

- (void)setNumberPeopleSharingOut:(int64_t)a3
{
  self->_numberPeopleSharingOut = a3;
}

- (int64_t)numberPeopleSharingIn
{
  return self->_numberPeopleSharingIn;
}

- (void)setNumberPeopleSharingIn:(int64_t)a3
{
  self->_numberPeopleSharingIn = a3;
}

- (NSDate)mostRecentIncomingTransactionDate
{
  return self->_mostRecentIncomingTransactionDate;
}

- (void)setMostRecentIncomingTransactionDate:(id)a3
{
}

- (int64_t)numberOfAlertNotificationsEnabled
{
  return self->_numberOfAlertNotificationsEnabled;
}

- (void)setNumberOfAlertNotificationsEnabled:(int64_t)a3
{
  self->_numberOfAlertNotificationsEnabled = a3;
}

- (int64_t)numberOfTrendNotificationsEnabled
{
  return self->_numberOfTrendNotificationsEnabled;
}

- (void)setNumberOfTrendNotificationsEnabled:(int64_t)a3
{
  self->_numberOfTrendNotificationsEnabled = a3;
}

- (int64_t)numberOfUpdateNotificationsEnabled
{
  return self->_numberOfUpdateNotificationsEnabled;
}

- (void)setNumberOfUpdateNotificationsEnabled:(int64_t)a3
{
  self->_numberOfUpdateNotificationsEnabled = a3;
}

- (NSDate)askSomeoneToShareLastSelectedDate
{
  return self->_askSomeoneToShareLastSelectedDate;
}

- (void)setAskSomeoneToShareLastSelectedDate:(id)a3
{
}

- (NSDate)anySharingWithYouLastViewedDate
{
  return self->_anySharingWithYouLastViewedDate;
}

- (void)setAnySharingWithYouLastViewedDate:(id)a3
{
}

- (NSDate)sharingContactOptionLastSelectedDate
{
  return self->_sharingContactOptionLastSelectedDate;
}

- (void)setSharingContactOptionLastSelectedDate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sharingContactOptionLastSelectedDate, 0);
  objc_storeStrong((id *)&self->_anySharingWithYouLastViewedDate, 0);
  objc_storeStrong((id *)&self->_askSomeoneToShareLastSelectedDate, 0);

  objc_storeStrong((id *)&self->_mostRecentIncomingTransactionDate, 0);
}

@end