@interface EKCalendarEventInvitationNotificationAttendee
- (BOOL)commentChanged;
- (BOOL)isCurrentUser;
- (BOOL)proposedStartDateChanged;
- (BOOL)proposedStartDateDeclined;
- (BOOL)statusChanged;
- (EKCalendarEventInvitationNotificationAttendee)initWithParticipant:(id)a3 forEvent:(id)a4;
- (NSDate)proposedStartDate;
- (NSString)comment;
- (NSString)emailAddress;
- (NSString)firstName;
- (NSString)lastName;
- (NSString)name;
- (NSString)phoneNumber;
- (NSURL)URL;
- (int64_t)participantStatus;
- (int64_t)participantType;
@end

@implementation EKCalendarEventInvitationNotificationAttendee

- (EKCalendarEventInvitationNotificationAttendee)initWithParticipant:(id)a3 forEvent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(EKCalendarEventInvitationNotificationAttendee *)self init];
  if (v8)
  {
    uint64_t v9 = [v6 name];
    name = v8->_name;
    v8->_name = (NSString *)v9;

    uint64_t v11 = [v6 firstName];
    firstName = v8->_firstName;
    v8->_firstName = (NSString *)v11;

    uint64_t v13 = [v6 lastName];
    lastName = v8->_lastName;
    v8->_lastName = (NSString *)v13;

    uint64_t v15 = [v6 emailAddress];
    emailAddress = v8->_emailAddress;
    v8->_emailAddress = (NSString *)v15;

    uint64_t v17 = [v6 phoneNumber];
    phoneNumber = v8->_phoneNumber;
    v8->_phoneNumber = (NSString *)v17;

    uint64_t v19 = [v6 URL];
    URL = v8->_URL;
    v8->_URL = (NSURL *)v19;

    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v21 = v6;
    }
    else {
      id v21 = 0;
    }
    if (CalAlertInviteeDeclines()) {
      v8->_statusChanged = [v21 statusChanged];
    }
    v8->_participantType = [v6 participantType];
    v8->_participantStatus = [v6 participantStatus];
    v8->_commentChanged = [v21 commentChanged];
    uint64_t v22 = [v6 comment];
    comment = v8->_comment;
    v8->_comment = (NSString *)v22;

    v8->_proposedStartDateChanged = [v21 proposedStartDateChanged];
    uint64_t v24 = [v21 proposedStartDateForEvent:v7];
    proposedStartDate = v8->_proposedStartDate;
    v8->_proposedStartDate = (NSDate *)v24;

    v8->_proposedStartDateDeclined = [v21 proposedStartDateStatus] == 3;
    v8->_isCurrentUser = [v6 isCurrentUser];
  }
  return v8;
}

- (NSString)name
{
  return self->_name;
}

- (NSString)firstName
{
  return self->_firstName;
}

- (NSString)lastName
{
  return self->_lastName;
}

- (NSString)emailAddress
{
  return self->_emailAddress;
}

- (NSString)phoneNumber
{
  return self->_phoneNumber;
}

- (NSURL)URL
{
  return self->_URL;
}

- (BOOL)statusChanged
{
  return self->_statusChanged;
}

- (BOOL)commentChanged
{
  return self->_commentChanged;
}

- (BOOL)proposedStartDateChanged
{
  return self->_proposedStartDateChanged;
}

- (int64_t)participantType
{
  return self->_participantType;
}

- (int64_t)participantStatus
{
  return self->_participantStatus;
}

- (NSString)comment
{
  return self->_comment;
}

- (NSDate)proposedStartDate
{
  return self->_proposedStartDate;
}

- (BOOL)proposedStartDateDeclined
{
  return self->_proposedStartDateDeclined;
}

- (BOOL)isCurrentUser
{
  return self->_isCurrentUser;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_proposedStartDate, 0);
  objc_storeStrong((id *)&self->_comment, 0);
  objc_storeStrong((id *)&self->_URL, 0);
  objc_storeStrong((id *)&self->_phoneNumber, 0);
  objc_storeStrong((id *)&self->_emailAddress, 0);
  objc_storeStrong((id *)&self->_lastName, 0);
  objc_storeStrong((id *)&self->_firstName, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

@end