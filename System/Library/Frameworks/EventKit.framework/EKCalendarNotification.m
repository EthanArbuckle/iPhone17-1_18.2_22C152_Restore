@interface EKCalendarNotification
- (BOOL)acknowledgeWithEventStore:(id)a3 error:(id *)a4;
- (BOOL)alerted;
- (BOOL)couldBeJunk;
- (BOOL)hiddenFromNotificationCenter;
- (BOOL)isInvitation;
- (BOOL)isProposedNewTime;
- (BOOL)isSharedCalendarInvitation;
- (BOOL)needsAlert;
- (BOOL)proposedStartDateIsInFutureForAttendee:(id)a3;
- (CGColor)dotColor;
- (EKCalendar)calendar;
- (EKCalendarNotification)initWithType:(int64_t)a3;
- (EKEvent)event;
- (EKObjectID)objectID;
- (EKSource)source;
- (NSString)emailAddress;
- (NSString)firstName;
- (NSString)lastName;
- (NSString)name;
- (NSString)phoneNumber;
- (NSString)recipientName;
- (NSString)title;
- (NSString)uniqueIdentifier;
- (NSURL)URL;
- (int64_t)type;
- (void)dealloc;
- (void)setAlerted:(BOOL)a3;
- (void)setCalendar:(id)a3;
- (void)setDotColor:(CGColor *)a3;
- (void)setEmailAddress:(id)a3;
- (void)setEvent:(id)a3;
- (void)setFirstName:(id)a3;
- (void)setHiddenFromNotificationCenter:(BOOL)a3;
- (void)setLastName:(id)a3;
- (void)setName:(id)a3;
- (void)setObjectID:(id)a3;
- (void)setPhoneNumber:(id)a3;
- (void)setRecipientName:(id)a3;
- (void)setSource:(id)a3;
- (void)setTitle:(id)a3;
- (void)setType:(int64_t)a3;
- (void)setURL:(id)a3;
@end

@implementation EKCalendarNotification

- (void)setURL:(id)a3
{
}

- (void)setTitle:(id)a3
{
}

- (void)setSource:(id)a3
{
}

- (void)setRecipientName:(id)a3
{
}

- (void)setPhoneNumber:(id)a3
{
}

- (void)setObjectID:(id)a3
{
}

- (void)setName:(id)a3
{
}

- (void)setLastName:(id)a3
{
}

- (void)setHiddenFromNotificationCenter:(BOOL)a3
{
  self->_hiddenFromNotificationCenter = a3;
}

- (void)setFirstName:(id)a3
{
}

- (void)setEvent:(id)a3
{
}

- (void)setEmailAddress:(id)a3
{
}

- (void)setDotColor:(CGColor *)a3
{
  dotColor = self->_dotColor;
  if (dotColor) {
    CFRelease(dotColor);
  }
  if (a3) {
    Copy = CGColorCreateCopy(a3);
  }
  else {
    Copy = 0;
  }
  self->_dotColor = Copy;
}

- (void)setCalendar:(id)a3
{
}

- (void)setAlerted:(BOOL)a3
{
  self->_alerted = a3;
}

- (EKCalendarNotification)initWithType:(int64_t)a3
{
  v7.receiver = self;
  v7.super_class = (Class)EKCalendarNotification;
  v4 = [(EKCalendarNotification *)&v7 init];
  v5 = v4;
  if (v4) {
    [(EKCalendarNotification *)v4 setType:a3];
  }
  return v5;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (EKSource)source
{
  return self->_source;
}

- (void)dealloc
{
  dotColor = self->_dotColor;
  if (dotColor) {
    CFRelease(dotColor);
  }
  v4.receiver = self;
  v4.super_class = (Class)EKCalendarNotification;
  [(EKCalendarNotification *)&v4 dealloc];
}

- (NSString)uniqueIdentifier
{
  v2 = [(EKCalendarNotification *)self objectID];
  v3 = [v2 stringRepresentation];

  return (NSString *)v3;
}

- (BOOL)needsAlert
{
  return ![(EKCalendarNotification *)self alerted];
}

- (BOOL)isSharedCalendarInvitation
{
  return 0;
}

- (BOOL)isInvitation
{
  return 0;
}

- (BOOL)acknowledgeWithEventStore:(id)a3 error:(id *)a4
{
  if (a4)
  {
    *a4 = [MEMORY[0x1E4F28C58] errorWithDomain:@"EKErrorDomain" code:5 userInfo:0];
  }
  return 0;
}

- (BOOL)isProposedNewTime
{
  return 0;
}

- (BOOL)proposedStartDateIsInFutureForAttendee:(id)a3
{
  return 0;
}

- (BOOL)couldBeJunk
{
  return 0;
}

- (int64_t)type
{
  return self->_type;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)name
{
  return self->_name;
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

- (EKObjectID)objectID
{
  return self->_objectID;
}

- (CGColor)dotColor
{
  return self->_dotColor;
}

- (BOOL)hiddenFromNotificationCenter
{
  return self->_hiddenFromNotificationCenter;
}

- (BOOL)alerted
{
  return self->_alerted;
}

- (NSString)firstName
{
  return self->_firstName;
}

- (NSString)lastName
{
  return self->_lastName;
}

- (NSString)recipientName
{
  return self->_recipientName;
}

- (EKCalendar)calendar
{
  return self->_calendar;
}

- (EKEvent)event
{
  return self->_event;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_event, 0);
  objc_storeStrong((id *)&self->_calendar, 0);
  objc_storeStrong((id *)&self->_recipientName, 0);
  objc_storeStrong((id *)&self->_lastName, 0);
  objc_storeStrong((id *)&self->_firstName, 0);
  objc_storeStrong((id *)&self->_source, 0);
  objc_storeStrong((id *)&self->_objectID, 0);
  objc_storeStrong((id *)&self->_URL, 0);
  objc_storeStrong((id *)&self->_phoneNumber, 0);
  objc_storeStrong((id *)&self->_emailAddress, 0);
  objc_storeStrong((id *)&self->_name, 0);

  objc_storeStrong((id *)&self->_title, 0);
}

@end