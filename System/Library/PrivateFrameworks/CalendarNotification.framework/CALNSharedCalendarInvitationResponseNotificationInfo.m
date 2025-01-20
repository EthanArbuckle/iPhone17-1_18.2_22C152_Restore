@interface CALNSharedCalendarInvitationResponseNotificationInfo
- (BOOL)isDelegate;
- (CALNSharedCalendarInvitationResponseNotificationInfo)initWithSourceClientIdentifier:(id)a3 calendarNotification:(id)a4 isDelegate:(BOOL)a5 sourceTitle:(id)a6 sourceIdentifier:(id)a7;
- (EKCalendarNotification)calendarNotification;
- (NSString)sourceClientIdentifier;
- (NSString)sourceIdentifier;
- (NSString)sourceTitle;
- (id)description;
@end

@implementation CALNSharedCalendarInvitationResponseNotificationInfo

- (CALNSharedCalendarInvitationResponseNotificationInfo)initWithSourceClientIdentifier:(id)a3 calendarNotification:(id)a4 isDelegate:(BOOL)a5 sourceTitle:(id)a6 sourceIdentifier:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  id v15 = a7;
  v24.receiver = self;
  v24.super_class = (Class)CALNSharedCalendarInvitationResponseNotificationInfo;
  v16 = [(CALNSharedCalendarInvitationResponseNotificationInfo *)&v24 init];
  if (v16)
  {
    uint64_t v17 = [v12 copy];
    sourceClientIdentifier = v16->_sourceClientIdentifier;
    v16->_sourceClientIdentifier = (NSString *)v17;

    objc_storeStrong((id *)&v16->_calendarNotification, a4);
    v16->_isDelegate = a5;
    uint64_t v19 = [v14 copy];
    sourceTitle = v16->_sourceTitle;
    v16->_sourceTitle = (NSString *)v19;

    uint64_t v21 = [v15 copy];
    sourceIdentifier = v16->_sourceIdentifier;
    v16->_sourceIdentifier = (NSString *)v21;
  }
  return v16;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(CALNSharedCalendarInvitationResponseNotificationInfo *)self sourceClientIdentifier];
  v6 = [(CALNSharedCalendarInvitationResponseNotificationInfo *)self calendarNotification];
  v7 = objc_msgSend(NSNumber, "numberWithBool:", -[CALNSharedCalendarInvitationResponseNotificationInfo isDelegate](self, "isDelegate"));
  v8 = [(CALNSharedCalendarInvitationResponseNotificationInfo *)self sourceTitle];
  v9 = [(CALNSharedCalendarInvitationResponseNotificationInfo *)self sourceIdentifier];
  v10 = [v3 stringWithFormat:@"<%@: %p>(sourceClientIdentifier = %@, calendarNotification = %@, isDelegate = %@, sourceTitle = %@, sourceIdentifier = %@)", v4, self, v5, v6, v7, v8, v9];

  return v10;
}

- (NSString)sourceClientIdentifier
{
  return self->_sourceClientIdentifier;
}

- (EKCalendarNotification)calendarNotification
{
  return self->_calendarNotification;
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
  objc_storeStrong((id *)&self->_calendarNotification, 0);
  objc_storeStrong((id *)&self->_sourceClientIdentifier, 0);
}

@end