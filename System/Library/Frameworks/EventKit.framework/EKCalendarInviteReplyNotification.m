@interface EKCalendarInviteReplyNotification
- (BOOL)acknowledgeWithEventStore:(id)a3 error:(id *)a4;
- (EKCalendarInviteReplyNotification)initWithType:(int64_t)a3;
- (id)inviteReplyNotificationFromEventStore:(id)a3;
- (unint64_t)allowedEntityTypes;
- (unint64_t)status;
- (void)setAllowedEntityTypes:(unint64_t)a3;
- (void)setStatus:(unint64_t)a3;
@end

@implementation EKCalendarInviteReplyNotification

- (EKCalendarInviteReplyNotification)initWithType:(int64_t)a3
{
  v9.receiver = self;
  v9.super_class = (Class)EKCalendarInviteReplyNotification;
  v5 = -[EKCalendarNotification initWithType:](&v9, sel_initWithType_);
  v6 = v5;
  if ((unint64_t)(a3 - 11) <= 0xFFFFFFFFFFFFFFFDLL && v5)
  {
    v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2 object:v6 file:@"EKCalendarInviteReplyNotification.m" lineNumber:22 description:@"Invalid type for EKCalendarInviteReplyNotification."];
  }
  return v6;
}

- (id)inviteReplyNotificationFromEventStore:(id)a3
{
  return (id)[a3 publicObjectWithObjectID:self->super._objectID];
}

- (BOOL)acknowledgeWithEventStore:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = [(EKCalendarInviteReplyNotification *)self inviteReplyNotificationFromEventStore:v6];
  if (v7)
  {
    char v8 = [v6 removeInviteReplyNotification:v7 error:a4];
  }
  else
  {
    objc_super v9 = EKLogHandle;
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR)) {
      -[EKCalendarInviteReplyNotification acknowledgeWithEventStore:error:]((uint64_t)self, v9);
    }
    char v8 = 1;
  }

  return v8;
}

- (unint64_t)status
{
  return self->_status;
}

- (void)setStatus:(unint64_t)a3
{
  self->_status = a3;
}

- (unint64_t)allowedEntityTypes
{
  return self->_allowedEntityTypes;
}

- (void)setAllowedEntityTypes:(unint64_t)a3
{
  self->_allowedEntityTypes = a3;
}

- (void)acknowledgeWithEventStore:(uint64_t)a1 error:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 56);
  int v3 = 138543362;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_1A4E47000, a2, OS_LOG_TYPE_ERROR, "Attempted to acknowledge calendar invite reply notification with objectID %{public}@, but it was not found. Silently ignoring this request.", (uint8_t *)&v3, 0xCu);
}

@end