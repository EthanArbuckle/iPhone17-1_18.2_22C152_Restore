@interface CALNEventInvitationNotificationInfo
- (BOOL)isDelegate;
- (CALNEventInvitationNotificationInfo)initWithSourceClientIdentifier:(id)a3 launchURL:(id)a4 expirationDate:(id)a5 conflictDetails:(id)a6 eventInvitationNotification:(id)a7 eventRepresentationDictionary:(id)a8 eventURI:(id)a9 isDelegate:(BOOL)a10 sourceTitle:(id)a11 sourceIdentifier:(id)a12;
- (EKCalendarEventInvitationNotification)eventInvitationNotification;
- (EKConflictDetails)conflictDetails;
- (NSDate)expirationDate;
- (NSDictionary)eventRepresentationDictionary;
- (NSString)eventURI;
- (NSString)sourceClientIdentifier;
- (NSString)sourceIdentifier;
- (NSString)sourceTitle;
- (NSURL)launchURL;
- (id)description;
@end

@implementation CALNEventInvitationNotificationInfo

- (CALNEventInvitationNotificationInfo)initWithSourceClientIdentifier:(id)a3 launchURL:(id)a4 expirationDate:(id)a5 conflictDetails:(id)a6 eventInvitationNotification:(id)a7 eventRepresentationDictionary:(id)a8 eventURI:(id)a9 isDelegate:(BOOL)a10 sourceTitle:(id)a11 sourceIdentifier:(id)a12
{
  id v42 = a3;
  id v18 = a4;
  id v19 = a5;
  id v41 = a6;
  id v40 = a7;
  id v20 = a8;
  id v21 = a9;
  id v22 = a11;
  id v23 = a12;
  v43.receiver = self;
  v43.super_class = (Class)CALNEventInvitationNotificationInfo;
  v24 = [(CALNEventInvitationNotificationInfo *)&v43 init];
  if (v24)
  {
    uint64_t v25 = [v42 copy];
    sourceClientIdentifier = v24->_sourceClientIdentifier;
    v24->_sourceClientIdentifier = (NSString *)v25;

    uint64_t v27 = [v18 copy];
    launchURL = v24->_launchURL;
    v24->_launchURL = (NSURL *)v27;

    uint64_t v29 = [v19 copy];
    expirationDate = v24->_expirationDate;
    v24->_expirationDate = (NSDate *)v29;

    objc_storeStrong((id *)&v24->_conflictDetails, a6);
    objc_storeStrong((id *)&v24->_eventInvitationNotification, a7);
    uint64_t v31 = [v20 copy];
    eventRepresentationDictionary = v24->_eventRepresentationDictionary;
    v24->_eventRepresentationDictionary = (NSDictionary *)v31;

    uint64_t v33 = [v21 copy];
    eventURI = v24->_eventURI;
    v24->_eventURI = (NSString *)v33;

    v24->_isDelegate = a10;
    uint64_t v35 = [v22 copy];
    sourceTitle = v24->_sourceTitle;
    v24->_sourceTitle = (NSString *)v35;

    uint64_t v37 = [v23 copy];
    sourceIdentifier = v24->_sourceIdentifier;
    v24->_sourceIdentifier = (NSString *)v37;
  }
  return v24;
}

- (id)description
{
  v15 = NSString;
  uint64_t v14 = objc_opt_class();
  v16 = [(CALNEventInvitationNotificationInfo *)self sourceClientIdentifier];
  v3 = [(CALNEventInvitationNotificationInfo *)self launchURL];
  v4 = [(CALNEventInvitationNotificationInfo *)self expirationDate];
  v5 = [(CALNEventInvitationNotificationInfo *)self conflictDetails];
  v6 = [(CALNEventInvitationNotificationInfo *)self eventInvitationNotification];
  v7 = [(CALNEventInvitationNotificationInfo *)self eventURI];
  v8 = [(CALNEventInvitationNotificationInfo *)self eventRepresentationDictionary];
  v9 = objc_msgSend(NSNumber, "numberWithBool:", -[CALNEventInvitationNotificationInfo isDelegate](self, "isDelegate"));
  v10 = [(CALNEventInvitationNotificationInfo *)self sourceTitle];
  v11 = [(CALNEventInvitationNotificationInfo *)self sourceIdentifier];
  v12 = [v15 stringWithFormat:@"<%@: %p>(sourceClientIdentifier = %@, launchURL = %@, expirationDate = %@, conflictDetails = %@, eventInvitationNotification = %@, eventURI = %@, eventRepresentationDictionary = %@, isDelegate = %@, sourceTitle = %@, sourceIdentifier = %@)", v14, self, v16, v3, v4, v5, v6, v7, v8, v9, v10, v11];

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

- (EKConflictDetails)conflictDetails
{
  return self->_conflictDetails;
}

- (EKCalendarEventInvitationNotification)eventInvitationNotification
{
  return self->_eventInvitationNotification;
}

- (NSDictionary)eventRepresentationDictionary
{
  return self->_eventRepresentationDictionary;
}

- (NSString)eventURI
{
  return self->_eventURI;
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
  objc_storeStrong((id *)&self->_eventURI, 0);
  objc_storeStrong((id *)&self->_eventRepresentationDictionary, 0);
  objc_storeStrong((id *)&self->_eventInvitationNotification, 0);
  objc_storeStrong((id *)&self->_conflictDetails, 0);
  objc_storeStrong((id *)&self->_expirationDate, 0);
  objc_storeStrong((id *)&self->_launchURL, 0);
  objc_storeStrong((id *)&self->_sourceClientIdentifier, 0);
}

@end