@interface EKCalendarSharedCalendarNotification
- (BOOL)couldBeJunk;
- (BOOL)isSharedCalendarInvitation;
- (EKCalendarSharedCalendarNotification)initWithType:(int64_t)a3;
- (id)calendarFromEventStore:(id)a3;
- (unint64_t)allowedEntityTypes;
- (unint64_t)sharingInvitationResponse;
- (void)setAllowedEntityTypes:(unint64_t)a3;
- (void)setSharingInvitationResponse:(unint64_t)a3;
@end

@implementation EKCalendarSharedCalendarNotification

- (EKCalendarSharedCalendarNotification)initWithType:(int64_t)a3
{
  v9.receiver = self;
  v9.super_class = (Class)EKCalendarSharedCalendarNotification;
  v5 = -[EKCalendarNotification initWithType:](&v9, sel_initWithType_);
  v6 = v5;
  if (a3 != 8 && v5)
  {
    v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2 object:v6 file:@"EKCalendarSharedCalendarNotification.m" lineNumber:20 description:@"Invalid type for EKCalendarSharedCalendarNotification."];
  }
  return v6;
}

- (id)calendarFromEventStore:(id)a3
{
  return (id)[a3 calendarWithID:self->super._objectID];
}

- (BOOL)isSharedCalendarInvitation
{
  return 1;
}

- (BOOL)couldBeJunk
{
  v2 = [(EKCalendarNotification *)self calendar];
  char v3 = [v2 couldBeJunk];

  return v3;
}

- (unint64_t)sharingInvitationResponse
{
  return self->_sharingInvitationResponse;
}

- (void)setSharingInvitationResponse:(unint64_t)a3
{
  self->_sharingInvitationResponse = a3;
}

- (unint64_t)allowedEntityTypes
{
  return self->_allowedEntityTypes;
}

- (void)setAllowedEntityTypes:(unint64_t)a3
{
  self->_allowedEntityTypes = a3;
}

@end