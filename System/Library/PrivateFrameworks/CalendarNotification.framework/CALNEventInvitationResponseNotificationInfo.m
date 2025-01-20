@interface CALNEventInvitationResponseNotificationInfo
- (BOOL)isDelegate;
- (CALNEventInvitationResponseNotificationInfo)initWithSourceClientIdentifier:(id)a3 launchURL:(id)a4 expirationDate:(id)a5 eventInvitationNotification:(id)a6 eventRepresentationDictionary:(id)a7 isDelegate:(BOOL)a8 sourceTitle:(id)a9 sourceIdentifier:(id)a10;
- (EKCalendarEventInvitationNotification)eventInvitationNotification;
- (NSDate)expirationDate;
- (NSDictionary)eventRepresentationDictionary;
- (NSString)sourceClientIdentifier;
- (NSString)sourceIdentifier;
- (NSString)sourceTitle;
- (NSURL)launchURL;
- (id)description;
@end

@implementation CALNEventInvitationResponseNotificationInfo

- (CALNEventInvitationResponseNotificationInfo)initWithSourceClientIdentifier:(id)a3 launchURL:(id)a4 expirationDate:(id)a5 eventInvitationNotification:(id)a6 eventRepresentationDictionary:(id)a7 isDelegate:(BOOL)a8 sourceTitle:(id)a9 sourceIdentifier:(id)a10
{
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a6;
  id v20 = a7;
  id v21 = a9;
  id v22 = a10;
  v37.receiver = self;
  v37.super_class = (Class)CALNEventInvitationResponseNotificationInfo;
  v23 = [(CALNEventInvitationResponseNotificationInfo *)&v37 init];
  if (v23)
  {
    uint64_t v24 = [v16 copy];
    sourceClientIdentifier = v23->_sourceClientIdentifier;
    v23->_sourceClientIdentifier = (NSString *)v24;

    uint64_t v26 = [v17 copy];
    launchURL = v23->_launchURL;
    v23->_launchURL = (NSURL *)v26;

    uint64_t v28 = [v18 copy];
    expirationDate = v23->_expirationDate;
    v23->_expirationDate = (NSDate *)v28;

    objc_storeStrong((id *)&v23->_eventInvitationNotification, a6);
    uint64_t v30 = [v20 copy];
    eventRepresentationDictionary = v23->_eventRepresentationDictionary;
    v23->_eventRepresentationDictionary = (NSDictionary *)v30;

    v23->_isDelegate = a8;
    uint64_t v32 = [v21 copy];
    sourceTitle = v23->_sourceTitle;
    v23->_sourceTitle = (NSString *)v32;

    uint64_t v34 = [v22 copy];
    sourceIdentifier = v23->_sourceIdentifier;
    v23->_sourceIdentifier = (NSString *)v34;
  }
  return v23;
}

- (id)description
{
  v14 = NSString;
  uint64_t v3 = objc_opt_class();
  v4 = [(CALNEventInvitationResponseNotificationInfo *)self sourceClientIdentifier];
  v5 = [(CALNEventInvitationResponseNotificationInfo *)self launchURL];
  v6 = [(CALNEventInvitationResponseNotificationInfo *)self expirationDate];
  v7 = [(CALNEventInvitationResponseNotificationInfo *)self eventInvitationNotification];
  v8 = [(CALNEventInvitationResponseNotificationInfo *)self eventRepresentationDictionary];
  v9 = objc_msgSend(NSNumber, "numberWithBool:", -[CALNEventInvitationResponseNotificationInfo isDelegate](self, "isDelegate"));
  v10 = [(CALNEventInvitationResponseNotificationInfo *)self sourceTitle];
  v11 = [(CALNEventInvitationResponseNotificationInfo *)self sourceIdentifier];
  v12 = [v14 stringWithFormat:@"<%@: %p>(sourceClientIdentifier = %@, launchURL = %@, expirationDate = %@, eventInvitationNotification = %@, eventRepresentationDictionary = %@, isDelegate = %@, sourceTitle = %@, sourceIdentifier = %@)", v3, self, v4, v5, v6, v7, v8, v9, v10, v11];

  return v12;
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

- (EKCalendarEventInvitationNotification)eventInvitationNotification
{
  return self->_eventInvitationNotification;
}

- (NSDictionary)eventRepresentationDictionary
{
  return self->_eventRepresentationDictionary;
}

- (BOOL)isDelegate
{
  return self->_isDelegate;
}

- (NSString)sourceTitle
{
  return self->_sourceTitle;
}

- (NSString)sourceIdentifier
{
  return self->_sourceIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourceIdentifier, 0);
  objc_storeStrong((id *)&self->_sourceTitle, 0);
  objc_storeStrong((id *)&self->_eventRepresentationDictionary, 0);
  objc_storeStrong((id *)&self->_eventInvitationNotification, 0);
  objc_storeStrong((id *)&self->_expirationDate, 0);
  objc_storeStrong((id *)&self->_launchURL, 0);
  objc_storeStrong((id *)&self->_sourceClientIdentifier, 0);
}

@end