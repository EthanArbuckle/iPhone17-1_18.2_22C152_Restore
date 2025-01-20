@interface CALNSuggestedEventNotificationInfo
- (CALNSuggestedEventNotificationInfo)initWithSourceClientIdentifier:(id)a3 launchURL:(id)a4 expirationDate:(id)a5 suggestionNotification:(id)a6;
- (EKCalendarSuggestionNotification)suggestionNotification;
- (NSDate)expirationDate;
- (NSString)sourceClientIdentifier;
- (NSURL)launchURL;
- (id)description;
@end

@implementation CALNSuggestedEventNotificationInfo

- (CALNSuggestedEventNotificationInfo)initWithSourceClientIdentifier:(id)a3 launchURL:(id)a4 expirationDate:(id)a5 suggestionNotification:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v22.receiver = self;
  v22.super_class = (Class)CALNSuggestedEventNotificationInfo;
  v14 = [(CALNSuggestedEventNotificationInfo *)&v22 init];
  if (v14)
  {
    uint64_t v15 = [v10 copy];
    sourceClientIdentifier = v14->_sourceClientIdentifier;
    v14->_sourceClientIdentifier = (NSString *)v15;

    uint64_t v17 = [v11 copy];
    launchURL = v14->_launchURL;
    v14->_launchURL = (NSURL *)v17;

    uint64_t v19 = [v12 copy];
    expirationDate = v14->_expirationDate;
    v14->_expirationDate = (NSDate *)v19;

    objc_storeStrong((id *)&v14->_suggestionNotification, a6);
  }

  return v14;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(CALNSuggestedEventNotificationInfo *)self sourceClientIdentifier];
  v6 = [(CALNSuggestedEventNotificationInfo *)self suggestionNotification];
  v7 = [(CALNSuggestedEventNotificationInfo *)self expirationDate];
  v8 = [(CALNSuggestedEventNotificationInfo *)self launchURL];
  v9 = [v3 stringWithFormat:@"<%@: %p>(sourceClientIdentifier = %@, suggestionNotification = %@, expirationDate = %@, launchURL = %@)", v4, self, v5, v6, v7, v8];

  return v9;
}

- (NSString)sourceClientIdentifier
{
  return self->_sourceClientIdentifier;
}

- (NSURL)launchURL
{
  return self->_launchURL;
}

- (NSDate)expirationDate
{
  return self->_expirationDate;
}

- (EKCalendarSuggestionNotification)suggestionNotification
{
  return self->_suggestionNotification;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suggestionNotification, 0);
  objc_storeStrong((id *)&self->_expirationDate, 0);
  objc_storeStrong((id *)&self->_launchURL, 0);
  objc_storeStrong((id *)&self->_sourceClientIdentifier, 0);
}

@end