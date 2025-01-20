@interface CUIKMessageStrings
- (BOOL)timeProposals;
- (CUIKMessageStrings)initWithTitles:(id)a3 bodyStrings:(id)a4 comments:(int64_t)a5 timeProposals:(BOOL)a6 importantAttendee:(id)a7;
- (EKCalendarEventInvitationNotificationAttendee)importantAttendee;
- (NSArray)bodyStrings;
- (NSArray)titleStrings;
- (int64_t)comments;
@end

@implementation CUIKMessageStrings

- (CUIKMessageStrings)initWithTitles:(id)a3 bodyStrings:(id)a4 comments:(int64_t)a5 timeProposals:(BOOL)a6 importantAttendee:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a7;
  v16 = [(CUIKMessageStrings *)self init];
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_titleStrings, a3);
    objc_storeStrong((id *)&v17->_bodyStrings, a4);
    v17->_comments = a5;
    objc_storeStrong((id *)&v17->_importantAttendee, a7);
    v17->_timeProposals = a6;
  }

  return v17;
}

- (NSArray)titleStrings
{
  return self->_titleStrings;
}

- (NSArray)bodyStrings
{
  return self->_bodyStrings;
}

- (int64_t)comments
{
  return self->_comments;
}

- (BOOL)timeProposals
{
  return self->_timeProposals;
}

- (EKCalendarEventInvitationNotificationAttendee)importantAttendee
{
  return self->_importantAttendee;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_importantAttendee, 0);
  objc_storeStrong((id *)&self->_bodyStrings, 0);

  objc_storeStrong((id *)&self->_titleStrings, 0);
}

@end